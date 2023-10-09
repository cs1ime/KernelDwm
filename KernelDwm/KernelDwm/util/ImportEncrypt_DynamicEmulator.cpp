
#include <ntifs.h>
#include "../util/util.h"
#include "../util/khookutil.h"

namespace DynamicEmulator {
	ULONG_PTR offset_PreviousMode = DYNEMU_XOR((ULONG_PTR)0);
	ULONG_PTR offset_CurrentProcess = DYNEMU_XOR((ULONG_PTR)0);
	ULONG_PTR offset_ImageFileName = DYNEMU_XOR((ULONG_PTR)0);
	ULONG_PTR offset_ProcessId = DYNEMU_XOR((ULONG_PTR)0);

	VOID Init() {
		PVOID nt = ntos();
		ULONG_PTR pExGetPreviousMode = (ULONG_PTR)utilinc::GetProcAddress(nt, xs("ExGetPreviousMode"));
		offset_PreviousMode = *(ULONG*)(pExGetPreviousMode + 12);
		offset_PreviousMode = DYNEMU_XOR(offset_PreviousMode);

		ULONG_PTR pPsGetCurrentThreadProcess = (ULONG_PTR)utilinc::GetProcAddress(nt, xs("PsGetCurrentThreadProcess"));
		offset_CurrentProcess = *(ULONG*)(pPsGetCurrentThreadProcess + 12);
		offset_CurrentProcess = DYNEMU_XOR(offset_CurrentProcess);

		ULONG_PTR pPsGetProcessImageFileName = (ULONG_PTR)utilinc::GetProcAddress(nt, xs("PsGetProcessImageFileName"));
		offset_ImageFileName = *(ULONG*)(pPsGetProcessImageFileName + 3);
		offset_ImageFileName = DYNEMU_XOR(offset_ImageFileName);

		ULONG_PTR pPsGetProcessId = (ULONG_PTR)utilinc::GetProcAddress(nt, xs("PsGetProcessId"));
		offset_ProcessId = *(ULONG*)(pPsGetProcessId + 3);
		offset_ProcessId = DYNEMU_XOR(offset_ProcessId);

	}
}

