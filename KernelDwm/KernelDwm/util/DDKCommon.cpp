#include <ntifs.h>
#include "oldnames_inline.h"
#include <windef.h>
#include "NtFunctionDefine.h"

__forceinline LPCSTR GetSuffixFileNameA(LPCSTR a) {
	LPCSTR resu = a;

	int len = strlen(a);
	for (int i = 0; i < len; i++) {
		if (a[i] == '\\' || a[i] == '/') {
			resu = &a[i + 1];
		}
	}

	return resu;
}

__forceinline PVOID KGetDriverImageBase3(PCHAR name) {
	PVOID addr = 0;

	ULONG size = 0;
	NTSTATUS status = ZwQuerySystemInformation(SystemModuleInformation, 0, 0, &size);
	if (STATUS_INFO_LENGTH_MISMATCH != status) {
		//DbgPrint("! ZwQuerySystemInformation for size failed: %p !\n", status);
		return addr;
	}

	PSYSTEM_MODULE_INFORMATION modules = (PSYSTEM_MODULE_INFORMATION)ExAllocatePool(NonPagedPoolNx, size);
	if (!modules) {
		//DbgPrint("! failed to allocate %d bytes for modules !\n", size);
		return addr;
	}

	if (!NT_SUCCESS(status = ZwQuerySystemInformation(SystemModuleInformation, modules, size, 0))) {
		//DbgPrint("! ZwQuerySystemInformation failed: %p !\n", status);
		return addr;
	}
	int name_len = emu_strlen(name);
	for (ULONG i = 0; i < modules->NumberOfModules; ++i) {
		SYSTEM_MODULE m = modules->Modules[i];
		UCHAR buf[256 + 1];
		RtlZeroMemory(buf, sizeof(buf));
		memcpy(buf, m.FullPathName, 256);
		LPCSTR n = GetSuffixFileNameA((LPCSTR)buf);
		if (!emu_strnicmp(n, name, name_len)) {
			addr = m.ImageBase;
			break;
		}
	}

	ExFreePool(modules);
	return addr;
}
#include "DDKCommon.h"
#include "XorStr.hpp"
#include "MyMemoryIo64.h"
#include "HandleTable.h"
#include "KernelAsm.h"
#include "smem.h"


#include "ImportEncrypt.h"
PVOID KGetDriverImageBase2(PCHAR name) {
	PVOID addr = 0;

	ULONG size = 0;
	NTSTATUS status = ZwQuerySystemInformation(SystemModuleInformation, 0, 0, &size);
	if (STATUS_INFO_LENGTH_MISMATCH != status) {
		//DbgPrint("! ZwQuerySystemInformation for size failed: %p !\n", status);
		return addr;
	}

	PSYSTEM_MODULE_INFORMATION modules = (PSYSTEM_MODULE_INFORMATION)ExAllocatePool(NonPagedPoolNx, size);
	if (!modules) {
		//DbgPrint("! failed to allocate %d bytes for modules !\n", size);
		return addr;
	}

	if (!NT_SUCCESS(status = ZwQuerySystemInformation(SystemModuleInformation, modules, size, 0))) {
		//DbgPrint("! ZwQuerySystemInformation failed: %p !\n", status);
		return addr;
	}
	int name_len = strlen(name);
	for (ULONG i = 0; i < modules->NumberOfModules; ++i) {
		SYSTEM_MODULE m = modules->Modules[i];
		UCHAR buf[256 + 1];
		RtlZeroMemory(buf, sizeof(buf));
		memcpy(buf, m.FullPathName, 256);
		LPCSTR n = GetSuffixFileNameA((LPCSTR)buf);
		if (!emu_strnicmp(n, name, name_len)) {
			addr = m.ImageBase;
			break;
		}
	}

	ExFreePool(modules);
	return addr;
}
ULONG KGetDriverImageSize2(PCHAR name) {
	ULONG addr = 0;

	ULONG size = 0;
	NTSTATUS status = ZwQuerySystemInformation(SystemModuleInformation, 0, 0, &size);
	if (STATUS_INFO_LENGTH_MISMATCH != status) {
		//DbgPrint("! ZwQuerySystemInformation for size failed: %p !\n", status);
		return addr;
	}

	PSYSTEM_MODULE_INFORMATION modules = (PSYSTEM_MODULE_INFORMATION)ExAllocatePool(NonPagedPoolNx, size);
	if (!modules) {
		//DbgPrint("! failed to allocate %d bytes for modules !\n", size);
		return addr;
	}

	if (!NT_SUCCESS(status = ZwQuerySystemInformation(SystemModuleInformation, modules, size, 0))) {
		//DbgPrint("! ZwQuerySystemInformation failed: %p !\n", status);
		return addr;
	}

	for (ULONG i = 0; i < modules->NumberOfModules; ++i) {
		SYSTEM_MODULE m = modules->Modules[i];
		UCHAR buf[256 + 1];
		RtlZeroMemory(buf, sizeof(buf));
		memcpy(buf, m.FullPathName, 256);
		if (StrStrIA((LPCSTR)buf, name)) {
			addr = m.ImageSize;
			break;
		}
		/*int name_len = strlen(name);
		if (strlen((PCHAR)m.FullPathName) >= name_len) {
			LPCSTR cmp_str = (LPCSTR)m.FullPathName + (strlen((PCHAR)m.FullPathName) - name_len);
			if (!strcmpi(cmp_str, name)) {
				addr = m.ImageSize;
				break;
			}
		}*/
	}

	ExFreePool(modules);
	return addr;
}
PVOID KGetDriverImageBase(LPCWSTR DriverName) {
	CHAR str[300];
	UnicodeToAnsi(DriverName, str, 300);
	return KGetDriverImageBase2(str);
	/*PLDR_DATA_TABLE_ENTRY ldr = KGetDriverLdr(DriverName);

	if (ldr) {
		return ldr->DllBase;
	}
	return NULL;*/
}
ULONG KGetDriverImageSize(LPCWSTR DriverName) {
	CHAR str[300];
	UnicodeToAnsi(DriverName, str, 300);
	return KGetDriverImageSize2(str);
	/*PLDR_DATA_TABLE_ENTRY ldr = KGetDriverLdr(DriverName);

	if (ldr) {
		return ldr->SizeOfImage;
	}
	return NULL;*/
}

typedef struct _SBYTEINFO_3 {
	UCHAR RawByte;
	UCHAR Hi : 1; //Hi 4 bit is ??
	UCHAR Lo : 1; //Lo 4 bit is ??
	UCHAR All : 1;
	UCHAR No : 1;
}SBYTEINFO_3, *PSBYTEINFO_3;
typedef struct _SBYTEINFO_2 {
	UCHAR RawByte;
	BOOLEAN All;
}SBYTEINFO_2, *PSBYTEINFO_2;
const BOOL g_ddk_EnablePrint = TRUE;

NTSTATUS NTAPI MmCopyVirtualMemory
(
	PEPROCESS SourceProcess,
	PVOID SourceAddress,
	PEPROCESS TargetProcess,
	PVOID TargetAddress,
	SIZE_T BufferSize,
	KPROCESSOR_MODE PreviousMode,
	PSIZE_T ReturnSize
);
//
//

volatile static DymOffsets g_DymOffsets = { 0 };
volatile static BOOL g_DymOffsets_inited = FALSE;

PDymOffsets KGetDymOffsets() {
	if (g_DymOffsets_inited == FALSE) {
		g_DymOffsets_inited = TRUE;
		ULONG64 pos = 0;
		//48 8B 80 ?? ?? ?? ?? C3
		ULONG64 fn = (ULONG64)KGetProcAddress(KGetNtoskrnl(), xs("PsGetProcessExitTime"));
		if (fn) {
			pos = FindSignatureCode_nocheck((LPCVOID)fn, 0x100, xs("48 8B 80 ?? ?? ?? ?? C3"), 0);
			if (pos != -1) {
				g_DymOffsets.ep_ProcessExitTime = *(DWORD*)(fn + pos + 3);
			}
		}
		if (g_DymOffsets.ep_ProcessExitTime == 0) {
			KeBugCheck(0x87987767);
		}
		g_DymOffsets.BuildNumber = KGetBuildNumber();

	}
	return (DymOffsets *)&g_DymOffsets;
}

static ULONG64 g_per = 0;
static BOOL g_first = TRUE;
ULONG64 GetSystemTime() {
	//FF FF F7 80 00 00 00 14
	//FFFFF78000000014
	ULONG64 addr = 0;
	memcpy(&addr, xs("\x14\x00\x00\x00\x80\xF7\xFF\xFF"), 8);
	return *(ULONG64*)addr;
	//return AsmRdtsc();
}
//ULONG64 GetRealTime() {
//	if (g_first) {
//		g_first = FALSE;
//
//		ULONG64 fir, sec;
//		fir = AsmRdtsc();
//		Sleep(50);
//		sec = AsmRdtsc();
//
//		g_per = (sec - fir) / 50;
//
//	}
//
//	return AsmRdtsc() / g_per;
//}
ULONG64 GetRealTime() {
	//if (g_first) {
	//	g_first = FALSE;
	//
	//	ULONG64 fir, sec;
	//	fir = GetSystemTime();
	//	Sleep(50);
	//	sec = GetSystemTime();
	//
	//	g_per = (sec - fir) / 50;
	//	if (!g_per)
	//		KeBugCheck(0x9981);
	//}
	//
	//return GetSystemTime() / g_per;
	return GetSystemTime() / (10 * 1000);
}
static ULONG64 g_per_micro = 0;
static BOOL g_first_micro = TRUE;
ULONG64 GetRealMicroTime() {
	if (g_first_micro) {
		g_first_micro = FALSE;

		ULONG64 fir, sec;
		fir = GetSystemTime();
		Sleep(50);
		sec = GetSystemTime();

		g_per_micro = (sec - fir) / 50000;
		if (!g_per_micro)
			KeBugCheck(0x9981);
	}

	return GetSystemTime() / g_per_micro;
}
VOID Sleep(LONG Millsecond) {
	LARGE_INTEGER t;
	t.QuadPart = Millsecond;
	//单位:100纳秒
	t.QuadPart *= -10 * 1000;
	KeDelayExecutionThread(KernelMode, FALSE, &t);
	return;
}

