#pragma once
#ifndef _EXPORTS__INDLC
#define _EXPORTS__INDLC

#include "ntifs.h"
typedef enum _SYSTEM_INFORMATION_CLASS {
	SystemBasicInformation,
	SystemProcessorInformation,
	SystemPerformanceInformation,
	SystemTimeOfDayInformation,
	SystemNotImplemented1,
	SystemProcessesAndThreadsInformation,
	SystemCallCounts,
	SystemConfigurationInformation,
	SystemProcessorTimes,
	SystemGlobalFlag,
	SystemNotImplemented2,
	SystemModuleInformation,
	SystemLockInformation,
	SystemNotImplemented3,
	SystemNotImplemented4,
	SystemNotImplemented5,
	SystemHandleInformation,
	SystemObjectInformation,
	SystemPagefileInformation,
	SystemInstructionEmulationCounts,
	SystemInvalidInfoClass1,
	SystemCacheInformation,
	SystemPoolTagInformation,
	SystemProcessorStatistics,
	SystemDpcInformation,
	SystemNotImplemented6,
	SystemLoadImage,
	SystemUnloadImage,
	SystemTimeAdjustment,
	SystemNotImplemented7,
	SystemNotImplemented8,
	SystemNotImplemented9,
	SystemCrashDumpInformation,
	SystemExceptionInformation,
	SystemCrashDumpStateInformation,
	SystemKernelDebuggerInformation,
	SystemContextSwitchInformation,
	SystemRegistryQuotaInformation,
	SystemLoadAndCallImage,
	SystemPrioritySeparation,
	SystemNotImplemented10,
	SystemNotImplemented11,
	SystemInvalidInfoClass2,
	SystemInvalidInfoClass3,
	SystemTimeZoneInformation,
	SystemLookasideInformation,
	SystemSetTimeSlipEvent,
	SystemCreateSession,
	SystemDeleteSession,
	SystemInvalidInfoClass4,
	SystemRangeStartInformation,
	SystemVerifierInformation,
	SystemAddVerifier,
	SystemSessionProcessesInformation
} SYSTEM_INFORMATION_CLASS, * PSYSTEM_INFORMATION_CLASS;

typedef struct _SYSTEM_HANDLE_INFORMATION {
	USHORT ProcessId;
	USHORT CreatorBackTraceIndex;
	UCHAR ObjectTypeNumber;
	UCHAR Flags;
	USHORT Handle;
	PVOID Object;
	ACCESS_MASK GrantedAccess;
} SYSTEM_HANDLE_INFORMATION, *PSYSTEM_HANDLE_INFORMATION;
typedef struct _SYSTEM_HANDLE_INFORMATION_EX {
	ULONG NumberOfHandles;
	SYSTEM_HANDLE_INFORMATION Information[1];
} SYSTEM_HANDLE_INFORMATION_EX, *PSYSTEM_HANDLE_INFORMATION_EX;

typedef struct _SYSTEM_THREAD_INFORMATION {
	LARGE_INTEGER KernelTime;
	LARGE_INTEGER UserTime;
	LARGE_INTEGER CreateTime;
	ULONG WaitTime;
	PVOID StartAddress;
	CLIENT_ID ClientId;
	KPRIORITY Priority;
	KPRIORITY BasePriority;
	ULONG ContextSwitchCount;
	LONG State;
	LONG WaitReason;
} SYSTEM_THREAD_INFORMATION, * PSYSTEM_THREAD_INFORMATION;
typedef struct _SYSTEM_PROCESS_INFORMATION {
	ULONG NextEntryDelta;
	ULONG ThreadCount;
	ULONG Reserved1[6];
	LARGE_INTEGER CreateTime;
	LARGE_INTEGER UserTime;
	LARGE_INTEGER KernelTime;
	UNICODE_STRING ProcessName;
	KPRIORITY BasePriority;
	ULONG ProcessId;
	ULONG InheritedFromProcessId;
	ULONG HandleCount;
	ULONG Reserved2[2];
	VM_COUNTERS VmCounters;
	IO_COUNTERS IoCounters;
	SYSTEM_THREAD_INFORMATION Threads[1];
} SYSTEM_PROCESS_INFORMATION, * PSYSTEM_PROCESS_INFORMATION;
typedef struct _SYSTEM_MODULE {
	HANDLE Section;
	PVOID MappedBase;
	PVOID ImageBase;
	ULONG ImageSize;
	ULONG Flags;
	USHORT LoadOrderIndex;
	USHORT InitOrderIndex;
	USHORT LoadCount;
	USHORT OffsetToFileName;
	UCHAR  FullPathName[MAXIMUM_FILENAME_LENGTH];
} SYSTEM_MODULE, * PSYSTEM_MODULE;

