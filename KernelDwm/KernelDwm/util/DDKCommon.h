#pragma once
#ifndef __DDKCOMMON_INCLUDED_
#define __DDKCOMMON_INCLUDED_

#pragma comment(linker,"/INCREMENTAL:NO")

#include "ntifs.h"
#include "ntimage.h"
#include "MyPEB.h"
#include "NtFunctionDefine.h"
#include "MyMemoryIo64.h"
#include "DDKCommonInline.h"

//#define print DbgPrint
#define print



#define WIN10		(10240)
#define WIN10_1507	(10240)
#define WIN10_1511	(10586)
#define WIN10_1607	(14393)
#define WIN10_1703	(15063)
#define WIN10_1709	(16299)
#define WIN10_1803	(17134)
#define WIN10_1809	(17763)
#define WIN10_1903	(18362)
#define WIN10_1909	(18363)
#define WIN10_2004	(19041)
#define WIN10_20H2	(19042)
#define WIN10_21H1	(19043)
#define WIN10_21H2	(19044)
#define WIN10_22H2	(19045)
#define WIN11		(22000)
#define WIN11_21H2	(22000)
#define WIN11_22H2	(22621)

#define POOL_TAG 'enoN'

typedef struct _IDT_ENTRY64 {
	UINT16 AddrLow16;
	UINT16 Selector;
	union {
		UCHAR ist;
		struct {
			UCHAR zero1 : 5;
			UCHAR ist_offset : 3;
		};
	};
	union {
		UCHAR type_attr;
		struct {
			UCHAR Type : 4;	//GateType
			UCHAR Z : 1;	//Zero
			UCHAR DPL : 2;	//Descriptor Privilege Level 0 or 3
			UCHAR P : 1;	//Present
		};
	};

	UINT16 AddrMid16;
	ULONG AddrHigh32;
	UCHAR Zero2[4];
}IDT_ENTRY64, * PIDT_ENTRY64;

typedef struct _XINPUT_GAMEPAD
{
	WORD                                wButtons;
	BYTE                                bLeftTrigger;
	BYTE                                bRightTrigger;
	SHORT                               sThumbLX;
	SHORT                               sThumbLY;
	SHORT                               sThumbRX;
	SHORT                               sThumbRY;
} XINPUT_GAMEPAD, * PXINPUT_GAMEPAD;

typedef struct _XINPUT_STATE
{
	DWORD                               dwPacketNumber;
	XINPUT_GAMEPAD                      Gamepad;
} XINPUT_STATE, * PXINPUT_STATE;

typedef struct _KSYSTEM_SERVICE_TABLE
{
	PULONG  ServiceTableBase;          // SSDT (System Service Descriptor Table)的基地址
	PULONG  ServiceCounterTableBase;   // 用于 checked builds, 包含 SSDT 中每个服务被调用的次数
	ULONG64   NumberOfService;           // 服务函数的个数
	PULONG   ParamTableBase;            // SSPT(System Service Parameter Table)的基地址
} KSYSTEM_SERVICE_TABLE, *PKSYSTEM_SERVICE_TABLE;
typedef struct _KSERVICE_TABLE_DESCRIPTOR
{
	KSYSTEM_SERVICE_TABLE   ntoskrnl;                       // ntoskrnl.exe 的服务函数
	KSYSTEM_SERVICE_TABLE   win32k;                         // win32k.sys 的服务函数(GDI32.dll/User32.dll 的内核支持)
	KSYSTEM_SERVICE_TABLE   notUsed1;
	KSYSTEM_SERVICE_TABLE   notUsed2;
}KSERVICE_TABLE_DESCRIPTOR, *PKSERVICE_TABLE_DESCRIPTOR;
typedef struct _DymOffsets {
	DWORD ep_ProcessExitTime;
	PEPROCESS SystemProcess;
	ULONG BuildNumber;
}DymOffsets, *PDymOffsets;

typedef struct _KBuffer {
	PVOID Address;
	ULONG Size;
}KBuffer, * PKBuffer;

