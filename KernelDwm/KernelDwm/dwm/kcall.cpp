#include <ntifs.h>
#include "kcall.h"
#include "ddkcommon.h"
#include "xorstr.hpp"
#include "kernelasm.h"
#include "CompileControl.h"
#include "importencrypt.h"

extern "C" VOID __KiCallUserMode2(ULONG64 OutVarPtr, ULONG64 CallCtx, ULONG64 KStackControl);
extern "C" VOID __KiCallUserMode2_1(ULONG64 OutVarPtr, ULONG64 CallCtx, ULONG64 KStackControl);
#define RVA(pos,off,off2)(pos == 0 ? 0 : *(LONG*)(pos+off)+pos+off2)
namespace KCall {
	MmCreateKernelStack_t MmCreateKernelStack = 0;
	MmDeleteKernelStack_t MmDeleteKernelStack = 0;

	ULONG precall_offset = 0;
	ULONG postcall_offset = 0;
}




