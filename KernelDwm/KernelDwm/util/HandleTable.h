#pragma once
#ifndef __PROCESS_GUARD__INCLUDED__
#define __PROCESS_GUARD__INCLUDED__

#include "DDKCommon.h"
#include "MyMemoryIo64.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef ULONG64(*EXPLOOPUPHANDLETABLEENTRY)(
	IN ULONG64 HandleTable,
	IN ULONG64 Handle
	);

BOOL FindFunction();
VOID InitTableValues();
PEPROCESS GetEprocessByPid(ULONG64 Pid);
//BOOL CloseTidAllHandle(ULONG64 Tid);

#ifdef __cplusplus
}
#endif

#endif // !__PROCESS_GUARD__INCLUDED__


