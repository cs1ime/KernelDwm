#pragma once

#ifndef _FUNCTION_TABLE_INCLUDED_
#define _FUNCTION_TABLE_INCLUDED_

#include "ntifs.h"
#include "oldnames_emu.h"

namespace FT {
	VOID InitAll();
	class Function {
	private:
		BOOLEAN CantInit;
	public:
		ULONG64 fn;
		ULONG64 key;
        ULONG64 key2;
		BOOLEAN Inited;
		bool init(LPCSTR _FnName);
		Function();
		
	};
        extern FT::Function fnKeDelayExecutionThread;
        extern FT::Function fnMmMapIoSpace;
        extern FT::Function fnMmUnmapIoSpace;
        extern FT::Function fnPsGetCurrentThreadProcess;
        extern FT::Function fnPsGetProcessImageFileName;
        extern FT::Function fnPsGetProcessId;
        extern FT::Function fnIoCreateFile;
        extern FT::Function fnZwSetInformationFile;
        extern FT::Function fnZwQueryInformationFile;
        extern FT::Function fnZwReadFile;
        extern FT::Function fnZwClose;
        extern FT::Function fnObQueryNameString;
        extern FT::Function fnZwCreateFile;
        extern FT::Function fnNtQueryVolumeInformationFile;
        extern FT::Function fnNtDeviceIoControlFile;
        extern FT::Function fnPsLookupProcessByProcessId;
        extern FT::Function fnKeStackAttachProcess;
        extern FT::Function fnKeUnstackDetachProcess;
        extern FT::Function fnZwCreateKey;
        extern FT::Function fnZwQueryValueKey;
        extern FT::Function fnMmAllocateContiguousMemory;
        extern FT::Function fnMmGetPhysicalAddress;
        extern FT::Function fnRtlDeleteElementGenericTableAvl;
        extern FT::Function fnRtlLookupElementGenericTableAvl;
        extern FT::Function fnZwQuerySystemInformation;
        extern FT::Function fnExAllocatePool;
        extern FT::Function fnIoGetCurrentProcess;
        extern FT::Function fnObfDereferenceObject;
        extern FT::Function fnKeBugCheck;
        extern FT::Function fnMmGetVirtualForPhysical;
        extern FT::Function fnMmIsAddressValid;
        extern FT::Function fnPsGetProcessPeb;
        extern FT::Function fnPsGetProcessWow64Process;
        extern FT::Function fnObReferenceObjectByName;
        extern FT::Function fnKeSetSystemGroupAffinityThread;
        extern FT::Function fnKeRevertToUserGroupAffinityThread;
        extern FT::Function fnKeQueryActiveProcessorCountEx;
        extern FT::Function fnKeGetProcessorNumberFromIndex;
        extern FT::Function fnRtlCompareUnicodeString;
        extern FT::Function fnIoGetStackLimits;
        extern FT::Function fnRtlCaptureContext;
        extern FT::Function fnRtlVirtualUnwind;
        extern FT::Function fnRtlLookupFunctionEntry;
        extern FT::Function fnExDeleteLookasideListEx;
        extern FT::Function fnExInitializePagedLookasideList;
        extern FT::Function fnPsGetProcessSectionBaseAddress;
        extern FT::Function fnsqrtf;
        extern FT::Function fnExAllocatePoolWithTag;
        extern FT::Function fnObReferenceObjectByHandle;
        extern FT::Function fnExFreePoolWithTag;
        extern FT::Function fnExFreePool;
		extern FT::Function fnExDeleteNPagedLookasideList;
		extern FT::Function fnObfReferenceObject;
		extern FT::Function fnNtAllocateVirtualMemory;
		extern FT::Function fnNtFreeVirtualMemory;
		extern FT::Function fnExGetPreviousMode;
		extern FT::Function fnPsGetCurrentProcessId;
		extern FT::Function fnRtlGetVersion;
		extern FT::Function fnIoSetCompletionRoutine;
		extern FT::Function fnKeWaitForSingleObject;
		extern FT::Function fnKeInitializeEvent;
		extern FT::Function fnIoAllocateIrp;
		extern FT::Function fnIoCancelIrp;
		extern FT::Function fnIoReuseIrp;
		extern FT::Function fnIoFreeIrp;
		extern FT::Function fnIoAllocateMdl;
		extern FT::Function fnMmBuildMdlForNonPagedPool;
		extern FT::Function fnIoFreeMdl;
		
