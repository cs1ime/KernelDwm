#pragma once

#ifndef __INJECT_DWM_H_
#define __INJECT_DWM_H_

#include <ntifs.h>

namespace DWM {
	extern ULONG64 m_offset_Context;
	VOID TryDecDWMINJ();
	VOID Init();
	VOID TryInjectDWM();
	VOID DwmHandlerInject(bool FreeExec);
	bool isEnd();
	VOID Init2();
	VOID DwmInjectCallback();
}


#endif // !__INJECT_DWM_H_

