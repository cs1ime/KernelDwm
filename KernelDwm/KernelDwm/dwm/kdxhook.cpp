#include "DDKCommon.h"
#include "Kernelasm.h"
#include "MakeR3Mem.h"
#include "PeMapper.h"
#include "xorstr.hpp"
#include "kdxrender.h"
#include "compilecontrol.h"
#include "importencrypt.h"

namespace DWM {
	extern PETHREAD RenderThread;
}

namespace kdx {
	static ULONG64 g_dwm = 0;
	static ULONG64 PrevPrevFlashTime = 0;


	void KernelDxHook_SetDwm(ULONG64 dwm) {
		g_dwm = dwm;
	}

	VOID WrapMainCallback(ULONG_PTR Rsp) {
		_pt("cb!");
		if (DWM::RenderThread == PsGetCurrentThread()) {
			// _pt("cb!");
			{
				static SHORT exec_lock = 0;
				static ULONG64 exec_last_time = 0;

				if (InterlockedCompareExchange16(&exec_lock, 1, 0) == 0) {
					
					krd::TestRender(Rsp);
					exec_lock = 0;
				}
			}
			
		}
	}
}


