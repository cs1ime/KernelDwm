#include "ntifs.h"
#include "../hde/hde64.h"
#include "ddkcommon.h"
#include "xorstr.hpp"
#include "importencrypt.h"
#include "compilecontrol.h"
#include "../dwm/InjectDWM.h"
extern "C" unsigned char hde64_table[529];
namespace Dxgk {
	struct struMoreHook {
		ULONG64 m_pWin32kNtGdiDdDDISubmitCommandPtr;
		ULONG64 m_pDxgkNtGdiDdDDISubmitCommand;

		UCHAR OriginCode[50];
		int OriginLen;
		ULONG64 OriginV;
		PVOID UseShellcode;

	};
	extern struMoreHook MoreHook[20];
	extern int hookcnt;

	extern bool dxhook_removed;
	extern VOID TryRemoveDxgkHook();
	extern VOID win32kCallback();

	VOID InstallHookWin32k(int type) {
		auto ctx = &MoreHook[hookcnt++];
		PVOID win32kbase = KGetDriverImageBase2(xs("win32kbase.sys"));
		//NtGdiDdDDISubmitCommand
		if (win32kbase) {
			ULONG64 Proc = 0;
			if (type == 0)
				Proc = (ULONG64)KGetProcAddress(win32kbase, xs("NtGdiDdDDIRender"));
			else if (type == 1)
				Proc = (ULONG64)KGetProcAddress(win32kbase, xs("NtGdiDdDDIPresent"));
			else if (type == 2)
				Proc = (ULONG64)KGetProcAddress(win32kbase, xs("NtGdiDdDDIPresentMultiPlaneOverlay"));
			else if (type == 3)
				Proc = (ULONG64)KGetProcAddress(win32kbase, xs("NtGdiDdDDIPresentMultiPlaneOverlay2"));
			else if (type == 4)
				Proc = (ULONG64)KGetProcAddress(win32kbase, xs("NtGdiDdDDIPresentMultiPlaneOverlay3"));

			if (Proc) {
				INT64 pos = FindSignatureCode_nocheck((PVOID)Proc, 0x100, xs("48 8B 05"), 0);
				if (pos != -1) {
					ctx->m_pWin32kNtGdiDdDDISubmitCommandPtr = *(LONG*)(Proc + pos + 3) + Proc + pos + 7;
				}
			}
			printf("[112233] win32kptr=%p\n", ctx->m_pWin32kNtGdiDdDDISubmitCommandPtr);

		}
		if (!ctx->m_pWin32kNtGdiDdDDISubmitCommandPtr) {
			KeBugCheck(0x98C12);
		}

		ULONG_PTR OriginVal = *(ULONG_PTR*)ctx->m_pWin32kNtGdiDdDDISubmitCommandPtr;
		ctx->OriginV = OriginVal;
		printf("[112233] OriginV=%p\n", ctx->OriginV);
		//ULONG_PTR ShellcodePtr = (ULONG_PTR)KAllocatePool(0x300);
		ULONG_PTR ShellcodePtr = (ULONG_PTR)ExAllocatePool(NonPagedPool, 0x300);
		UCHAR shellcode[131];
		memcpy(shellcode, xs("\x90\x50\x53\x51\x52\x56\x57\x55\x41\x50\x41\x51\x41\x52\x41\x53\x41\x54\x41\x55\x41\x56\x41\x57\x9C\xE8\x3A\x00\x00\x00\x48\xBB\x00\x00\x00\x00\x10\x00\x00\x00\xFF\xD3\xE8\x3F\x00\x00\x00\x9D\x41\x5F\x41\x5E\x41\x5D\x41\x5C\x41\x5B\x41\x5A\x41\x59\x41\x58\x5D\x5F\x5E\x5A\x59\x5B\x58\x50\xC7\x04\x24\x00\x00\x10\x00\xC7\x44\x24\x04\x00\x00\x10\x00\xC3\x4C\x8D\x5C\x24\x08\x48\x83\xE4\xF0\x41\x53\x41\x53\x48\x83\xEC\x30\x41\xFF\x73\xF8\xC3\x41\x5B\x48\x83\xC4\x38\x5C\x41\x53\xC3")
			, sizeof(shellcode));
		*(ULONG64*)(shellcode + 0x20) = (ULONG64)win32kCallback;
		LARGE_INTEGER retaddr;
		retaddr.QuadPart = OriginVal;
		*(ULONG*)(shellcode + 0x4B) = retaddr.LowPart;
		*(ULONG*)(shellcode + 0x53) = retaddr.HighPart;
		memcpy((PVOID)ShellcodePtr, shellcode, sizeof(shellcode));

		ctx->UseShellcode = (PVOID)ShellcodePtr;

		*(ULONG_PTR *)ctx->m_pWin32kNtGdiDdDDISubmitCommandPtr = ShellcodePtr;
	}

