#pragma once

#ifndef _NTHELPERX64_
#define _NTHELPERX64_

#include "stdio.h"
#include "windows.h"
#include "LoadMemLibrary.h"
#include "intrin.h"
#include "NtHelperX64_BaseStruct.h"
#include "XorStr.hpp"

	LONG GetFunctionSSDTIndex(LPCSTR FunName);
	BOOLEAN nthelper_init(BOOL IsManualMap);
	void AnsiToUnicode(LPCSTR AnsiStr, LPWSTR UnicodeStrBuffer, ULONG MaxLenth);
	void UnicodeToAnsi(LPCWSTR UnicodeStr, LPSTR AnsiStrBuffer, ULONG MaxLenth);
	VOID myRtlInitUnicodeString(
		OUT PMYUNICODE_STRING DestinationString,
		IN PCWSTR SourceString OPTIONAL
	);
	MYNTSTATUS myNtDelayExecution(
		IN BOOLEAN              Alertable,
		IN PLARGE_INTEGER       DelayInterval
	);
	MYNTSTATUS myNtTerminateProcess(
		IN HANDLE               ProcessHandle OPTIONAL,
		IN MYNTSTATUS             ExitStatus
	);
	MYNTSTATUS myNtOpenProcess(
		OUT PHANDLE             ProcessHandle,
		IN ACCESS_MASK          AccessMask,
		IN PMYOBJECT_ATTRIBUTES   ObjectAttributes,
		IN PMYCLIENT_ID           ClientId
	);
	MYNTSTATUS myNtQueryInformationFile(
		IN HANDLE               FileHandle,
		OUT PMYIO_STATUS_BLOCK    IoStatusBlock,
		OUT PVOID               FileInformation,
		IN ULONG                Length,
		IN MYFILE_INFORMATION_CLASS FileInformationClass
	);
	MYNTSTATUS myNtQueryAttributesFile(
		IN PMYOBJECT_ATTRIBUTES   ObjectAttributes,
		OUT PFILE_BASIC_INFORMATION FileAttributes
	);
	MYNTSTATUS myNtQueryInformationToken(
		IN HANDLE               TokenHandle,
		IN TOKEN_INFORMATION_CLASS TokenInformationClass,
		OUT PVOID               TokenInformation,
		IN ULONG                TokenInformationLength,
		OUT PULONG              ReturnLength
	);
	MYNTSTATUS myNtQuerySystemInformation(
		IN MYSYSTEM_INFORMATION_CLASS SystemInformationClass,
		OUT PVOID               SystemInformation,
		IN ULONG                SystemInformationLength,
		OUT PULONG              ReturnLength OPTIONAL
	);
	MYNTSTATUS myNtOpenProcessToken(
		IN HANDLE               ProcessHandle,
		IN ACCESS_MASK          DesiredAccess,
		OUT PHANDLE             TokenHandle
	);
	MYNTSTATUS myNtSetValueKey(
		IN HANDLE               KeyHandle,
		IN PMYUNICODE_STRING      ValueName,
		IN ULONG                TitleIndex OPTIONAL,
		IN ULONG                Type,
		IN PVOID                Data,
		IN ULONG                DataSize
	);
	MYNTSTATUS myNtLoadDriver(PMYUNICODE_STRING DriverServiceName);
	MYNTSTATUS myNtUnloadDriver(PMYUNICODE_STRING DriverServiceName);
	MYNTSTATUS myNtOpenKey(
		PHANDLE            KeyHandle,
		ACCESS_MASK        DesiredAccess,
		PMYOBJECT_ATTRIBUTES ObjectAttributes
	);
	MYNTSTATUS myNtCreateKey(
		PHANDLE            KeyHandle,
		ACCESS_MASK        DesiredAccess,
		PMYOBJECT_ATTRIBUTES ObjectAttributes,
		ULONG              TitleIndex,
		PMYUNICODE_STRING    Class,
		ULONG              CreateOptions,
		PULONG             Disposition
	);
	MYNTSTATUS myNtAdjustPrivilegesToken(
		IN HANDLE               TokenHandle,
		IN BOOLEAN              DisableAllPrivileges,
		IN PTOKEN_PRIVILEGES    TokenPrivileges,
		IN ULONG                PreviousPrivilegesLength,
		OUT PTOKEN_PRIVILEGES   PreviousPrivileges OPTIONAL,
		OUT PULONG              RequiredLength OPTIONAL
	);
	MYNTSTATUS myNtQueryValueKey(
		HANDLE                      KeyHandle,
		PMYUNICODE_STRING             ValueName,
		KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass,
		PVOID                       KeyValueInformation,
		ULONG                       Length,
		PULONG                      ResultLength
	);
	MYNTSTATUS myNtEnumerateKey(
		IN HANDLE               KeyHandle,
		IN ULONG                Index,
		IN KEY_INFORMATION_CLASS KeyInformationClass,
		OUT PVOID               KeyInformation,
		IN ULONG                Length,
		OUT PULONG              ResultLength
	);
	MYNTSTATUS myNtOpenKeyEx(
		PHANDLE            KeyHandle,
		ACCESS_MASK        DesiredAccess,
		PMYOBJECT_ATTRIBUTES ObjectAttributes,
		ULONG              OpenOptions
	);
	MYNTSTATUS myNtDeleteKey(IN HANDLE KeyHandle);
	MYNTSTATUS myNtDeleteValueKey(
		IN HANDLE               KeyHandle,
		IN PMYUNICODE_STRING      ValueName
	);

	MYNTSTATUS myNtClose(HANDLE Handle);
	MYNTSTATUS myNtOpenFile(
		OUT PHANDLE           FileHandle,
		IN ACCESS_MASK        DesiredAccess,
		IN PMYOBJECT_ATTRIBUTES ObjectAttributes,
		OUT PMYIO_STATUS_BLOCK  IoStatusBlock,
		IN ULONG              ShareAccess,
		IN ULONG              OpenOptions
	);
	MYNTSTATUS myNtCreateFile(
		OUT PHANDLE           FileHandle,
		IN ACCESS_MASK        DesiredAccess,
		IN PMYOBJECT_ATTRIBUTES ObjectAttributes,
		OUT PMYIO_STATUS_BLOCK  IoStatusBlock,
		IN PLARGE_INTEGER     AllocationSize,
		IN ULONG              FileAttributes,
		IN ULONG              ShareAccess,
		IN ULONG              CreateDisposition,
		IN ULONG              CreateOptions,
		IN PVOID              EaBuffer,
		IN ULONG              EaLength
	);
	MYNTSTATUS myNtReadFile(
		_In_     HANDLE           FileHandle,
		_In_opt_ HANDLE           Event,
		_In_opt_ PMYIO_APC_ROUTINE  ApcRoutine,
		_In_opt_ PVOID            ApcContext,
		_Out_    PMYIO_STATUS_BLOCK IoStatusBlock,
		_Out_    PVOID            Buffer,
		_In_     ULONG            Length,
		_In_opt_ PLARGE_INTEGER   ByteOffset,
		_In_opt_ PULONG           Key
	);
	MYNTSTATUS myNtWriteFile(
		IN HANDLE               FileHandle,
		IN HANDLE               Event OPTIONAL,
		IN PMYIO_APC_ROUTINE      ApcRoutine OPTIONAL,
		IN PVOID                ApcContext OPTIONAL,
		OUT PMYIO_STATUS_BLOCK    IoStatusBlock,
		IN PVOID                Buffer,
		IN ULONG                Length,
		IN PLARGE_INTEGER       ByteOffset OPTIONAL,
		IN PULONG               Key OPTIONAL
	);
	MYNTSTATUS myNtDeviceIoControlFile(
		IN HANDLE            FileHandle,
		IN HANDLE            Event,
		IN PMYIO_APC_ROUTINE   ApcRoutine,
		IN PVOID             ApcContext,
		OUT PMYIO_STATUS_BLOCK IoStatusBlock,
		IN ULONG             IoControlCode,
		IN PVOID             InputBuffer,
		IN ULONG             InputBufferLength,
		OUT PVOID            OutputBuffer,
		IN ULONG             OutputBufferLength
	);
	MYNTSTATUS myNtProtectVirtualMemory(
		IN HANDLE               ProcessHandle,
		IN OUT PVOID* BaseAddress,
		IN OUT PULONG           NumberOfBytesToProtect,
		IN ULONG                NewAccessProtection,
		OUT PULONG              OldAccessProtection
	);
	MYNTSTATUS myNTReadVirtualMemory(
		IN HANDLE               ProcessHandle,
		IN PVOID                BaseAddress,
		OUT PVOID               Buffer,
		IN ULONG                NumberOfBytesToRead,
		OUT PULONG              NumberOfBytesReaded OPTIONAL
	);
	MYNTSTATUS myNTWriteVirtualMemory(
		IN HANDLE               ProcessHandle,
		IN PVOID                BaseAddress,
		IN PVOID                Buffer,
		IN ULONG                NumberOfBytesToWrite,
		OUT PULONG              NumberOfBytesWritten OPTIONAL
	);
	MYNTSTATUS myNtQueryVirtualMemory(
		IN HANDLE               ProcessHandle,
		IN PVOID                BaseAddress,
		IN ULONG64 MemoryInformationClass,
		OUT PVOID               Buffer,
		IN ULONG64                Length,
		OUT PULONG              ResultLength OPTIONAL
	);
	MYNTSTATUS myNtQueryPerformanceCounter(
		_Out_     PLARGE_INTEGER PerformanceCounter,
		_Out_opt_ PLARGE_INTEGER PerformanceFrequency
	);
	MYNTSTATUS myNtAllocateVirtualMemory(
		_In_ HANDLE ProcessHandle,
		_Inout_ PVOID *BaseAddress,
		_In_ ULONG_PTR ZeroBits,
		_Inout_ PSIZE_T RegionSize,
		_In_ ULONG AllocationType,
		_In_ ULONG Protect
	);
	MYNTSTATUS myNtFreeVirtualMemory(
		HANDLE  ProcessHandle,
		PVOID   *BaseAddress,
		PSIZE_T RegionSize,
		ULONG   FreeType
	);
	MYNTSTATUS myNtQueryObject(
		HANDLE                   Handle,
		MYOBJECT_INFORMATION_CLASS ObjectInformationClass,
		PVOID                    ObjectInformation,
		ULONG                    ObjectInformationLength,
		PULONG                   ReturnLength
	);
	MYNTSTATUS myNtCreateThreadEx(
		OUT PHANDLE hThread,
		IN ACCESS_MASK DesiredAccess,
		IN PVOID ObjectAttributes,
		IN HANDLE ProcessHandle,
		IN PVOID lpStartAddress,
		IN PVOID lpParameter,
		IN ULONG Flags,
		IN SIZE_T StackZeroBits,
		IN SIZE_T SizeOfStackCommit,
		IN SIZE_T SizeOfStackReserve,
		OUT PVOID lpBytesBuffer);
	ULONG myGetNtBuildNumber();
	short myGetAsyncKeyState(int vCode);
	void mySleep(ULONG mill);
	BOOL myTerminateProcess(
		IN HANDLE               ProcessHandle OPTIONAL,
		IN MYNTSTATUS             ExitStatus
	);
	HANDLE myOpenProcess(
		_In_ DWORD dwDesiredAccess,
		_In_ BOOL bInheritHandle,
		_In_ DWORD dwProcessId
	);
	ULONG64 myGetFileSize(HANDLE hFile);
	DWORD myGetFileAttributesW(LPCWSTR lpFileName);
	DWORD myGetFileAttributesA(LPCSTR lpFileName);
	BOOL myPathFileExistsW(LPCWSTR lpFileName);
	BOOL myPathFileExistsA(LPCSTR lpFileName);
	BOOL myGetTokenInformation(
		HANDLE                  TokenHandle,
		TOKEN_INFORMATION_CLASS TokenInformationClass,
		LPVOID                  TokenInformation,
		DWORD                   TokenInformationLength,
		PDWORD                  ReturnLength
	);
	HANDLE myCreateFileW(
		LPCWSTR               lpFileName,
		DWORD                 dwDesiredAccess,
		DWORD                 dwShareMode,
		DWORD                 dwCreationDisposition
	);
	HANDLE myCreateFileA(
		LPCSTR                lpFileName,
		DWORD                 dwDesiredAccess,
		DWORD                 dwShareMode,
		DWORD                 dwCreationDisposition
	);
	HANDLE myCreateFileDeviceA(
		LPCSTR                lpFileName,
		DWORD                 dwDesiredAccess,
		DWORD                 dwShareMode,
		DWORD                 dwCreationDisposition
	);
	BOOL myReadFile(
		_In_ HANDLE hFile,
		_Out_writes_bytes_to_opt_(nNumberOfBytesToRead, *lpNumberOfBytesRead) __out_data_source(FILE) LPVOID lpBuffer,
		_In_ DWORD nNumberOfBytesToRead,
		_Out_opt_ LPDWORD lpNumberOfBytesRead
	);
	BOOL myWriteFile(
		_In_ HANDLE hFile,
		_In_reads_bytes_opt_(nNumberOfBytesToWrite) LPCVOID lpBuffer,
		_In_ DWORD nNumberOfBytesToWrite,
		_Out_opt_ LPDWORD lpNumberOfBytesWritten
	);
	BOOL myDeviceIoControl(
		_In_ HANDLE hDevice,
		_In_ DWORD dwIoControlCode,
		_In_reads_bytes_opt_(nInBufferSize) LPVOID lpInBuffer,
		_In_ DWORD nInBufferSize,
		_Out_writes_bytes_to_opt_(nOutBufferSize, *lpBytesReturned) LPVOID lpOutBuffer,
		_In_ DWORD nOutBufferSize,
		_Out_opt_ LPDWORD lpBytesReturned
	);
	BOOL myDeleteFileW(LPCWSTR lpFileName);
	BOOL myDeleteFileA(LPCSTR lpFileName);
	HANDLE myRegCreateKeyW(
		LPCWSTR KeyName,
		ACCESS_MASK DesiredAccess
	);
	HANDLE myRegCreateKeyA(
		LPCSTR KeyName,
		ACCESS_MASK DesiredAccess
	);
	BOOL myRegEnumKeyW(
		HANDLE KeyHandle,
		ULONG dwIndex,
		LPWSTR lpName,
		ULONG cchName
	);
	BOOL myRegEnumKeyA(
		HANDLE KeyHandle,
		ULONG dwIndex,
		LPSTR lpName,
		ULONG cchName
	);
	BOOL myRegSetValueExW(
		_In_ HANDLE KeyHandle,
		_In_opt_ LPCWSTR lpValueName,
		_In_ DWORD dwType,
		_In_reads_bytes_opt_(cbData) CONST BYTE* lpData,
		_In_ DWORD cbData
	);
	BOOL myRegSetValueExA(
		_In_ HANDLE KeyHandle,
		_In_opt_ LPCSTR lpValueName,
		_In_ DWORD dwType,
		_In_reads_bytes_opt_(cbData) CONST BYTE* lpData,
		_In_ DWORD cbData
	);
	BOOL myRegQueryValueExW(
		_In_ HANDLE KeyHandle,
		_In_opt_ LPCWSTR lpValueName,
		_Out_opt_ LPDWORD lpType,
		_Out_writes_bytes_to_opt_(*lpcbData, *lpcbData) __out_data_source(REGISTRY) LPBYTE lpData,
		_When_(lpData == NULL, _Out_opt_) _When_(lpData != NULL, _Inout_opt_) LPDWORD lpcbData
	);
	BOOL myRegQueryValueExA(
		_In_ HANDLE KeyHandle,
		_In_opt_ LPCSTR lpValueName,
		_Out_opt_ LPDWORD lpType,
		_Out_writes_bytes_to_opt_(*lpcbData, *lpcbData) __out_data_source(REGISTRY) LPBYTE lpData,
		_When_(lpData == NULL, _Out_opt_) _When_(lpData != NULL, _Inout_opt_) LPDWORD lpcbData
	);
	BOOL myOpenProcessToken(
		_In_ HANDLE ProcessHandle,
		_In_ DWORD DesiredAccess,
		_Outptr_ PHANDLE TokenHandle
	);
	BOOL myAdjustTokenPrivileges(
		_In_ HANDLE TokenHandle,
		_In_ BOOL DisableAllPrivileges,
		_In_opt_ PTOKEN_PRIVILEGES NewState,
		_In_ DWORD BufferLength,
		_Out_writes_bytes_to_opt_(BufferLength, *ReturnLength) PTOKEN_PRIVILEGES PreviousState,
		_Out_opt_ PDWORD ReturnLength
	);
	BOOL myCloseHandle(HANDLE Handle);
	BOOL myVirtualProtect(
		LPVOID lpAddress,
		SIZE_T dwSize,
		DWORD  flNewProtect,
		PDWORD lpflOldProtect
	);
	SIZE_T myVirtualQuery(LPCVOID lpAddress, PMEMORY_BASIC_INFORMATION lpBuffer, SIZE_T dwLength);
	ULONG myGetCurrentThreadId();


#endif // !_NTHELPER_

