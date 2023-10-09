#pragma once

#ifndef __MAKE_R3_MEM__
#define __MAKE_R3_MEM__
#include "ntdef.h"


namespace r3mem {
	PVOID NewHistory();
	VOID DeleteHistory(PVOID h);
	bool FreeHistory(PVOID a_his);

	//BOOLEAN Init();
	BOOLEAN MakeR3Memory(ULONG64 start, ULONG64 size, PVOID a_his);
	ULONG64 AllocR3Mem(ULONG Size, PVOID his);
}

#endif // !__MAKE_R3_MEM__

