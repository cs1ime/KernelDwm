#pragma once

#ifndef _R0CALLR3_H_
#define _R0CALLR3_H_

#include <ntifs.h>
#include "../util/XorStr.hpp"
#include "../util/DDKCommon.h"
#include "../util/KernelAsm.h"

struct ProcessContext {
	PVOID user32;
	PVOID ntdll;
	PVOID shell32;
	PVOID PostCall;
	PVOID PreCall;
	ULONG_PTR stack[10];
	bool stackUseStatus[10];
	SHORT stackLock = 0;
	UCHAR *pKCallU;
	bool inited;
};
extern "C" DWORD g_offset_stack;
extern "C" DWORD g_kvashadow;
namespace KCall {
	typedef ULONG64 u64;
	typedef ULONG32 u32;
	typedef USHORT u16;
	typedef UCHAR u8;

	typedef u64(NTAPI* MmCreateKernelStack_t)(u32, u16, PETHREAD);
	typedef void(NTAPI* MmDeleteKernelStack_t)(u64, u8);
	extern MmCreateKernelStack_t MmCreateKernelStack;
	extern MmDeleteKernelStack_t MmDeleteKernelStack;

	extern ULONG precall_offset;
	extern ULONG postcall_offset;
	namespace rc4 {
		__forceinline void rc4_init(unsigned char *s, const unsigned char *key, unsigned long Len)
		{
			int i = 0, j = 0;
			char k[256] = { 0 };
			unsigned char tmp = 0;

			for (i = 0; i < 256; i++)
			{
				s[i] = i;
				k[i] = key[i%Len];
			}

			for (i = 0; i < 256; i++)
			{
				j = (j + s[i] + k[i]) % 256;
				tmp = s[i];
				s[i] = s[j];     //交换s[i]和s[j]
				s[j] = tmp;
			}
		}
		__forceinline void rc4_crypt(unsigned char *s, unsigned char *Data, unsigned long Len)
		{
			int i = 0, j = 0, t = 0;
			unsigned long k = 0;
			unsigned char tmp;

			for (k = 0; k < Len; k++)
			{
				i = (i + 1) % 256;
				j = (j + s[i]) % 256;
				tmp = s[i];
				s[i] = s[j];      //交换s[x]和s[y]
				s[j] = tmp;
				t = (s[i] + s[j]) % 256;
				Data[k] ^= s[t];
			}
		}
		__forceinline void rc4impl(unsigned char *Data, unsigned long DataLen, const unsigned char *key, unsigned long keylen) {
			unsigned char s[256] = { 0 };
			rc4_init(s, (unsigned char*)key, keylen);
			rc4_crypt(s, Data, DataLen);
		}
		__forceinline void rc4(unsigned char *Data, unsigned long DataLen) {
			unsigned char key[32];
			memcpy(key, xs("OIUADJ1231232JKHKJHWELkj12378987"), 32);
			rc4impl(Data, DataLen, key, 32);
		}
	}
	__forceinline bool TryInitProcessImpl(ProcessContext *ctx) {
			if (ctx->ntdll == 0) {
				ctx->ntdll = GetUserModeModuleBaseX64A(xs("ntdll.dll"));
				ctx->PreCall = (PUCHAR)ctx->ntdll + precall_offset;
			}
			if (ctx->user32 == 0) {
				ctx->user32 = GetUserModeModuleBaseX64A(xs("user32.dll"));
				ctx->PostCall = (PUCHAR)ctx->user32 + postcall_offset;
			}
			if (ctx->shell32 == 0) {
				ctx->shell32 = GetUserModeModuleBaseX64A(xs("ntdll.dll"));
			}
			if (ctx->pKCallU == 0)
			{
				ctx->pKCallU = (UCHAR*)KAllocatePool(0x400);
			}

			if (ctx->ntdll && ctx->PostCall && ctx->PreCall && ctx->user32 && ctx->shell32) {
				for (int i = 0; i < 10; i++) {
					ctx->stack[i] = MmCreateKernelStack(false, 0, 0);
					ctx->stackUseStatus[i] = 0;
				}
				ctx->stackLock = 0;

				char shellcode[385] = {};
				memcpy(shellcode, xs("\x90\xEB\x08\x90\x90\x90\x90\x90\x90\x90\x90\x48\xC7\xC0\xE4\x0E\x00\x00\x48\x35\xDC\x0F\x00\x00\x48\x2B\xE0\x48\x83\xC4\x10\x74\x06\x75\x04\x90\x90\x90\x90\x48\x83\xEC\x10\x44\x0F\x29\x54\x24\x70\x0F\x29\x7C\x24\x40\x48\x8D\x84\x24\x00\x01\x00\x00\x44\x0F\x29\x58\x80\x44\x0F\x29\x70\xB0\x0F\x29\x74\x24\x30\x44\x0F\x29\x68\xA0\x44\x0F\x29\x44\x24\x50\x44\x0F\x29\x78\xC0\x44\x0F\x29\x4C\x24\x60\x44\x0F\x29\x60\x90\x48\x89\x68\xF8\x48\x8B\xEC\x48\x89\x18\x48\x89\x78\x08\x48\x89\x70\x10\x4C\x89\x68\x20\x4C\x89\x78\x30\x4C\x89\x60\x18\x4C\x89\x70\x28\x48\x89\x8D\xD8\x00\x00\x00\x49\x8D\x40\xD0\x48\x89\x85\xE0\x00\x00\x00\x68\x01\x09\x00\x00\x48\x81\x34\x24\x89\x08\x00\x00\x58\x65\x48\x8B\x18\x49\x89\x60\x20\x48\x8B\xB3\x90\x00\x00\x00\x48\x89\xB5\xD0\x00\x00\x00\xFA\x4C\x89\x43\x28\x4D\x8D\x48\x50\x4C\x89\x4B\x38\xE8\x00\x00\x00\x00\x58\x48\x2D\xCB\x00\x00\x00\x83\x38\x00\x74\x15\xE8\x00\x00\x00\x00\x58\x48\x2D\xE0\x00\x00\x00\x8B\x00\x67\x65\x4C\x89\x00\xEB\x0D\x65\x48\x8B\x3C\x25\x08\x00\x00\x00\x4C\x89\x47\x04\xB9\x00\x60\x00\x00\x4C\x2B\xC9\x65\x4C\x89\x04\x25\xA8\x01\x00\x00\x4C\x89\x4B\x30\x49\x8D\xA0\x70\xFE\xFF\xFF\x48\x8B\xFC\xB9\x32\x00\x00\x00\xF3\x48\xA5\x48\x8D\xAE\xF0\xFE\xFF\xFF\x0F\xAE\x55\xAC\x4C\x8B\x9D\xF8\x00\x00\x00\x48\x8B\xAD\xD8\x00\x00\x00\x48\x8B\x42\x10\x48\x8B\x62\x08\x48\x8B\x0A\xF3\x0F\x10\x42\x18\xF3\x0F\x10\x52\x28\xF3\x0F\x10\x4A\x20\xF3\x0F\x10\x5A\x30\x48\x83\x7A\x38\x00\x74\x04\x4C\x8B\x6A\x38\xE8\x00\x00\x00\x00\x48\x83\x04\x24\x07\xC3\x01\x0F\x01\xF8\x48\x0F\x07\x59\x66\xCF\xEF"
				), 385);
				*(ULONG*)(shellcode + 3) = g_offset_stack;
				*(ULONG*)(shellcode + 7) = g_kvashadow;
				//ctx->pKCallU = ExAllocatePool(NonPagedPool, sizeof(shellcode));
				memcpy(ctx->pKCallU, shellcode, sizeof(shellcode));
				rc4::rc4(ctx->pKCallU, 400);

				return true;
			}


			return false;
		}
	__forceinline bool TryInitProcess(ProcessContext *ctx) {
			if (ctx->inited)
				return true;
			bool i_enable = AsmReadRFlags() & 0x200;
			if (i_enable)
				AsmCli();
			_CR4 cr4 = { 0 };
			cr4.all = AsmReadCr4();
			bool smap = cr4.SMAP == 1;
			if (smap == true) {
				cr4.SMAP = 0;
				AsmWriteCr4(cr4.all);
			}

			bool result = TryInitProcessImpl(ctx);

			if (smap == true) {
				cr4.SMAP = 1;
				AsmWriteCr4(cr4.all);
			}
			if (i_enable)
				AsmSti();
			if (result)
				ctx->inited = result;
			return result;
		}

