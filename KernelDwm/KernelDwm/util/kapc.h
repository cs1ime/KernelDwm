#ifndef _KAPC_H_
#define _KAPC_H_

#include <ntifs.h>
#include "XorCrypt.h"
#include "DDKCommon.h"

extern PVOID g_KiSignalThreadForApc;

__forceinline char __fastcall MyKeInitializeApc(
	PRKAPC Apc,
	PRKTHREAD Thread,
	char Environment,
	PVOID KernelRoutine,
	PVOID RundownRoutine,
	PVOID NormalRoutine,
	KPROCESSOR_MODE ApcMode,
	PVOID NormalContext)
{
	char result; // al

	Apc->Type = 18;
	Apc->Size = 88;
	if (Environment == 2)
		Environment = *(char*)((char*)Thread + 0x24A);
	Apc->ApcStateIndex = Environment;
	Apc->Reserved[1] = RundownRoutine;
	Apc->Thread = Thread;
	Apc->Reserved[2] = (void(__fastcall *)(void *, void *, void *))NormalRoutine;
	Apc->Reserved[0] = (void(__fastcall *)(_KAPC *, void(__fastcall **)(void *, void *, void *), void **, void **, void **))KernelRoutine;
	result = NormalRoutine != 0i64 ? ApcMode : 0;
	Apc->ApcMode = result;
	Apc->NormalContext = (void *)((unsigned __int64)NormalContext & -(__int64)(NormalRoutine != 0i64));
	Apc->Inserted = 0;
	return result;
}

__forceinline _LIST_ENTRY *__fastcall KiInsertQueueApc(PKAPC Apc)
{
	_KTHREAD *Thread; // rdx
	char *p_ApcStateIndex; // rax
	__int64 v3; // rax
	_KAPC_STATE *TargetThreadApcState; // r8
	__int64 ApcMode; // rax
	_LIST_ENTRY *v6; // rcx
	_LIST_ENTRY *v7; // rdx
	_LIST_ENTRY *result; // rax
	PVOID KernelRoutine; // r9
	_LIST_ENTRY *p_ApcListEntry; // rcx
	_LIST_ENTRY *v11; // rdx
	_LIST_ENTRY *v12; // r8
	_LIST_ENTRY *Flink; // rdx
	_LIST_ENTRY *ApcList; // rcx
	_LIST_ENTRY *v15; // rdx

	int offset_ApcStateIndex = 0x24A;
	int offset_ApcState = 0x98;

	Thread = Apc->Thread;
	p_ApcStateIndex = (char *)Thread + offset_ApcStateIndex;
	if (!Apc->ApcStateIndex && *p_ApcStateIndex)
	{
		v3 = 0x258i64;                              // SavedApcState    
	}
	else
	{
		Apc->ApcStateIndex = *p_ApcStateIndex;
		v3 = 0x98i64;                               // ApcState
	}
	TargetThreadApcState = (_KAPC_STATE *)((char *)Thread + v3);
	ApcMode = Apc->ApcMode;
	if (Apc->Reserved[2])
	{

		//if (!(UCHAR)ApcMode)
		{
			//InsertAPC to TargetThread
			v6 = &Apc->ApcListEntry;
			v7 = &TargetThreadApcState->ApcListHead[ApcMode];
			result = v7->Blink;
			if (result->Flink == v7)
			{
				v6->Flink = v7;
				v6->Blink = result;
				result->Flink = v6;
				v7->Blink = v6;
				return result;
			}
			return 0;
		}
		KernelRoutine = Apc->Reserved[0];
		v12 = &TargetThreadApcState->ApcListHead[ApcMode];
		for (result = v12->Flink; result != v12; result = result->Flink)
			;
		PKAPC_STATE papc = (PKAPC_STATE)((char*)Thread + offset_ApcState);
		papc->UserApcPendingAll |= 1u;
	}
	else
	{
		v15 = &TargetThreadApcState->ApcListHead[ApcMode];
		for (result = v15->Blink; result != v15 && ((PKAPC_STATE)result)->Process; result = result->Blink)// result[2].Flink=KAPC_STATE->Process
			;
	}
	Flink = result->Flink;
	ApcList = &Apc->ApcListEntry;
	if (result->Flink->Blink != result)
		return 0;
	ApcList->Flink = Flink;
	ApcList->Blink = result;
	Flink->Blink = ApcList;
	result->Flink = ApcList;
	return result;
}