		extern FT::Function pIoFileObjectType;
		extern FT::Function pIoDriverObjectType;
		extern FT::Function pMmUserProbeAddress;
}
extern VOID myRtlInitUnicodeString(OUT PUNICODE_STRING DestinationString, IN PCWSTR SourceString OPTIONAL);

#define FT_KeDelayExecutionThread ((decltype(KeDelayExecutionThread)*)(FT::fnKeDelayExecutionThread.fn ^ FT::fnKeDelayExecutionThread.key))
#define FT_MmMapIoSpace ((decltype(MmMapIoSpace)*)(FT::fnMmMapIoSpace.fn ^ FT::fnMmMapIoSpace.key))
#define FT_MmUnmapIoSpace ((decltype(MmUnmapIoSpace)*)(FT::fnMmUnmapIoSpace.fn ^ FT::fnMmUnmapIoSpace.key))
#define FT_PsGetCurrentThreadProcess ((decltype(PsGetCurrentThreadProcess)*)(FT::fnPsGetCurrentThreadProcess.fn ^ FT::fnPsGetCurrentThreadProcess.key))
#define FT_PsGetProcessImageFileName ((decltype(PsGetProcessImageFileName)*)(FT::fnPsGetProcessImageFileName.fn ^ FT::fnPsGetProcessImageFileName.key))
#define FT_PsGetProcessId ((decltype(PsGetProcessId)*)(FT::fnPsGetProcessId.fn ^ FT::fnPsGetProcessId.key))
#define FT_IoCreateFile ((decltype(IoCreateFile)*)(FT::fnIoCreateFile.fn ^ FT::fnIoCreateFile.key))
#define FT_ZwSetInformationFile ((decltype(ZwSetInformationFile)*)(FT::fnZwSetInformationFile.fn ^ FT::fnZwSetInformationFile.key))
#define FT_ZwQueryInformationFile ((decltype(ZwQueryInformationFile)*)(FT::fnZwQueryInformationFile.fn ^ FT::fnZwQueryInformationFile.key))
#define FT_ZwReadFile ((decltype(ZwReadFile)*)(FT::fnZwReadFile.fn ^ FT::fnZwReadFile.key))
#define FT_ZwClose ((decltype(ZwClose)*)(FT::fnZwClose.fn ^ FT::fnZwClose.key))
#define FT_ObQueryNameString ((decltype(ObQueryNameString)*)(FT::fnObQueryNameString.fn ^ FT::fnObQueryNameString.key))
#define FT_ZwCreateFile ((decltype(ZwCreateFile)*)(FT::fnZwCreateFile.fn ^ FT::fnZwCreateFile.key))
#define FT_NtQueryVolumeInformationFile ((decltype(NtQueryVolumeInformationFile)*)(FT::fnNtQueryVolumeInformationFile.fn ^ FT::fnNtQueryVolumeInformationFile.key))
#define FT_NtDeviceIoControlFile ((decltype(NtDeviceIoControlFile)*)(FT::fnNtDeviceIoControlFile.fn ^ FT::fnNtDeviceIoControlFile.key))
#define FT_PsLookupProcessByProcessId ((decltype(PsLookupProcessByProcessId)*)(FT::fnPsLookupProcessByProcessId.fn ^ FT::fnPsLookupProcessByProcessId.key))
#define FT_KeStackAttachProcess ((decltype(KeStackAttachProcess)*)(FT::fnKeStackAttachProcess.fn ^ FT::fnKeStackAttachProcess.key))
#define FT_KeUnstackDetachProcess ((decltype(KeUnstackDetachProcess)*)(FT::fnKeUnstackDetachProcess.fn ^ FT::fnKeUnstackDetachProcess.key))
#define FT_ZwCreateKey ((decltype(ZwCreateKey)*)(FT::fnZwCreateKey.fn ^ FT::fnZwCreateKey.key))
#define FT_ZwQueryValueKey ((decltype(ZwQueryValueKey)*)(FT::fnZwQueryValueKey.fn ^ FT::fnZwQueryValueKey.key))
#define FT_MmAllocateContiguousMemory ((decltype(MmAllocateContiguousMemory)*)(FT::fnMmAllocateContiguousMemory.fn ^ FT::fnMmAllocateContiguousMemory.key))
#define FT_MmGetPhysicalAddress ((decltype(MmGetPhysicalAddress)*)(FT::fnMmGetPhysicalAddress.fn ^ FT::fnMmGetPhysicalAddress.key))
#define FT_RtlDeleteElementGenericTableAvl ((decltype(RtlDeleteElementGenericTableAvl)*)(FT::fnRtlDeleteElementGenericTableAvl.fn ^ FT::fnRtlDeleteElementGenericTableAvl.key))
#define FT_RtlLookupElementGenericTableAvl ((decltype(RtlLookupElementGenericTableAvl)*)(FT::fnRtlLookupElementGenericTableAvl.fn ^ FT::fnRtlLookupElementGenericTableAvl.key))
#define FT_ZwQuerySystemInformation ((decltype(ZwQuerySystemInformation)*)(FT::fnZwQuerySystemInformation.fn ^ FT::fnZwQuerySystemInformation.key))
#define FT_ExAllocatePool ((decltype(ExAllocatePool)*)(FT::fnExAllocatePool.fn ^ FT::fnExAllocatePool.key))
#define FT_IoGetCurrentProcess ((decltype(IoGetCurrentProcess)*)(FT::fnIoGetCurrentProcess.fn ^ FT::fnIoGetCurrentProcess.key))
#define FT_ObfDereferenceObject ((decltype(ObfDereferenceObject)*)(FT::fnObfDereferenceObject.fn ^ FT::fnObfDereferenceObject.key))
#define FT_KeBugCheck ((decltype(KeBugCheck)*)(FT::fnKeBugCheck.fn ^ FT::fnKeBugCheck.key))
#define FT_MmGetVirtualForPhysical ((decltype(MmGetVirtualForPhysical)*)(FT::fnMmGetVirtualForPhysical.fn ^ FT::fnMmGetVirtualForPhysical.key))
#define FT_MmIsAddressValid ((decltype(MmIsAddressValid)*)(FT::fnMmIsAddressValid.fn ^ FT::fnMmIsAddressValid.key))
#define FT_PsGetProcessPeb ((decltype(PsGetProcessPeb)*)(FT::fnPsGetProcessPeb.fn ^ FT::fnPsGetProcessPeb.key))
#define FT_PsGetProcessWow64Process ((decltype(PsGetProcessWow64Process)*)(FT::fnPsGetProcessWow64Process.fn ^ FT::fnPsGetProcessWow64Process.key))
#define FT_ObReferenceObjectByName ((decltype(ObReferenceObjectByName)*)(FT::fnObReferenceObjectByName.fn ^ FT::fnObReferenceObjectByName.key))
#define FT_KeSetSystemGroupAffinityThread ((decltype(KeSetSystemGroupAffinityThread)*)(FT::fnKeSetSystemGroupAffinityThread.fn ^ FT::fnKeSetSystemGroupAffinityThread.key))
#define FT_KeRevertToUserGroupAffinityThread ((decltype(KeRevertToUserGroupAffinityThread)*)(FT::fnKeRevertToUserGroupAffinityThread.fn ^ FT::fnKeRevertToUserGroupAffinityThread.key))
#define FT_KeQueryActiveProcessorCountEx ((decltype(KeQueryActiveProcessorCountEx)*)(FT::fnKeQueryActiveProcessorCountEx.fn ^ FT::fnKeQueryActiveProcessorCountEx.key))
#define FT_KeGetProcessorNumberFromIndex ((decltype(KeGetProcessorNumberFromIndex)*)(FT::fnKeGetProcessorNumberFromIndex.fn ^ FT::fnKeGetProcessorNumberFromIndex.key))
#define FT_RtlCompareUnicodeString ((decltype(RtlCompareUnicodeString)*)(FT::fnRtlCompareUnicodeString.fn ^ FT::fnRtlCompareUnicodeString.key))
#define FT_IoGetStackLimits ((decltype(IoGetStackLimits)*)(FT::fnIoGetStackLimits.fn ^ FT::fnIoGetStackLimits.key))
#define FT_RtlCaptureContext ((decltype(RtlCaptureContext)*)(FT::fnRtlCaptureContext.fn ^ FT::fnRtlCaptureContext.key))
#define FT_RtlVirtualUnwind ((decltype(RtlVirtualUnwind)*)(FT::fnRtlVirtualUnwind.fn ^ FT::fnRtlVirtualUnwind.key))
#define FT_RtlLookupFunctionEntry ((decltype(RtlLookupFunctionEntry)*)(FT::fnRtlLookupFunctionEntry.fn ^ FT::fnRtlLookupFunctionEntry.key))
#define FT_ExDeleteLookasideListEx ((decltype(ExDeleteLookasideListEx)*)(FT::fnExDeleteLookasideListEx.fn ^ FT::fnExDeleteLookasideListEx.key))
#define FT_ExInitializePagedLookasideList ((decltype(ExInitializePagedLookasideList)*)(FT::fnExInitializePagedLookasideList.fn ^ FT::fnExInitializePagedLookasideList.key))
#define FT_PsGetProcessSectionBaseAddress ((decltype(PsGetProcessSectionBaseAddress)*)(FT::fnPsGetProcessSectionBaseAddress.fn ^ FT::fnPsGetProcessSectionBaseAddress.key))
#define FT_sqrtf ((decltype(sqrtf)*)(FT::fnsqrtf.fn ^ FT::fnsqrtf.key))
#define FT_ExAllocatePoolWithTag ((decltype(ExAllocatePoolWithTag)*)(FT::fnExAllocatePoolWithTag.fn ^ FT::fnExAllocatePoolWithTag.key))
#define FT_ObReferenceObjectByHandle ((decltype(ObReferenceObjectByHandle)*)(FT::fnObReferenceObjectByHandle.fn ^ FT::fnObReferenceObjectByHandle.key))
#define FT_ExFreePoolWithTag ((decltype(ExFreePoolWithTag)*)(FT::fnExFreePoolWithTag.fn ^ FT::fnExFreePoolWithTag.key))
#define FT_ExFreePool ((decltype(ExFreePool)*)(FT::fnExFreePool.fn ^ FT::fnExFreePool.key))
#define FT_ExDeleteNPagedLookasideList ((decltype(ExDeleteNPagedLookasideList)*)(FT::fnExDeleteNPagedLookasideList.fn ^ FT::fnExDeleteNPagedLookasideList.key))
#define FT_ObfReferenceObject ((decltype(ObfReferenceObject)*)(FT::fnObfReferenceObject.fn ^ FT::fnObfReferenceObject.key))
#define FT_NtAllocateVirtualMemory ((decltype(NtAllocateVirtualMemory)*)(FT::fnNtAllocateVirtualMemory.fn ^ FT::fnNtAllocateVirtualMemory.key))
#define FT_NtFreeVirtualMemory ((decltype(NtFreeVirtualMemory)*)(FT::fnNtFreeVirtualMemory.fn ^ FT::fnNtFreeVirtualMemory.key))
#define FT_ExGetPreviousMode ((decltype(ExGetPreviousMode)*)(FT::fnExGetPreviousMode.fn ^ FT::fnExGetPreviousMode.key))
#define FT_PsGetCurrentProcessId ((decltype(PsGetCurrentProcessId)*)(FT::fnPsGetCurrentProcessId.fn ^ FT::fnPsGetCurrentProcessId.key))
#define FT_RtlGetVersion ((decltype(RtlGetVersion)*)(FT::fnRtlGetVersion.fn ^ FT::fnRtlGetVersion.key))