	__forceinline ULONG_PTR AcquireStack(ProcessContext *ctx) {
			ULONG_PTR result = 0;
			if (InterlockedCompareExchange16(&ctx->stackLock, 1, 0) == 0) {
				for (int i = 0; i < 10; i++) {
					if (ctx->stackUseStatus[i] == 0) {
						ctx->stackUseStatus[i] = 1;
						result = ctx->stack[i];
						break;
					}
				}

				ctx->stackLock = 0;
			}
			return result;
		}
	__forceinline void ReleaseStack(ProcessContext *ctx, ULONG_PTR stack) {
			for (int i = 0; i < 10; i++) {
				if (ctx->stack[i] == stack) {
					ctx->stackUseStatus[i] = 0;
					break;
				}
			}
		}
	__forceinline u64 Call2(ProcessContext *ctx, ULONG64 ptr, char* userRsp, void** callData)
		{
			//alloc new kernel stack
			auto CurrentThread = (u64)KeGetCurrentThread();
			//auto KernelStack = ctx->stack;
			//auto KernelStack = MmCreateKernelStack(false, 0, 0);
			auto KernelStack = AcquireStack(ctx);
			if (!KernelStack) return 0;

			//fill kernel stack control
			auto KernelStackControl = KernelStack - 0x50;
			*(u64*)(KernelStack - 0x50) = KernelStack;
			*(u64*)(KernelStack - 0x48) = KernelStack - 0x6000;
			*(u64*)(KernelStack - 0x40) = *(u64*)(CurrentThread + 0x38);
			*(u64*)(KernelStack - 0x38) = *(u64*)(CurrentThread + 0x30);
			*(u64*)(KernelStack - 0x28) = *(u64*)(CurrentThread + 0x28);

			//fill kernel shadow stack control
			*(u64*)(KernelStack - 0x20) = 0;
			*(u64*)(KernelStack - 0x18) = 0;
			*(u64*)(KernelStack - 0x10) = 0;
			*(u64*)(KernelStack - 0x08) = 0;

			//push ret to kernel addr
			*(ULONG64*)(userRsp + 0x48) = (ULONG64)ctx->PostCall;

			//goto usermode
			callData[2] = (PVOID)ptr;
			callData[1] = userRsp;
			callData[0] = ctx->PreCall;

			//get apc state
			auto apcIndex = *(u8*)(CurrentThread + 0x24A);
			auto v1 = *(u16*)(CurrentThread + 0x1E4);
			auto v2 = *(u16*)(CurrentThread + 0x1E6);

			//fix apc state
			*(u16*)(CurrentThread + 0x1E4) = 0;
			*(u16*)(CurrentThread + 0x1E6) = 0;
			*(u8*)(CurrentThread + 0x24A) = 0;

			typedef VOID(*FnKiCallUserMode2)(ULONG64 OutVarPtr, ULONG64 CallCtx, ULONG64 KStackControl);
			auto pFnKiCallUserMode2 = (FnKiCallUserMode2)ctx->pKCallU;
			//goto usermode
			u64 retValPtr = 0;
			rc4::rc4(ctx->pKCallU, 400);
			pFnKiCallUserMode2((ULONG64)&retValPtr, (ULONG64)callData, (ULONG64)KernelStackControl);
			rc4::rc4(ctx->pKCallU, 400);
			//__KiCallUserMode2_1((ULONG64)&retValPtr, (ULONG64)callData, (ULONG64)KernelStackControl);

			//restore apc state
			*(u16*)(CurrentThread + 0x1E4) = v1;
			*(u16*)(CurrentThread + 0x1E6) = v2;
			*(u8*)(CurrentThread + 0x24A) = apcIndex;

			//delete kernel stack
			//MmDeleteKernelStack(KernelStack, false);
			ReleaseStack(ctx, KernelStack);
			return *(u64*)retValPtr;
		}
	__forceinline u64 GetUserStackPtr() {
			auto CurrentThread = (u64)KeGetCurrentThread();
			auto trapFrame = *(KTRAP_FRAME**)(CurrentThread + 0x90);
			return *(u64*)&trapFrame->Rsp;
		}
	__forceinline ULONG64 Call(ProcessContext *ctx, ULONG64 ptr, ULONG64 a1, ULONG64 a2, ULONG64 a3, ULONG64 a4) {
			auto NewUserRsp = (char*)((GetUserStackPtr() - 0x98) & 0xFFFFFFFFFFFFFFF0);
			ULONG OldIrql = AsmReadCr8();
			if (OldIrql > 0) {
				AsmWriteCr8(0);
			}
			bool i_enable = AsmReadRFlags() & 0x200;

			*(u64*)(NewUserRsp + 0x20 + (0 * 8)) = a1;
			*(u64*)(NewUserRsp + 0x20 + (1 * 8)) = a2;
			*(u64*)(NewUserRsp + 0x20 + (2 * 8)) = a3;
			*(u64*)(NewUserRsp + 0x20 + (3 * 8)) = a4;

			void* cData[9];
			memset(&cData, 0, sizeof(cData));

			ULONG64 ret = Call2(ctx, ptr, NewUserRsp, cData);

			if (OldIrql > 0) {
				AsmWriteCr8(OldIrql);
			}
			if (!i_enable)
				AsmCli();

			return ret;
		}
	__forceinline ULONG64 Call(ProcessContext *ctx, ULONG64 ptr, ULONG64 a1, ULONG64 a2, ULONG64 a3, ULONG64 a4, ULONG64 a5, ULONG64 a6) {
			auto NewUserRsp = (char*)((GetUserStackPtr() - 0x98) & 0xFFFFFFFFFFFFFFF0);
			bool i_enable = AsmReadRFlags() & 0x200;
			ULONG OldIrql = AsmReadCr8();
			if (OldIrql > 0) {
				AsmWriteCr8(0);
			}

			*(u64*)(NewUserRsp + 0x20 + (0 * 8)) = a1;
			*(u64*)(NewUserRsp + 0x20 + (1 * 8)) = a2;
			*(u64*)(NewUserRsp + 0x20 + (2 * 8)) = a3;
			*(u64*)(NewUserRsp + 0x20 + (3 * 8)) = a4;
			*(u64*)(NewUserRsp + 0x70 + (0 * 8)) = a5;
			*(u64*)(NewUserRsp + 0x70 + (1 * 8)) = a6;

			void* cData[9];
			memset(&cData, 0, sizeof(cData));

			ULONG64 ret = Call2(ctx, ptr, NewUserRsp, cData);

			if (OldIrql > 0) {
				AsmWriteCr8(OldIrql);
			}
			if (!i_enable)
				AsmCli();
			return ret;
		}

	extern VOID Init();
}

#endif // !_R0CALLR3_H_