VOID
RtlInitUnicodeString32(
	OUT PMYUNICODE_STRING32 DestinationString,
	IN PCWSTR SourceString OPTIONAL
)
{

	SIZE_T Length;

	DestinationString->MaximumLength = 0;
	DestinationString->Length = 0;
	DestinationString->Buffer = (ULONG)SourceString;
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
void AnsiToUnicode(LPCSTR AnsiStr, LPWSTR UnicodeStrBuffer, ULONG MaxLenth) {
	int len = strlen(AnsiStr);
	if (len > MaxLenth)len = MaxLenth;
	UnicodeStrBuffer[len] = 0;
	for (int i = 0; i < len; ++i) {
		UnicodeStrBuffer[i] = AnsiStr[i];
	}
	return;
}
void UnicodeToAnsi(LPCWSTR UnicodeStr, LPSTR AnsiStrBuffer, ULONG MaxLenth) {
	int len = wcslen(UnicodeStr);
	if (len > MaxLenth)len = MaxLenth;

	AnsiStrBuffer[len] = 0;
	for (int i = 0; i < len; ++i) {
		AnsiStrBuffer[i] = UnicodeStr[i];
	}
	return;
}
LPWSTR FullPathToFileNameW(LPCWSTR FullPath) {
	int len = wcslen(FullPath);
	LPWSTR result = (LPWSTR)FullPath;
	LPCWSTR Current = FullPath;
	LPCWSTR End = Current + len;

	while (Current < End) {
		if (*Current == L'\\') {
			if (Current + 1 >= End)break;
			result = (LPWSTR)++Current;
		}
		else {
			Current++;
		}
	}
	return result;
}
LPCWSTR GetSuffixFileName(LPCWSTR a) {
	LPCWSTR resu = a;

	int len = wcslen(a);
	for (int i = 0; i < len; i++) {
		if (a[i] == L'\\' || a[i] == L'/') {
			resu = &a[i + 1];
		}
	}

	return resu;
}

LPWSTR WINAPI StrStrIW(LPCWSTR lpszStr, LPCWSTR lpszSearch)
{
	int iLen;
	LPCWSTR end;

	if (!lpszStr || !lpszSearch || !*lpszSearch)
		return NULL;

	iLen = wcslen(lpszSearch);
	end = lpszStr + wcslen(lpszStr);

	while (lpszStr + iLen <= end)
	{
		if (!wcsnicmp(lpszStr, lpszSearch, iLen))
			return (LPWSTR)lpszStr;
		lpszStr++;
	}
	return NULL;
}
LPWSTR WINAPI StrStrNIW(LPCWSTR lpszStr, LPCWSTR lpszSearch, SIZE_T max_chars)
{
	int iLen;
	LPCWSTR end;

	if (!lpszStr || !lpszSearch || !*lpszSearch || !max_chars)
		return NULL;

	iLen = wcslen(lpszSearch);
	end = lpszStr + max_chars;

	while (lpszStr + iLen <= end)
	{
		if (!wcsnicmp(lpszStr, lpszSearch, iLen))
			return (LPWSTR)lpszStr;
		lpszStr++;
	}
	return NULL;
}
LPSTR WINAPI StrStrIA(LPCSTR lpszStr, LPCSTR lpszSearch)
{
	int iLen;
	LPCSTR end;

	if (!lpszStr || !lpszSearch || !*lpszSearch)
		return NULL;

	iLen = strlen(lpszSearch);
	end = lpszStr + strlen(lpszStr);

	while (lpszStr + iLen <= end)
	{
		if (!strnicmp(lpszStr, lpszSearch, iLen))
			return (LPSTR)lpszStr;
		lpszStr++;
	}
	return NULL;
}
LPSTR WINAPI StrStrNIA(LPCSTR lpszStr, LPCSTR lpszSearch, SIZE_T max_chars)
{
	int iLen;
	LPCSTR end;

	if (!lpszStr || !lpszSearch || !*lpszSearch || !max_chars)
		return NULL;

	iLen = strlen(lpszSearch);
	end = lpszStr + max_chars;

	while (lpszStr + iLen <= end)
	{
		if (!strnicmp(lpszStr, lpszSearch, iLen))
			return (LPSTR)lpszStr;
		lpszStr++;
	}
	return NULL;
}
BOOL CommonMmIsAddressValidEx(PVOID addr) {
	/*if ((ULONG64)addr >= MmUserProbeAddress)return KIsAddressValid(addr);
	UCHAR v = 0;
	return c_memcpy_seh(&v, addr, 1);*/
	return (BOOL)MmiGetPhysicalAddress(addr);
}
BOOL IsPidActive(ULONG Pid)
{
	NTSTATUS status = STATUS_UNSUCCESSFUL;
	//*pRet = FALSE;

	PSYSTEM_PROCESS_INFORMATION pProcessInfo = NULL;
	PSYSTEM_PROCESS_INFORMATION pTemp = NULL;//这个留作以后释放指针的时候用。
	ULONG ulNeededSize;
	ULONG ulNextOffset;


	//第一次使用肯定是缓冲区不够，不过本人在极少数的情况下第二次也会出现不够，所以用while循环
	status =  ZwQuerySystemInformation(SystemProcessesAndThreadsInformation, pProcessInfo, 0, &ulNeededSize);
	while (STATUS_INFO_LENGTH_MISMATCH == status)
	{
		if (pTemp) {
			ExFreePool(pTemp);
		}
		pProcessInfo = (PSYSTEM_PROCESS_INFORMATION)ExAllocatePool(NonPagedPoolNx, ulNeededSize);
		pTemp = pProcessInfo;
		if (!pProcessInfo)
		{
			return FALSE;
		}
		status =  ZwQuerySystemInformation(SystemProcessesAndThreadsInformation, pProcessInfo, ulNeededSize, &ulNeededSize);
	}
	if (!NT_SUCCESS(status))return FALSE;
	BOOL result = FALSE;
	//DbgPrint("[112233] 2\n");
	do
	{

		if (NULL != pProcessInfo)
		{
			//pProcessInfo->ProcessName
			//DbgPrint("[112233] Pid:%d\n", pProcessInfo->InheritedFromProcessId);
			if (pProcessInfo->InheritedFromProcessId == Pid) {
				result = TRUE;
				break;
			}

		}

		ulNextOffset = pProcessInfo->NextEntryDelta;
		pProcessInfo = (PSYSTEM_PROCESS_INFORMATION)((PUCHAR)pProcessInfo + pProcessInfo->NextEntryDelta);

	} while (ulNextOffset != 0);

	ExFreePool(pTemp);

	return result;
}
ULONG GetPidByProcessNameW(LPCWSTR name)
{
	NTSTATUS status = STATUS_UNSUCCESSFUL;
	//*pRet = FALSE;
	
	PSYSTEM_PROCESS_INFORMATION pProcessInfo = NULL;
	PSYSTEM_PROCESS_INFORMATION pTemp = NULL;//这个留作以后释放指针的时候用。
	ULONG ulNeededSize;
	ULONG ulNextOffset;
	
	
	//第一次使用肯定是缓冲区不够，不过本人在极少数的情况下第二次也会出现不够，所以用while循环
	status =  ZwQuerySystemInformation(SystemProcessesAndThreadsInformation, pProcessInfo, 0, &ulNeededSize);
	ULONG OldSize = 0;
	while (STATUS_INFO_LENGTH_MISMATCH == status)
	{
		if (pTemp) {
			//ExFreePoolWithTag(pTemp, POOL_TAG);
			ExFreePool(pTemp);
		}
		//pProcessInfo = (PSYSTEM_PROCESS_INFORMATION)ExAllocatePoolWithTag(NonPagedPoolNx, ulNeededSize, POOL_TAG);
		pProcessInfo = (PSYSTEM_PROCESS_INFORMATION)ExAllocatePool(NonPagedPoolNx, ulNeededSize);
		OldSize = ulNeededSize;
		pTemp = pProcessInfo;
		if (!pProcessInfo)
		{
			return FALSE;
		}
		status =  ZwQuerySystemInformation(SystemProcessesAndThreadsInformation, pProcessInfo, ulNeededSize, &ulNeededSize);
	}
	if (!NT_SUCCESS(status))return FALSE;

	do
	{

		if (CommonMmIsAddressValidEx(pProcessInfo->ProcessName.Buffer) && NULL != pProcessInfo)
		{
			//pProcessInfo->ProcessName
			if (CommonMmIsAddressValidEx(pProcessInfo->ProcessName.Buffer)) {
				if (!wcsicmp(name, pProcessInfo->ProcessName.Buffer))
					return pProcessInfo->InheritedFromProcessId;
			}

		}

		ulNextOffset = pProcessInfo->NextEntryDelta;
		pProcessInfo = (PSYSTEM_PROCESS_INFORMATION)((PUCHAR)pProcessInfo + pProcessInfo->NextEntryDelta);

	} while (ulNextOffset != 0);

	//ExFreePoolWithTag(pTemp, POOL_TAG);
	ExFreePool(pTemp);
	return 0;
}
ULONG GetPidByProcessNameA(LPCSTR name) {

	WCHAR wModuleName[100];
	RtlZeroMemory(wModuleName, sizeof(wModuleName));
	AnsiToUnicode(name, wModuleName, 99);
	return GetPidByProcessNameW(wModuleName);
}
PLDR_DATA_TABLE_ENTRY GetUserModeModuleLdrX64(ULONG64 ModuleBase) {
	PEPROCESS Process = PsGetCurrentProcess();
	PMYPEB peb = (PMYPEB)PsGetProcessPeb(Process);

	PVOID Base = 0;

	if (peb && CommonMmIsAddressValidEx(peb)) {

		PPEB_LDR_DATA ldr = peb->Ldr;
		PLIST_ENTRY first = &ldr->InLoadOrderModuleList;
		PLIST_ENTRY query = first->Flink;

		while (first != query) {
			if (!CommonMmIsAddressValidEx(query) || !CommonMmIsAddressValidEx(((PUCHAR)query + sizeof(LDR_DATA_TABLE_ENTRY)) - 1))return NULL;
			PLDR_DATA_TABLE_ENTRY data = (PLDR_DATA_TABLE_ENTRY)query;

			if ((ULONG64)data->DllBase == ModuleBase)return data;

			query = query->Flink;

		}
	}
	return (PLDR_DATA_TABLE_ENTRY)Base;
}
PLDR_DATA_TABLE_ENTRY32 GetUserModeModuleLdrX32(ULONG ModuleBase) {
	PEPROCESS Process = PsGetCurrentProcess();
	PMYPEB32 peb = (PMYPEB32)PsGetProcessWow64Process(Process);

	PVOID Base = 0;

	if (peb && CommonMmIsAddressValidEx(peb)) {

		PPEB_LDR_DATA32 ldr = (PPEB_LDR_DATA32)peb->Ldr;
		PLIST_ENTRY32 first = &ldr->InLoadOrderModuleList;
		PLIST_ENTRY32 query = (PLIST_ENTRY32)(first->Flink);

		while (first != query) {
			if (!CommonMmIsAddressValidEx(query) || !CommonMmIsAddressValidEx(((PUCHAR)query + sizeof(LDR_DATA_TABLE_ENTRY32)) - 1))return NULL;
			PLDR_DATA_TABLE_ENTRY32 data = (PLDR_DATA_TABLE_ENTRY32)query;

			if (data->DllBase == ModuleBase)return data;
			
			query = (PLIST_ENTRY32)(query->Flink);

		}

	}

	return (PLDR_DATA_TABLE_ENTRY32)Base;
}
PVOID64 GetUserModeModuleBaseX64WImpl1(LPCWSTR ModuleName) {
	int mod_cnt = 0;
	PMYPEB peb = (PMYPEB)PsGetProcessPeb(PsGetCurrentProcess());
	if (peb && MmiGetPhysicalAddress(peb)) {

		PPEB_LDR_DATA ldr = (PPEB_LDR_DATA)mem::r<ULONG_PTR>(&peb->Ldr);
		//DbgPrint("[112233] ldr:%p\n", ldr);
		if (!MmiGetPhysicalAddress(ldr))return 0;
		PLIST_ENTRY first = &ldr->InLoadOrderModuleList;
		PLIST_ENTRY query = (PLIST_ENTRY)mem::r<ULONG_PTR>(&first->Blink);
		//DbgPrint("[112233] query:%p\n", query);
		if (!MmiGetPhysicalAddress(query))return 0;

		while (first != query) {
			if (!MmiGetPhysicalAddress(query) || !MmiGetPhysicalAddress(((PUCHAR)query + sizeof(LDR_DATA_TABLE_ENTRY) - 1)))return 0;
			PLDR_DATA_TABLE_ENTRY data = (PLDR_DATA_TABLE_ENTRY)query;

			PUNICODE_STRING Name = &data->BaseDllName;
			if (Name && MmiGetPhysicalAddress(Name)) {
				PVOID NameBuffer = (PVOID)mem::r<ULONG_PTR>(&Name->Buffer);
				USHORT NameLength = mem::r<USHORT>(&Name->Length);

				if (NameBuffer && MmiGetPhysicalAddress(NameBuffer) && NameLength && MmiGetPhysicalAddress((NameLength + ((PUCHAR)NameBuffer) - 1))) {
					WCHAR wName[80];
					memset(wName, 0, sizeof(wName));
					DWORD ReadLen = NameLength;
					if (ReadLen > 158)
						ReadLen = 158;
					if (MmiReadVirtualAddressSafe((DWORD64)NameBuffer, wName, ReadLen)) {
						//DbgPrint("[112233] %ws\n", wName);
						if (!wcsicmp(wName, ModuleName)) {
							return (PVOID)mem::r<ULONG_PTR>(&data->DllBase);
						}
					}

				}
			}
			else {
				return 0;
			}
			mod_cnt++;
			query = (PLIST_ENTRY)mem::r<ULONG_PTR>(&query->Blink);
		}
	}
	return 0;
}
PVOID64 GetUserModeModuleBaseX64WImpl2(LPCWSTR ModuleName) {
	int mod_cnt = 0;
	PMYPEB peb = (PMYPEB)PsGetProcessPeb(PsGetCurrentProcess());
	if (peb && MmiGetPhysicalAddress(peb)) {

		PPEB_LDR_DATA ldr = (PPEB_LDR_DATA)mem::r<ULONG_PTR>(&peb->Ldr);
		//DbgPrint("[112233] ldr:%p\n", ldr);
		if (!MmiGetPhysicalAddress(ldr))return 0;
		PLIST_ENTRY first = &ldr->InLoadOrderModuleList;
		PLIST_ENTRY query = (PLIST_ENTRY)mem::r<ULONG_PTR>(&first->Blink);
		//DbgPrint("[112233] query:%p\n", query);
		if (!MmiGetPhysicalAddress(query))return 0;

		while (first != query) {
			if (!MmiGetPhysicalAddress(query) || !MmiGetPhysicalAddress(((PUCHAR)query + sizeof(LDR_DATA_TABLE_ENTRY) - 1)))return 0;
			PLDR_DATA_TABLE_ENTRY data = (PLDR_DATA_TABLE_ENTRY)query;

			PUNICODE_STRING Name = &data->FullDllName;
			if (Name && MmiGetPhysicalAddress(Name)) {
				PVOID NameBuffer = (PVOID)mem::r<ULONG_PTR>(&Name->Buffer);
				USHORT NameLength = mem::r<USHORT>(&Name->Length);

				if (NameBuffer && MmiGetPhysicalAddress(NameBuffer) && NameLength && MmiGetPhysicalAddress((NameLength + ((PUCHAR)NameBuffer) - 1))) {
					WCHAR wName[80];
					memset(wName, 0, sizeof(wName));
					DWORD ReadLen = NameLength;
					if (ReadLen > 158)
						ReadLen = 158;
					if (MmiReadVirtualAddressSafe((DWORD64)NameBuffer, wName, ReadLen)) {
						//DbgPrint("[112233] %ws\n", wName);
						LPCWSTR sufMooduleName = GetSuffixFileName(wName);
						//DbgPrint("[112233] %ws\n", sufMooduleName);
						if (!wcsicmp(sufMooduleName, ModuleName)) {
							return (PVOID)mem::r<ULONG_PTR>(&data->DllBase);
						}
					}

				}
			}
			else {
				return 0;
			}
			mod_cnt++;
			query = (PLIST_ENTRY)mem::r<ULONG_PTR>(&query->Blink);
		}
	}
	return 0;
}
PVOID64 GetUserModeModuleBaseX64W(LPCWSTR ModuleName) {
	PVOID r = GetUserModeModuleBaseX64WImpl1(ModuleName);
	if (r == 0) {
		r = GetUserModeModuleBaseX64WImpl2(ModuleName);
	}
	return r;
}
PVOID64 GetUserModeModuleBaseX64WByPeb(PVOID _peb, LPCWSTR ModuleName) {
	PMYPEB peb = (PMYPEB)_peb;

	PVOID Base = 0;

	if (peb && CommonMmIsAddressValidEx(peb)) {

		PPEB_LDR_DATA ldr = peb->Ldr;
		if (!CommonMmIsAddressValidEx(ldr))return NULL;
		PLIST_ENTRY first = &ldr->InLoadOrderModuleList;
		PLIST_ENTRY query = first->Flink;
		if (!CommonMmIsAddressValidEx(query))return NULL;

		while (first != query) {
			if (!CommonMmIsAddressValidEx(query) || !CommonMmIsAddressValidEx(((PUCHAR)query + sizeof(LDR_DATA_TABLE_ENTRY))))return NULL;
			PLDR_DATA_TABLE_ENTRY data = (PLDR_DATA_TABLE_ENTRY)query;

			PUNICODE_STRING Name = &data->BaseDllName;
			//DbgPrint("[112233] %ws\n", Name->Buffer);
			if (Name && CommonMmIsAddressValidEx(Name)) {
				if (Name->Buffer && CommonMmIsAddressValidEx(Name->Buffer) && Name->Length && CommonMmIsAddressValidEx((Name->Length + ((PUCHAR)Name->Buffer)))) {
					WCHAR wName[100];
					memset(wName, 0, sizeof(wName));
					DWORD ReadLen = Name->Length;
					if (ReadLen > 80)
						ReadLen = 80;
					if (MmiReadVirtualAddressWStringSafe((DWORD64)Name->Buffer, wName, ReadLen / 2)) {
						//DbgPrint("[112233] 2%ws\n", wName);
						if (StrStrIW(wName, ModuleName)) {
							Base = data->DllBase;
							break;
						}
					}
				
				}
			}
			query = query->Flink;
			//if (!CommonMmIsAddressValidEx(query))
				//break;
		}
	}
	return Base;
}
PVOID64 GetUserModeModuleBaseX32WByPebImpl(PVOID _peb, LPCWSTR ModuleName){
	PMYPEB32 peb = (PMYPEB32)_peb;

	PVOID Base = 0;

	if (peb && MmiGetPhysicalAddress(peb)) {
		
		PPEB_LDR_DATA32 ldr = (PPEB_LDR_DATA32)mem::r<ULONG>(&peb->Ldr);
		PLIST_ENTRY32 first = &ldr->InLoadOrderModuleList;
		PLIST_ENTRY32 query = (PLIST_ENTRY32)mem::r<ULONG>(&first->Blink);

		while (first != query) {
			if (!MmiGetPhysicalAddress(query) || !MmiGetPhysicalAddress(((PUCHAR)query + sizeof(LDR_DATA_TABLE_ENTRY32) - 1)))return NULL;
			PLDR_DATA_TABLE_ENTRY32 data = (PLDR_DATA_TABLE_ENTRY32)query;

			PMYUNICODE_STRING32 Name = &data->BaseDllName;
			//DbgPrint("%ws\n", (LPCWSTR)Name->Buffer);
			if (Name && MmiGetPhysicalAddress(Name)) {
				ULONG NameBuffer = mem::r<ULONG>(&Name->Buffer);
				USHORT NameLength = mem::r<USHORT>(&Name->Length);
				if (NameBuffer && MmiGetPhysicalAddress((PVOID)NameBuffer) && NameLength && MmiGetPhysicalAddress((NameLength + ((PUCHAR)NameBuffer) - 1))) {
					static WCHAR wName[300];
					RtlZeroMemory(wName, sizeof(wName));
					DWORD ReadLen = NameLength;
					if (ReadLen > 598)
						ReadLen = 598;
					if (MmiReadVirtualAddressSafe((DWORD64)NameBuffer, wName, ReadLen)) {
						//DbgPrint("[112233] %ws\n", wName);
						if (!wcsicmp(wName, ModuleName)) {
							Base = (PVOID)mem::r<ULONG>(&data->DllBase);
							break;
						}
					}
				}
			}
			query = (PLIST_ENTRY32)mem::r<ULONG>(&query->Blink);

		}

	}

	return Base;
}
PVOID64 GetUserModeModuleBaseX32WByPeb(PVOID _peb, LPCWSTR ModuleName) {
	PVOID64 resu = GetUserModeModuleBaseX32WByPebImpl(_peb, ModuleName);
	return resu;
	
}
PVOID64 GetUserModeModuleBaseX32AByPeb(PVOID _peb, LPCSTR ModuleName) {
	WCHAR wModuleName[50];
	RtlZeroMemory(wModuleName, sizeof(wModuleName));
	AnsiToUnicode(ModuleName, wModuleName, 49);
	return GetUserModeModuleBaseX32WByPeb(_peb, wModuleName);
}
PVOID64 GetUserModeModuleBaseX32W(LPCWSTR ModuleName) {
	PEPROCESS Process = PsGetCurrentProcess();
	PMYPEB32 peb = (PMYPEB32)PsGetProcessWow64Process(Process);

	PVOID Base = 0;

	if (peb && CommonMmIsAddressValidEx(peb)) {

		PPEB_LDR_DATA32 ldr = (PPEB_LDR_DATA32)peb->Ldr;
		PLIST_ENTRY32 first = &ldr->InLoadOrderModuleList;
		PLIST_ENTRY32 query = (PLIST_ENTRY32)(first->Flink);

		while (first != query) {
			if (!CommonMmIsAddressValidEx(query) || !CommonMmIsAddressValidEx(((PUCHAR)query + sizeof(LDR_DATA_TABLE_ENTRY32))))return NULL;
			PLDR_DATA_TABLE_ENTRY32 data = (PLDR_DATA_TABLE_ENTRY32)query;

			PMYUNICODE_STRING32 Name = &data->BaseDllName;
			//DbgPrint("%ws\n", (LPCWSTR)Name->Buffer);
			if (Name && CommonMmIsAddressValidEx(Name)) {
				if (Name->Buffer && CommonMmIsAddressValidEx((PVOID)Name->Buffer) && Name->Length && CommonMmIsAddressValidEx((Name->Length + ((PUCHAR)Name->Buffer)))) {
					WCHAR wName[300];
					RtlZeroMemory(wName, sizeof(wName));
					DWORD ReadLen = Name->Length;
					if (ReadLen > 80)
						ReadLen = 80;
					if (MmiReadVirtualAddressWStringSafe((DWORD64)Name->Buffer, wName, ReadLen / 2)) {
						if (!wcsicmp(wName, ModuleName)) {
							Base = (PVOID)data->DllBase;
							break;
						}
					}
				}
			}
			query = (PLIST_ENTRY32)(query->Flink);
			//if (!CommonMmIsAddressValidEx(query))
				//break;
		}

	}

	return Base;
}
PVOID64 GetUserModeModuleBaseX64A(LPCSTR ModuleName) {

	WCHAR wModuleName[100];
	RtlZeroMemory(wModuleName, sizeof(wModuleName));
	AnsiToUnicode(ModuleName, wModuleName, 99);
	return GetUserModeModuleBaseX64W(wModuleName);
}
PVOID64 GetUserModeModuleBaseX32A(LPCSTR ModuleName) {
	WCHAR wModuleName[100];
	RtlZeroMemory(wModuleName, sizeof(wModuleName));
	AnsiToUnicode(ModuleName, wModuleName, 99);
	return GetUserModeModuleBaseX32W(wModuleName);
}

BOOLEAN GetUserModeModuleFullNameX64W(LPCWSTR ModuleName, LPWSTR FullName, SIZE_T max_char_cnt) {
	if (max_char_cnt == 0)
		return FALSE;
	PEPROCESS Process = PsGetCurrentProcess();
	PMYPEB peb = (PMYPEB)PsGetProcessPeb(Process);
	//DbgPrint("[112233] %p\n", peb);
	PVOID Base = 0;

	if (peb) {

		PPEB_LDR_DATA ldr = peb->Ldr;
		//if (!CommonMmIsAddressValidEx(ldr))return NULL;
		//DbgPrint("[112233] %p\n", ldr);
		PLIST_ENTRY first = &ldr->InLoadOrderModuleList;
		PLIST_ENTRY query = first->Flink;
		if (!query)
			return FALSE;
		/*if (!CommonMmIsAddressValidEx(query)) {
			first = &ldr->InMemoryOrderModuleList;
			query = first->Flink;
			if (!CommonMmIsAddressValidEx(query)) {
				first = &ldr->InInitializationOrderModuleList;
				query = first->Flink;
				//if (!CommonMmIsAddressValidEx(query))
					//return NULL;
			}
		}*/

		while (first != query) {
			if (!query)
				return FALSE;
			//if (!CommonMmIsAddressValidEx(query))return NULL;
			PLDR_DATA_TABLE_ENTRY data = (PLDR_DATA_TABLE_ENTRY)query;

			PUNICODE_STRING Name = &data->BaseDllName;
			//DbgPrint("[112233] %wZ\n", Name);
			if (Name && CommonMmIsAddressValidEx(Name)) {
				if (Name->Buffer && CommonMmIsAddressValidEx(Name->Buffer) && Name->Length) {
					WCHAR wName[100];
					memset(wName, 0, sizeof(wName));
					DWORD ReadLen = Name->Length;
					if (ReadLen > 80)
						ReadLen = 80;
					if (MmiReadVirtualAddressWStringSafe((DWORD64)Name->Buffer, wName, ReadLen / 2)) {
						if (StrStrIW(wName, ModuleName)) {
							PUNICODE_STRING FullNameW = &data->FullDllName;
							if (!MmiGetPhysicalAddress(FullNameW->Buffer))
								return FALSE;
							int cpy_cnt = FullNameW->Length / 2;
							if (cpy_cnt > max_char_cnt - 1)
								return FALSE;
							MmiReadVirtualAddressSafe((DWORD64)FullNameW->Buffer, FullName, FullNameW->Length);
							FullName[cpy_cnt] = 0;
							return TRUE;
						}
					}
				}
			}
			//if (!MmiGetPhysicalAddress(&query->Flink))
				//break;
			query = query->Flink;
			//if (MmiGetPhysicalAddress(query) == 0)
				//break;
		}
	}
	return FALSE;
}

PVOID64 GetProcAddressX64(PVOID ModuleHandle, LPCSTR ProcName) {
	IMAGE_DOS_HEADER *idh = (IMAGE_DOS_HEADER *)ModuleHandle;
	if (!CommonMmIsAddressValidEx(idh))return NULL;
	IMAGE_NT_HEADERS64 *inh = (IMAGE_NT_HEADERS64 *)(idh->e_lfanew + (PUCHAR)idh);
	if (!CommonMmIsAddressValidEx(inh))return NULL;
	IMAGE_EXPORT_DIRECTORY *ied = (IMAGE_EXPORT_DIRECTORY *)((PUCHAR)ModuleHandle + inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
	if (!CommonMmIsAddressValidEx(ied))return NULL;
	for (int i = 0; i < ied->NumberOfNames; i++) {
		WORD index = ((WORD *)((PUCHAR)ModuleHandle + ied->AddressOfNameOrdinals))[i];
		ULONG NameRVA = ((ULONG *)((PUCHAR)ModuleHandle + ied->AddressOfNames))[i];
		PCSTR Name = (PCSTR)(((ULONG64)ModuleHandle) + NameRVA);
		if (CommonMmIsAddressValidEx((PVOID)Name)) {
			CHAR StrName[260];
			RtlZeroMemory(StrName, sizeof(StrName));
			if (MmiReadVirtualAddressStringSafe((DWORD64)Name, StrName, 200)) {
				if (!strcmp(StrName, ProcName)) {
					ULONG FunRVA = ((ULONG *)((PUCHAR)ModuleHandle + ied->AddressOfFunctions))[index];
					PUCHAR FunAddress = ((PUCHAR)ModuleHandle + FunRVA);

					BOOLEAN IsBoundImport = FALSE;
					ULONG BoundImportNameLenth = 0;
					for (ULONG i = 0; i < 50; i++) {
						PUCHAR pAddr = FunAddress + i;
						if (!CommonMmIsAddressValidEx(pAddr))break;
						UCHAR c = *pAddr;
						if (c == '.' && i > 0) {
							IsBoundImport = TRUE;
							BoundImportNameLenth = i;
							break;
						}
						else {
							if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9'))) {
								break;
							}
						}
					}
					if (IsBoundImport) {
						UCHAR BoundImportModuleName[160];
						RtlZeroMemory(BoundImportModuleName, sizeof(BoundImportModuleName));
						if (MmiReadVirtualAddressSafe((DWORD64)FunAddress, BoundImportModuleName, BoundImportNameLenth)) {
							*(ULONG *)(BoundImportModuleName + BoundImportNameLenth) = 'lld.';

							LPCSTR BoundImportFunctionName = (LPCSTR)(FunAddress + BoundImportNameLenth + 1);

							/*if (g_ddk_EnablePrint)
								DbgPrint("[Huaji] BoundImportModuleName:%s\n", BoundImportModuleName);
							if (g_ddk_EnablePrint)
								DbgPrint("[Huaji] BoundImportFunctionName:%s\n", BoundImportFunctionName);*/

							ULONG64 base = (ULONG64)GetUserModeModuleBaseX64A((LPCSTR)BoundImportModuleName);
							if (base) {
								return GetProcAddressX64((PVOID)base, BoundImportFunctionName);
							}
						}

					}

					return FunAddress;
				}
			}

		}
	}

	return NULL;
}
PULONG64 GetImportFunctionPtrX64(PVOID64 ModuleBase, LPCSTR ImportModule, LPCSTR ImportFunction) {
	ULONG64 ImportModuleBase = (ULONG64)GetUserModeModuleBaseX64A((LPCSTR)ImportModule);
	if (ImportModuleBase == 0)return 0;
	ULONG64 FunBase = (ULONG64)GetProcAddressX64((PVOID)ImportModuleBase, ImportFunction);
	if (FunBase == 0)return 0;

	ULONG64 ModBase = (ULONG64)ModuleBase;
	IMAGE_DOS_HEADER *idh = (IMAGE_DOS_HEADER *)ModBase;
	IMAGE_NT_HEADERS *inh = (IMAGE_NT_HEADERS *)(idh->e_lfanew + ModBase);
	DWORD size = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].Size;
	IMAGE_IMPORT_DESCRIPTOR *iid = (IMAGE_IMPORT_DESCRIPTOR *)(inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress + ModBase);

	for (DWORD i = 0; i < size / sizeof(IMAGE_IMPORT_DESCRIPTOR); i++) {
		if (iid[i].Name == NULL)break;
		PCSTR DName = (PCSTR)(iid[i].Name + ModBase);
		if (!strcmpi(DName, ImportModule)) {
			PDWORD64 FirstThunk = (PDWORD64)(iid[i].FirstThunk + ModBase);
			DWORD j = 0;
			DWORD64 Value;
			while (Value = FirstThunk[j]) {
				if (Value & 0x8000000000000000)continue;
				if (Value == FunBase)return &FirstThunk[j];
				//DbgPrint("[Huaji] Value:%llx\n", Value);
				++j;
			}
		}
	}
	return 0;
}
BOOLEAN ForceWrite(PVOID64 TargetAddress, PVOID64 Buffer, ULONG Size) {
	return MmiWriteVirtualAddressSafe((DWORD64)TargetAddress, Buffer, Size);
}
BOOLEAN ForceRead(PVOID64 TargetAddress, PVOID64 Buffer, ULONG Size) {
	return MmiReadVirtualAddressSafe((DWORD64)TargetAddress, Buffer, Size);
}


