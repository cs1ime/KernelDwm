#pragma once

#ifndef PAT_WRAPPER_H_
#define PAT_WRAPPER_H_

#include "DDKCommon.h"

__forceinline ULONG_PTR LocateRVA(PVOID Module, LPCSTR SectionName, LPCSTR Pattern, LONG offset1, LONG offset2) {
	ULONG_PTR pos = ScanSection_Image(Module, SectionName, Pattern);
	if (pos) {
		return *(LONG*)(pos + offset1) + pos + offset2;
	}
	return 0;
}


#endif