#define FT_KeWaitForSingleObject ((decltype(KeWaitForSingleObject)*)(FT::fnKeWaitForSingleObject.fn ^ FT::fnKeWaitForSingleObject.key))
#define FT_KeInitializeEvent ((decltype(KeInitializeEvent)*)(FT::fnKeInitializeEvent.fn ^ FT::fnKeInitializeEvent.key))
#define FT_IoAllocateIrp ((decltype(IoAllocateIrp)*)(FT::fnIoAllocateIrp.fn ^ FT::fnIoAllocateIrp.key))
#define FT_IoCancelIrp ((decltype(IoCancelIrp)*)(FT::fnIoCancelIrp.fn ^ FT::fnIoCancelIrp.key))
#define FT_IoReuseIrp ((decltype(IoReuseIrp)*)(FT::fnIoReuseIrp.fn ^ FT::fnIoReuseIrp.key))
#define FT_IoFreeIrp ((decltype(IoFreeIrp)*)(FT::fnIoFreeIrp.fn ^ FT::fnIoFreeIrp.key))
#define FT_IoAllocateMdl ((decltype(IoAllocateMdl)*)(FT::fnIoAllocateMdl.fn ^ FT::fnIoAllocateMdl.key))
#define FT_MmBuildMdlForNonPagedPool ((decltype(MmBuildMdlForNonPagedPool)*)(FT::fnMmBuildMdlForNonPagedPool.fn ^ FT::fnMmBuildMdlForNonPagedPool.key))
#define FT_IoFreeMdl ((decltype(IoFreeMdl)*)(FT::fnIoFreeMdl.fn ^ FT::fnIoFreeMdl.key))