//#pragma optimize( "", on )
//#pragma clang optimize on

//
UCHAR CharToByte(UCHAR c) {
	if (c >= '0' && c <= '9') return(c - 48);
	else if (c >= 'A' && c <= 'F')return(c - 55);
	else if (c >= 'a' && c <= 'f')return(c - 87);
	return 0;
}
#define STRTOBYTE(h) (CharToByte(h[0]) * 0x10 + CharToByte(h[1]))
UCHAR StrToByte(const char* hex) {
	return CharToByte(hex[0]) * 0x10 + CharToByte(hex[1]);
}
ULONG __strlen__(LPCSTR str) {
	ULONG len = 0;
	while (*str++)++len;
	return len;
}
#define CHECKCHARVALID(v) ((v >= '0' && v <= '9') || (v >= 'A' && v <= 'F') || (v >= 'a' && v <= 'f') || v == '?')
ULONG CheckForSignureCode(LPCSTR scode) {
	ULONG len = __strlen__(scode);
	LPCSTR str = scode;
	if (len % 2)return FALSE;
	str = scode;
	ULONG Type = 1;
	for (int i = 0; i < len; i += 2) {
		if (!CHECKCHARVALID(scode[i]) || !CHECKCHARVALID(scode[i + 1]))return 0;
		if (scode[i] == '?' && scode[i + 1] != '?') {
			return 3;
		}
		if (scode[i + 1] == '?' && scode[i] != '?') {
			return 3;
		}
		if (scode[i] == '?' && scode[i + 1] == '?')Type = 2;
	}
	return Type;
}

