#pragma once

#ifndef _DDKCOMMON_INLIBNE_H_
#define _DDKCOMMON_INLIBNE_H_

#include <ntifs.h>
#include <ntimage.h>
#include "KernelAsm.h"
#include "ImportEncrypt.h"
 
__forceinline PVOID KGetFunctionBegin(PVOID Module, PVOID pc) {
	ULONG64 uPc = (ULONG64)pc;
	PUCHAR nt = (PUCHAR)Module;
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)nt;
	IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(idh->e_lfanew + nt);
	if (inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].VirtualAddress) {
		DWORD sz = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].Size;
		IMAGE_RUNTIME_FUNCTION_ENTRY* pFun =
			(IMAGE_RUNTIME_FUNCTION_ENTRY*)(inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].VirtualAddress + nt);
		for (int i = 0; i < sz / sizeof(IMAGE_RUNTIME_FUNCTION_ENTRY); i++) {
			ULONG64 Begin = pFun[i].BeginAddress + (ULONG64)nt;
			ULONG64 End = pFun[i].EndAddress + (ULONG64)nt;
			if (uPc >= Begin && uPc < End) {
				return (PVOID)Begin;
			}
		}
	}

}
__forceinline PVOID KGetFunctionEnd(PVOID Module, PVOID pc) {
	ULONG64 uPc = (ULONG64)pc;
	PUCHAR nt = (PUCHAR)Module;
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)nt;
	IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(idh->e_lfanew + nt);
	if (inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].VirtualAddress) {
		DWORD sz = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].Size;
		IMAGE_RUNTIME_FUNCTION_ENTRY* pFun =
			(IMAGE_RUNTIME_FUNCTION_ENTRY*)(inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].VirtualAddress + nt);
		for (int i = 0; i < sz / sizeof(IMAGE_RUNTIME_FUNCTION_ENTRY); i++) {
			ULONG64 Begin = pFun[i].BeginAddress + (ULONG64)nt;
			ULONG64 End = pFun[i].EndAddress + (ULONG64)nt;
			if (uPc >= Begin && uPc < End) {
				return (PVOID)End;
			}
		}
	}
}
__forceinline PVOID KGetImportFunctionPtr(PVOID64 ModuleBase, LPCSTR ImportModule, LPCSTR ImportFunction) {

	ULONG64 ModBase = (ULONG64)ModuleBase;
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)ModBase;
	IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(idh->e_lfanew + ModBase);
	DWORD size = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].Size;
	IMAGE_IMPORT_DESCRIPTOR* iid = (IMAGE_IMPORT_DESCRIPTOR*)(inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress + ModBase);

	for (DWORD i = 0; i < size / sizeof(IMAGE_IMPORT_DESCRIPTOR); i++) {
		if (iid[i].Name == NULL)break;
		PCSTR DName = (PCSTR)(iid[i].Name + ModBase);
		if (!stricmp(DName, ImportModule)) {
			PDWORD64 FirstThunk = (PDWORD64)(iid[i].FirstThunk + ModBase);
			DWORD j = 0;
			DWORD64 Value;
			while (Value = FirstThunk[j]) {
				if (Value & 0x8000000000000000)continue;
				LPCSTR Name = (LPCSTR)((ULONG_PTR)ModuleBase + (ULONG_PTR)Value + 2);
				if (!stricmp(Name, ImportFunction)) {
					return &FirstThunk[j];
				}
				++j;
			}
		}
	}
	return 0;
}

#define DPC_CLI_BEGIN \
bool i_enable=AsmReadRFlags()&0x200;\
if(i_enable)AsmCli();\
unsigned int old_irql=AsmReadCr8();\
if(old_irql<2)AsmWriteCr8(2);\

#define DPC_CLI_END \
if(i_enable)AsmSti();\
if(old_irql<2)AsmWriteCr8(old_irql);\



#endif // !_DDKCOMMON_INLIBNE_H_