	int HdeCalc(ULONG_PTR code_addr, int inst_sz) {

		int result_len = 0;
		while (result_len < inst_sz) {
			hde64s hdes = { 0 };
			int len = hde64_disasm((const void*)code_addr, &hdes);
			result_len += len;
			code_addr += len;
		}

		return result_len;

	}
	VOID InstallHookDxgk(int type) {
		auto ctx = &MoreHook[hookcnt++];
		PVOID dxgk = KGetDriverImageBase2(xs("dxgkrnl.sys"));
		if (dxgk) {
			if (type == 0) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("DxgkRender"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 1) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("DxgkPresent"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 2) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("DxgkPresentMultiPlaneOverlay"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 3) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("DxgkPresentMultiPlaneOverlay2"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 4) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("DxgkPresentMultiPlaneOverlay3"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 11) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("NtGdiDdDDIRender"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 12) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("NtGdiDdDDIPresent"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 13) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("NtGdiDdDDIPresentMultiPlaneOverlay"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 14) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("NtGdiDdDDIPresentMultiPlaneOverlay2"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}
			else if (type == 15) {
				ULONG64 Proc = (ULONG64)KGetProcAddress(dxgk, xs("NtGdiDdDDIPresentMultiPlaneOverlay3"));
				ctx->m_pDxgkNtGdiDdDDISubmitCommand = Proc;
			}

		}
		if (!ctx->m_pDxgkNtGdiDdDDISubmitCommand) {
			KeBugCheck(0x98C12);
		}

		UCHAR jmpcode[12];
		memcpy(jmpcode, xs("\x48\xB8\x00\x00\x00\x00\x00\x10\x00\x00\x50\xC3"), 12);
		int hdelen = HdeCalc(ctx->m_pDxgkNtGdiDdDDISubmitCommand, 12);

		//ULONG_PTR ShellcodePtr = (ULONG_PTR)KAllocatePool(0x300);
		ULONG_PTR ShellcodePtr = (ULONG_PTR)ExAllocatePool(NonPagedPool, 0x300);

		UCHAR shellcode[148];
		memcpy(shellcode, xs("\x90\x50\x53\x51\x52\x56\x57\x55\x41\x50\x41\x51\x41\x52\x41\x53\x41\x54\x41\x55\x41\x56\x41\x57\x9C\xE8\x56\x00\x00\x00\x48\xBB\x00\x00\x00\x00\x10\x00\x00\x00\xFF\xD3\xE8\x5B\x00\x00\x00\x9D\x41\x5F\x41\x5E\x41\x5D\x41\x5C\x41\x5B\x41\x5A\x41\x59\x41\x58\x5D\x5F\x5E\x5A\x59\x5B\x58\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x50\xC7\x04\x24\x00\x00\x10\x00\xC7\x44\x24\x04\x00\x00\x10\x00\xC3\x4C\x8D\x5C\x24\x08\x48\x83\xE4\xF0\x41\x53\x41\x53\x48\x83\xEC\x30\x41\xFF\x73\xF8\xC3\x41\x5B\x48\x83\xC4\x38\x5C\x41\x53\xC3")
			, sizeof(shellcode));
		*(ULONG64*)(shellcode + 0x20) = (ULONG64)win32kCallback;
		LARGE_INTEGER retaddr;
		retaddr.QuadPart = ctx->m_pDxgkNtGdiDdDDISubmitCommand + hdelen;
		*(ULONG*)(shellcode + 0x67) = retaddr.LowPart;
		*(ULONG*)(shellcode + 0x6F) = retaddr.HighPart;
		memcpy(shellcode + 0x47, (PVOID)ctx->m_pDxgkNtGdiDdDDISubmitCommand, hdelen);
		memcpy((PVOID)ShellcodePtr, shellcode, sizeof(shellcode));

		*(ULONG64*)(jmpcode + 2) = ShellcodePtr;
		UCHAR writejmpcode[50];
		memset(writejmpcode, 0x90, 50);
		memcpy(writejmpcode, jmpcode, 12);

		memcpy(ctx->OriginCode, (PVOID)ctx->m_pDxgkNtGdiDdDDISubmitCommand, hdelen);
		ctx->OriginLen = hdelen;
		ctx->UseShellcode = (PVOID)ShellcodePtr;

		MmiWriteVirtualAddressSafe(ctx->m_pDxgkNtGdiDdDDISubmitCommand, writejmpcode, hdelen);

	}
	VOID InstallHook() {
		memset(MoreHook, 0, sizeof(MoreHook));
		ULONG bn = KGetBuildNumber();
		if (bn <= WIN10_1809) {
			InstallHookWin32k(0);
			InstallHookWin32k(1);
			InstallHookWin32k(2);
			InstallHookWin32k(3);
			InstallHookWin32k(4);
		}
		else if (bn >= WIN10_1903 && bn <= WIN10_1909) {
			InstallHookDxgk(0);
			InstallHookDxgk(1);
			InstallHookDxgk(2);
			InstallHookDxgk(3);
			InstallHookDxgk(4);
		}
		else if (bn >= WIN10_2004/* && bn <= WIN10_21H2*/) {
			InstallHookDxgk(11);
			InstallHookDxgk(12);
			InstallHookDxgk(13);
			InstallHookDxgk(14);
			InstallHookDxgk(15);
		}
		//else if (bn >= WIN11) {
		//	InstallHookDxgk(2);
		//}
	}

}

