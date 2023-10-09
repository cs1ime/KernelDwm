#pragma once

#ifndef _KDXHOOK_H_
#define _KDXHOOK_H_

#include <ntifs.h>

namespace kdx {
	void KernelDxHook_SetDwm(ULONG64 dwm);
	VOID InitKernelCallback();
	VOID WrapMainCallback(ULONG_PTR Rsp);
}

#endif // !_KDXHOOK_H_

