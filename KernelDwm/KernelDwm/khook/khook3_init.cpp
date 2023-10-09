#include <ntifs.h>

#include "../util/util.h"
#include "khook3.h"
#include "../util/khookutil.h"
#include "../dwm/kcall.h"
#include "XorCrypt.h"
#include "../dwm//kdxhook.h"
#include "../dwm/InjectDwm.h"

namespace khook3 {


	struct REG_CTX {
		ULONG_PTR rfl;
		ULONG_PTR r15;
		ULONG_PTR r14;
		ULONG_PTR r13;
		ULONG_PTR r12;
		ULONG_PTR r11;
		ULONG_PTR r10;
		ULONG_PTR r9;
		ULONG_PTR r8;
		ULONG_PTR rbp;
		ULONG_PTR rdi;
		ULONG_PTR rsi;
		ULONG_PTR rdx;
		ULONG_PTR rcx;
		ULONG_PTR rbx;
		ULONG_PTR rax;
		ULONG_PTR retaddr;
	};

	typedef VOID(*HOOK_CB)(REG_CTX*);

	struct HOOK_INFO_BLOCK {
		ULONG_PTR addr;
		SIZE_T hde_sz;
		UCHAR ori_ins[50];
		UCHAR* shellcode;
	};

	PVOID m_hookcb[100] = {};
	int m_hookcb_cnt = 0;
	ULONG_PTR g_pShellcode = HOOK_XOR((ULONG_PTR)0);

	PVOID m_orifunc = 0;
	int stiretGadgetType = 0;

	namespace walker {
		ULONG_PTR g_DxgkGetDeviceStateRetaddr = 0;

		__forceinline VOID Init() {
			ULONG bn = KGetBuildNumber();
			PVOID dxgk = KGetDriverImageBase2(xs("dxgkrnl.sys"));
			if (bn >= WIN10_1903) {
				PVOID pDxgkGetDeviceState = utilinc::GetProcAddress(dxgk, xs("DxgkGetDeviceState"));
				if (pDxgkGetDeviceState == 0) {
					pDxgkGetDeviceState = utilinc::GetProcAddress(dxgk, xs("NtGdiDdDDIGetDeviceState"));
					if (pDxgkGetDeviceState == 0) {
						KeBugCheck(0x8f172);
					}
				}

				//NtGdiDdDDIGetDeviceState	00000001C01A71A0	167
				// 
				//8B ?? E8
				ULONG_PTR pos = FindSignatureCode_nocheck(pDxgkGetDeviceState, 0x100, xs("8B ?? E8"), 0);
				if (pos == -1)
					KeBugCheck(0x8f172);
				auto uDxgkGetDeviceState = (ULONG_PTR)pDxgkGetDeviceState;
				g_DxgkGetDeviceStateRetaddr = pos + uDxgkGetDeviceState + 7;

			}
			else if (bn <= WIN10_1809) {
				//3C 01 48 8B ?? 0F 94 C2 E8 ?? ?? ?? ?? 
				ULONG_PTR pos = ScanSection_Image(dxgk, xs("PAGE"), xs("3C 01 48 8B ?? 0F 94 C2 E8"));
				if (pos) {
					g_DxgkGetDeviceStateRetaddr = pos + 13;
				}
				else {
					KeBugCheck(0x8f172);
				}
			}

		}
		

