#include <ntifs.h>

extern "C" ULONG g_offset_stack;
extern "C" ULONG g_kvashadow;
//ULONG g_offset_stack_c;
//ULONG g_kvashadow_c;
__attribute__((naked)) VOID __KiCallUserMode2_C(ULONG64 OutVarPtr, ULONG64 CallCtx, ULONG64 KStackControl) {
	_asm {
		
	}
}