#define HI4BIT(v) (v>>4)
#define LO4BIT(v) (v&0x0f)

ULONG64 g_CachedPageAddress = 0;
UCHAR g_CachedPage[0x1000];
BOOL CachedReadByte(ULONG64 Address, BYTE* result) {
	ULONG64 PageAddress = Address & 0xFFFFFFFFFFFFF000;
	if (!PageAddress)
		return FALSE;
	ULONG64 offset = Address & 0xFFF;
	if (g_CachedPageAddress != PageAddress) {
		if (MmiGetPhysicalAddress((PVOID)PageAddress) == 0)
			return FALSE;
		memcpy(g_CachedPage, (PVOID)PageAddress, 0x1000);
		//if (!MmiReadVirtualAddressSafe(PageAddress, g_CachedPage, 0x1000)) {
		//	//DbgPrint("[112233] AddressFault :%p\n", Address);
		//	return FALSE;
		//}
		g_CachedPageAddress = PageAddress;
	}
	*result = g_CachedPage[offset];
	return TRUE;
}

namespace sd {
#define sd_c2v(v)((v>='0'&&v<='9')?(v-'0'):(v-'A'+10))
	__forceinline int sd_toval(const char *vs) {
		int hi = sd_c2v(vs[0]);
		int lo = sd_c2v(vs[1]);

		return hi * 0x10 + lo;
	}
	__forceinline char sd_toupper(char v) {
		if (v >= 'a' && v <= 'z') {
			v -= 0x20;
		}
		return v;
	}
	struct sd_skip {
		int offset;
		unsigned char cmap[256];
	};
//#define sd_setcmap(m,p)(m[p/8]|=(1<<((p%8))))
//#define sd_iscmap(m,p)( (m[p/8]>>(p%8)) & 0b00000001)
	#define sd_setcmap(m,p)(m[p]=1)
	#define sd_iscmap(m,p)(m[p]==1)
	__forceinline int sd_convert(const char *pattern, unsigned short *pat) {
		int len = strlen(pattern);

		char val[3];
		val[2] = 0;

		int val_idx = 0;

		bool flag_fuzzy = false;
		bool flag_char = false;
		int pat_idx = 0;

		bool flag_cvt = false;
		for (int i = 0; i < len + 1; i++) {
			if (i == len)
				flag_cvt = true;
			else {
				char v = sd_toupper(pattern[i]);
				if ((v >= '0'&&v <= '9') || (v >= 'A' && v <= 'Z')) {
					if (flag_fuzzy)
						return 0;
					if (val_idx >= 2)
						return 0;
					val[val_idx++] = v;
					flag_char = true;
				}
				else if (v == '?') {
					if (flag_char)
						return 0;
					flag_fuzzy = true;
				}
				else if (v == ' ')
					flag_cvt = true;
				else
					return 0;
			}


			if (flag_cvt) {
				if (flag_fuzzy && flag_char)
					return 0;
				if (flag_fuzzy) {
					pat[pat_idx++] = 0x100;
					flag_fuzzy = false;
				}
				else if (flag_char) {
					if (val_idx != 2)
						return false;
					pat[pat_idx++] = sd_toval(val);
					flag_char = false;
				}

				val_idx = 0;

				flag_cvt = false;
			}
		}
		return pat_idx;
	}
	__forceinline int sd_praseskip(unsigned short *pat, int pat_len, sd_skip* skip) {
		int prev_v = 0;
		for (int i = 0; i < pat_len; i++) {
			if ((pat[i] == 0x100 && prev_v != 0x100)) {
				skip[0].offset = i;
				return 1;
			}
			else
				sd_setcmap(skip[0].cmap, pat[i]);
			prev_v = pat[i];
		}
		return 0;
	}
	__forceinline int sd_dosearch
	(
		const unsigned char *	buf, size_t	buf_len,
		const unsigned short *	pat, int		pat_len,
		sd_skip*				skip, int		skip_cnt
	)
	{
		size_t i = 0;
		size_t match_size = 0;

		int pat_8b_idx = 0;
		int pat_idx = 0;
		bool flag_notmatch = false;

		while (i < buf_len) {
			if (pat[pat_idx] == 0x100 || buf[i] == pat[pat_idx]) {
				match_size++;
				i++;
				pat_idx++;
			}
			else {
				flag_notmatch = true;
			}
			if (flag_notmatch) {
				int skip_v = 1;

				for (int j = 0; j < skip_cnt; j++) {
					size_t next_idx = i - match_size + skip[j].offset;
					unsigned char next_v = buf[next_idx];
					if (!sd_iscmap(skip[j].cmap, next_v))
						skip_v = skip[j].offset;
					else
						break;
				}
				i = i - match_size + skip_v;

				match_size = 0;
				pat_8b_idx = 0;
				pat_idx = 0;
				flag_notmatch = false;
			}
			if (match_size == pat_len)
				return i - match_size;
		}

		return -1;
	}
	__forceinline int sd_dosearch_noskip
	(
		const unsigned char *	buf, size_t		buf_len,
		const unsigned short *	pat, int		pat_len
	)
	{
		bool cmap[256];
		memset(cmap, 0, sizeof(cmap));
		for (int i = 0; i < pat_len; i++) {
			cmap[pat[i]] = 1;
		}
		int prev_sz = pat_len;

		size_t i = 0;
		size_t match_size = 0;

		int pat_8b_idx = 0;
		int pat_idx = 0;
		bool flag_notmatch = false;

		while (i < buf_len) {
			if (pat[pat_idx] == 0x100 || buf[i] == pat[pat_idx]) {
				match_size++;
				i++;
				pat_idx++;
			}
			else {
				flag_notmatch = true;
			}
			if (flag_notmatch) {
				int skip_v = 1;
				size_t next_idx = i - match_size + prev_sz;
				if (cmap[buf[next_idx]] == 0) {
					skip_v = prev_sz + 1;
				}
				i = i - match_size + skip_v;

				match_size = 0;
				pat_8b_idx = 0;
				pat_idx = 0;
				flag_notmatch = false;
			}
			if (match_size == pat_len)
				return i - match_size;
		}

		return -1;
	}
	__forceinline int sd_lstrip(unsigned short *pat, int pat_len) {
		int start = 0;
		for (int i = 0; i < pat_len; i++) {
			if (pat[i] == 0x100)
				start++;
			else
				break;
		}
		return start;
	}
	__forceinline int sd_rstrip(unsigned short *pat, int pat_len) {
		int off = 0;
		for (int i = pat_len - 1; i >= 0; i--) {
			if (pat[i] == 0x100)
				off++;
			else
				break;
		}
		return off;
	}
	__forceinline int sd_search(const unsigned char *buf, size_t buf_len, const char *pattern) {
		unsigned short cmp_pat[100];
		int cmp_pat_len = sd_convert(pattern, cmp_pat);

		int left = sd_lstrip(cmp_pat, cmp_pat_len);
		int right = sd_rstrip(cmp_pat, cmp_pat_len);

		sd_skip skip[1];
		memset(skip, 0, sizeof(skip));
		int skip_cnt = sd_praseskip(cmp_pat + left, cmp_pat_len - left - right, skip);

		int result = 0;
		if (skip_cnt == 0)
			result = sd_dosearch_noskip(buf, buf_len, cmp_pat + left, cmp_pat_len - left - right);
		else
			result = sd_dosearch(buf, buf_len, cmp_pat + left, cmp_pat_len - left - right, skip, skip_cnt);
		return result != -1 ? (result - left) : -1;
	}

	__forceinline int sdsafe_dosearch
	(
		const unsigned char *	buf, size_t	buf_len,
		const unsigned short *	pat, int		pat_len,
		sd_skip*				skip, int		skip_cnt
	)
	{
		size_t i = 0;
		size_t match_size = 0;

		int pat_8b_idx = 0;
		int pat_idx = 0;
		bool flag_notmatch = false;

		while (i < buf_len) {
			UCHAR bufv;
			if (!CachedReadByte((ULONG64)&buf[i], &bufv))
				return -1;
			if (pat[pat_idx] == 0x100 || bufv == pat[pat_idx]) {
				match_size++;
				i++;
				pat_idx++;
			}
			else {
				flag_notmatch = true;
			}
			if (flag_notmatch) {
				int skip_v = 1;

				for (int j = 0; j < skip_cnt; j++) {
					size_t next_idx = i - match_size + skip[j].offset;
					if (!CachedReadByte((ULONG64)&buf[next_idx], &bufv))
						return -1;
					unsigned char next_v = bufv;
					if (!sd_iscmap(skip[j].cmap, next_v))
						skip_v = skip[j].offset;
					else
						break;
				}
				i = i - match_size + skip_v;

				match_size = 0;
				pat_8b_idx = 0;
				pat_idx = 0;
				flag_notmatch = false;
			}
			if (match_size == pat_len)
				return i - match_size;
		}

		return -1;
	}
	__forceinline int sdsafe_dosearch_noskip
	(
		const unsigned char *	buf, size_t		buf_len,
		const unsigned short *	pat, int		pat_len
	)
	{
		bool cmap[256];
		memset(cmap, 0, sizeof(cmap));
		for (int i = 0; i < pat_len; i++) {
			cmap[pat[i]] = 1;
		}
		int prev_sz = pat_len;

		size_t i = 0;
		size_t match_size = 0;

		int pat_8b_idx = 0;
		int pat_idx = 0;
		bool flag_notmatch = false;

		while (i < buf_len) {
			UCHAR bufv = 0;
			if (!CachedReadByte((ULONG64)&buf[i], &bufv))
				return -1;
			if (pat[pat_idx] == 0x100 || bufv == pat[pat_idx]) {
				match_size++;
				i++;
				pat_idx++;
			}
			else {
				flag_notmatch = true;
			}
			if (flag_notmatch) {
				int skip_v = 1;
				size_t next_idx = i - match_size + prev_sz;
				if (!CachedReadByte((ULONG64)&buf[next_idx], &bufv))
					return -1;
				if (cmap[bufv] == 0) {
					skip_v = prev_sz + 1;
				}
				i = i - match_size + skip_v;

				match_size = 0;
				pat_8b_idx = 0;
				pat_idx = 0;
				flag_notmatch = false;
			}
			if (match_size == pat_len)
				return i - match_size;
		}

		return -1;
	}
	__forceinline int sdsafe_search(const unsigned char *buf, size_t buf_len, const char *pattern) {
		unsigned short cmp_pat[100];
		int cmp_pat_len = sd_convert(pattern, cmp_pat);

		int left = sd_lstrip(cmp_pat, cmp_pat_len);
		int right = sd_rstrip(cmp_pat, cmp_pat_len);

		sd_skip skip[1];
		memset(skip, 0, sizeof(skip));
		int skip_cnt = sd_praseskip(cmp_pat + left, cmp_pat_len - left - right, skip);
		int result = 0;
		if (skip_cnt == 0)
			result = sdsafe_dosearch_noskip(buf, buf_len, cmp_pat + left, cmp_pat_len - left - right);
		else
			result = sdsafe_dosearch(buf, buf_len, cmp_pat + left, cmp_pat_len - left - right, skip, skip_cnt);
		return result != -1 ? (result - left) : -1;
	}

}
INT64 FindSignatureCode(LPCVOID Memory, UINT64 MemoryLenth, LPCSTR SignatureCode, UINT64 Pos) {
	Memory = (LPCVOID)((PUCHAR)Memory + Pos);
	int result = sd::sdsafe_search((const unsigned char *)Memory, MemoryLenth, SignatureCode);


	return result;
}
INT64 FindSignatureCode_nocheck(LPCVOID Memory, UINT64 MemoryLenth, LPCSTR SignatureCode, UINT64 Pos) {
	Memory = (LPCVOID)((PUCHAR)Memory + Pos);
	int result = sd::sd_search((const unsigned char *)Memory, MemoryLenth, SignatureCode);


	return result;
}

