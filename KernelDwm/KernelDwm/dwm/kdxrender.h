#pragma once
#ifndef _KDX_RENDER_H_
#define _KDX_RENDER_H_
#include <ntifs.h>
#include "kcall.h"
namespace krd {
	extern ProcessContext dwmctx;
	VOID Init();
	VOID SetDWM(PEPROCESS proc, ULONG64 SwapChain, ULONG64 userbuffer);
	VOID TestRender(ULONG_PTR Rsp);
	VOID SetResolution(LONG x, LONG y);

}

#endif // !_KDX_RENDER_H_