__forceinline BOOLEAN MyKeInsertQueueApcNoAlert(
	IN PRKAPC Apc,
	IN PVOID SystemArgument1,
	IN PVOID SystemArgument2,
	IN KPRIORITY Increment
) {
	PETHREAD Thread = Apc->Thread;
	PLONG64 pLock = (PLONG64)((PUCHAR)Thread + 0x40);
	//if (InterlockedBitTestAndSet64((volatile LONG64*)pLock, 0) == 0) {
	ULONG_PTR prcb = __readgsqword(0x20);
	Apc->SystemArgument1 = SystemArgument1;
	Apc->SystemArgument2 = SystemArgument2;
	Apc->Inserted = 1;
	KiInsertQueueApc(Apc);
	return TRUE;
	//}
	//return FALSE;
}

__forceinline BOOLEAN MyKeInsertQueueApc(
	IN PRKAPC Apc,
	IN PVOID SystemArgument1,
	IN PVOID SystemArgument2,
	IN KPRIORITY Increment
) {
	PETHREAD Thread = Apc->Thread;
	PLONG64 pLock = (PLONG64)((PUCHAR)Thread + 0x40);
	//if (InterlockedBitTestAndSet64((volatile LONG64*)pLock, 0) == 0) {
	ULONG_PTR prcb = __readgsqword(0x20);
	Apc->SystemArgument1 = SystemArgument1;
	Apc->SystemArgument2 = SystemArgument2;
	Apc->Inserted = 1;
	KiInsertQueueApc(Apc);
	typedef VOID(*FnKiSignalThreadForApc)(ULONG_PTR Prcb, PKAPC Apc, char Irql);
	auto aa = (FnKiSignalThreadForApc)MOU_XOR(g_KiSignalThreadForApc);
	ULONG current_irql = AsmReadCr8();
	aa(prcb, Apc, current_irql);
	//*pLock = 0;
	return TRUE;
	//}
	//return FALSE;
}

extern void APCKernelRoutine(PKAPC apc);
extern  VOID ApcpKernelRoutineAlertThreadCallback(
	_In_ PKAPC Apc
);

__forceinline BOOLEAN MyApcExecUsermode(PETHREAD Thread, PVOID Address) {
	 
	PKAPC ExecutionApc = (PKAPC)ExAllocatePool(NonPagedPool, sizeof(KAPC));
	PKAPC AlertThreadApc = (PKAPC)ExAllocatePool(NonPagedPool, sizeof(KAPC));

	memset(ExecutionApc, 0, sizeof(KAPC));
	memset(AlertThreadApc, 0, sizeof(KAPC));

	typedef VOID(*FnKeInitializeApc)(
		_Out_ PKAPC Apc,
		_In_ PETHREAD Thread,
		_In_ ULONG64 Environment,
		_In_ PVOID KernelRoutine,
		_In_opt_ PVOID RundownRoutine,
		_In_opt_ PVOID NormalRoutine,
		_In_opt_ KPROCESSOR_MODE ApcMode,
		_In_opt_ PVOID NormalContext
	);
	FnKeInitializeApc KeInitializeApc=(decltype(KeInitializeApc))KGetProcAddress(ntos(), "KeInitializeApc");


	KeInitializeApc(ExecutionApc, Thread, 0, APCKernelRoutine, 0, Address, UserMode, 0);

	KeInitializeApc(
		AlertThreadApc,
		Thread,
		0,
		ApcpKernelRoutineAlertThreadCallback,
		NULL,
		NULL,
		KernelMode,
		NULL
	);

	
	
	typedef BOOLEAN(*FnKeInsertQueueApc)(PKAPC apc, PVOID, PVOID, PVOID);
	FnKeInsertQueueApc KeInsertQueueApc = (decltype(KeInsertQueueApc))KGetProcAddress(ntos(), "KeInsertQueueApc");
	
	BOOLEAN r = KeInsertQueueApc(ExecutionApc, 0, 0, 0);
	KeInsertQueueApc(AlertThreadApc, 0, 0, 0);

	
	p1x(r);

	return TRUE;
}

void kapc_init();

#endif // !_KAPC_H_