BOOL CommonReadUserModeMemory(PVOID64 TargetAddress, PVOID64 Buffer, SIZE_T Size) {
	if (TargetAddress == 0 || Buffer == 0)
		return FALSE;
	if ((ULONG64)TargetAddress >= MmUserProbeAddress)
		return FALSE;
	return MmiReadVirtualAddressSafe((DWORD64)TargetAddress, Buffer, Size);
}

ULONG64 FindPattern_nocheck(LPCVOID hImage, LPCSTR Pattern) {
	const PUCHAR Image = (const PUCHAR)hImage;
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)(Image);
	if (idh->e_magic != 'ZM')return 0;
	IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(Image + idh->e_lfanew);
	if (inh->Signature != 'EP')return 0;
	IMAGE_SECTION_HEADER* ish = IMAGE_FIRST_SECTION(inh);
	//IMAGE_SCN_MEM_PURGEABLE
	for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
		if (ish[i].Characteristics & IMAGE_SCN_MEM_DISCARDABLE)continue;
		if (*(ULONG*)(ish[i].Name) == 'TINI')continue;
		PUCHAR start = Image + ish[i].VirtualAddress;
		INT64 result = FindSignatureCode_nocheck((LPCVOID)(start), ish[i].SizeOfRawData, Pattern, 0);
		if (result != -1) {
			return (ULONG64)(start + result);
		}
	}
	return NULL;

}

ULONG64 ScanSection(LPCSTR SectionName, LPCSTR Pattern) {
	PIMAGE_NT_HEADERS pHdr;
	PIMAGE_SECTION_HEADER pFirstSec;
	PIMAGE_SECTION_HEADER pSec;
	PUCHAR ntosBase;
	PKSERVICE_TABLE_DESCRIPTOR SSDT;

	ntosBase = (PUCHAR)KGetNtoskrnl();

	if (!ntosBase)
		return NULL;
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)ntosBase;
	pHdr = (IMAGE_NT_HEADERS*)(ntosBase + idh->e_lfanew);
	pFirstSec = IMAGE_FIRST_SECTION(pHdr);
	for (pSec = pFirstSec; pSec < pFirstSec + pHdr->FileHeader.NumberOfSections; pSec++)
	{
		// Non-paged, non-discardable, readable sections
		// Probably still not fool-proof enough...
		CHAR Name[9];
		RtlZeroMemory(&Name, 9);
		memcpy(Name, pSec->Name, 8);
		if (!strcmp(SectionName, Name))
		{
			PUCHAR pFound = NULL;
			//DbgPrint("%s\n", pSec->Name);
			INT64 pos = FindSignatureCode_nocheck(ntosBase + pSec->VirtualAddress, pSec->Misc.VirtualSize, Pattern, 0);
			if (pos != -1)
			{
				return (ULONG64)(pos + ntosBase + pSec->VirtualAddress);
			}

		}
	}
	return NULL;
}
ULONG64 ScanSection_Image(LPCVOID hImage, LPCSTR SectionName, LPCSTR Pattern) {
	PIMAGE_NT_HEADERS pHdr;
	PIMAGE_SECTION_HEADER pFirstSec;
	PIMAGE_SECTION_HEADER pSec;
	PUCHAR ntosBase;
	PKSERVICE_TABLE_DESCRIPTOR SSDT;

	ntosBase = (PUCHAR)hImage;

	if (!ntosBase)
		return NULL;
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)ntosBase;
	pHdr = (IMAGE_NT_HEADERS*)(ntosBase + idh->e_lfanew);
	pFirstSec = IMAGE_FIRST_SECTION(pHdr);
	for (pSec = pFirstSec; pSec < pFirstSec + pHdr->FileHeader.NumberOfSections; pSec++)
	{
		// Non-paged, non-discardable, readable sections
		// Probably still not fool-proof enough...
		CHAR Name[9];
		RtlZeroMemory(&Name, 9);
		memcpy(Name, pSec->Name, 8);
		if (!strcmp(SectionName, Name))
		{
			PUCHAR pFound = NULL;
			
			//DbgPrint("%s\n", pSec->Name);
			INT64 pos = FindSignatureCode_nocheck(ntosBase + pSec->VirtualAddress, pSec->Misc.VirtualSize, Pattern, 0);
			//if (!strcmp(Pattern, "8BD8FF05????????488D0D????????48FF15")) {
				//DbgPrint("[112233]pos !%p scanstart:%p size:%X\n", pos, ntosBase + pSec->VirtualAddress, pSec->Misc.VirtualSize);
			//}
			if (pos != -1)
			{
				return (ULONG64)(pos + ntosBase + pSec->VirtualAddress);
			}

		}
	}
	return NULL;
}
#include "smem.h"
#define MYIMAGE_FIRST_SECTION( ntheader ) ((PIMAGE_SECTION_HEADER)        \
    ((ULONG_PTR)(ntheader) +                                            \
     FIELD_OFFSET( IMAGE_NT_HEADERS, OptionalHeader ) +                 \
     mem::read<WORD>((ULONG64)&((ntheader))->FileHeader.SizeOfOptionalHeader)   \
    ))

ULONG64 ScanSection_Safe(ULONG64 ImageBase, LPCSTR SectionName, LPCSTR Pattern) {
	

	WORD mz = mem::read<WORD>(ImageBase);
	if (mz != 'ZM')
		return 0;
	auto idh = (IMAGE_DOS_HEADER*)ImageBase;
	auto inh = (IMAGE_NT_HEADERS*)(ImageBase + mem::read<WORD>((ULONG64)&idh->e_lfanew));
	DWORD pe = mem::read<DWORD>((ULONG64)&inh->Signature);
	if (pe != 'EP')
		return 0;
	auto ish = MYIMAGE_FIRST_SECTION(inh);
	int section_cnt = mem::read<WORD>((ULONG64)&inh->FileHeader.NumberOfSections);

	for (int i = 0; i < section_cnt; i++) {
		auto hdr = mem::read<IMAGE_SECTION_HEADER>((ULONG64)&ish[i]);
		if (!strncmp(SectionName, (const char*)hdr.Name, strlen(SectionName))) {
			ULONG64 start = hdr.VirtualAddress + ImageBase;
			ULONG64 pos = FindSignatureCode((LPCVOID)start, hdr.Misc.VirtualSize, Pattern, 0);
			if (pos != -1) {
				return pos + start;
			}
			else
				return 0;
		}
	}
	return 0;
}
ULONG64 ScanSection_Safe(LPCVOID ImageBase, LPCSTR SectionName, LPCSTR Pattern) {
	return ScanSection_Safe((ULONG64)ImageBase, SectionName, Pattern);
}
//#pragma optimize( "", on )



PKSERVICE_TABLE_DESCRIPTOR g_SSDT = NULL;
PKSERVICE_TABLE_DESCRIPTOR g_ShadowSSDT = NULL;
KBuffer g_NtdllBase = { 0,0 };

PLDR_DATA_TABLE_ENTRY KGetDriverLdr(LPCWSTR DriverName) {
	UNICODE_STRING mouname = RTL_CONSTANT_STRING(L"\\Driver\\mouclass");
	PDRIVER_OBJECT mouclass = 0;
	NTSTATUS stats = ObReferenceObjectByName(&mouname, OBJ_CASE_INSENSITIVE, NULL, 0, *IoDriverObjectType, KernelMode, 0, (PVOID *)&mouclass);
	if (!NT_SUCCESS(stats))return NULL;
	ObDereferenceObject(mouclass);

	PLIST_ENTRY first = (PLIST_ENTRY)mouclass->DriverSection;
	PLIST_ENTRY query = first->Flink;

	while (first != query) {
		PLDR_DATA_TABLE_ENTRY ldr = (PLDR_DATA_TABLE_ENTRY)query;
		if (!ldr)return NULL;

		if (ldr->BaseDllName.Length && ldr->BaseDllName.Buffer) {
			if (ldr->BaseDllName.Buffer) {
				if (!wcsicmp(ldr->BaseDllName.Buffer, DriverName)) {
					return ldr;
				}
			}
		}
		query = query->Flink;
	};
	return NULL;
}


ULONG64 KGetProcessCr3(PEPROCESS Process) {
	return *(PULONG64)(((PUCHAR)Process) + 0x28);
}
ULONG g_cachedBuildNumber = 0 ^ 0x98127;

PVOID g_NtoskrnlBase = E((PVOID)(0 ^ 0xbd0d1fab4afc56e3));
PVOID g_HaldllBase = E((PVOID)(0));

VOID InitNtoskrnl() {
	PVOID ret = KGetDriverImageBase3(xs("ntoskrnl.exe"));
	g_NtoskrnlBase = E((PVOID)((ULONG_PTR)ret ^ 0xbd0d1fab4afc56e3));
}

PVOID KGetHaldll() {

	/*UNICODE_STRING fun = RTL_CONSTANT_STRING(L"HalInitSystem");
	DWORD64 Addr = MmGetSystemRoutineAddress(&fun);
	if (Addr == NULL)return NULL;
	Addr &= ~0xFFF;
		while (1) {
			if (MmIsAddressValid(Addr) && MmIsAddressValid(Addr + 1)) {
				if ((*(PWORD)Addr) == 'ZM') {
					return (PVOID)Addr;
				}
			}

			Addr -= 0x1000;
		}

	return NULL;*/

	if (E(g_HaldllBase)) {
		return E(g_HaldllBase);
	}
	PVOID ret = KGetDriverImageBase2(xs("hal.dll"));
	g_HaldllBase = E(ret);
	return E(g_HaldllBase);

}
ULONG KGetImageSize(PVOID pModule) {
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)pModule;
	IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)((PUCHAR)pModule + idh->e_lfanew);
	return inh->OptionalHeader.SizeOfImage;
}
PVOID KGetNtosRoutine(LPCSTR ProcName) {
	PVOID Ntos = KGetNtoskrnl();
	if (Ntos) {
		return KGetProcAddress(Ntos, ProcName);
	}
	return NULL;
}

