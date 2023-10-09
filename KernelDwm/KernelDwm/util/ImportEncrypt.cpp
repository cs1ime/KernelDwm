#include "xorstr.hpp"
#include "DDKCommon.h"
#include "KernelAsm.h"
#include "ImportEncrypt.h"

const unsigned long long compile_const_encv = XORAND64(0x8337bbcc17169fc8);

namespace FT {
	bool g_allinited = false;
        FT::Function fnKeDelayExecutionThread;
        FT::Function fnMmMapIoSpace;
        FT::Function fnMmUnmapIoSpace;
        FT::Function fnPsGetCurrentThreadProcess;
        FT::Function fnPsGetProcessImageFileName;
        FT::Function fnPsGetProcessId;
        FT::Function fnIoCreateFile;
        FT::Function fnZwSetInformationFile;
        FT::Function fnZwQueryInformationFile;
        FT::Function fnZwReadFile;
        FT::Function fnZwClose;
        FT::Function fnObQueryNameString;
        FT::Function fnZwCreateFile;
        FT::Function fnNtQueryVolumeInformationFile;
        FT::Function fnNtDeviceIoControlFile;
        FT::Function fnPsLookupProcessByProcessId;
        FT::Function fnKeStackAttachProcess;
        FT::Function fnKeUnstackDetachProcess;
        FT::Function fnZwCreateKey;
        FT::Function fnZwQueryValueKey;
        FT::Function fnMmAllocateContiguousMemory;
        FT::Function fnMmGetPhysicalAddress;
        FT::Function fnRtlDeleteElementGenericTableAvl;
        FT::Function fnRtlLookupElementGenericTableAvl;
        FT::Function fnZwQuerySystemInformation;
        FT::Function fnExAllocatePool;
        FT::Function fnIoGetCurrentProcess;
        FT::Function fnObfDereferenceObject;
        FT::Function fnKeBugCheck;
        FT::Function fnMmGetVirtualForPhysical;
        FT::Function fnMmIsAddressValid;
        FT::Function fnPsGetProcessPeb;
        FT::Function fnPsGetProcessWow64Process;
        FT::Function fnObReferenceObjectByName;
        FT::Function fnKeSetSystemGroupAffinityThread;
        FT::Function fnKeRevertToUserGroupAffinityThread;
        FT::Function fnKeQueryActiveProcessorCountEx;
        FT::Function fnKeGetProcessorNumberFromIndex;
        FT::Function fnRtlCompareUnicodeString;
        FT::Function fnIoGetStackLimits;
        FT::Function fnRtlCaptureContext;
        FT::Function fnRtlVirtualUnwind;
        FT::Function fnRtlLookupFunctionEntry;
        FT::Function fnExDeleteLookasideListEx;
        FT::Function fnExInitializePagedLookasideList;
        FT::Function fnPsGetProcessSectionBaseAddress;
        FT::Function fnsqrtf;
        FT::Function fnExAllocatePoolWithTag;
        FT::Function fnObReferenceObjectByHandle;
        FT::Function fnExFreePoolWithTag;
        FT::Function fnExFreePool;
		FT::Function fnExDeleteNPagedLookasideList;
		FT::Function fnObfReferenceObject;
		FT::Function fnNtAllocateVirtualMemory;
		FT::Function fnNtFreeVirtualMemory;
		FT::Function fnExGetPreviousMode;
		FT::Function fnPsGetCurrentProcessId;
		FT::Function fnRtlGetVersion;
		FT::Function fnKeWaitForSingleObject;

		FT::Function fnKeInitializeEvent;
		FT::Function fnIoAllocateIrp;
		FT::Function fnIoCancelIrp;
		FT::Function fnIoReuseIrp;
		FT::Function fnIoFreeIrp;
		FT::Function fnIoAllocateMdl;
		FT::Function fnMmBuildMdlForNonPagedPool;
		FT::Function fnIoFreeMdl;

		FT::Function pIoFileObjectType;
		FT::Function pIoDriverObjectType;
		FT::Function pMmUserProbeAddress;

