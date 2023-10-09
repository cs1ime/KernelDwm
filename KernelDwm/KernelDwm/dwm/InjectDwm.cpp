#include "DDKCommon.h"
#include "kapc.h"
#include "Kernelasm.h"
#include "dwm_dlldata.h"
#include "PeMapper.h"
#include "xorstr.hpp"
#include "kdxhook.h"
#include "dwmrender.h"
#include "CompileControl.h"
#include "kdxrender.h"
#include "smem.h"
#include "kcall.h"
#include "importencrypt.h"
#include "MakeR3Mem.h"
#include "dxgkhook.h"
#include "../util/khookutil.h"
#include "InjectDwm.h"
#include "../khook/khook3.h"
#include "../hde/hde64.h"
extern "C" unsigned char hde64_table[529];



namespace DWM {
	//const int m_shellcode

	PETHREAD RenderThread = 0;
	PEPROCESS DWMProcess = 0;

	bool m_bInjected = false;
	bool m_bEnd = false;

	ULONG_PTR m_BaseAddr = 0;
	ULONG_PTR m_userbuffer = 0;
	SIZE_T m_AllocateSize = 0;

	ULONG64 m_uInjectedTime = 0;

	ULONG64 m_SwapChainPointer = 0;
	ULONG64 m_BeepPointer = 0;
	ULONG64 m_UserBufferPointer = 0;

	ULONG64 m_DWMSwapChain = 0;
	ULONG64 m_pBeep = 0;

	PVOID m_History = 0;

	bool m_zeroed = false;
	
	ULONG64 m_offset_Context = 0;

	ULONG offset_CComposition_Present = 0;
	ULONG CComposition_Present_HdeSize = 0;
	UCHAR CComposition_Present_Oricode[50] = { 0 };

	ULONG_PTR m_dwmcore = 0;

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

	VOID Init() {
		m_History = r3mem::NewHistory();
		
		WCHAR Name[300] = { 0 };
		AnsiToUnicode(xs("\\??\\C:\\Windows\\System32\\dwmcore.dll"), Name, 260);

		KBuffer buffer = KLoadLibrary(Name);
		ULONG64 fn = 0;

		
		{
			//89 ?? 24 B8 01 00 00 E8 ?? ?? ?? ?? 85 C0
			ULONG64 pos = utilinc::ScanSection_Image((LPCVOID)buffer.Address, xs(".text"), xs("89 ?? 24 B8 01 00 00 E8 ?? ?? ?? ?? 85 C0"));

			if (pos != 0) {
				fn = *(LONG*)(pos + 8) + pos + 12;
			}

			//49 8D 4B D8 48 FF 15
			if (!fn) {
				pos = utilinc::ScanSection_Image((PVOID)buffer.Address, xs(".text"), xs("49 8D 4B D8 48 FF 15"));
				if (pos != 0) {
					fn = (ULONG64)KGetFunctionBegin((PVOID)buffer.Address, (PVOID)pos);
				}
				else {
					//40 B7 01 FF 15

					pos = utilinc::ScanSection_Image((PVOID)buffer.Address, xs(".text"), xs("40 B7 01 FF 15"));
					if (pos != 0) {
						fn = (ULONG64)KGetFunctionBegin((PVOID)buffer.Address, (PVOID)pos);
					}

				}
			}

		}
		
		if (fn != 0) {

			offset_CComposition_Present = fn - (ULONG64)buffer.Address;

			p1x(offset_CComposition_Present);

			ULONG_PTR pCComposition_Present = (ULONG_PTR)((ULONG64)buffer.Address + offset_CComposition_Present);

			CComposition_Present_HdeSize = HdeCalc(pCComposition_Present, 12);
			p1d(CComposition_Present_HdeSize);
			memcpy(CComposition_Present_Oricode, (PVOID)pCComposition_Present, CComposition_Present_HdeSize);
		}
		


		KFreeLibrary(buffer);
		if (offset_CComposition_Present == 0) {
			KeBugCheck(0x8E971);
		}
	}
	