PKSERVICE_TABLE_DESCRIPTOR GetSSDTAddress_win7() {
	if (g_SSDT) {
		return g_SSDT;
	}
	PUCHAR pSyscall = (PUCHAR)AsmReadMsr(0xC0000082);
	ULONG offset;
	PUCHAR i = pSyscall;
	for (ULONG j = 0; j < 0x1000; i++, j++) {
		//if (MmIsAddressValid(i) && MmIsAddressValid(i + 6)) {
			if (i[0] == 0x4c && i[1] == 0x8d && i[2] == 0x15) {
				offset = *(PINT32)(i + 3);
				g_SSDT = (PKSERVICE_TABLE_DESCRIPTOR)(i + 7 + offset);
				return g_SSDT;
			}
		//}
	}
	return NULL;
}
PKSERVICE_TABLE_DESCRIPTOR GetShadowSSDTAddress_win7() {
	if (g_ShadowSSDT) {
		return g_ShadowSSDT;
	}
	PUCHAR pSyscall = (PUCHAR)AsmReadMsr(0xC0000082);
	ULONG offset;
	PUCHAR i = pSyscall;
	for (ULONG j = 0; j < 0x1000; i++, j++) {
		//if (MmIsAddressValid(i) && MmIsAddressValid(i + 6)) {
			if (i[0] == 0x4c && i[1] == 0x8d && i[2] == 0x1d) {
				offset = *(PINT32)(i + 3);
				g_ShadowSSDT = (PKSERVICE_TABLE_DESCRIPTOR)(i + 7 + offset);
				return g_ShadowSSDT;
			}
		//}

	}
	return NULL;
}
PKSERVICE_TABLE_DESCRIPTOR GetSSDTAddress_Win10()
{
	if (g_SSDT) {
		return g_SSDT;
	}
	PIMAGE_NT_HEADERS pHdr;
	PIMAGE_SECTION_HEADER pFirstSec;
	PIMAGE_SECTION_HEADER pSec;
	PUCHAR ntosBase;
	PKSERVICE_TABLE_DESCRIPTOR SSDT;

	ntosBase = (PUCHAR)KGetNtoskrnl();

	if (!ntosBase)
		return NULL;
	IMAGE_DOS_HEADER *idh = (IMAGE_DOS_HEADER *)ntosBase;
	pHdr = (IMAGE_NT_HEADERS *)(ntosBase + idh->e_lfanew);
	pFirstSec = IMAGE_FIRST_SECTION(pHdr);
	for (pSec = pFirstSec; pSec < pFirstSec + pHdr->FileHeader.NumberOfSections; pSec++)
	{
		// Non-paged, non-discardable, readable sections
		// Probably still not fool-proof enough...
		if (pSec->Characteristics & IMAGE_SCN_MEM_NOT_PAGED &&
			pSec->Characteristics & IMAGE_SCN_MEM_EXECUTE &&
			!(pSec->Characteristics & IMAGE_SCN_MEM_DISCARDABLE) &&
			(*(PULONG)pSec->Name != 'TINI') &&
			(*(PULONG)pSec->Name != 'EGAP'))
		{
			PUCHAR pFound = NULL;

			// KiSystemServiceRepeat pattern
			//4C 8D 15 ?? ?? ?? ?? 4C 8D 1D ?? ?? ?? ?? F7
			INT64 pos = FindSignatureCode_nocheck(ntosBase + pSec->VirtualAddress, pSec->Misc.VirtualSize, xs("4C 8D 15 ?? ?? ?? ?? 4C 8D 1D ?? ?? ?? ?? F7"), 0);
			if (pos != -1)
			{
				pFound = pos + ntosBase + pSec->VirtualAddress;
				SSDT = (PKSERVICE_TABLE_DESCRIPTOR)(pFound + *(PULONG)(pFound + 3) + 7);
				g_SSDT = SSDT;
				return SSDT;
			}
		}
	}
	return NULL;

}
PKSERVICE_TABLE_DESCRIPTOR GetShadowSSDTAddress_Win10()
{
	if (g_ShadowSSDT) {
		return g_ShadowSSDT;
	}
	PIMAGE_NT_HEADERS pHdr;
	PIMAGE_SECTION_HEADER pFirstSec;
	PIMAGE_SECTION_HEADER pSec;
	PUCHAR ntosBase;
	PKSERVICE_TABLE_DESCRIPTOR SSDT;

	ntosBase = (PUCHAR)KGetNtoskrnl();

	if (!ntosBase)
		return NULL;
	IMAGE_DOS_HEADER *idh = (IMAGE_DOS_HEADER *)ntosBase;
	pHdr = (IMAGE_NT_HEADERS *)(ntosBase + idh->e_lfanew);
	pFirstSec = IMAGE_FIRST_SECTION(pHdr);
	for (pSec = pFirstSec; pSec < pFirstSec + pHdr->FileHeader.NumberOfSections; pSec++)
	{
		// Non-paged, non-discardable, readable sections
		// Probably still not fool-proof enough...
		if (pSec->Characteristics & IMAGE_SCN_MEM_NOT_PAGED &&
			pSec->Characteristics & IMAGE_SCN_MEM_EXECUTE &&
			!(pSec->Characteristics & IMAGE_SCN_MEM_DISCARDABLE) &&
			(*(PULONG)pSec->Name != 'TINI') &&
			(*(PULONG)pSec->Name != 'EGAP'))
		{
			PUCHAR pFound = NULL;

			// KiSystemServiceRepeat pattern

			INT64 pos = FindSignatureCode_nocheck(ntosBase + pSec->VirtualAddress, pSec->Misc.VirtualSize, xs("4C 8D 15 ?? ?? ?? ?? 4C 8D 1D ?? ?? ?? ?? F7"), 0);
			if (pos != -1)
			{
				pFound = pos + ntosBase + pSec->VirtualAddress;
				SSDT = (PKSERVICE_TABLE_DESCRIPTOR)(pFound + *(PULONG)(pFound + 10) + 14);
				g_ShadowSSDT = SSDT;
				return SSDT;
			}
		}
	}
	return NULL;

}
PKSERVICE_TABLE_DESCRIPTOR KGetSSDTAddress() {
	if (g_SSDT) {
		return g_SSDT;
	}
	if (KGetBuildNumber() < 10240) {
		return GetSSDTAddress_win7();
	}
	return GetSSDTAddress_Win10();
}
PKSERVICE_TABLE_DESCRIPTOR KGetShadowSSDTAddress() {
	if (g_ShadowSSDT) {
		return g_ShadowSSDT;
	}
	if (KGetBuildNumber() < 10240) {
		return GetShadowSSDTAddress_win7();
	}
	return GetShadowSSDTAddress_Win10();
}

PVOID KGetSectionBase(PVOID pModule, LPCSTR SectionName) {
	PIMAGE_NT_HEADERS pHdr;
	PIMAGE_SECTION_HEADER pFirstSec;
	PIMAGE_SECTION_HEADER pSec;
	PUCHAR ntosBase;
	PKSERVICE_TABLE_DESCRIPTOR SSDT;

	ntosBase = (PUCHAR)pModule;

	if (!ntosBase)
		return NULL;
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)ntosBase;
	pHdr = (IMAGE_NT_HEADERS*)(ntosBase + idh->e_lfanew);
	pFirstSec = IMAGE_FIRST_SECTION(pHdr);
	for (pSec = pFirstSec; pSec < pFirstSec + pHdr->FileHeader.NumberOfSections; pSec++)
	{
		// Non-paged, non-discardable, readable sections
		// Probably still not fool-proof enough...
		CHAR Name[9];
		RtlZeroMemory(&Name, 9);
		memcpy(Name, pSec->Name, 8);
		if (!strcmp(SectionName, Name))
		{
			return (PVOID)(ntosBase + pSec->VirtualAddress);
		}
	}
	return NULL;
}
PVOID KGetProcAddress(PVOID ModuleHandle, LPCSTR ProcName) {
	IMAGE_DOS_HEADER *idh = (IMAGE_DOS_HEADER *)ModuleHandle;
	IMAGE_NT_HEADERS64 *inh = (IMAGE_NT_HEADERS64 *)(idh->e_lfanew + (PUCHAR)idh);
	IMAGE_EXPORT_DIRECTORY *ied = (IMAGE_EXPORT_DIRECTORY *)((PUCHAR)ModuleHandle + inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);

	for (int i = 0; i < ied->NumberOfNames; i++) {
		USHORT index = ((USHORT *)((PUCHAR)ModuleHandle + ied->AddressOfNameOrdinals))[i];
		ULONG NameRVA = ((ULONG *)((PUCHAR)ModuleHandle + ied->AddressOfNames))[i];
		PCSTR Name = (PCSTR)(((ULONG64)ModuleHandle) + NameRVA);

		if (!strcmp(Name, ProcName)) {
			ULONG FunRVA = ((ULONG *)((PUCHAR)ModuleHandle + ied->AddressOfFunctions))[index];
			PUCHAR FunAddress = ((PUCHAR)ModuleHandle + FunRVA);

			BOOLEAN IsBoundImport = FALSE;
			ULONG BoundImportNameLenth = 0;
			for (ULONG i = 0; i < 50; i++) {
				PUCHAR pAddr = FunAddress + i;
				//if (!CommonMmIsAddressValidEx(pAddr))break;
				UCHAR c = *pAddr;
				if (c == '.' && i > 0) {
					IsBoundImport = TRUE;
					BoundImportNameLenth = i;
					break;
				}
				else {
					if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9'))) {
						break;
					}
				}
			}
			if (IsBoundImport) {
				UCHAR BoundImportModuleName[40];
				RtlZeroMemory(BoundImportModuleName, sizeof(BoundImportModuleName));
				memcpy(BoundImportModuleName, FunAddress, BoundImportNameLenth);
				//*(ULONG *)(BoundImportModuleName + BoundImportNameLenth) = 'lld.';

				LPCSTR BoundImportFunctionName = (LPCSTR)(FunAddress + BoundImportNameLenth + 1);
				ULONG64 base = (ULONG64)KGetDriverImageBase2((PCHAR)BoundImportModuleName);
				if (base) {
					return KGetProcAddress((PVOID)base, BoundImportFunctionName);
				}


			}

			return FunAddress;
		}

	}

	return NULL;
}

KBuffer KLoadLibrary(LPCWSTR ModuleFileName) {

	NTSTATUS status;
	HANDLE hFile;
	OBJECT_ATTRIBUTES oa;
	IO_STATUS_BLOCK isb;
	UNICODE_STRING uFileName;
	RtlInitUnicodeString(&uFileName, ModuleFileName);
	InitializeObjectAttributes(&oa, &uFileName, OBJ_CASE_INSENSITIVE | OBJ_KERNEL_HANDLE, NULL, NULL);
	status = IoCreateFile(&hFile, FILE_READ_DATA, &oa, &isb, NULL, FILE_ATTRIBUTE_NORMAL, FILE_SHARE_READ, FILE_OPEN, FILE_NON_DIRECTORY_FILE | FILE_SYNCHRONOUS_IO_NONALERT, NULL, 0, CreateFileTypeNone, NULL, IO_NO_PARAMETER_CHECKING);
	//FILE_GENER
	if (!NT_SUCCESS(status))return { 0,0 };
	FILE_STANDARD_INFORMATION fileInfo;
	FILE_POSITION_INFORMATION posinfo;
	posinfo.CurrentByteOffset.QuadPart = 0;
	status = ZwSetInformationFile(hFile, &isb, &posinfo, sizeof(FILE_POSITION_INFORMATION), FilePositionInformation);
	if (!NT_SUCCESS(status)) {
		ZwClose(hFile);
		return { 0,0 };
	}
	status = ZwQueryInformationFile(hFile, &isb, &fileInfo, sizeof(FILE_STANDARD_INFORMATION), FileStandardInformation);
	if (!NT_SUCCESS(status)) {
		ZwClose(hFile);
		return { 0,0 };
	}
	LARGE_INTEGER FileSize = fileInfo.EndOfFile;

	//PUCHAR FileImage = (PUCHAR)ExAllocatePoolWithTag(NonPagedPoolNx, FileSize.QuadPart, POOL_TAG);
	ULONG FileImageSize = FileSize.QuadPart;
	PUCHAR FileImage = (PUCHAR)ExAllocatePool(NonPagedPoolNx, FileImageSize);
	status = ZwReadFile(hFile, NULL, NULL, NULL, &isb, FileImage, FileSize.QuadPart, NULL, NULL);
	if (!NT_SUCCESS(status)) {
		 ZwClose(hFile);
		//ExFreePoolWithTag(FileImage, POOL_TAG);
		ExFreePool(FileImage);
		return { 0,0 };
	}
	 ZwClose(hFile);

	IMAGE_DOS_HEADER *idh = (IMAGE_DOS_HEADER *)FileImage;
	IMAGE_NT_HEADERS64 *inh = (IMAGE_NT_HEADERS64 *)(FileImage + idh->e_lfanew);
	IMAGE_SECTION_HEADER *ish = IMAGE_FIRST_SECTION(inh);
	//PUCHAR ModuleHandle = (PUCHAR)ExAllocatePoolWithTag(NonPagedPoolNx, inh->OptionalHeader.SizeOfImage, POOL_TAG);
	ULONG ModSize = inh->OptionalHeader.SizeOfImage;
	PUCHAR ModuleHandle = (PUCHAR)ExAllocatePool(NonPagedPoolNx, ModSize);

	memcpy(ModuleHandle, FileImage, inh->OptionalHeader.SizeOfHeaders);
	for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
		memcpy(ModuleHandle + ish[i].VirtualAddress, FileImage + ish[i].PointerToRawData, ish[i].SizeOfRawData);
	}
	//ExFreePoolWithTag(FileImage, POOL_TAG);
	ExFreePool(FileImage);
	return { ModuleHandle,ModSize };
}
VOID KFreeLibrary(KBuffer ModuleHandle) {
	//ExFreePoolWithTag(ModuleHandle, POOL_TAG);
	ExFreePool(ModuleHandle.Address);
}
VOID KFreeLastLibrary() {
	if (g_NtdllBase.Address) {
		KFreeLibrary(g_NtdllBase);
		g_NtdllBase = { 0,0 };
	}

}
KBuffer g_mntoskrnl = { 0,0 };
PVOID KLoadNtoskrnl() {
	if (g_mntoskrnl.Address == 0)
		g_mntoskrnl = KLoadLibrary(L"\\SystemRoot\\System32\\ntoskrnl.exe");
	return g_mntoskrnl.Address;
}
VOID KFreeMalualNtos() {
	if (g_mntoskrnl.Address) {
		KFreeLibrary(g_mntoskrnl);
		g_mntoskrnl = { 0,0 };
	}
}
VOID KCleanUpAllManualMapImage() {
	
	KFreeMalualNtos();
	KFreeLastLibrary();
}
ULONG KGetNativeRoutineSSDTIndex(LPCSTR ProcName) {
	if (!g_NtdllBase.Address) {
		g_NtdllBase = KLoadLibrary(L"\\SystemRoot\\System32\\ntdll.dll");
		if (!g_NtdllBase.Address) {
			g_NtdllBase = KLoadLibrary(L"\\??\\C:\\Windows\\System32\\ntdll.dll");
			if (!g_NtdllBase.Address)return -1;;
		}
	}
	PUCHAR ProcAddress = (PUCHAR)KGetProcAddress(g_NtdllBase.Address, ProcName);
	if (!ProcAddress)return -1;

	for (int i = 0; i < 0x100; i++) {
		if (ProcAddress[i] == 0xB8) {
			return *(ULONG *)(&ProcAddress[i + 1]);
		}
	}
	return -1;
}
PVOID KGetSSDTRoutineAddress(LPCSTR RoutineName) {
	if (!g_SSDT) {
		KGetSSDTAddress();
		if (g_SSDT == 0)return NULL;
	}
	PKSERVICE_TABLE_DESCRIPTOR SSDT = g_SSDT;
	if (SSDT == 0) return NULL;
	ULONG index = KGetNativeRoutineSSDTIndex(RoutineName);
	if (index > SSDT->ntoskrnl.NumberOfService || index == -1) return NULL;
	if (index == -1)return NULL;
	ULONG offset = SSDT->ntoskrnl.ServiceTableBase[index];
	return (PVOID)((PUCHAR)SSDT->ntoskrnl.ServiceTableBase + (offset >> 4));

}
PVOID KGetSSDTRoutineAddress_Zw(LPCSTR RoutineName) {
	ULONG Index = KGetNativeRoutineSSDTIndex(RoutineName);
	if (Index == -1)return NULL;

	ULONG64 ntoskrnl = (ULONG64)KGetNtoskrnl();
	IMAGE_DOS_HEADER *idh = (IMAGE_DOS_HEADER *)ntoskrnl;
	IMAGE_NT_HEADERS *inh = (IMAGE_NT_HEADERS *)(ntoskrnl + idh->e_lfanew);
	IMAGE_SECTION_HEADER *ish = IMAGE_FIRST_SECTION(inh);
	ULONG size = inh->FileHeader.NumberOfSections;
	for (ULONG i = 0; i < size; i++) {
		if (ish[i].Characteristics & IMAGE_SCN_MEM_NOT_PAGED &&
			ish[i].Characteristics & IMAGE_SCN_MEM_EXECUTE &&
			!(ish[i].Characteristics & IMAGE_SCN_MEM_DISCARDABLE) &&
			(*(PULONG)ish[i].Name != 'TINI') &&
			(*(PULONG)ish[i].Name != 'EGAP')) {
			PUCHAR Current = (PUCHAR)(ntoskrnl + ish[i].VirtualAddress);
			ULONG SectionSize = ish[i].SizeOfRawData;
			if (SectionSize <= 26)continue;
			//48 8B C4 FA  48 83 EC 10  50 9C 6A 10  48 8D 05 ??  ?? ?? ?? 50  B8 ?? ?? ??  ?? E9
			for (ULONG i = 0; i < SectionSize - 26; i++) {
				if (MmIsAddressValid(Current) && MmIsAddressValid(Current + 26)) {
					ULONG Value1 = *(ULONG *)(Current);
					ULONG Value2 = *(ULONG *)(Current + 4);
					ULONG Value3 = *(ULONG *)(Current + 8);
					UCHAR Value4 = *(UCHAR *)(Current + 25);
					ULONG SsdtIndex = *(ULONG *)(Current + 21);
					if (Value1 == 0xFAC48B48 && Value2 == 0x10EC8348 && Value3 == 0x106A9C50 && Value4 == 0xE9 && SsdtIndex == Index) {
						return Current;
					}
				}
				Current++;
			}
		}
	}
	return NULL;

}