typedef struct _SYSTEM_MODULE_INFORMATION {
	ULONG NumberOfModules;
	SYSTEM_MODULE Modules[1];
} SYSTEM_MODULE_INFORMATION, * PSYSTEM_MODULE_INFORMATION;

typedef struct _SYSTEM_BIGPOOL_ENTRY
{
	union {
		PVOID VirtualAddress;
		ULONG_PTR NonPaged : 1;
	};
	ULONG_PTR SizeInBytes;
	union {
		UCHAR Tag[4];
		ULONG TagUlong;
	};
} SYSTEM_BIGPOOL_ENTRY, *PSYSTEM_BIGPOOL_ENTRY;

typedef struct _SYSTEM_BIGPOOL_INFORMATION {
	ULONG Count;
	SYSTEM_BIGPOOL_ENTRY AllocatedInfo[ANYSIZE_ARRAY];
} SYSTEM_BIGPOOL_INFORMATION, *PSYSTEM_BIGPOOL_INFORMATION;

/*typedef struct _IMAGE_RUNTIME_FUNCTION_ENTRY {
	DWORD BeginAddress;
	DWORD EndAddress;
	union {
		DWORD UnwindInfoAddress;
		DWORD UnwindData;
	} DUMMYUNIONNAME;
} RUNTIME_FUNCTION, * PRUNTIME_FUNCTION, _IMAGE_RUNTIME_FUNCTION_ENTRY, * _PIMAGE_RUNTIME_FUNCTION_ENTRY;*/
typedef enum _MYOBJECT_INFORMATION_CLASS
{
	myObjectBasicInformation = 0,
	myObjectNameInformation,
	myObjectTypeInformation,
	myObjectTypesInformation,
	myObjectHandleFlagInformation,
	myObjectSessionInformation,
	myMaxObjectInfoClass
} MYOBJECT_INFORMATION_CLASS, * PMYOBJECT_INFORMATION_CLASS;
typedef struct _MYOBJECT_HANDLE_ATTRIBUTE_INFORMATION
{
	BOOLEAN Inherit;
	BOOLEAN ProtectFromClose;
} MYOBJECT_HANDLE_ATTRIBUTE_INFORMATION, * PMYOBJECT_HANDLE_ATTRIBUTE_INFORMATION;

typedef struct _MYOBJECT_TYPE_INFORMATION
{
	UNICODE_STRING TypeName;
	ULONG TotalNumberOfObjects;
	ULONG TotalNumberOfHandles;
	ULONG TotalPagedPoolUsage;
	ULONG TotalNonPagedPoolUsage;
	ULONG TotalNamePoolUsage;
	ULONG TotalHandleTableUsage;
	ULONG HighWaterNumberOfObjects;
	ULONG HighWaterNumberOfHandles;
	ULONG HighWaterPagedPoolUsage;
	ULONG HighWaterNonPagedPoolUsage;
	ULONG HighWaterNamePoolUsage;
	ULONG HighWaterHandleTableUsage;
	ULONG InvalidAttributes;
	GENERIC_MAPPING GenericMapping;
	ULONG ValidAccessMask;
	BOOLEAN SecurityRequired;
	BOOLEAN MaintainHandleCount;
	ULONG PoolType;
	ULONG DefaultPagedPoolCharge;
	ULONG DefaultNonPagedPoolCharge;
} MYOBJECT_TYPE_INFORMATION, * PMYOBJECT_TYPE_INFORMATION;

typedef struct _MYOBJECT_NAME_INFORMATION
{
	UNICODE_STRING Name;
} MYOBJECT_NAME_INFORMATION, * PMYOBJECT_NAME_INFORMATION;

typedef struct _IMAGE_RUNTIME_FUNCTION_ENTRY RUNTIME_FUNCTION, * PRUNTIME_FUNCTION;

#define UNWIND_HISTORY_TABLE_SIZE 12
typedef struct _UNWIND_HISTORY_TABLE_ENTRY {
	DWORD64 ImageBase;
	PRUNTIME_FUNCTION FunctionEntry;
} UNWIND_HISTORY_TABLE_ENTRY, * PUNWIND_HISTORY_TABLE_ENTRY;