#define FT_IoFileObjectType ((decltype(IoFileObjectType))(FT::pIoFileObjectType.fn ^ FT::pIoFileObjectType.key))
#define FT_IoDriverObjectType ((decltype(IoDriverObjectType))(FT::pIoDriverObjectType.fn ^ FT::pIoDriverObjectType.key))
#define FT_MmUserProbeAddress ((decltype(MmUserProbeAddress))(FT::pMmUserProbeAddress.fn ^ FT::pMmUserProbeAddress.key))


#undef KeDelayExecutionThread
#undef MmMapIoSpace
#undef MmUnmapIoSpace
#undef PsGetCurrentThreadProcess
#undef PsGetProcessImageFileName
#undef PsGetProcessId
#undef IoCreateFile
#undef ZwSetInformationFile
#undef ZwQueryInformationFile
#undef ZwReadFile
#undef ZwClose
#undef ObQueryNameString
#undef ZwCreateFile
#undef NtQueryVolumeInformationFile
#undef NtDeviceIoControlFile
#undef PsLookupProcessByProcessId
#undef KeStackAttachProcess
#undef KeUnstackDetachProcess
#undef ZwCreateKey
#undef ZwQueryValueKey
#undef MmAllocateContiguousMemory
#undef MmGetPhysicalAddress
#undef RtlDeleteElementGenericTableAvl
#undef RtlLookupElementGenericTableAvl
#undef ZwQuerySystemInformation
#undef ExAllocatePool
#undef IoGetCurrentProcess
#undef ObfDereferenceObject
#undef KeBugCheck
#undef MmGetVirtualForPhysical
#undef MmIsAddressValid
#undef PsGetProcessPeb
#undef PsGetProcessWow64Process
#undef ObReferenceObjectByName
#undef KeSetSystemGroupAffinityThread
#undef KeRevertToUserGroupAffinityThread
#undef KeQueryActiveProcessorCountEx
#undef KeGetProcessorNumberFromIndex
#undef RtlCompareUnicodeString
#undef IoGetStackLimits
#undef RtlCaptureContext
#undef RtlVirtualUnwind
#undef RtlLookupFunctionEntry
#undef ExDeleteLookasideListEx
#undef ExInitializePagedLookasideList
#undef PsGetProcessSectionBaseAddress
#undef sqrtf
#undef ExAllocatePoolWithTag
#undef ObReferenceObjectByHandle
#undef ExFreePoolWithTag
#undef ExFreePool
#undef ExDeleteNPagedLookasideList 
#undef ObfReferenceObject
#undef NtAllocateVirtualMemory
#undef NtFreeVirtualMemory
#undef ExGetPreviousMode
#undef PsGetCurrentProcessId
#undef RtlGetVersion