	__forceinline VOID Reboot() {
		//return;
		//Reboot23();
		return;
	}
	
	__forceinline PULONG64 GetUserRspPtr() {
		ULONG64 pSyscall = ((ULONG64)AsmReadMsr(0xC0000082));
		if (!pSyscall)return 0;
		ULONG offset = *(ULONG*)(pSyscall + 8);
		return (PULONG64)__readgsqword(offset);


	}
	__forceinline ULONG64 calcAllocSize() {
		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)dwm_dlldata::dll;
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(dwm_dlldata::dll + idh->e_lfanew);

		ULONG ImageSize = inh->OptionalHeader.SizeOfImage;
		//printf("[112233] ImageSize:%p\n", ImageSize);
		ULONG DllDataSize = sizeof(dwm_dlldata::dll);
		ULONG ShellCodeSize = 130;
		ULONG UserModeHookCodeSize = 0x200;

		return ImageSize + ShellCodeSize + UserModeHookCodeSize + UserModeHookCodeSize;
	}

	ULONG GetTableOff() {
		ULONG bn = KGetBuildNumber();
		if (bn < WIN10) {
			return 0x28;
		}
		else if (bn == WIN10_1511) {
			return 0x60;
		}
		else if (bn >= WIN10_1607 && bn <= WIN10_1809) {
			return 0xD8;
		}
		else if (bn >= WIN10_1903 && bn <= WIN10_1909) {
			return 0xB0;
		}
		else if (bn >= WIN10_2004) {
			return 0x90;
		}
		return 0;

	}
	ULONG GetContextOff() {
		ULONG bn = KGetBuildNumber();
		if (bn < WIN10) {
			return 0x50;
		}
		else if (bn == WIN10_1511) {
			return 0x90;
		}
		else if (bn >= WIN10_1607 && bn <= WIN10_1909) {
			return 0xE0;
		}
		else if (bn >= WIN10_2004) {
			return 0xC0;
		}
		return 0;
	}
	UCHAR TmpTable[0x2000];
	void ProcessSwapChain(ULONG64 SwapChain) {
		return;
		bool i_enable = AsmReadRFlags() & 0x200;
		if (i_enable)
			AsmCli();

		_CR4 cr4 = { 0 };
		cr4.all = AsmReadCr4();
		bool smap = cr4.SMAP == 1;
		if (smap == true) {
			cr4.SMAP = 0;
			AsmWriteCr4(cr4.all);
		}

		ULONG Tableoff = GetTableOff();
		ULONG Contextoff = GetContextOff();
		ULONG64 Table = mem::r<ULONG64>(SwapChain + Tableoff);
		ULONG64 pFunctionTable = mem::r<ULONG64>(Table + Contextoff);

		//ULONG64 Table = *(ULONG64*)(SwapChain + Tableoff);
		//ULONG64 pFunctionTable = *(ULONG64*)(Table + Contextoff);

		ULONG_PTR NewTable = m_userbuffer + 0x3000;

		//mem::w_t(NewTable, (PVOID)(pFunctionTable - 0x1000), 0x2000);
		MmiReadVirtualAddressSafe((DWORD64)(pFunctionTable - 0x1000), (PVOID)TmpTable, 0x2000);
		//memcpy((PVOID)NewTable, TmpTable, 0x2000);
		mem::w_t(NewTable, (PVOID)(pFunctionTable - 0x1000), 0x2000);
		PULONG64 pNewFunctionTable = (PULONG64)(NewTable + 0x1000);
		mem::w<ULONG64>((ULONG64)&pNewFunctionTable[0], m_pBeep);

		//*(ULONG64*)(Table + Contextoff) = (ULONG64)pNewFunctionTable;
		mem::w<ULONG64>(Table + Contextoff, (ULONG64)pNewFunctionTable);

		if (smap == true) {
			cr4.SMAP = 1;
			AsmWriteCr4(cr4.all);
		}
		if (i_enable)
			AsmSti();

	}

	ULONG_PTR AllocR3Mem(SIZE_T sz) {
		return r3mem::AllocR3Mem(sz, m_History);
	}

	ProcessContext dwmctx = { 0 };
	VOID TryDecDWMINJ() {
		return;
	}
	__forceinline VOID AllocateMemImpl() {

		m_BaseAddr = AllocR3Mem(calcAllocSize());
		m_AllocateSize = calcAllocSize();
		printf("[112233] m_BaseAddr:%p\n", m_BaseAddr);
		printf("[112233] m_AllocateSize:%p\n", m_AllocateSize);

		printf("[112233] page_cnt:%d\n", *(int*)m_History);

	}
	__forceinline VOID GenericShellcode(PVOID cb, ULONG_PTR jmptarget, PVOID buffer) {
		UCHAR shellcode[] = "\x90\x50\x53\x51\x52\x56\x57\x55\x41\x50\x41\x51\x41\x52\x41\x53\x41\x54\x41\x55\x41\x56\x41\x57\x9C\x48\xBB\x00\x00\x00\x00\x00\x01\x00\x00\x48\x89\xE1\xE8\x4A\x00\x00\x00\xFF\xD3\xE8\x68\x00\x00\x00\x9D\x41\x5F\x41\x5E\x41\x5D\x41\x5C\x41\x5B\x41\x5A\x41\x59\x41\x58\x5D\x5F\x5E\x5A\x59\x5B\x58\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x50\xC7\x04\x24\x00\x00\x00\x10\xC7\x44\x24\x04\x00\x00\x00\x10\xC3\x4C\x8D\x5C\x24\x08\x90\xEB\x03\x9D\x0F\x05\x48\x83\xE4\xF0\x90\x90\x41\x53\x90\x41\x53\x90\x48\x83\xEC\x30\x90\x41\xFF\x73\xF8\x90\x48\x89\xFF\xC3\x90\x48\x89\xFF\x41\x5B\x90\x48\x89\xFF\x48\x83\xC4\x38\x90\x48\x89\xFF\x5C\x90\x48\x89\xFF\x41\x53\x90\x48\x89\xFF\xC3"
			;
		*(ULONG_PTR*)(shellcode + 0x1b) = (ULONG_PTR)cb;
		LARGE_INTEGER v;
		v.QuadPart = jmptarget;
		*(ULONG*)(shellcode + 0x68) = v.LowPart;
		*(ULONG*)(shellcode + 0x70) = v.HighPart;

		memcpy(buffer, shellcode, sizeof(shellcode));
	}
	ULONG64 alloc_starttime = 0;
	__forceinline bool ReadyDwmCore() {
		//m_dwmcore = 0;

		if (m_dwmcore == 0) {
			m_dwmcore = (ULONG_PTR)GetUserModeModuleBaseX64A(xs("dwmcore.dll"));
			return m_dwmcore != 0;
		}
		return true;
	}
	__forceinline bool DoInjectDWM() {
		if (!ReadyDwmCore())
			return false;
		if (m_BaseAddr == 0) {
			AllocateMemImpl();
			if (m_BaseAddr) {
				alloc_starttime = GetRealTime();
			}
			
		}
		if (m_BaseAddr == 0)
			return false;
		ULONG64 pSyscall = ((ULONG64)AsmReadMsr(0xC0000082));
		if (!pSyscall)return false;
		ULONG offset = *(ULONG*)(pSyscall + 8);
		if ((offset & 0xFF) != 0x10) {
			return false;
		}
		bool result = false;
		
		//PULONG64 ursp = GetUserRspPtr();
		PULONG64 ursp = (PULONG64)(KGetRspBase() - 0x28);

		ULONG64 rspOriginValue = mem::r<ULONG64>(ursp);
		if (!MmiIsExecutableAddress((PVOID)rspOriginValue)) {
			return false;
		}

		unsigned char shellcode[200] = { 0 };
		memcpy(shellcode, xs("\x90\x50\x53\x51\x52\x56\x57\x55\x41\x50\x41\x51\x41\x52\x41\x53\x41\x54\x41\x55\x41\x56\x41\x57\x9C\x48\xB9\x00\x00\x00\x00\x00\x00\x10\x00\x48\xBB\x00\x00\x00\x00\x00\x00\x01\x00\xE8\x30\x00\x00\x00\xFF\xD3\xE8\x3E\x00\x00\x00\x9D\x41\x5F\x41\x5E\x41\x5D\x41\x5C\x41\x5B\x41\x5A\x41\x59\x41\x58\x5D\x5F\x5E\x5A\x59\x5B\x58\x50\xC7\x04\x24\x00\x00\x00\x10\xC7\x44\x24\x04\x00\x00\x00\x10\xC3\x4C\x8D\x5C\x24\x08\x48\x83\xE4\xF0\x41\x53\x41\x53\x48\x83\xEC\x30\x41\xFF\x63\xF8\x41\x5B\x48\x83\xC4\x38\x5C\x41\xFF\xE3"),
			130);
		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)dwm_dlldata::dll;
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(dwm_dlldata::dll + idh->e_lfanew);

		ULONG ImageSize = inh->OptionalHeader.SizeOfImage;
		ULONG DllDataSize = sizeof(dwm_dlldata::dll);
		ULONG ShellCodeSize = 130;
		ULONG UserModeHookCodeSize = 0x200;

		int all_size = ImageSize + ShellCodeSize + UserModeHookCodeSize + UserModeHookCodeSize;

		ULONG_PTR pMem = m_BaseAddr;
		if (pMem) {
			RenderThread = PsGetCurrentThread();
			khook3::SetShellcodeThread(RenderThread);
			ULONG_PTR pImage = pMem;
			ULONG_PTR pShellcode = pMem + ImageSize;
			ULONG_PTR pHookCode = pMem + ImageSize + ShellCodeSize;
			printf("[112233] pMem:%p\n", pMem);

			PE::MapPE((PUCHAR)dwm_dlldata::dll, (PUCHAR)pMem);
			ULONG64 Entry = (ULONG64)PE::GetMemProcAddress((PVOID)pImage, xs("Entry"));
			printf("[112233] Entry:%p\n", Entry);

			ULONG SymbolOffset = PE::GetSymbolOffset((PVOID)dwm_dlldata::dll, xs("exp_swapchain"));
			ULONG64 Value = *(ULONG64*)(SymbolOffset + (PUCHAR)dwm_dlldata::dll);
			ULONG64 DataOffset = Value - inh->OptionalHeader.ImageBase;

			ULONG64 SwapChainPointer = (ULONG64)(DataOffset + pImage);
			m_SwapChainPointer = SwapChainPointer;
			printf("[112233] SwapChainPointer:%p\n", SwapChainPointer);

			SymbolOffset = PE::GetSymbolOffset((PVOID)dwm_dlldata::dll, xs("exp_beep"));
			Value = *(ULONG64*)(SymbolOffset + (PUCHAR)dwm_dlldata::dll);
			DataOffset = Value - inh->OptionalHeader.ImageBase;
			ULONG64 BeepPointer = (ULONG64)(DataOffset + pImage);
			m_BeepPointer = BeepPointer;
			printf("[112233] BeepPointer:%p\n", BeepPointer);

			SymbolOffset = PE::GetSymbolOffset((PVOID)dwm_dlldata::dll, xs("exp_buffer"));
			Value = *(ULONG64*)(SymbolOffset + (PUCHAR)dwm_dlldata::dll);
			DataOffset = Value - inh->OptionalHeader.ImageBase;
			ULONG64 UserBufferPointer = (ULONG64)(DataOffset + pImage);
			m_UserBufferPointer = UserBufferPointer;
			printf("[112233] UserBufferPointer:%p\n", UserBufferPointer);
			mem::w<ULONG_PTR>(m_UserBufferPointer, DWM::m_offset_Context);
			
			if (MmiGetPhysicalAddress(ursp)) {
				//ULONG64 OriginValue = *ursp;
				ULONG64 OriginValue = mem::r<ULONG64>(ursp);
				printf("[112233] OriginValue:%p\n", OriginValue);

				GenericShellcode((PVOID)Entry, OriginValue, shellcode);

				mem::w_t(pShellcode, shellcode, sizeof(shellcode));

				{ 
					ULONG_PTR pCComposition_Present = m_dwmcore + offset_CComposition_Present;

					UCHAR HookCode[0x200] = { 0 };

					memcpy(HookCode, xs("\x90\x50\x53\x51\x52\x56\x57\x55\x41\x50\x41\x51\x41\x52\x41\x53\x41\x54\x41\x55\x41\x56\x41\x57\x9C\x48\x89\xE1\x48\xBB\x00\x00\x00\x00\x00\x01\x00\x00\xE8\x4A\x00\x00\x00\xFF\xD3\xE8\x68\x00\x00\x00\x9D\x41\x5F\x41\x5E\x41\x5D\x41\x5C\x41\x5B\x41\x5A\x41\x59\x41\x58\x5D\x5F\x5E\x5A\x59\x5B\x58\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x50\xC7\x04\x24\x00\x00\x00\x10\xC7\x44\x24\x04\x00\x00\x00\x10\xC3\x4C\x8D\x5C\x24\x08\x90\xEB\x03\x9D\x0F\x05\x48\x83\xE4\xF0\x90\x90\x41\x53\x90\x41\x53\x90\x48\x83\xEC\x30\x90\x41\xFF\x73\xF8\x90\x48\x89\xFF\xC3\x90\x48\x89\xFF\x41\x5B\x90\x48\x89\xFF\x48\x83\xC4\x38\x90\x48\x89\xFF\x5C\x90\x48\x89\xFF\x41\x53\x90\x48\x89\xFF\xC3"),
						185);
					*(ULONG64*)(HookCode + 0x1E) = Entry;
					UCHAR dwmcoreOricode[50] = { 0 };
					mem::read(pCComposition_Present,dwmcoreOricode , 50);
					CComposition_Present_HdeSize = HdeCalc((ULONG_PTR)dwmcoreOricode, 12);
					memcpy(HookCode + 0x4a, dwmcoreOricode, CComposition_Present_HdeSize);
					memcpy(CComposition_Present_Oricode, dwmcoreOricode, CComposition_Present_HdeSize);

					LARGE_INTEGER intAddr = { 0 };
					intAddr.QuadPart = pCComposition_Present + CComposition_Present_HdeSize;

					*(ULONG*)(HookCode + 0x68) = intAddr.LowPart;
					*(ULONG*)(HookCode + 0x70) = intAddr.HighPart;

					mem::w_t(pHookCode, HookCode, 185);
					
					UCHAR jmpcode[12];
					memcpy(jmpcode, xs("\x48\xB8\x00\x00\x00\x00\x00\x10\x00\x00\x50\xC3"), 12);
					int hdelen = CComposition_Present_HdeSize;

					*(ULONG_PTR*)(jmpcode + 2) = pHookCode;

					mem::w_t(pCComposition_Present, jmpcode, 12);
				}

				memset((PVOID)dwm_dlldata::dll, 0, sizeof(dwm_dlldata::dll));

				result = true;
			}
			

			
		}

		return result;
	}
	__forceinline bool checkinjectenv() {
		

		PULONG64 ursp = GetUserRspPtr();
		//PULONG64 ursp = (PULONG64)(KGetRspBase() - 0x28);
		bool result = false;
		if (MmiGetPhysicalAddress(ursp)) {
			PVOID uv = mem::r<PVOID>(ursp);
			if ((ULONG64)uv < MmUserProbeAddress) {
				if (MmiGetPhysicalAddress(uv)) {
					//if (MmiIsExecutableAddress(uv))
						result = true;
				}
			}
		}
		return result;
	}
	
	VOID TryInjectDWMImpl() {
		//DbgPrint("[112233] hhook!\n");
		if (PsGetCurrentThreadProcess() == PsGetCurrentProcess() && ExGetPreviousMode() == UserMode) {

			if (DWMProcess != 0 && PsGetCurrentProcess() == DWMProcess) {
				//DbgPrint("[112233] dwm:%p\n", DWMProcess);
				if (m_bInjected == false) {
					if (checkinjectenv() == true) {
						static SHORT exec_lock = 0;
						static ULONG64 exec_last_time = 0;
						if (InterlockedCompareExchange16(&exec_lock, 1, 0) == 0) {
							ULONG64 now_time = GetRealTime();
							int detal_time = 1000;
							if (now_time - exec_last_time > detal_time) {
								exec_last_time = now_time;
								bool resu = 0;
								DPC_CLI_BEGIN

								resu = DoInjectDWM();

								DPC_CLI_END

								m_bInjected = resu;
								if (m_bInjected)
									m_uInjectedTime = GetRealTime();
							}
							exec_lock = 0;
						}
					}
				}
			}
		}
	}
	VOID TryInjectDWM() {

		if (m_zeroed == false)
			TryInjectDWMImpl();
	}
	VOID TrySwitchDWMImpl() {
		if (DWMProcess == 0) {
			CHAR pName[16] = { 0 };
			UCHAR* Name = PsGetProcessImageFileName(PsGetCurrentProcess());
			if (Name) {
				memcpy(pName, Name, 15);
				if (!stricmp(pName, xs("dwm.exe"))) {
					DWMProcess = PsGetCurrentProcess();
				}
			}
		}
	}
	VOID TrySwitchDWM() {
		//TryDecDWMINJ();
		if (m_zeroed == false)
			TrySwitchDWMImpl();
	}

	__forceinline bool FreeDWMImpl() {
		//DbgBreakPoint();
		
		bool i_enable = AsmReadRFlags() & 0x200;
		if (i_enable)
			AsmCli();
		ULONG64 oldcr3 = SwitchToProcessCr3(DWMProcess);

		mem::w_t(m_dwmcore + offset_CComposition_Present, 
			CComposition_Present_Oricode, CComposition_Present_HdeSize);

		bool result = r3mem::FreeHistory(m_History);
		if (result) {
			for (int i = 0; i < m_AllocateSize / 0x1000; i++) {
				if (MmiGetPhysicalAddress((PVOID)(m_BaseAddr + i * 0x1000)))
					Reboot();
				MmiFlushTLB((PVOID)(m_BaseAddr + i * 0x1000));
			}
		}

		AsmWriteCr3(oldcr3);
		
		if (i_enable)
			AsmSti();

		memset((PVOID)dwm_dlldata::dll, 0, sizeof(dwm_dlldata::dll));
		
			
		if (result)
			r3mem::DeleteHistory(m_History);

		//DbgPrint("[112233] freedwm:%d\n", result);
		return result;
	}
	__forceinline bool GetDWMVarsImpl() {
		//DbgBreakPoint();

		bool i_enable = AsmReadRFlags() & 0x200;
		if (i_enable)
			AsmCli();
		ULONG64 oldcr3 = SwitchToProcessCr3(DWMProcess);

		bool result = false;
		m_userbuffer = mem::r<ULONG64>(m_UserBufferPointer);
		printf("[112233] m_userbuffer:%p\n", m_userbuffer);
		ULONG_PTR DWMSwapChain = mem::r<ULONG64>(m_SwapChainPointer);
		p1x(DWMSwapChain);
		if (DWMSwapChain != 0 /*&& m_userbuffer != 0*/) {
			m_pBeep = mem::r<ULONG64>(m_BeepPointer);

			krd::SetDWM(DWMProcess, DWMSwapChain, m_userbuffer);
			kdx::KernelDxHook_SetDwm((ULONG64)DWMProcess);
			ProcessSwapChain(m_DWMSwapChain);
			printf("[112233] m_DWMSwapChain:%p\n", DWMSwapChain);
			printf("[112233] m_pBeep:%p\n", m_pBeep);
			result = true;
		}

		AsmWriteCr3(oldcr3); 
		
		if (i_enable)
			AsmSti();

		return result;
	}
	VOID TryFreeDWMImpl() {
		//if (PsGetCurrentProcess() == PsGetCurrentThreadProcess() && DWMProcess != 0 && PsGetCurrentProcess() == DWMProcess) {
			static int step = 0;
			if (step == 0) {
				if (m_bInjected == true) {
					static SHORT exec_lock = 0;
					static ULONG64 exec_last_time = 0;
					if (InterlockedCompareExchange16(&exec_lock, 1, 0) == 0) {
						ULONG64 now_time = GetRealTime();
						int detal_time = 300;
						if (now_time - exec_last_time > detal_time) {
							exec_last_time = now_time;

							if (GetRealTime() - m_uInjectedTime > 1000) {
								if (step == 0) {
									if (GetDWMVarsImpl()) {
										step = 1;
									}
								}
								if (step == 1) {
									if (FreeDWMImpl()) {
										m_bEnd = true;
										step = 999;
										printf("[112233] freeok\n");
									}
								}
							}
							if (GetRealTime() - m_uInjectedTime > 10000) {
								Reboot();
							}
						}
						exec_lock = 0;
					}
				}
			}
		//}
		

		
	}
	VOID TryFreeDWM() {
		//TryDecDWMINJ();
		if (m_zeroed == false)
			TryFreeDWMImpl();
	}
	VOID TryAllocateMemImpl() {
		if (DWMProcess == PsGetCurrentProcess() && m_BaseAddr == 0 
			&& PsGetCurrentProcess() == PsGetCurrentThreadProcess()) {
			static SHORT exec_lock = 0;
			static ULONG64 exec_last_time = 0;
			if (InterlockedCompareExchange16(&exec_lock, 1, 0) == 0) {
				ULONG64 now_time = GetRealTime();
				int detal_time = 1000;
				if (now_time - exec_last_time > detal_time) {
					exec_last_time = now_time;

					AllocateMemImpl();
					
				}
				exec_lock = 0;
			}
		}
	}
	VOID TryAllocateMem() {
		//TryDecDWMINJ();
		if (m_zeroed == false)
			TryAllocateMemImpl();
	}
	  
	bool isEnd() {
		return m_bEnd;
	}
	VOID DwmHandlerInjectImpl(bool FreeExec) {
		if (AsmReadCr8() >= 2)
			return;
		if (ExGetPreviousMode() != UserMode)
			return;
		
		if (!m_bEnd) {
			if (!m_bInjected) {
				TrySwitchDWM();
				if (DWMProcess != 0) {
					TryInjectDWM();
				}
				if (m_BaseAddr && alloc_starttime) {
					if (GetRealTime() - alloc_starttime > 15000)
						Reboot();
				}
			}
			else {
				TryFreeDWM();
			}
			
			if (m_bInjected && m_uInjectedTime) {
				if (GetRealTime() - m_uInjectedTime > 15000) {
					Reboot();
				}
			}
		}
	}
	VOID DwmHandlerInject(bool FreeExec) {
		//TryDecDWMINJ();
		if (m_zeroed == false)
			DwmHandlerInjectImpl(FreeExec);
	}
	VOID DwmInjectCallback()
	{
		DWM::DwmHandlerInject(false);
	}

}

