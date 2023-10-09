#include <ntifs.h>
#include "kcall.h"
#include "ddkcommon.h"
#include "xorstr.hpp"
#include "kernelasm.h"
#include "CompileControl.h"
#include "importencrypt.h"
#include "../util/khookutil.h"

extern "C" VOID __KiCallUserMode2(ULONG64 OutVarPtr, ULONG64 CallCtx, ULONG64 KStackControl);
#define RVA(pos,off,off2)(pos == 0 ? 0 : *(LONG*)(pos+off)+pos+off2)
extern "C"  DWORD g_offset_stack = 0;
extern "C"  DWORD g_kvashadow = 0;

namespace KCall {
	typedef ULONG64 u64;
	typedef ULONG32 u32;
	typedef USHORT u16;
	typedef UCHAR u8;

	typedef u64(NTAPI* MmCreateKernelStack_t)(u32, u16, PETHREAD);
	typedef void(NTAPI* MmDeleteKernelStack_t)(u64, u8);
	extern MmCreateKernelStack_t MmCreateKernelStack;
	extern MmDeleteKernelStack_t MmDeleteKernelStack;

	extern ULONG precall_offset;
	extern ULONG postcall_offset;

	VOID Init() {
		PVOID nt = ntos();
		
		MmDeleteKernelStack = (MmDeleteKernelStack_t)RVA(ScanSection_Image(ntos(), xs("PAGE"), xs("8B D5 E8 ?? ?? ?? ?? 48 8B 05 ?? ?? ?? ?? 48 05")), 3, 7);
		if (!MmDeleteKernelStack)
			KeBugCheck(0x88712);
		MmCreateKernelStack = (MmCreateKernelStack_t)RVA(ScanSection_Image(ntos(), xs("PAGE"), xs("E8 ?? ?? ?? ?? 48 85 C0 0F 84 ?? ?? ?? ?? 49 89 06 FF")), 1, 5);
		if (!MmCreateKernelStack)
			KeBugCheck(0x88713);

		WCHAR wstr[50];
		AnsiToUnicode(xs("\\SystemRoot\\System32\\ntdll.dll"), wstr, 49);
		KBuffer ntdll = KLoadLibrary(wstr);
		AnsiToUnicode(xs("\\SystemRoot\\System32\\user32.dll"), wstr, 49);
		KBuffer user32 = KLoadLibrary(wstr);

		precall_offset = (ULONG)(ScanSection_Image(ntdll.Address, xs(".text"), xs("48 8B 4C 24 ?? 48 8B 54 24 ?? 4C")) - (ULONG_PTR)ntdll.Address);
		postcall_offset = (ULONG)(ScanSection_Image(user32.Address, xs(".text"), xs("45 33 C0 48 89 44 24 20 48 8D 4C 24 20")) - (ULONG_PTR)user32.Address);

		KFreeLibrary(ntdll);
		KFreeLibrary(user32);

		ULONG64 pSyscall = ((ULONG64)AsmReadMsr(0xC0000082));
		if (!pSyscall)
			KeBugCheck(0x82871);
		ULONG offset = *(ULONG*)(pSyscall + 8);
		if ((offset & 0xFF) != 0x10) {
			KeBugCheck(0x82872);
		}
		offset &= 0xFF00;
		g_offset_stack = offset + 8;

		if (offset != 0) {
			g_kvashadow = 1;
		}
		else {
			g_kvashadow = 0;
		}
		//DbgPrint("[112233] offset:%X g_kvashadow:%d\n", offset, g_kvashadow);
	}
}