PVOID64 KGetMmPfnDataBase() {
	ULONG bn = KGetBuildNumber();
	if (bn < WIN10) {
		//win7
		return (PVOID64)0xFFFFFA8000000000;
	}
	else {
		//48 B8 ?? ?? ?? ?? ?? ?? ?? ?? 48
		ULONG64 fun = (ULONG64)KGetProcAddress(KGetNtoskrnl(), xs("MmGetVirtualForPhysical"));
		ULONG64 pos = FindSignatureCode_nocheck((LPCVOID)fun, 0x100, xs("48 B8 ?? ?? ?? ?? ?? ?? ?? ?? 48"), 0);
		if (pos != -1) {
			return (PVOID64)(*(ULONG64*)(pos + fun + 2) - 8);
		}
		return (PVOID64)0xFFFFFA8000000000;
	}
	return (PVOID64)0xFFFFFA8000000000;
}

BOOL KIsGuiThread() {
	ULONG64 Thread = (ULONG64)PsGetCurrentThread();
	ULONG BuildNumber = KGetBuildNumber();
	if (BuildNumber <= 7601) {
		ULONG Flags = *(ULONG *)(Thread + 0x100);

		return (Flags & 0x80) >> 7;
	}
	else if (BuildNumber >= 10240 && BuildNumber <= 15063) {
		//win10 1503-win10 1703
		ULONG Flags = *(ULONG *)(Thread + 0x78);

		return (Flags & 0x40) >> 6;
	}
	else if (BuildNumber >= 16299) {
		//win10 1709
		ULONG Flags = *(ULONG *)(Thread + 0x78);

		return (Flags & 0x80) >> 7;
	}
	return FALSE;
}

typedef PVOID(*fnMmAllocateIndependentPages)(IN ULONG64 NumberOfBytes, IN ULONG Node, ULONG64 zero1, ULONG64 zero2);
typedef NTKERNELAPI BOOLEAN(*fnMmSetPageProtection)(__in_bcount(NumberOfBytes) PVOID VirtualAddress, __in ULONG64 NumberOfBytes, __in ULONG NewProtect);
typedef VOID(*fnMmFreeIndependentPages)(IN PVOID VirtualAddress, IN ULONG64 NumberOfBytes);

fnMmAllocateIndependentPages g_pMmAllocateIndependentPages = 0;
fnMmSetPageProtection g_pMmSetPageProtection = 0;
fnMmFreeIndependentPages g_pMmFreeIndependentPages = 0;

BOOLEAN KInitMemoryRoutine() {
	if (g_pMmAllocateIndependentPages != 0 && g_pMmSetPageProtection != 0 && g_pMmFreeIndependentPages != 0)
		return TRUE;
	//DbgBreakPoint();
	ULONG bn = KGetBuildNumber();
	if (g_pMmAllocateIndependentPages == 0) {
		if (bn < WIN10) {
			//win7 48 C1 E1 03 E8 ?? ?? ?? ?? 48 ?? ?? 48 85 C0
			ULONG64 pos = ScanSection(xs("PAGE"), xs("48 C1 E1 03 E8 ?? ?? ?? ?? 48 ?? ?? 48 85 C0"));
			if (pos) {
				g_pMmAllocateIndependentPages = (fnMmAllocateIndependentPages)(*(LONG*)(pos + 5) + pos + 9);
			}
		}
		else {
			//win10 B9 00 70 00 00 E8 ?? ?? ?? ?? 48
			ULONG64 pos = ScanSection(xs("PAGE"), xs("B9 00 70 00 00 E8 ?? ?? ?? ?? 48"));
			if (pos) {
				g_pMmAllocateIndependentPages = (fnMmAllocateIndependentPages)(*(LONG*)(pos + 6) + pos + 10);
			}
			else {
				//45 33 C9 45 33 C0 ?? ?? E8 ?? ?? ?? ?? 48 8B D8 48 85 C0
				pos = ScanSection(xs("PAGE"), xs("45 33 C9 45 33 C0 ?? ?? E8 ?? ?? ?? ?? 48 8B D8 48 85 C0"));
				if (pos) {
					g_pMmAllocateIndependentPages = (fnMmAllocateIndependentPages)(*(LONG*)(pos + 9) + pos + 13);
				}

			}
		}
	}
	if (g_pMmFreeIndependentPages == 0) {
		if (bn < WIN10) {
			//win7 BA 00 50 00 00 E8 ?? ?? ?? ??
			ULONG64 pos = ScanSection(xs(".text"), xs("BA 00 50 00 00 E8"));
			if (pos) {
				g_pMmFreeIndependentPages = (fnMmFreeIndependentPages)(*(LONG*)(pos + 6) + pos + 10);
			}
		}
		else {
			//win10 BA 00 60 00 00 48 8B CB E8 ?? ?? ?? ?? 48
			ULONG64 pos = ScanSection(xs("PAGE"), xs("BA 00 60 00 00 48 8B CB E8 ?? ?? ?? ?? 48"));
			if (pos) {
				g_pMmFreeIndependentPages = (fnMmFreeIndependentPages)(*(LONG*)(pos + 9) + pos + 13);
			}
			else {
				//8B 15 ?? ?? ?? ?? ?? 8B ?? E8 ?? ?? ?? ?? 48 ?? ?? 00 F0 FF FF
				pos = ScanSection(xs("PAGE"), xs("8B 15 ?? ?? ?? ?? ?? 8B ?? E8 ?? ?? ?? ?? 48 ?? ?? 00 F0 FF FF"));
				if (pos) {
					g_pMmFreeIndependentPages = (fnMmFreeIndependentPages)(*(LONG*)(pos + 10) + pos + 14);
				}
			}
		}
	}
	if (g_pMmSetPageProtection == 0) {
		if (bn < WIN10) {
			//win7 40 00 00 00 48 ?? ?? 48 ?? ?? E8 ?? ?? ?? ?? 84 C0
			ULONG64 pos = ScanSection(xs(".text"), xs("40 00 00 00 48 ?? ?? 48 ?? ?? E8 ?? ?? ?? ?? 84 C0"));
			if (pos) {
				g_pMmSetPageProtection = (fnMmSetPageProtection)(*(LONG*)(pos + 11) + pos + 15);
			}
		}
		else {
			//win10 BA 00 60 00 00 41 B8 04 00 00 00 48 2B DA 48 8B CB E8 ?? ?? ?? ?? 84 C0
			ULONG64 pos = ScanSection(xs("PAGE"), xs("BA 00 60 00 00 41 B8 04 00 00 00 48 2B DA 48 8B CB E8 ?? ?? ?? ?? 84 C0"));
			if (pos) {
				g_pMmSetPageProtection = (fnMmSetPageProtection)(*(LONG*)(pos + 18) + pos + 22);
			}
			else {
				//41 B8 04 00 00 00 E8 ?? ?? ?? ?? 84 C0 
				pos = ScanSection(xs("PAGE"), xs("41 B8 04 00 00 00 E8 ?? ?? ?? ?? 84 C0"));
				if (pos) {
					g_pMmSetPageProtection = (fnMmSetPageProtection)(*(LONG*)(pos + 7) + pos + 11);
				}
				else {
					//41 B8 04 00 00 00 ?? 8B ?? ?? 8B ?? E8 ?? ?? ?? ?? 84 C0
					pos = ScanSection(xs("PAGE"), xs("41 B8 04 00 00 00 ?? 8B ?? ?? 8B ?? E8 ?? ?? ?? ?? 84 C0"));
					if (pos) {
						g_pMmSetPageProtection = (fnMmSetPageProtection)(*(LONG*)(pos + 13) + pos + 17);
					}
				}
			}
		}
	}
	//DbgPrint("[112233] MmAllocateIndependentPages:%p MmFreeIndependentPages:%p MmSetPageProtection:%p\n", g_pMmAllocateIndependentPages, g_pMmFreeIndependentPages, g_pMmSetPageProtection);
	if (g_pMmAllocateIndependentPages != 0 && g_pMmSetPageProtection != 0 && g_pMmFreeIndependentPages != 0)
		return TRUE;
	else {
		KeBugCheck(0x88172);
		return FALSE;
	}


	return FALSE;
}


ULONG64 InternalAlian4K(ULONG64 Size) {
	ULONG64 erse = Size % 0x1000;
	if (erse) {
		return Size + 0x1000 - erse;
	}
	return Size;
}
PVOID KAllocateHeap(SIZE_T Size) {
	if (KInitMemoryRoutine()) {
		ULONG64 rSize = InternalAlian4K(Size);
		PVOID result = 0;
		while (1) {
			result = g_pMmAllocateIndependentPages(rSize, -1, 0, 0);
			if (result != 0)
				break;
			Sleep(500);
		}
		RtlZeroMemory(result, Size);
		return result;
	}
	return NULL;
}
BOOLEAN InternalSetPageProtection(PVOID VirtualAddress, ULONG64 NumberOfBytes, ULONG NewProtect) {
	ULONG64 rSize = InternalAlian4K(NumberOfBytes);
	ULONG64 cnt = rSize / 0x1000;
	ULONG64 Address = (ULONG64)VirtualAddress;
	for (ULONG64 i = 0; i < cnt; i++) {
		if (!g_pMmSetPageProtection((PVOID)(Address + i * 0x1000), 0x1000, NewProtect))
			return FALSE;
	}
	return TRUE;
}
PVOID KAllocatePool(SIZE_T Size) {
	if (KInitMemoryRoutine()) {
		ULONG64 rSize = InternalAlian4K(Size);
		PVOID result = 0;
		while (1) {
			result = g_pMmAllocateIndependentPages(rSize, -1, 0, 0);
			if (result != 0)
				break;
			Sleep(500);
		}
		InternalSetPageProtection(result, rSize, PAGE_EXECUTE_READWRITE);
		if (!MmiIsExecutableAddress(result)) {
			ULONG64 rSize = InternalAlian4K(Size);
			for (int i = 0; i < rSize / 0x1000; i++) {
				PVOID addr = (PVOID)((ULONG64)result + i * 0x1000);
				HardwarePteX64 *pte = (HardwarePteX64 *)MmiGetPteAddress(addr);
				if (pte) {
					pte->no_execute = 0;
					MmiFlushTLB(addr);
				}
			}
		}
		RtlZeroMemory(result, Size);
		return result;
	}
	return NULL;
}
VOID KFreePool(PVOID Address, SIZE_T Size) {
	if (KInitMemoryRoutine()) {
		ULONG64 rSize = InternalAlian4K(Size);
		g_pMmFreeIndependentPages(Address, rSize);
	}
	return;
}