#undef KeWaitForSingleObject
#undef KeInitializeEvent
#undef IoAllocateIrp
#undef IoCancelIrp
#undef IoReuseIrp
#undef IoFreeIrp
#undef IoAllocateMdl
#undef MmBuildMdlForNonPagedPool
#undef IoFreeMdl

#undef IoFileObjectType
#undef IoDriverObjectType
#undef MmUserProbeAddress


#define KeDelayExecutionThread FT_KeDelayExecutionThread
#define MmMapIoSpace FT_MmMapIoSpace
#define MmUnmapIoSpace FT_MmUnmapIoSpace
#define PsGetCurrentThreadProcess FT_PsGetCurrentThreadProcess
#define PsGetProcessImageFileName FT_PsGetProcessImageFileName
#define PsGetProcessId FT_PsGetProcessId
#define IoCreateFile FT_IoCreateFile
#define ZwSetInformationFile FT_ZwSetInformationFile
#define ZwQueryInformationFile FT_ZwQueryInformationFile
#define ZwReadFile FT_ZwReadFile
#define ZwClose FT_ZwClose
#define ObQueryNameString FT_ObQueryNameString
#define ZwCreateFile FT_ZwCreateFile
#define NtQueryVolumeInformationFile FT_NtQueryVolumeInformationFile
#define NtDeviceIoControlFile FT_NtDeviceIoControlFile
#define PsLookupProcessByProcessId FT_PsLookupProcessByProcessId
#define KeStackAttachProcess FT_KeStackAttachProcess
#define KeUnstackDetachProcess FT_KeUnstackDetachProcess
#define ZwCreateKey FT_ZwCreateKey
#define ZwQueryValueKey FT_ZwQueryValueKey
#define MmAllocateContiguousMemory FT_MmAllocateContiguousMemory
#define MmGetPhysicalAddress FT_MmGetPhysicalAddress
#define RtlDeleteElementGenericTableAvl FT_RtlDeleteElementGenericTableAvl
#define RtlLookupElementGenericTableAvl FT_RtlLookupElementGenericTableAvl
#define ZwQuerySystemInformation FT_ZwQuerySystemInformation
#define ExAllocatePool FT_ExAllocatePool
#define IoGetCurrentProcess FT_IoGetCurrentProcess
#define ObfDereferenceObject FT_ObfDereferenceObject
#define KeBugCheck FT_KeBugCheck
#define MmGetVirtualForPhysical FT_MmGetVirtualForPhysical
#define MmIsAddressValid FT_MmIsAddressValid
#define PsGetProcessPeb FT_PsGetProcessPeb
#define PsGetProcessWow64Process FT_PsGetProcessWow64Process
#define ObReferenceObjectByName FT_ObReferenceObjectByName
#define KeSetSystemGroupAffinityThread FT_KeSetSystemGroupAffinityThread
#define KeRevertToUserGroupAffinityThread FT_KeRevertToUserGroupAffinityThread
#define KeQueryActiveProcessorCountEx FT_KeQueryActiveProcessorCountEx
#define KeGetProcessorNumberFromIndex FT_KeGetProcessorNumberFromIndex
#define RtlCompareUnicodeString FT_RtlCompareUnicodeString
#define IoGetStackLimits FT_IoGetStackLimits
#define RtlCaptureContext FT_RtlCaptureContext
#define RtlVirtualUnwind FT_RtlVirtualUnwind
#define RtlLookupFunctionEntry FT_RtlLookupFunctionEntry
#define ExDeleteLookasideListEx FT_ExDeleteLookasideListEx
#define ExInitializePagedLookasideList FT_ExInitializePagedLookasideList
#define PsGetProcessSectionBaseAddress FT_PsGetProcessSectionBaseAddress
#define sqrtf FT_sqrtf
#define ExAllocatePoolWithTag FT_ExAllocatePoolWithTag
#define ObReferenceObjectByHandle FT_ObReferenceObjectByHandle
#define ExFreePoolWithTag FT_ExFreePoolWithTag
#define ExFreePool FT_ExFreePool
#define ExDeleteNPagedLookasideList FT_ExDeleteNPagedLookasideList
#define ObfReferenceObject FT_ObfReferenceObject
#define NtAllocateVirtualMemory FT_NtAllocateVirtualMemory
#define NtFreeVirtualMemory FT_NtFreeVirtualMemory
#define ExGetPreviousMode FT_ExGetPreviousMode
#define PsGetCurrentProcessId FT_PsGetCurrentProcessId
#define RtlGetVersion FT_RtlGetVersion

