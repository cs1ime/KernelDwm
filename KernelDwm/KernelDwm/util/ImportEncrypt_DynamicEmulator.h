#pragma once

#ifndef _IMPORTENCRYPT_DYN_H_
#define _IMPORTENCRYPT_DYN_H_

#include <ntifs.h>
#include "XorCrypt.h"
#include "MyMemoryIo64.h"

namespace DynamicEmulator {

	extern ULONG_PTR offset_PreviousMode;
	extern ULONG_PTR offset_CurrentProcess;
	extern ULONG_PTR offset_ImageFileName;
	extern ULONG_PTR offset_ProcessId;


	VOID Init();

	__forceinline KPROCESSOR_MODE emu_ExGetPreviousMode() {
		return *(KPROCESSOR_MODE*)((PUCHAR)KeGetCurrentThread() + DYNEMU_XOR(offset_PreviousMode));
	}
	__forceinline PEPROCESS emu_PsGetCurrentThreadProcess() {
		return *(PEPROCESS*)((PUCHAR)KeGetCurrentThread() + DYNEMU_XOR(offset_CurrentProcess));
	}
	__forceinline UCHAR* emu_PsGetProcessImageFileName(PEPROCESS Process) {
		UCHAR *resp = (UCHAR*)((PUCHAR)Process + DYNEMU_XOR(offset_ImageFileName));
		if (!MmiGetPhysicalAddress(resp))
			return NULL;
		return resp;
	}
	__forceinline HANDLE emu_PsGetProcessId(PEPROCESS Process) {
		HANDLE* pHandle = (HANDLE*)((PUCHAR)Process + DYNEMU_XOR(offset_ProcessId));
		if (!MmiGetPhysicalAddress(pHandle))
			return 0;
		return *pHandle;
	}

}

#undef ExGetPreviousMode
#undef PsGetCurrentThreadProcess
#undef PsGetProcessImageFileName
#undef PsGetProcessId

#define ExGetPreviousMode DynamicEmulator::emu_ExGetPreviousMode
#define PsGetCurrentThreadProcess DynamicEmulator::emu_PsGetCurrentThreadProcess
#define PsGetProcessImageFileName DynamicEmulator::emu_PsGetProcessImageFileName
#define PsGetProcessId DynamicEmulator::emu_PsGetProcessId

#endif // !_IMPORTENCRYPT_H_