		ULONG_PTR m_retaddr_offset = 0;
		ULONG_PTR m_stacksize = 0;
		

	}
	__forceinline UCHAR* GenericShellcode(HOOK_CB cb, ULONG_PTR jmptarget, ULONG_PTR stiret) {
		UCHAR shellcode[1000];
		memcpy(shellcode,
			xs("\xFA\x53\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x50\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x53\x4D\x89\xFF\x51\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x52\x89\xD2\x56\x50\x58\x57\x4D\x89\xFF\x55\x89\xD2\x41\x50\x50\x58\x41\x51\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x41\x52\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x41\x53\x4D\x89\xFF\x41\x54\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x41\x55\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x41\x56\x50\x58\x41\x57\x4D\x87\xC7\x4D\x87\xF8\x9C\x4D\x89\xFF\x89\xD2\x48\x89\xE1\x50\x58\x48\x31\xF6\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x48\xC7\xC0\x01\x00\x00\x00\x89\xD2\x48\x83\xF8\x01\x50\x58\x75\x65\x50\x58\x48\xB8\x00\x00\x00\x00\x00\x01\x00\x00\x89\xD2\x65\x48\x8B\x1C\x25\x88\x01\x00\x00\x89\xD2\x48\x39\xD8\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x75\x3D\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x50\x58\x90\x50\x58\x48\x89\xE3\x4D\x87\xC7\x4D\x87\xF8\x48\xB8\x00\x00\x00\x00\x00\x10\x00\x00\x89\xD2\x48\x89\xC4\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x53\x89\xD2\x48\xC7\xC6\x01\x00\x00\x00\x50\x58\x50\x58\x48\xBB\x00\x00\x00\x00\x00\x01\x00\x00\x4D\x89\xFF\x56\x89\xD2\xE8\xA8\x01\x00\x00\x89\xD2\xFF\xD3\x4D\x87\xC7\x4D\x87\xF8\xE8\x23\x02\x00\x00\x89\xD2\x5E\x4D\x89\xFF\x89\xD2\x48\x83\xFE\x01\x4D\x87\xC7\x4D\x87\xF8\x75\x16\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x58\x89\xD2\x48\x89\xC4\x89\xD2\x89\xD2\x4D\x89\xFF\x4D\x89\xFF\x9D\x89\xD2\x41\x5F\x89\xD2\x41\x5E\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x41\x5D\x4D\x89\xFF\x41\x5C\x4D\x89\xFF\x41\x5B\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x41\x5A\x4D\x89\xFF\x41\x59\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x41\x58\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x5D\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x5F\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x5E\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x5A\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x59\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x5B\x4D\x87\xC7\x4D\x87\xF8\x58\x50\x58\x89\xD2\x90\x4D\x87\xC7\x4D\x87\xF8\x90\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x90\x4D\x87\xC7\x4D\x87\xF8\x90\x4D\x89\xFF\x90\x50\x58\x90\x4D\x87\xC7\x4D\x87\xF8\x90\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x90\x89\xD2\x90\x4D\x87\xC7\x4D\x87\xF8\x90\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x90\x4D\x89\xFF\x90\x4D\x87\xC7\x4D\x87\xF8\x90\x4D\x87\xC7\x4D\x87\xF8\x90\x50\x58\x90\x4D\x87\xC7\x4D\x87\xF8\x90\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x90\x89\xD2\x90\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x90\x50\x58\x90\x50\x58\x90\x4D\x87\xC7\x4D\x87\xF8\x90\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x90\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x90\x50\x58\x90\x4D\x89\xFF\x90\x4D\x89\xFF\x4D\x89\xFF\x68\x00\x00\x00\x10\x89\xD2\xC7\x44\x24\x04\x00\x00\x00\x10\x89\xD2\x48\x83\xEC\x28\x50\x4D\x87\xC7\x4D\x87\xF8\xC7\x04\x24\x00\x00\x00\x10\x50\x58\xC7\x44\x24\x04\x00\x00\x00\x10\x89\xD2\xC3\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x4D\x89\xFF\x50\x58\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x4C\x8D\x5C\x24\x08\x50\x58\x90\x4D\x89\xFF\xEB\x0A\x4D\x89\xFF\x9D\x50\x58\x0F\x05\x50\x58\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x48\x83\xE4\xF0\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x90\x50\x58\x90\x4D\x89\xFF\x41\x53\x4D\x87\xC7\x4D\x87\xF8\x90\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x41\x53\x4D\x87\xC7\x4D\x87\xF8\x90\x4D\x89\xFF\x48\x83\xEC\x30\x4D\x89\xFF\x90\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x41\xFF\x73\xF8\x89\xD2\x90\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x48\x89\xFF\x50\x58\xC3\x50\x58\x50\x58\x89\xD2\x90\x4D\x87\xC7\x4D\x87\xF8\x48\x89\xFF\x89\xD2\x41\x5B\x4D\x89\xFF\x90\x50\x58\x48\x89\xFF\x4D\x87\xC7\x4D\x87\xF8\x48\x83\xC4\x38\x4D\x89\xFF\x90\x50\x58\x48\x89\xFF\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x5C\x89\xD2\x90\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x48\x89\xFF\xE8\x00\x00\x00\x00\x48\x83\xC4\x08\x41\x53\x75\x07\x74\x05\xCD\x16\x48\x89\x08\x90\x90\x89\xD2\x48\x89\xFF\x89\xD2\xC3\x4D\x87\xC7\x4D\x87\xF8\x4D\x87\xC7\x4D\x87\xF8"),
			955);

		*(ULONG_PTR*)(shellcode + 0x105) = (ULONG_PTR)cb;
		LARGE_INTEGER v;

		memcpy(shellcode + 0x291, xs("\x90\x90"), 2);
		memcpy(shellcode + 0x293, xs("\x48\x83\xec\x20"), 4);
		memset(shellcode + 0x282, 0x90, 15);

		v.QuadPart = stiret;
		*(ULONG*)(shellcode + 0x2A1) = v.LowPart;
		*(ULONG*)(shellcode + 0x2AB) = v.HighPart;

		*(ULONG*)(shellcode + 0x8E) = 0;//is_enable_fake_stack

		*(ULONG64*)(shellcode + 0xDE) = KCall::MmCreateKernelStack(false, 0, 0);
		UCHAR* code = (UCHAR*)KAllocatePool(sizeof(shellcode));
		memcpy(code, shellcode, sizeof(shellcode));
		return code;
	}
	