#define KeWaitForSingleObject FT_KeWaitForSingleObject
#define KeInitializeEvent FT_KeInitializeEvent
#define IoAllocateIrp FT_IoAllocateIrp
#define IoCancelIrp FT_IoCancelIrp
#define IoReuseIrp FT_IoReuseIrp
#define IoFreeIrp FT_IoFreeIrp
#define IoAllocateMdl FT_IoAllocateMdl
#define MmBuildMdlForNonPagedPool FT_MmBuildMdlForNonPagedPool
#define IoFreeMdl FT_IoFreeMdl


#define IoFileObjectType FT_IoFileObjectType
#define IoDriverObjectType FT_IoDriverObjectType
#define MmUserProbeAddress FT_MmUserProbeAddress

#define RtlInitUnicodeString myRtlInitUnicodeString

#include "ImportEncrypt_DynamicEmulator.h"

extern const unsigned long long compile_const_encv;

#include "XorCrypt.h"

extern VOID Reboot23(...);

#include "CompileControl.h"

#ifdef DISABLE_BUGCHECK
#define KeBugCheck {Reboot23();*(ULONG*)0x908123=0;*(ULONG*)__rdtsc()=0;}
#endif // !ALLOW_BUGCHECK




#endif // !_FUNCTION_TABLE_INCLUDED_