#ifdef __cplusplus
extern "C"{
#endif

LPWSTR WINAPI StrStrIW(LPCWSTR lpszStr, LPCWSTR lpszSearch);
LPSTR WINAPI StrStrIA(LPCSTR lpszStr, LPCSTR lpszSearch);

PDymOffsets KGetDymOffsets();
VOID Sleep(LONG Millsecond);
VOID ForceSleep(LONG Millsecond);
ULONG64 GetRealTime();
ULONG64 GetRealMicroTime();
LPSTR WINAPI StrStrIA(LPCSTR lpszStr, LPCSTR lpszSearch);
LPWSTR WINAPI StrStrIW(LPCWSTR lpszStr, LPCWSTR lpszSearch);
LPWSTR WINAPI StrStrNIW(LPCWSTR lpszStr, LPCWSTR lpszSearch, SIZE_T max_chars);
LPSTR WINAPI StrStrNIA(LPCSTR lpszStr, LPCSTR lpszSearch, SIZE_T max_chars);
VOID RtlInitUnicodeString32(OUT PMYUNICODE_STRING32 DestinationString, IN PCWSTR SourceString OPTIONAL);
void AnsiToUnicode(LPCSTR AnsiStr, LPWSTR UnicodeStrBuffer, ULONG MaxLenth);
void UnicodeToAnsi(LPCWSTR UnicodeStr, LPSTR AnsiStrBuffer, ULONG MaxLenth);
LPWSTR FullPathToFileNameW(LPCWSTR FullPath);
BOOL CommonMmIsAddressValidEx(PVOID addr);
BOOL IsPidActive(ULONG Pid);
ULONG GetPidByProcessNameW(LPCWSTR name);
ULONG GetPidByProcessNameA(LPCSTR name);
PLDR_DATA_TABLE_ENTRY GetUserModeModuleLdrX64(ULONG64 ModuleBase);
PLDR_DATA_TABLE_ENTRY32 GetUserModeModuleLdrX32(ULONG ModuleBase);
PVOID64 GetUserModeModuleBaseX64W(LPCWSTR ModuleName);
PVOID64 GetUserModeModuleBaseX64WByPeb(PVOID _peb, LPCWSTR ModuleName);
PVOID64 GetUserModeModuleBaseX32W(LPCWSTR ModuleName);
PVOID64 GetUserModeModuleBaseX32WByPeb(PVOID _peb, LPCWSTR ModuleName);
PVOID64 GetUserModeModuleBaseX32AByPeb(PVOID _peb, LPCSTR ModuleName);
PVOID64 GetUserModeModuleBaseX64A(LPCSTR ModuleName);
//PVOID64 GetUserModeModuleBaseX64ByProcessA(PEPROCESS Process, LPCSTR ModuleName);
PVOID64 GetUserModeModuleBaseX32A(LPCSTR ModuleName);
BOOLEAN GetUserModeModuleFullNameX64W(LPCWSTR ModuleName, LPWSTR FullName, SIZE_T max_char_cnt);

PVOID64 GetProcAddressX64(PVOID ModuleHandle, LPCSTR ProcName);
PULONG64 GetImportFunctionPtrX64(PVOID64 ModuleBase, LPCSTR ImportModule, LPCSTR ImportFunction);
BOOLEAN ForceWrite(PVOID64 TargetAddress, PVOID64 Buffer, ULONG Size);
BOOLEAN ForceRead(PVOID64 TargetAddress, PVOID64 Buffer, ULONG Size);
INT64 FindSignatureCode(LPCVOID Memory, UINT64 MemoryLenth, LPCSTR SignatureCode, UINT64 Pos);
INT64 FindSignatureCode_nocheck(LPCVOID Memory, UINT64 MemoryLenth, LPCSTR SignatureCode, UINT64 Pos);
ULONG64 FindPattern_nocheck(LPCVOID hImage, LPCSTR Pattern);

ULONG64 ScanSection(LPCSTR SectionName, LPCSTR Pattern);
ULONG64 ScanSection_Image(LPCVOID hImage, LPCSTR SectionName, LPCSTR Pattern);
ULONG64 ScanSection_Safe(LPCVOID hImage, LPCSTR SectionName, LPCSTR Pattern);
ULONG64 KGetProcessCr3(PEPROCESS Process);
KBuffer KLoadLibrary(LPCWSTR ModuleFileName);
VOID KFreeLibrary(KBuffer ModuleHandle);

PLDR_DATA_TABLE_ENTRY KGetDriverLdr(LPCWSTR DriverName);
PVOID KGetDriverImageBase(LPCWSTR DriverName);
PVOID KGetDriverImageBase2(PCHAR name);
ULONG KGetDriverImageSize(LPCWSTR DriverName);
ULONG KGetDriverImageSize2(PCHAR name);

PVOID KGetProcAddress(PVOID ModuleHandle, LPCSTR ProcName);
VOID InitNtoskrnl();

PVOID KGetSectionBase(PVOID pModule, LPCSTR SectionName);
ULONG KGetImageSize(PVOID pModule);
ULONG KGetBuildNumber();
#include "XorCrypt.h"
extern PVOID g_NtoskrnlBase;
__forceinline PVOID KGetNtoskrnl() {
	return E((PVOID)((ULONG_PTR)g_NtoskrnlBase ^ 0xbd0d1fab4afc56e3));
}

#define ntos KGetNtoskrnl
PVOID KGetHaldll();
PVOID KGetNtosRoutine(LPCSTR ProcName);

PKSERVICE_TABLE_DESCRIPTOR KGetSSDTAddress();
PKSERVICE_TABLE_DESCRIPTOR KGetShadowSSDTAddress();
VOID KFreeLastLibrary();
PVOID KLoadNtoskrnl();
VOID KCleanUpAllManualMapImage();
ULONG KGetNativeRoutineSSDTIndex(LPCSTR ProcName);
PVOID KGetSSDTRoutineAddress(LPCSTR RoutineName);
PVOID KGetSSDTRoutineAddress_Zw(LPCSTR RoutineName);

PEPROCESS KGetProcessByPid(ULONG Pid);

PVOID64 KGetPteBase();
PVOID64 KGetMmPfnDataBase();
BOOL KIsGuiThread();

BOOLEAN KInitMemoryRoutine();

PVOID KAllocateHeap(SIZE_T Size);
PVOID KAllocatePool(SIZE_T Size);
VOID KFreePool(PVOID Address, SIZE_T Size);
VOID KSetPreviousMode(UCHAR Mode);
ULONG64 KGetIdtProcAddress(ULONG Index);
BOOL KIsAddressValid(PVOID Address);
BOOL KIsProcessExit(PEPROCESS Process);
BOOL KIsPidActive(ULONG Pid);

typedef struct _IRQL_STATE {
	ULONG old_irql;
}IRQL_STATE, * PIRQL_STATE;

VOID KRaiseIrqlToDpcOrHigh(PIRQL_STATE state);
VOID KLowerIrqlToState(PIRQL_STATE state);

ULONG64 KGetRspBase();
ULONG KGetSyscallNumber();
UCHAR KIsThreadRunning(PETHREAD Thread);
bool RemoveFromBigPool(ULONG64 Address);
ULONG64 SwitchToProcessCr3(PEPROCESS p);

#ifdef __cplusplus
}
#endif

#endif // !__DDKCOMMON_INCLUDED_