ULONG off_PreviousMode = 0;
VOID KSetPreviousMode(UCHAR Mode) {
	if (off_PreviousMode == 0) {
		ULONG64 Proc = (ULONG64)KGetProcAddress(KGetNtoskrnl(), xs("ExGetPreviousMode"));
		if (Proc) {
			off_PreviousMode = *(ULONG*)(Proc + 11);
		}
		if (off_PreviousMode == 0)
			return;
	}
	ULONG64 Thread = (ULONG64)PsGetCurrentThread();
	*(UCHAR*)(Thread + off_PreviousMode) = Mode;

}
PIDT_ENTRY64 KGetIdtBase() {
	return (PIDT_ENTRY64)AsmGetIdtBase();
}
ULONG64 KGetIdtProcAddress(ULONG Index) {
	PIDT_ENTRY64 idt = KGetIdtBase();
	return (ULONG64)((ULONG64)idt[Index].AddrHigh32 << 32 | (ULONG64)idt[Index].AddrMid16 << 16 | idt[Index].AddrLow16);
}


BOOL KIsAddressValid(PVOID Address) {
	return  MmiGetPhysicalAddress(Address) != 0;
}
BOOL KIsProcessExit(PEPROCESS Process) {
	if (!MmiGetPhysicalAddress(Process))
		return TRUE;
	PDymOffsets dym = KGetDymOffsets();
	if (dym->ep_ProcessExitTime) {
		ULONG64 exittime = *(ULONG64*)((ULONG64)Process + dym->ep_ProcessExitTime);
		LARGE_INTEGER exitt;
		exitt.QuadPart = exittime;
		if (exitt.LowPart != 0) {
			return TRUE;
		}
	}
	return FALSE;
}


VOID KRaiseIrqlToDpcOrHigh(PIRQL_STATE state) {
	state->old_irql = AsmReadCr8();
	if (state->old_irql < DISPATCH_LEVEL) {
		AsmWriteCr8(DISPATCH_LEVEL);
	}
}
VOID KLowerIrqlToState(PIRQL_STATE state) {
	if (state->old_irql < DISPATCH_LEVEL) {
		AsmWriteCr8(state->old_irql);
	}
}

ULONG64 KGetRspBase() {
	return __readgsqword(0x1A8);
}
ULONG KGetSyscallNumber() {
	ULONG bn = KGetBuildNumber();
	if (bn < WIN10) {
		return *(ULONG*)((PUCHAR)PsGetCurrentThread() + 0x1F8);
	}
	else {
		return *(ULONG*)((PUCHAR)PsGetCurrentThread() + 0x80);
	}
	return 0;
}
UCHAR KIsThreadRunning(PETHREAD Thread) {
	ULONG bn = KGetBuildNumber();
	if (bn < WIN10) {
		return *(UCHAR*)((PUCHAR)Thread + 0x49);
	}
	else {
		return *(UCHAR*)((PUCHAR)Thread + 0x71);
	}
	return 0;
}

typedef struct _POOL_TRACKER_BIG_PAGES
{
	volatile ULONGLONG Va;                                                  //0x0
	ULONG Key;                                                              //0x8
	ULONG Pattern : 8;                                                        //0xc
	ULONG PoolType : 12;                                                      //0xc
	ULONG SlushSize : 12;                                                     //0xc
	ULONGLONG NumberOfBytes;                                                //0x10
}POOL_TRACKER_BIG_PAGES, * PPOOL_TRACKER_BIG_PAGES;

ULONG64 g_pPoolBigPageTable = 0;
ULONG64 g_pPoolBigPageTableSize = 0;

BOOLEAN FindPoolTable2() {
	//ExProtectPoolEx
	//E8 ?? ?? ?? ?? 83 67 0C 00
	//E8 ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? 
	ULONG64 pos = ScanSection(xs(".text"), xs("E8 ?? ?? ?? ?? 83 67 0C 00"));
	if (pos) {
		ULONG64 pExProtectPoolEx = *(LONG*)(pos + 1) + pos + 5;
		pos = FindSignatureCode_nocheck((LPCVOID)pExProtectPoolEx, 0x1000, xs("E8 ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ??"), 0);
		if (pos != -1) {
			g_pPoolBigPageTableSize = *(LONG*)(pos + pExProtectPoolEx + 8) + pos + pExProtectPoolEx + 12;
			g_pPoolBigPageTable = *(LONG*)(pos + pExProtectPoolEx + 18) + pos + pExProtectPoolEx + 22;
			return TRUE;
		}
		else {
			//E8 ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? 
			pos = FindSignatureCode_nocheck((LPCVOID)pExProtectPoolEx, 0x1000, xs("E8 ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ??"), 0);
			if (pos != -1) {
				g_pPoolBigPageTableSize = *(LONG*)(pos + pExProtectPoolEx + 8) + pos + pExProtectPoolEx + 12;
				g_pPoolBigPageTable = *(LONG*)(pos + pExProtectPoolEx + 15) + pos + pExProtectPoolEx + 19;
				return TRUE;
			}

		}
	}
	return FALSE;
}
BOOLEAN FindPoolTable3() {
	//ExGetBigPoolInfo
	//04 00 00 C0 ?? ?? ?? ?? ?? 45 33 C0 E8 ?? ?? ?? ?? 85 C0
	//04 00 00 C0 ?? ?? ?? ?? 45 33 C0 E8 ?? ?? ?? ?? 85 C0
	ULONG64 pExGetBigPoolInfo = 0;
	ULONG64 pos = ScanSection(xs("PAGE"), xs("04 00 00 C0 ?? ?? ?? ?? ?? 45 33 C0 E8 ?? ?? ?? ?? 85 C0"));
	if (pos) {
		pExGetBigPoolInfo = *(LONG*)(pos + 13) + pos + 17;
	}
	else {
		pos = ScanSection(xs("PAGE"), xs("04 00 00 C0 ?? ?? ?? ?? 45 33 C0 E8 ?? ?? ?? ?? 85 C0"));
		if (pos) {
			pExGetBigPoolInfo = *(LONG*)(pos + 12) + pos + 16;
		}
	}
	if (pExGetBigPoolInfo == 0)
		return FALSE;
	//48 8B 15 ?? ?? ?? ?? 48 8B ?? ?? ?? ?? ?? 
	pos = FindSignatureCode_nocheck((LPCVOID)pExGetBigPoolInfo, 0x500, xs("48 8B 15 ?? ?? ?? ?? 48 8B ?? ?? ?? ?? ??"), 0);
	if (pos != -1) {
		g_pPoolBigPageTable = *(LONG*)(pExGetBigPoolInfo + pos + 3) + pExGetBigPoolInfo + pos + 7;
		g_pPoolBigPageTableSize = *(LONG*)(pExGetBigPoolInfo + pos + 10) + pExGetBigPoolInfo + pos + 14;
		return TRUE;
	}
	return FALSE;

}
BOOLEAN FindPoolTable4() {

	//48 8B 15 ?? ?? ?? ?? ?? 8D ?? ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? 41 8D 40 FF
	ULONG64 pos = ScanSection(xs(".text"), xs("48 8B 15 ?? ?? ?? ?? ?? 8D ?? ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? 41 8D 40 FF"));
	if (pos) {
		g_pPoolBigPageTable = *(LONG*)(pos + 3) + pos + 7;
		g_pPoolBigPageTableSize = *(LONG*)(pos + 17) + pos + 21;
		return TRUE;
	}
	else {
		//?? 8B ?? ?? ?? ?? ?? ?? 8D ?? ?? ?? ?? ?? ?? 8B ?? ?? ?? ?? ?? 41 8D 40 FF
		pos = ScanSection(xs(".text"), xs("?? 8B ?? ?? ?? ?? ?? ?? 8D ?? ?? ?? ?? ?? ?? 8B ?? ?? ?? ?? ?? 41 8D 40 FF"));
		if (pos) {
			g_pPoolBigPageTable = *(LONG*)(pos + 3) + pos + 7;
			g_pPoolBigPageTableSize = *(LONG*)(pos + 17) + pos + 21;
			return TRUE;
		}
		else {
			//48 8B 1D ?? ?? ?? ?? 48 8B FA 4C 8B 0D ?? ?? ?? ?? ?? 8B ??
			pos = ScanSection(xs(".text"), xs("48 8B 1D ?? ?? ?? ?? 48 8B FA 4C 8B 0D ?? ?? ?? ?? ?? 8B ??"));
			if (pos) {
				g_pPoolBigPageTable = *(LONG*)(pos + 3) + pos + 7;
				g_pPoolBigPageTableSize = *(LONG*)(pos + 13) + pos + 17;
				return TRUE;
			}
		}
	}
	return FALSE;
}
BOOLEAN FindPoolTable()
{
	if (g_pPoolBigPageTable != 0 && g_pPoolBigPageTableSize != 0)
		return TRUE;
	ULONG bn = KGetBuildNumber();
	if (bn < WIN10) {
		//win7
		//ExProtectPool
		//BA 00 10 00 00 41 B8 04 00 00 00 E8 ?? ?? ?? ?? 85 C0

		ULONG64 pExProtectPool = 0;
		ULONG64 pos = ScanSection(xs("PAGE"), xs("BA 00 10 00 00 41 B8 04 00 00 00 E8 ?? ?? ?? ?? 85 C0"));
		if (pos) {
			//4C 8B 05 ?? ?? ?? ?? 4D 85 C0
			//4C 8B 0D ?? ?? ?? ?? 4E
			pExProtectPool = *(LONG*)(pos + 12) + pos + 16;
			pos = FindSignatureCode_nocheck((LPCVOID)pExProtectPool, 0x500, xs("4C 8B 05 ?? ?? ?? ?? 4D 85 C0"), 0);
			ULONG64 pos2 = FindSignatureCode_nocheck((LPCVOID)pExProtectPool, 0x500, xs("4C 8B 0D ?? ?? ?? ?? 4E"), 0);
			if (pos != -1 && pos2 != -1) {
				g_pPoolBigPageTable = *(LONG*)(pos + pExProtectPool + 3) + pos + pExProtectPool + 7;
				g_pPoolBigPageTableSize = *(LONG*)(pos2 + pExProtectPool + 3) + pos2 + pExProtectPool + 7;
				return TRUE;
			}
		}
	}
	else {
		//win10
		//5F 9E 00 00 E8 ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ??
		ULONG64 pos = ScanSection(xs(".text"), xs("5F 9E 00 00 E8 ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ?? ?? ?? ?? 4C 8B ?? ?? ?? ?? ??"));
		if (pos) {
			g_pPoolBigPageTableSize = *(LONG*)(pos + 12) + pos + 16;
			g_pPoolBigPageTable = *(LONG*)(pos + 22) + pos + 26;
			return TRUE;
		}
		else {
			if (FindPoolTable2())
				return TRUE;
			else if (FindPoolTable3())
				return TRUE;
			else if (FindPoolTable4())
				return TRUE;
		}
	}

	return FALSE;

}

bool RemoveFromBigPool(ULONG64 Address)
{
	return true;
	if (FindPoolTable())
	{
		//DbgPrint("[112233] g_pPoolBigPageTable:%p\n", g_pPoolBigPageTable);
		//DbgPrint("[112233] g_pPoolBigPageTableSize:%p\n", g_pPoolBigPageTableSize);
		ULONG64 pPoolBigPageTable = g_pPoolBigPageTable;
		ULONG64 pPoolBigPageTableSize = g_pPoolBigPageTableSize;

		PPOOL_TRACKER_BIG_PAGES PoolBigPageTable = 0;
		RtlCopyMemory(&PoolBigPageTable, (PVOID)pPoolBigPageTable, 8);
		SIZE_T PoolBigPageTableSize = 0;
		RtlCopyMemory(&PoolBigPageTableSize, (PVOID)pPoolBigPageTableSize, 8);

		for (int i = 0; i < PoolBigPageTableSize; i++)
		{
			if (PoolBigPageTable[i].Va == Address || PoolBigPageTable[i].Va == (Address + 0x1))
			{
				PoolBigPageTable[i].Va = 0x1;
				PoolBigPageTable[i].NumberOfBytes = 0x0;
				//DbgPrint("[112233] pool_success!\n");
				return true;
			}
		}

		return false;
	}
	else {
		KeBugCheck(0x5678);
	}

	return false;
}

#include "ImportEncrypt.h"

ULONG KGetBuildNumber() {
	if (g_cachedBuildNumber ^ 0x98127)
		return g_cachedBuildNumber ^ 0x98127;
	PULONG pNtBuildNumber = (PULONG)KGetProcAddress(ntos(), xs("NtBuildNumber"));
	if (!pNtBuildNumber)
		return false;
	ULONG bn = *pNtBuildNumber;
	bn &= 0xFFFF;
	g_cachedBuildNumber = bn ^ 0x98127;
	return g_cachedBuildNumber ^ 0x98127;
}

ULONG64 SwitchToProcessCr3(PEPROCESS proc) {
	ULONG64 newcr3 = KGetProcessCr3(proc);
	ULONG64 oldcr3 = AsmReadCr3();

	ULONG64 tail = oldcr3 & 0xFFF;
	newcr3 = (newcr3 & 0xFFFFFFFFFFFFF000) | tail;

	AsmWriteCr3(newcr3);
	return oldcr3;
}