	VOID Init1() {
		
	}
	VOID Init2() {
		
	}
	VOID Init3() {
		
	}
	VOID Init4() {
		
	}
	VOID Init5() {
		
	}
	VOID Init6() {
		
	}
	VOID InitAll() {
		if (g_allinited == false) {
			g_allinited = true;
                
			fnKeDelayExecutionThread.init(xs("KeDelayExecutionThread"));
			fnMmMapIoSpace.init(xs("MmMapIoSpace"));
			fnMmUnmapIoSpace.init(xs("MmUnmapIoSpace"));
			fnPsGetCurrentThreadProcess.init(xs("PsGetCurrentThreadProcess"));
			fnPsGetProcessImageFileName.init(xs("PsGetProcessImageFileName"));
			fnPsGetProcessId.init(xs("PsGetProcessId"));
			fnIoCreateFile.init(xs("IoCreateFile"));
			fnZwSetInformationFile.init(xs("ZwSetInformationFile"));
			fnZwQueryInformationFile.init(xs("ZwQueryInformationFile"));
			fnZwReadFile.init(xs("ZwReadFile"));
			fnZwClose.init(xs("ZwClose"));
			fnObQueryNameString.init(xs("ObQueryNameString"));
			fnZwCreateFile.init(xs("ZwCreateFile"));
			fnNtQueryVolumeInformationFile.init(xs("NtQueryVolumeInformationFile"));
			fnNtDeviceIoControlFile.init(xs("NtDeviceIoControlFile"));
			fnPsLookupProcessByProcessId.init(xs("PsLookupProcessByProcessId"));
			fnKeStackAttachProcess.init(xs("KeStackAttachProcess"));
			fnKeUnstackDetachProcess.init(xs("KeUnstackDetachProcess"));
			fnZwCreateKey.init(xs("ZwCreateKey"));
			fnZwQueryValueKey.init(xs("ZwQueryValueKey"));
			fnMmAllocateContiguousMemory.init(xs("MmAllocateContiguousMemory"));
			fnMmGetPhysicalAddress.init(xs("MmGetPhysicalAddress"));
			fnRtlDeleteElementGenericTableAvl.init(xs("RtlDeleteElementGenericTableAvl"));
			fnRtlLookupElementGenericTableAvl.init(xs("RtlLookupElementGenericTableAvl"));
			fnZwQuerySystemInformation.init(xs("ZwQuerySystemInformation"));
			fnExAllocatePool.init(xs("ExAllocatePool"));
			fnIoGetCurrentProcess.init(xs("IoGetCurrentProcess"));
			fnObfDereferenceObject.init(xs("ObfDereferenceObject"));
			fnKeBugCheck.init(xs("KeBugCheck"));
			fnMmGetVirtualForPhysical.init(xs("MmGetVirtualForPhysical"));
			fnMmIsAddressValid.init(xs("MmIsAddressValid"));
			fnPsGetProcessPeb.init(xs("PsGetProcessPeb"));
			fnPsGetProcessWow64Process.init(xs("PsGetProcessWow64Process"));
			fnObReferenceObjectByName.init(xs("ObReferenceObjectByName"));
			fnKeSetSystemGroupAffinityThread.init(xs("KeSetSystemGroupAffinityThread"));
			fnKeRevertToUserGroupAffinityThread.init(xs("KeRevertToUserGroupAffinityThread"));
			fnKeQueryActiveProcessorCountEx.init(xs("KeQueryActiveProcessorCountEx"));
			fnKeGetProcessorNumberFromIndex.init(xs("KeGetProcessorNumberFromIndex"));
			fnRtlCompareUnicodeString.init(xs("RtlCompareUnicodeString"));
			fnIoGetStackLimits.init(xs("IoGetStackLimits"));
			fnRtlCaptureContext.init(xs("RtlCaptureContext"));
			fnRtlVirtualUnwind.init(xs("RtlVirtualUnwind"));
			fnRtlLookupFunctionEntry.init(xs("RtlLookupFunctionEntry"));
			fnExDeleteLookasideListEx.init(xs("ExDeleteLookasideListEx"));
			fnExInitializePagedLookasideList.init(xs("ExInitializePagedLookasideList"));
			fnPsGetProcessSectionBaseAddress.init(xs("PsGetProcessSectionBaseAddress"));
			fnsqrtf.init(xs("sqrtf"));
			fnExAllocatePoolWithTag.init(xs("ExAllocatePoolWithTag"));
			fnObReferenceObjectByHandle.init(xs("ObReferenceObjectByHandle"));
			fnExFreePoolWithTag.init(xs("ExFreePoolWithTag"));
			fnExFreePool.init(xs("ExFreePool"));
			fnExDeleteNPagedLookasideList.init(xs("ExDeleteNPagedLookasideList"));
			fnObfReferenceObject.init(xs("ObfReferenceObject"));
			fnNtAllocateVirtualMemory.init(xs("NtAllocateVirtualMemory"));
			fnNtFreeVirtualMemory.init(xs("NtFreeVirtualMemory"));
			fnExGetPreviousMode.init(xs("ExGetPreviousMode"));
			fnPsGetCurrentProcessId.init(xs("PsGetCurrentProcessId"));
			fnRtlGetVersion.init(xs("RtlGetVersion"));
			fnKeWaitForSingleObject.init(xs("KeWaitForSingleObject"));

			fnKeInitializeEvent.init(xs("KeInitializeEvent"));
			fnIoAllocateIrp.init(xs("IoAllocateIrp"));
			fnIoCancelIrp.init(xs("IoCancelIrp"));
			fnIoReuseIrp.init(xs("IoReuseIrp"));
			fnIoFreeIrp.init(xs("IoFreeIrp"));
			fnIoAllocateMdl.init(xs("IoAllocateMdl"));
			fnMmBuildMdlForNonPagedPool.init(xs("MmBuildMdlForNonPagedPool"));
			fnIoFreeMdl.init(xs("IoFreeMdl"));


			pIoFileObjectType.init(xs("IoFileObjectType"));
			pIoDriverObjectType.init(xs("IoDriverObjectType"));
			pMmUserProbeAddress.init(xs("MmUserProbeAddress"));
		}
		
	}

