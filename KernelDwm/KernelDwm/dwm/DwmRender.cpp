#include "DwmRender.h"
#include "AsyncRenderTask.h"
#include "DDKCommon.h"
#include "xorstr.hpp"
#include "kernelasm.h"

#pragma optimize( "", off )
struct MyTittle {
	ULONG Enable;
	CHAR Title[100];
};
namespace dwmvar {
	volatile PEPROCESS DwmProcess = 0;
	volatile ULONG64 SwapChainPointer = 0;
	volatile bool dwm_exit = false;
}

PEPROCESS g_dwm = 0;
bool g_dwm_exit = true;
TaskBuffer* g_task = 0;
ULONG64 g_pFlags = 0;
MyTittle* g_pTitle = 0;

PEPROCESS getDwm() {
	return g_dwm;
}
void SetDwm(PEPROCESS Dwm, ULONG64 RenderTaskPointer, ULONG64 FlagPointer, ULONG64 TitlePointer) {
	g_dwm = Dwm;
	g_task = (TaskBuffer*)RenderTaskPointer;
	g_pFlags = (ULONG64)FlagPointer;
	g_pTitle = (MyTittle*)TitlePointer;
	g_dwm_exit = false;
}
bool CheckRender() {
	bool result = false;
	if (g_dwm_exit == false) {
		if (g_dwm && MmiGetPhysicalAddress(g_dwm) && !KIsProcessExit(g_dwm) && g_task) {
			IRQL_STATE state;
			KRaiseIrqlToDpcOrHigh(&state);
			_CR4 cr4;
			cr4.all = AsmReadCr4();
			bool smap = cr4.SMAP == 1;
			if (smap == true) {
				cr4.SMAP = 0;
				AsmWriteCr4(cr4.all);
			}

			if (MmiGetPhysicalAddress(g_dwm)) {
				ULONG64 cr3 = KGetProcessCr3(g_dwm);
				ULONG64 old_cr3 = AsmReadCr3();
				AsmWriteCr3(cr3);

				if (MmiGetPhysicalAddress(g_task) && MmiGetPhysicalAddress(((PUCHAR)g_task + 8))) {
					ULONG Magic = 0;
					if (g_task->Magic == 'LUXE') {
						result = true;
					}
				}
				AsmWriteCr3(old_cr3);

			}

			if (smap == true) {
				cr4.SMAP = 1;
				AsmWriteCr4(cr4.all);
			}
			KLowerIrqlToState(&state);
		}
		else {
			g_dwm_exit = true;
		}
	}

	return result;
}

bool PresentToDWM(ReleasedTaskSenderCache *Cache) {
	if (CheckRender()) {
		//DbgPrint("[112233] checkok\n");
		bool result = false;
		if (g_dwm_exit == false) {
			if (g_dwm && MmiGetPhysicalAddress(g_dwm) && !KIsProcessExit(g_dwm) && g_task) {
				ObReferenceObject(g_dwm);
				IRQL_STATE state;
				KRaiseIrqlToDpcOrHigh(&state);
				_CR4 cr4;
				cr4.all = AsmReadCr4();
				bool smap = cr4.SMAP == 1;
				if (smap == true) {
					cr4.SMAP = 0;
					AsmWriteCr4(cr4.all);
				}

				if (MmiGetPhysicalAddress(g_dwm)) {
					ULONG64 cr3 = KGetProcessCr3(g_dwm);
					ULONG64 old_cr3 = AsmReadCr3();
					AsmWriteCr3(cr3);

					if (MmiGetPhysicalAddress(g_task)) {
						result = TaskSender::PresentToTask(g_task, Cache->Cache);
					}

					AsmWriteCr3(old_cr3);

				}

				if (smap == true) {
					cr4.SMAP = 1;
					AsmWriteCr4(cr4.all);
				}
				KLowerIrqlToState(&state);

				ObDereferenceObject(g_dwm);
				//print("[112233] result:%d\n", result);
				return result;
			}
			else {
				g_dwm_exit = true;
			}
		}

	}
	return false;
}
CHAR FlagsReadBuffer[0x1000] = { 0 };
bool ReadFlags(PVOID Buffer, ULONG64 Size) {
	if (CheckRender()) {
		bool result = false;
		if (g_dwm_exit == false) {
			if (g_dwm && MmiGetPhysicalAddress(g_dwm) && !KIsProcessExit(g_dwm) && g_task) {
				IRQL_STATE state;
				KRaiseIrqlToDpcOrHigh(&state);
				_CR4 cr4;
				cr4.all = AsmReadCr4();
				bool smap = cr4.SMAP == 1;
				if (smap == true) {
					cr4.SMAP = 0;
					AsmWriteCr4(cr4.all);
				}

				if (MmiGetPhysicalAddress(g_dwm)) {
					ULONG64 cr3 = KGetProcessCr3(g_dwm);
					ULONG64 old_cr3 = AsmReadCr3();
					AsmWriteCr3(cr3);

					if (MmiGetPhysicalAddress((PVOID)g_pFlags)) {
						memcpy(FlagsReadBuffer, (PVOID)g_pFlags, Size);
						result = true;
					}

					AsmWriteCr3(old_cr3);
					memcpy(Buffer, FlagsReadBuffer, Size);

				}

				if (smap == true) {
					cr4.SMAP = 1;
					AsmWriteCr4(cr4.all);
				}
				KLowerIrqlToState(&state);
				//print("[112233] result:%d\n", result);
				return result;
			}
			else {
				g_dwm_exit = true;
			}
		}
	}
	return false;
}

void confusion_data(PVOID data, ULONG size) {
	//»ìÏýÊý¾Ý
	int xorkey = 128;
	for (ULONG i = 0; i < size; i++) {
		((PUCHAR)data)[i] ^= xorkey;
		if (xorkey == 255) {
			xorkey = 128;
		}
		xorkey++;
	}
}
bool UpdateTitle(LPCSTR NewTitle) {
	bool result = false;
	if (g_dwm_exit == false) {
		if (g_dwm && MmiGetPhysicalAddress(g_dwm) && !KIsProcessExit(g_dwm) && g_pTitle) {
			IRQL_STATE state = { 0 };
			KRaiseIrqlToDpcOrHigh(&state);
			_CR4 cr4;
			cr4.all = AsmReadCr4();
			bool smap = cr4.SMAP == 1;
			if (smap == true) {
				cr4.SMAP = 0;
				AsmWriteCr4(cr4.all);
			}
			if (MmiGetPhysicalAddress(g_dwm)) {
				ULONG64 cr3 = KGetProcessCr3(g_dwm);
				ULONG64 old_cr3 = AsmReadCr3();
				AsmWriteCr3(cr3);

				if (MmiGetPhysicalAddress(g_pTitle) && MmiGetPhysicalAddress(((PUCHAR)g_pTitle + 8))) {
					MyTittle tt;
					memset(&tt, 0, sizeof(tt));
					tt.Enable = 1;
					strncpy(tt.Title, NewTitle, 80);
					confusion_data(tt.Title, 100);

					memcpy(g_pTitle, &tt, sizeof(tt));

					result = true;
				}
				AsmWriteCr3(old_cr3);

			}
			if (smap == true) {
				cr4.SMAP = 1;
				AsmWriteCr4(cr4.all);
			}
			KLowerIrqlToState(&state);
		}
		else {
			g_dwm_exit = true;
		}
	}

	return result;
}


#pragma optimize( "", on )