typedef struct _UNWIND_HISTORY_TABLE {
	DWORD Count;
	BYTE  LocalHint;
	BYTE  GlobalHint;
	BYTE  Search;
	BYTE  Once;
	DWORD64 LowAddress;
	DWORD64 HighAddress;
	UNWIND_HISTORY_TABLE_ENTRY Entry[UNWIND_HISTORY_TABLE_SIZE];
} UNWIND_HISTORY_TABLE, * PUNWIND_HISTORY_TABLE;

typedef struct _KNONVOLATILE_CONTEXT_POINTERS {
	union {
		PM128A FloatingContext[16];
		struct {
			PM128A Xmm0;
			PM128A Xmm1;
			PM128A Xmm2;
			PM128A Xmm3;
			PM128A Xmm4;
			PM128A Xmm5;
			PM128A Xmm6;
			PM128A Xmm7;
			PM128A Xmm8;
			PM128A Xmm9;
			PM128A Xmm10;
			PM128A Xmm11;
			PM128A Xmm12;
			PM128A Xmm13;
			PM128A Xmm14;
			PM128A Xmm15;
		} DUMMYSTRUCTNAME;
	} DUMMYUNIONNAME;

	union {
		PDWORD64 IntegerContext[16];
		struct {
			PDWORD64 Rax;
			PDWORD64 Rcx;
			PDWORD64 Rdx;
			PDWORD64 Rbx;
			PDWORD64 Rsp;
			PDWORD64 Rbp;
			PDWORD64 Rsi;
			PDWORD64 Rdi;
			PDWORD64 R8;
			PDWORD64 R9;
			PDWORD64 R10;
			PDWORD64 R11;
			PDWORD64 R12;
			PDWORD64 R13;
			PDWORD64 R14;
			PDWORD64 R15;
		} DUMMYSTRUCTNAME;
	} DUMMYUNIONNAME2;

} KNONVOLATILE_CONTEXT_POINTERS, * PKNONVOLATILE_CONTEXT_POINTERS;
#ifdef __cplusplus
extern "C" {
#endif

NTSYSAPI
NTSTATUS
NTAPI
ZwQuerySystemInformation(
	IN SYSTEM_INFORMATION_CLASS SystemInformationClass,
	OUT PVOID SystemInformation,
	IN ULONG SystemInformationLength,
	OUT PULONG ReturnLength OPTIONAL
);
NTKERNELAPI NTSTATUS ObReferenceObjectByName(__in PUNICODE_STRING  ObjectName,
	__in ULONG  Attributes,
	__in_opt PACCESS_STATE  AccessState,
	__in_opt ACCESS_MASK  DesiredAccess,
	__in POBJECT_TYPE  ObjectType,
	__in KPROCESSOR_MODE  AccessMode,
	__inout_opt PVOID  ParseContext,
	__out PVOID *  Object
);
extern POBJECT_TYPE *IoDriverObjectType;

NTKERNELAPI
UCHAR* PsGetProcessImageFileName(__in PEPROCESS Process);
NTKERNELAPI HANDLE PsGetProcessInheritedFromUniqueProcessId(IN PEPROCESS Process);
NTKERNELAPI
PVOID
PsGetProcessSectionBaseAddress(
	__in PEPROCESS Process
);
PEJOB NTAPI PsGetProcessJob(PEPROCESS Process);
PEPROCESS NTAPI PsGetCurrentThreadProcess(VOID);
POBJECT_TYPE NTAPI ObGetObjectType(IN PVOID pObject);
NTSTATUS NTAPI ZwQueryInformationProcess(
	_In_      HANDLE           ProcessHandle,
	_In_      PROCESSINFOCLASS ProcessInformationClass,
	_Out_     PVOID            ProcessInformation,
	_In_      ULONG            ProcessInformationLength,
	_Out_opt_ PULONG           ReturnLength
);
NTSYSAPI
PEXCEPTION_ROUTINE
NTAPI
RtlVirtualUnwind(
	_In_ DWORD HandlerType,
	_In_ DWORD64 ImageBase,
	_In_ DWORD64 ControlPc,
	_In_ PRUNTIME_FUNCTION FunctionEntry,
	_Inout_ PCONTEXT ContextRecord,
	_Out_ PVOID* HandlerData,
	_Out_ PDWORD64 EstablisherFrame,
	_Inout_opt_ PKNONVOLATILE_CONTEXT_POINTERS ContextPointers
);

NTSYSAPI
PRUNTIME_FUNCTION
NTAPI
RtlLookupFunctionEntry(
	_In_ DWORD64 ControlPc,
	_Out_ PDWORD64 ImageBase,
	_Inout_opt_ PUNWIND_HISTORY_TABLE HistoryTable
);

#ifdef __cplusplus
}
#endif

#endif // !_EXPORTS__INDLC