	VOID no() {
		return;
	}
	bool Function::init(LPCSTR _FnName) {
		CHAR FnName[260];
		RtlZeroMemory(FnName, sizeof(FnName));
		strncpy(FnName, _FnName, 259);
		this->fn = 0;
		this->key = 0;
		this->CantInit = FALSE;
		this->Inited = FALSE;
		this->key = (AsmRdtsc() * XORAND64(0x84fe726b28774d8e)) ^ XORAND64(0x7364ce7503190d0c);
		this->key2 = (AsmRdtsc() * XORAND64(0x6d5f2c16dadcc970)) ^ XORAND64(0x035d76253d5a4416);
		ULONG64 Address = (ULONG64)KGetProcAddress(KGetNtoskrnl(), FnName);
		if (Address) {
			this->fn = ((ULONG64)Address) ^ this->key;
			this->Inited = TRUE;
			RtlZeroMemory(FnName, sizeof(FnName));
			return true;
		}
		this->fn = ((ULONG64)FT::no) ^ this->key;
		this->CantInit = TRUE;
		return false;
	}
	Function::Function() {
		//this->init(_FnName);
	}
}

VOID myRtlInitUnicodeString(OUT PUNICODE_STRING DestinationString, IN PCWSTR SourceString OPTIONAL)
{

	SIZE_T Length;

	DestinationString->MaximumLength = 0;
	DestinationString->Length = 0;
	DestinationString->Buffer = (PWSTR)SourceString;
	if (SourceString) {
		Length = wcslen(SourceString) * sizeof(WCHAR);

		if (Length >= 0xFFFF) {
			Length = 0xFFFF - sizeof(UNICODE_NULL);
		}

		DestinationString->Length = (USHORT)Length;
		DestinationString->MaximumLength = (USHORT)(Length + sizeof(UNICODE_NULL));
	}

	return;
}
typedef enum _FIRMWARE_REENTRY
{
	HalHaltRoutine,
	HalPowerDownRoutine,
	HalRestartRoutine,
	HalRebootRoutine,
	HalInteractiveModeRoutine,
	HalMaximumRoutine
}FIRMWARE_REENTRY, *PFIRMWARE_REENTRY;
typedef void(*fnHalReturnToFirmware)(IN FIRMWARE_REENTRY FirmwareReentry);
fnHalReturnToFirmware func = 0;
#include "smem.h"
__forceinline PULONG64 GetUserRspPtr() {
	ULONG64 pSyscall = ((ULONG64)AsmReadMsr(0xC0000082));
	if (!pSyscall)return 0;
	ULONG offset = *(ULONG*)(pSyscall + 8);
	return (PULONG64)__readgsqword(offset);
}

void Reboot23(...)
{
	func = (fnHalReturnToFirmware)KGetProcAddress(KGetHaldll(), xs("HalReturnToFirmware"));
	if (!func)
		func = (fnHalReturnToFirmware)KGetProcAddress(KGetNtoskrnl(), xs("HalReturnToFirmware"));
	func(HalRebootRoutine);
}