	__forceinline VOID Init() {
		walker::Init();
	}
	extern VOID GeneralCB(REG_CTX* regs);
	VOID InstallHook() {
		//return;
		Init();
		PEPROCESS process = Process::FindProcess(xs("dwm.exe"));
		pt("dwm process=%p", process);
		typedef ULONG_PTR(*FnPsGetProcessDxgProcess)(PEPROCESS);
		ULONG_PTR PsGetProcessDxgProcess = (ULONG_PTR)utilinc::GetProcAddress(ntos(), xs("PsGetProcessDxgProcess"));
		ULONG offset_DxgProcess = *(ULONG*)(PsGetProcessDxgProcess + 3);
		ULONG_PTR dxgkproc = *(ULONG_PTR*)((ULONG_PTR)process + offset_DxgProcess);

		p1x(dxgkproc);
		// DbgBreakPoint();

		ULONG off = 0x58;
		if (KGetBuildNumber() <= WIN10_1909) {
			off = 0x60;
		}
		decltype(ExAllocatePool) pAllocatePool = (decltype(ExAllocatePool))utilinc::GetProcAddress(ntos(), xs("ExAllocatePool"));
		ULONG_PTR new_vtabl = (ULONG_PTR)pAllocatePool(NonPagedPoolNx, 0x700 + (AsmRdtsc() % 3) * 0x100);
		new_vtabl += 0x100;
		memset((PVOID)new_vtabl, 0, 0x600);
		for (int i = 0; i < (0x600 / 8); i++) {
			PVOID src = (PVOID)(*(ULONG_PTR*)(dxgkproc + off) + i * 8);
			if (!MmiGetPhysicalAddress(src))
				break;
			memcpy((PVOID)(new_vtabl + i * 8), src, 8);
		}
		PVOID dxgk = KGetDriverImageBase2(xs("dxgkrnl.sys"));
		ULONG_PTR stiret = 0;
		if (dxgk) {
			stiret = utilinc::ScanSection_Image(dxgk, xs(".text"), xs("FB C3"));
		}
		{
			if (!stiret) {
				PVOID nt = ntos();
				stiret = utilinc::ScanSection_Image(nt, xs(".text"), xs("FB C3"));
			}
			if (!stiret) {
				PVOID nt = KGetDriverImageBase2(xs("mouclass.sys"));
				if (nt) {
					stiret = utilinc::ScanSection_Image(nt, xs(".text"), xs("FB C3"));
				}
			}
			if (!stiret) {
				PVOID nt = KGetDriverImageBase2(xs("hal.dll"));
				if (nt) {
					stiret = utilinc::ScanSection_Image(nt, xs(".text"), xs("FB C3"));
				}
			}
			if (!stiret) {
				PVOID nt = KGetDriverImageBase2(xs("kbdclass.sys"));
				if (nt) {
					stiret = utilinc::ScanSection_Image(nt, xs(".text"), xs("FB C3"));
				}
			}
			if (!stiret) {
				PVOID nt = KGetDriverImageBase2(xs("ci.dll"));
				if (nt) {
					stiret = utilinc::ScanSection_Image(nt, xs(".text"), xs("FB C3"));
				}
			}
		}
		if (!stiret)
			KeBugCheck(0x99817);
		
		//48 83 EC 28 48 8B C1 FA 65 48 8B 0C 25 20 00 00 00
		//65 48 8B 0C 25 20 00 00 00 4C 8B C2 48 8B D0 E8 ?? ?? ?? ?? FB 48 83 C4 28 C3
		//KeUpdateTotalCyclesCurrentThread 
		ULONG_PTR latestStiRet = 0;
		PVOID nt = ntos();
		ULONG_PTR pKeUpdateTotalCyclesCurrentThread = (ULONG_PTR)utilinc::ScanSection_Image(nt,xs(".text"), xs("65 48 8B 0C 25 20 00 00 00 4C 8B C2 48 8B D0 E8 ?? ?? ?? ?? FB 48 83 C4 28 C3"));
		if (pKeUpdateTotalCyclesCurrentThread != 0) {
			latestStiRet = pKeUpdateTotalCyclesCurrentThread + 20;

			stiretGadgetType = 0;
		}
		else {
			//65 48 8B 0C 25 20 00 00 00 4C 8B C2 48 8B D0 E8 ?? ?? ?? ?? 65 48 8B 0C 25 20 00 00 00
			ULONG_PTR pos = (ULONG_PTR)utilinc::ScanSection_Image(nt, xs(".text"), xs("65 48 8B 0C 25 20 00 00 00 4C 8B C2 48 8B D0 E8 ?? ?? ?? ?? 65 48 8B 0C 25 20 00 00 00"));
			if (pos) {
				pKeUpdateTotalCyclesCurrentThread = (decltype(pKeUpdateTotalCyclesCurrentThread))KGetFunctionBegin(nt, (PVOID)pos);

				//E8 ?? ?? ?? ?? FB

				pos =
					FindSignatureCode_nocheck((LPCVOID)pKeUpdateTotalCyclesCurrentThread, 0x1000, xs("E8 ?? ?? ?? ?? FB"), 0);

				if (pos != -1) {
					latestStiRet = pos + pKeUpdateTotalCyclesCurrentThread + 5;

					stiretGadgetType = 1;
				}
			}
		}

		if (!latestStiRet)
			KeBugCheck(0x99817);

		khook3::AddCB(kdx::WrapMainCallback);
		khook3::AddCB(DWM::DwmInjectCallback);

		m_orifunc = (PVOID)(*(ULONG_PTR*)(new_vtabl + 0xD0));
		p1x(m_orifunc);
		m_orifunc = HOOK_XOR(m_orifunc);

		*(ULONG_PTR*)(new_vtabl + 0xD0) = (ULONG_PTR)GenericShellcode(GeneralCB, *(ULONG_PTR*)(new_vtabl + 0xD0), latestStiRet);
		g_pShellcode = *(ULONG_PTR*)(new_vtabl + 0xD0);
		g_pShellcode = HOOK_XOR(g_pShellcode);
		*(ULONG_PTR*)(dxgkproc + off) = new_vtabl;
		pt("install ok");
	}
	
}
