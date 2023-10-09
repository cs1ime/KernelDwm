#pragma once

#ifndef _PROCESS_H
#define _PROCESS_H

#include <ntifs.h>

namespace Process {
	extern ULONG64 PspCidTable;

	VOID Init();
	__forceinline ULONG64 __fastcall EMU_ExpLookupHandleTableEntry(ULONG_PTR a1, __int64 a2)
	{
		unsigned __int64 v2; // rdx
		__int64 v3; // r8

		v2 = a2 & 0xFFFFFFFFFFFFFFFCui64;
		if (!MmiGetPhysicalAddress((ULONG64*)(a1 + 8)) || !MmiGetPhysicalAddress((ULONG64*)(a1))) {
			pt("miguan!!");
			return 0;
		}
		if (v2 >= *(unsigned int*)a1)
			return 0i64;
		v3 = *(ULONG64*)(a1 + 8);
		if ((v3 & 3) == 1) {
			if (MmiGetPhysicalAddress((ULONG64*)(v3 + 8 * (v2 >> 10) - 1))) {
				return *(ULONG64*)(v3 + 8 * (v2 >> 10) - 1) + 4 * (v2 & 0x3FF);
			}
			pt("miguan!!");
			return 0;
		}
			
		if ((v3 & 3) != 0) {
			if (MmiGetPhysicalAddress((ULONG64*)(*(ULONG64*)(v3 + 8 * (v2 >> 19) - 2)))) {
				return *(ULONG64*)(*(ULONG64*)(v3 + 8 * (v2 >> 19) - 2) + 8 * ((v2 >> 10) & 0x1FF)) + 4 * (v2 & 0x3FF);
			}
			pt("miguan!!");
			return 0;
		}
			
		return v3 + 4 * v2;
	}
	__forceinline PEPROCESS GetProcessByPid(ULONG64 Pid) {
		if (PspCidTable == 0)
			return NULL;
		ULONG64 Entry = EMU_ExpLookupHandleTableEntry(PspCidTable, Pid);
		if (Entry == 0)
			return NULL;
		if (!MmiGetPhysicalAddress((PVOID)Entry)) {
			return NULL;
		}
		//DbgPrint("Entry:%p\n", Entry);
		if (Entry) {
			ULONG64 value = *(ULONG64*)Entry;
			if (KGetBuildNumber() < WIN10) {
				//win7
				ULONG64 mask = ~(ULONG64)7;
				value = value & mask;
				return (MmiGetPhysicalAddress((PVOID)value) && !KIsProcessExit((PEPROCESS)value)) ? (PEPROCESS)value : NULL;
			}
			else {
				value = value >> 0x10;
				if (value == 0)
					return NULL;
				value = value | 0xFFFF000000000000;
				return (MmiGetPhysicalAddress((PVOID)value) && !KIsProcessExit((PEPROCESS)value)) ? (PEPROCESS)value : NULL;
			}

		}
		return NULL;
	}
	__forceinline PEPROCESS FindProcess(LPCSTR ProcessName) {
		if (PspCidTable == 0)
			return 0;
		for (int i = 4; i < 0x10000; i += 4) {
			PEPROCESS Process = GetProcessByPid(i);
			//p1x(Process);
			if (Process) {
				CHAR pName[16];
				memset(pName, 0, 16);
				UCHAR* Name = PsGetProcessImageFileName(Process);
				if (Name) {
					memcpy(pName, Name, 15);
					if (!stricmp(ProcessName, pName)) {
						return Process;
					}
				}
			}
		}
		return 0;

	}
	__forceinline BOOL KIsPidActive(ULONG Pid) {
		PEPROCESS Process = GetProcessByPid(Pid);
		if (MmiGetPhysicalAddress(Process) == 0)
			return FALSE;
		BOOL Result = FALSE;
		//NTSTATUS stats = PsLookupProcessByProcessId((HANDLE)Pid, &Process);
		if (Process) {
			if (!KIsProcessExit(Process)) {
				Result = TRUE;
			}
			//ObDereferenceObject(Process);
		}
		return Result;
	}
}

#endif // !_PROCESS_H

