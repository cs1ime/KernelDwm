#include "ntifs.h"
#include "../hde/hde64.h"
#include "ddkcommon.h"
#include "xorstr.hpp"
#include "importencrypt.h"
#include "compilecontrol.h"
#include "../dwm/InjectDWM.h"

extern "C" unsigned char hde64_table[529];
namespace Dxgk {

	struct struMoreHook {
		ULONG64 m_pWin32kNtGdiDdDDISubmitCommandPtr;
		ULONG64 m_pDxgkNtGdiDdDDISubmitCommand;

		UCHAR OriginCode[50];
		int OriginLen;
		ULONG64 OriginV;
		PVOID UseShellcode;

	};
	struMoreHook MoreHook[20] = { 0 };
	int hookcnt = 0;


	bool dxhook_removed = false;
	bool isRemoved() {
		return dxhook_removed;
	}

	VOID TryRemoveDxgkHook();
	VOID win32kCallback() {

		DWM::DwmHandlerInject(true);
		if (DWM::isEnd()) {
			TryRemoveDxgkHook();
		}
		
		//printf("[112233] win32k!\n");
	}

	ULONG64 rem_start = 0;
	VOID RemoveHook() {

		for (int i = 0; i < hookcnt; i++) {
			auto ctx = &MoreHook[i];

			ULONG bn = KGetBuildNumber();
			if (bn <= WIN10_1809) {
				*(ULONG_PTR*)ctx->m_pWin32kNtGdiDdDDISubmitCommandPtr = ctx->OriginV;
			}
			else if (bn >= WIN10_1903) {
				MmiWriteVirtualAddressSafe(ctx->m_pDxgkNtGdiDdDDISubmitCommand, ctx->OriginCode, ctx->OriginLen);
			}
			
		}
		rem_start = GetRealTime();
		//DbgBreakPoint();
	}
	bool m_bFreeed = false;
	VOID TryFreeMem() {
		if (m_bFreeed == false) {
			static SHORT exec_lock = 0;
			static ULONG64 exec_last_time = 0;
			if (InterlockedCompareExchange16(&exec_lock, 1, 0) == 0) {
				ULONG64 now_time = GetRealTime();
				int detal_time = 50;
				if (now_time - exec_last_time > detal_time) {
					exec_last_time = now_time;

					if (rem_start) {
						if (GetRealTime() - rem_start > 1000) {
							for (int i = 0; i < hookcnt; i++) {
								auto ctx = &MoreHook[i];
								if (ctx->UseShellcode) {
									memset(ctx->UseShellcode, 0, 0x300);
									//KFreePool(ctx->UseShellcode, 0x300);
									ExFreePool(ctx->UseShellcode);
								}
							}
							printf("[112233] hookcnt;%d\n", hookcnt);
							printf("[112233] dxgk freeed!\n");
							m_bFreeed = true;
						}
					}

				}
				exec_lock = 0;
			}
		}
		

		
			

		
	}
	VOID TryRemoveDxgkHook() {
		if (dxhook_removed == false) {
			static SHORT exec_lock = 0;
			static ULONG64 exec_last_time = 0;
			if (InterlockedCompareExchange16(&exec_lock, 1, 0) == 0) {
				ULONG64 now_time = GetRealTime();
				int detal_time = 10;
				if (now_time - exec_last_time > detal_time) {
					exec_last_time = now_time;

					if (DWM::isEnd()) {
						if (dxhook_removed == false) {
							Dxgk::RemoveHook();
							pt("removed");
							dxhook_removed = true;
						}
					}

				}
				exec_lock = 0;
			}
		}



	}

}


