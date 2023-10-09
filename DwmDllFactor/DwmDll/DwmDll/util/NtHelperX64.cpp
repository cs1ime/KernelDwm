#include "NtHelperX64.h"
#pragma comment(linker,"/INCREMENTAL:NO")

static const unsigned char shellcode_syscall[] = "\x49\x89\xCA\xB8\x00\x00\x01\x00\x0F\x05\xC3";

typedef MYNTSTATUS(*NTROUTINE)(...);

static BOOL g_Inited = FALSE;
static ULONG g_LastIndex = 0;
static PVOID g_SyscallBuffer = 0;

static ULONG index_NtCreateFile = 0;
static ULONG index_NtDeviceIoControlFile = 0;
static ULONG index_NtReadFile = 0;
static ULONG index_NtWriteFile = 0;
static ULONG index_NtClose = 0;
static ULONG index_NtOpenFile = 0;
static ULONG index_NtLoadDriver = 0;
static ULONG index_NtOpenKey = 0;
static ULONG index_NtCreateKey = 0;
static ULONG index_NtAdjustPrivilegesToken = 0;
static ULONG index_NtQueryValueKey = 0;
static ULONG index_NtEnumerateKey = 0;
static ULONG index_NtOpenKeyEx = 0;
static ULONG index_NtDeleteKey = 0;
static ULONG index_NtDeleteValueKey = 0;
static ULONG index_NtSetValueKey = 0;
static ULONG index_NtOpenProcessToken = 0;
static ULONG index_NtQuerySystemInformation = 0;
static ULONG index_NtQueryInformationToken = 0;
static ULONG index_NtQueryAttributesFile = 0;
static ULONG index_NtQueryInformationFile = 0;
static ULONG index_NtUnloadDriver = 0;
static ULONG index_NtOpenProcess = 0;
static ULONG index_NtTerminateProcess = 0;
static ULONG index_NtProtectVirtualMemory = 0;
static ULONG index_NTReadVirtualMemory = 0;
static ULONG index_NTWriteVirtualMemory = 0;
static ULONG index_NtDelayExecution = 0;
static ULONG index_NtQueryVirtualMemory = 0;
static ULONG index_NtQueryPerformanceCounter = 0;
static ULONG index_NtAllocateVirtualMemory = 0;
static ULONG index_NtFreeVirtualMemory = 0;
static ULONG index_NtQueryObject = 0;
static ULONG index_NtCreateThreadEx = 0;

static NTROUTINE fun_NtCreateFile = 0;
static NTROUTINE fun_NtDeviceIoControlFile = 0;
static NTROUTINE fun_NtReadFile = 0;
static NTROUTINE fun_NtWriteFile = 0;
static NTROUTINE fun_NtClose = 0;
static NTROUTINE fun_NtOpenFile = 0;
static NTROUTINE fun_NtLoadDriver = 0;
static NTROUTINE fun_NtOpenKey = 0;
static NTROUTINE fun_NtCreateKey = 0;
static NTROUTINE fun_NtAdjustPrivilegesToken = 0;
static NTROUTINE fun_NtQueryValueKey = 0;
static NTROUTINE fun_NtEnumerateKey = 0;
static NTROUTINE fun_NtOpenKeyEx = 0;
static NTROUTINE fun_NtDeleteKey = 0;
static NTROUTINE fun_NtDeleteValueKey = 0;
static NTROUTINE fun_NtSetValueKey = 0;
static NTROUTINE fun_NtOpenProcessToken = 0;
static NTROUTINE fun_NtQuerySystemInformation = 0;
static NTROUTINE fun_NtQueryInformationToken = 0;
static NTROUTINE fun_NtQueryAttributesFile = 0;
static NTROUTINE fun_NtQueryInformationFile = 0;
static NTROUTINE fun_NtUnloadDriver = 0;
static NTROUTINE fun_NtOpenProcess = 0;
static NTROUTINE fun_NtTerminateProcess = 0;
static NTROUTINE fun_NtProtectVirtualMemory = 0;
static NTROUTINE fun_NTReadVirtualMemory = 0;
static NTROUTINE fun_NTWriteVirtualMemory = 0;
static NTROUTINE fun_NtDelayExecution = 0;
static NTROUTINE fun_NtQueryVirtualMemory = 0;
static NTROUTINE fun_NtQueryPerformanceCounter = 0;
static NTROUTINE fun_NtAllocateVirtualMemory = 0;
static NTROUTINE fun_NtFreeVirtualMemory = 0;
static NTROUTINE fun_NtQueryObject = 0;
static NTROUTINE fun_NtCreateThreadEx = 0;

static ULONG index_NtUserGetAsyncKeyState = 0;

static NTROUTINE fun_NtUserGetAsyncKeyState = 0;

ULONG64 g_ntdll = 0;
ULONG64 g_win32u = 0;
extern "C" VOID PendingCode();

LONG GetFunctionSSDTIndex(LPCSTR FunName) {
	if (g_ntdll == 0) {
		g_ntdll = (ULONG64)GetMemModuleHandleA(XorStr("ntdll.dll"));
	}
	PUCHAR Addr = (PUCHAR)GetMemProcAddress((PVOID)g_ntdll, FunName);
	if (Addr == 0)return -1;
	for (int i = 0; i < 0x100; i++) {
		if (Addr[i] == 0xB8) {
			return *(LONG *)(&Addr[i + 1]);
		}
	}
	return -1;

}
LONG GetWin32uSSSDTIndex(LPCSTR FunName) {
	if (g_win32u == 0) {
		g_win32u = (ULONG64)GetMemModuleHandleA(XorStr("win32u.dll"));
	}
	PUCHAR Addr = (PUCHAR)GetMemProcAddress((PVOID)g_win32u, FunName);
	if (Addr == 0)return -1;
	for (int i = 0; i < 0x100; i++) {
		if (Addr[i] == 0xB8) {
			return *(LONG*)(&Addr[i + 1]);
		}
	}
	return -1;
}
NTROUTINE MakeSSDTFunction(ULONG SSDTIndex) {

	PVOID pCode = ((PUCHAR)g_SyscallBuffer) + SSDTIndex * 0xC;

	//g_LastIndex++;
	return (NTROUTINE)pCode;
}
ULONG GetNtUserGetAsyncKeyStateIndex() {
	ULONG64 hmod = (ULONG64)GetMemModuleHandleA(XorStr("win32u.dll"));
	if (hmod) {
		PUCHAR Addr = (PUCHAR)GetMemProcAddress((PVOID)hmod, XorStr("NtUserGetAsyncKeyState"));
		if (Addr) {
			for (int i = 0; i < 0x50; i++) {
				if (Addr[i] == 0xB8) {
					return *(ULONG*)(&Addr[i + 1]);
				}
			}
		}

	}
	else {
		hmod = (ULONG64)GetMemModuleHandleA(XorStr("user32.dll"));
		if (hmod) {
			PUCHAR Addr = (PUCHAR)GetMemProcAddress((PVOID)hmod, XorStr("GetAsyncKeyState"));
			if (Addr) {
				for (int i = 0; i < 0x150; i++) {
					if (Addr[i] == 0x8B && Addr[i + 1] == 0xCB && Addr[i + 2] == 0xE8) {
						PUCHAR FunAddr = *(LONG*)(Addr + i + 3) + Addr + i + 7;

						for (int j = 0; j < 0x50; j++) {
							if (FunAddr[j] == 0xB8) {
								return *(ULONG*)(&FunAddr[j + 1]);
							}
						}

					}
				}
			}
		}

	}
	return 0;
}

BOOLEAN nthelper_init(BOOL IsManualMap) {
	if (g_Inited)return TRUE;
	g_SyscallBuffer = (PVOID)PendingCode;

	g_ntdll = (ULONG64)GetMemModuleHandleA(XorStr("ntdll.dll"));

	index_NtUserGetAsyncKeyState = GetNtUserGetAsyncKeyStateIndex();
	//printf("ntuser:%x\n", index_NtUserGetAsyncKeyState);
	index_NtCreateFile = GetFunctionSSDTIndex(XorStr("NtCreateFile"));
	index_NtDeviceIoControlFile = GetFunctionSSDTIndex(XorStr("NtDeviceIoControlFile"));
	index_NtReadFile = GetFunctionSSDTIndex(XorStr("NtReadFile"));
	index_NtWriteFile = GetFunctionSSDTIndex( XorStr("NtWriteFile"));
	index_NtClose = GetFunctionSSDTIndex( XorStr("NtClose"));
	index_NtOpenFile = GetFunctionSSDTIndex(XorStr("NtOpenFile"));
	index_NtLoadDriver = GetFunctionSSDTIndex(XorStr("NtLoadDriver"));
	index_NtOpenKey = GetFunctionSSDTIndex(XorStr("NtOpenKey"));
	index_NtCreateKey = GetFunctionSSDTIndex(XorStr("NtCreateKey"));
	index_NtAdjustPrivilegesToken = GetFunctionSSDTIndex(XorStr("NtAdjustPrivilegesToken"));
	index_NtQueryValueKey = GetFunctionSSDTIndex(XorStr("NtQueryValueKey"));
	index_NtEnumerateKey = GetFunctionSSDTIndex(XorStr("NtEnumerateKey"));
	index_NtOpenKeyEx = GetFunctionSSDTIndex(XorStr("NtOpenKeyEx"));
	index_NtDeleteKey = GetFunctionSSDTIndex(XorStr("NtDeleteKey"));
	index_NtDeleteValueKey = GetFunctionSSDTIndex(XorStr("NtDeleteValueKey"));
	index_NtSetValueKey = GetFunctionSSDTIndex(XorStr("NtSetValueKey"));
	index_NtOpenProcessToken = GetFunctionSSDTIndex(XorStr("NtOpenProcessToken"));
	index_NtQuerySystemInformation = GetFunctionSSDTIndex(XorStr("NtQuerySystemInformation"));
	index_NtQueryInformationToken = GetFunctionSSDTIndex(XorStr("NtQueryInformationToken"));
	index_NtQueryAttributesFile = GetFunctionSSDTIndex(XorStr("NtQueryAttributesFile"));
	index_NtQueryInformationFile = GetFunctionSSDTIndex(XorStr("NtQueryInformationFile"));
	index_NtUnloadDriver = GetFunctionSSDTIndex(XorStr("NtUnloadDriver"));
	index_NtOpenProcess = GetFunctionSSDTIndex(XorStr("NtOpenProcess"));
	index_NtTerminateProcess = GetFunctionSSDTIndex(XorStr("NtTerminateProcess"));
	index_NtProtectVirtualMemory = GetFunctionSSDTIndex(XorStr("NtProtectVirtualMemory"));
	index_NTReadVirtualMemory = GetFunctionSSDTIndex(XorStr("NTReadVirtualMemory"));
	index_NTWriteVirtualMemory = GetFunctionSSDTIndex(XorStr("NTWriteVirtualMemory"));
	index_NtDelayExecution = GetFunctionSSDTIndex(XorStr("NtDelayExecution"));
	index_NtQueryVirtualMemory = GetFunctionSSDTIndex(XorStr("NtQueryVirtualMemory"));
	index_NtQueryPerformanceCounter = GetFunctionSSDTIndex(XorStr("NtQueryPerformanceCounter"));
	index_NtAllocateVirtualMemory = GetFunctionSSDTIndex(XorStr("NtAllocateVirtualMemory"));
	index_NtFreeVirtualMemory = GetFunctionSSDTIndex(XorStr("NtFreeVirtualMemory"));
	index_NtQueryObject = GetFunctionSSDTIndex(XorStr("NtQueryObject"));
	index_NtCreateThreadEx = GetFunctionSSDTIndex(XorStr("NtCreateThreadEx"));
	/*printf("NtUserGetAsyncKeyState:%x\n", index_NtUserGetAsyncKeyState);
	printf("NtCreateFile:%x\n", index_NtCreateFile);
	printf("NtDeviceIoControlFile:%x\n", index_NtDeviceIoControlFile);
	printf("NtReadFile:%x\n", index_NtReadFile);
	printf("NtWriteFile:%x\n", index_NtWriteFile);
	printf("NtClose:%x\n", index_NtClose);
	printf("NtOpenFile:%x\n", index_NtOpenFile);
	printf("NtLoadDriver:%x\n", index_NtLoadDriver);
	printf("NtOpenKey:%x\n", index_NtOpenKey);
	printf("NtCreateKey:%x\n", index_NtCreateKey);
	printf("NtAdjustPrivilegesToken:%x\n", index_NtAdjustPrivilegesToken);*/


	fun_NtUserGetAsyncKeyState = MakeSSDTFunction(index_NtUserGetAsyncKeyState);
	fun_NtCreateFile = MakeSSDTFunction(index_NtCreateFile);
	fun_NtDeviceIoControlFile = MakeSSDTFunction(index_NtDeviceIoControlFile);
	fun_NtReadFile = MakeSSDTFunction(index_NtReadFile);
	fun_NtWriteFile = MakeSSDTFunction(index_NtWriteFile);
	fun_NtClose = MakeSSDTFunction(index_NtClose);
	fun_NtOpenFile = MakeSSDTFunction(index_NtOpenFile);
	fun_NtLoadDriver = MakeSSDTFunction(index_NtLoadDriver);
	fun_NtOpenKey = MakeSSDTFunction(index_NtOpenKey);
	fun_NtCreateKey = MakeSSDTFunction(index_NtCreateKey);
	fun_NtAdjustPrivilegesToken = MakeSSDTFunction(index_NtAdjustPrivilegesToken);
	fun_NtQueryValueKey = MakeSSDTFunction(index_NtQueryValueKey);
	fun_NtEnumerateKey = MakeSSDTFunction(index_NtEnumerateKey);
	fun_NtOpenKeyEx = MakeSSDTFunction(index_NtOpenKeyEx);
	fun_NtDeleteKey = MakeSSDTFunction(index_NtDeleteKey);
	fun_NtDeleteValueKey = MakeSSDTFunction(index_NtDeleteValueKey);
	fun_NtSetValueKey = MakeSSDTFunction(index_NtSetValueKey);
	fun_NtOpenProcessToken = MakeSSDTFunction(index_NtOpenProcessToken);
	fun_NtQuerySystemInformation = MakeSSDTFunction(index_NtQuerySystemInformation);
	fun_NtQueryInformationToken = MakeSSDTFunction(index_NtQueryInformationToken);
	fun_NtQueryAttributesFile = MakeSSDTFunction(index_NtQueryAttributesFile);
	fun_NtQueryInformationFile = MakeSSDTFunction(index_NtQueryInformationFile);
	fun_NtUnloadDriver = MakeSSDTFunction(index_NtUnloadDriver);
	fun_NtOpenProcess = MakeSSDTFunction(index_NtOpenProcess);
	fun_NtTerminateProcess = MakeSSDTFunction(index_NtTerminateProcess);
	fun_NtProtectVirtualMemory = MakeSSDTFunction(index_NtProtectVirtualMemory);
	fun_NTReadVirtualMemory = MakeSSDTFunction(index_NTReadVirtualMemory);
	fun_NTWriteVirtualMemory = MakeSSDTFunction(index_NTWriteVirtualMemory);
	fun_NtDelayExecution = MakeSSDTFunction(index_NtDelayExecution);
	fun_NtQueryVirtualMemory = MakeSSDTFunction(index_NtQueryVirtualMemory);
	fun_NtQueryPerformanceCounter = MakeSSDTFunction(index_NtQueryPerformanceCounter);
	fun_NtAllocateVirtualMemory = MakeSSDTFunction(index_NtAllocateVirtualMemory);
	fun_NtFreeVirtualMemory = MakeSSDTFunction(index_NtFreeVirtualMemory);
	fun_NtQueryObject = MakeSSDTFunction(index_NtQueryObject);
	fun_NtCreateThreadEx = MakeSSDTFunction(index_NtCreateThreadEx);

	g_Inited = TRUE;
	return TRUE;
}

void AnsiToUnicode(LPCSTR AnsiStr, LPWSTR UnicodeStrBuffer, ULONG MaxLenth) {

	int len = strlen(AnsiStr);
	if (len >= MaxLenth)
		len = MaxLenth;
	for (int i = 0; i < len; i++) {
		UnicodeStrBuffer[i] = AnsiStr[i];
	}
	UnicodeStrBuffer[len] = 0;
}
void UnicodeToAnsi(LPCWSTR UnicodeStr, LPSTR AnsiStrBuffer, ULONG MaxLenth) {
	int len = wcslen(UnicodeStr);
	if (len >= MaxLenth)
		len = MaxLenth;
	for (ULONG i = 0; i < len; i++) {
		AnsiStrBuffer[i] = UnicodeStr[i];
	}
	AnsiStrBuffer[len] = 0;
	return;
}


VOID
myRtlInitUnicodeString(
	OUT PMYUNICODE_STRING DestinationString,
	IN PCWSTR SourceString OPTIONAL
)
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
MYNTSTATUS myNtDelayExecution(
	IN BOOLEAN              Alertable,
	IN PLARGE_INTEGER       DelayInterval
) {
	typedef MYNTSTATUS(*Originfn)(BOOLEAN, PLARGE_INTEGER);
	return ((Originfn)(fun_NtDelayExecution))(Alertable, DelayInterval);
}
MYNTSTATUS myNtTerminateProcess(
	IN HANDLE               ProcessHandle OPTIONAL,
	IN MYNTSTATUS             ExitStatus
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, MYNTSTATUS);
	return ((Originfn)(fun_NtTerminateProcess))(ProcessHandle, ExitStatus);
}
MYNTSTATUS myNtOpenProcess(
	OUT PHANDLE             ProcessHandle,
	IN ACCESS_MASK          AccessMask,
	IN PMYOBJECT_ATTRIBUTES   ObjectAttributes,
	IN PMYCLIENT_ID           ClientId
) {
	typedef MYNTSTATUS(*Originfn)(PHANDLE, ACCESS_MASK, PMYOBJECT_ATTRIBUTES, PMYCLIENT_ID);
	return ((Originfn)(fun_NtOpenProcess))(ProcessHandle, AccessMask, ObjectAttributes, ClientId);
}
MYNTSTATUS myNtQueryInformationFile(
	IN HANDLE               FileHandle,
	OUT PMYIO_STATUS_BLOCK    IoStatusBlock,
	OUT PVOID               FileInformation,
	IN ULONG                Length,
	IN MYFILE_INFORMATION_CLASS FileInformationClass
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, PMYIO_STATUS_BLOCK, PVOID, ULONG, MYFILE_INFORMATION_CLASS);
	return ((Originfn)(fun_NtQueryInformationFile))(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass);
}
MYNTSTATUS myNtQueryAttributesFile(
	IN PMYOBJECT_ATTRIBUTES   ObjectAttributes,
	OUT PFILE_BASIC_INFORMATION FileAttributes
) {
	typedef MYNTSTATUS(*Originfn)(PMYOBJECT_ATTRIBUTES, PFILE_BASIC_INFORMATION);
	return ((Originfn)(fun_NtQueryAttributesFile))(ObjectAttributes, FileAttributes);
}
MYNTSTATUS myNtQueryInformationToken(
	IN HANDLE               TokenHandle,
	IN TOKEN_INFORMATION_CLASS TokenInformationClass,
	OUT PVOID               TokenInformation,
	IN ULONG                TokenInformationLength,
	OUT PULONG              ReturnLength
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, TOKEN_INFORMATION_CLASS, PVOID, ULONG, PULONG);
	return ((Originfn)(fun_NtQueryInformationToken))(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength);
}
MYNTSTATUS myNtQuerySystemInformation(
	IN MYSYSTEM_INFORMATION_CLASS SystemInformationClass,
	OUT PVOID               SystemInformation,
	IN ULONG                SystemInformationLength,
	OUT PULONG              ReturnLength OPTIONAL
) {
	typedef MYNTSTATUS(*Originfn)(MYSYSTEM_INFORMATION_CLASS, PVOID, ULONG, PULONG);
	return ((Originfn)(fun_NtQuerySystemInformation))(SystemInformationClass, SystemInformation, SystemInformationLength, ReturnLength);
}
MYNTSTATUS myNtOpenProcessToken(
	IN HANDLE               ProcessHandle,
	IN ACCESS_MASK          DesiredAccess,
	OUT PHANDLE             TokenHandle
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, ACCESS_MASK, PHANDLE);
	return ((Originfn)(fun_NtOpenProcessToken))(ProcessHandle, DesiredAccess, TokenHandle);
}
MYNTSTATUS myNtSetValueKey(
	IN HANDLE               KeyHandle,
	IN PMYUNICODE_STRING      ValueName,
	IN ULONG                TitleIndex OPTIONAL,
	IN ULONG                Type,
	IN PVOID                Data,
	IN ULONG                DataSize
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, PMYUNICODE_STRING, ULONG, ULONG, PVOID, ULONG);
	return ((Originfn)(fun_NtSetValueKey))(KeyHandle, ValueName, TitleIndex, Type, Data, DataSize);
}
MYNTSTATUS myNtLoadDriver(PMYUNICODE_STRING DriverServiceName) {
	typedef MYNTSTATUS(*Originfn)(PMYUNICODE_STRING);
	return ((Originfn)(fun_NtLoadDriver))(DriverServiceName);
}
MYNTSTATUS myNtUnloadDriver(PMYUNICODE_STRING DriverServiceName) {
	typedef MYNTSTATUS(*Originfn)(PMYUNICODE_STRING);
	return ((Originfn)(fun_NtUnloadDriver))(DriverServiceName);
}
MYNTSTATUS myNtOpenKey(
	PHANDLE            KeyHandle,
	ACCESS_MASK        DesiredAccess,
	PMYOBJECT_ATTRIBUTES ObjectAttributes
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, ACCESS_MASK, PMYOBJECT_ATTRIBUTES);
	return ((Originfn)(fun_NtOpenKey))(KeyHandle, DesiredAccess, ObjectAttributes);
}
MYNTSTATUS myNtCreateKey(
	PHANDLE            KeyHandle,
	ACCESS_MASK        DesiredAccess,
	PMYOBJECT_ATTRIBUTES ObjectAttributes,
	ULONG              TitleIndex,
	PMYUNICODE_STRING    Class,
	ULONG              CreateOptions,
	PULONG             Disposition
) {
	typedef MYNTSTATUS(*Originfn)(PHANDLE, ACCESS_MASK, PMYOBJECT_ATTRIBUTES, ULONG, PMYUNICODE_STRING, ULONG, PULONG);
	return ((Originfn)(fun_NtCreateKey))(KeyHandle, DesiredAccess, ObjectAttributes, TitleIndex, Class, CreateOptions, Disposition);
}
MYNTSTATUS myNtAdjustPrivilegesToken(
	IN HANDLE               TokenHandle,
	IN BOOLEAN              DisableAllPrivileges,
	IN PTOKEN_PRIVILEGES    TokenPrivileges,
	IN ULONG                PreviousPrivilegesLength,
	OUT PTOKEN_PRIVILEGES   PreviousPrivileges OPTIONAL,
	OUT PULONG              RequiredLength OPTIONAL
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, BOOLEAN, PTOKEN_PRIVILEGES, ULONG, PTOKEN_PRIVILEGES, PULONG);
	return ((Originfn)(fun_NtAdjustPrivilegesToken))(TokenHandle, DisableAllPrivileges, TokenPrivileges, PreviousPrivilegesLength, PreviousPrivileges, RequiredLength);
}
MYNTSTATUS myNtQueryValueKey(
	HANDLE                      KeyHandle,
	PMYUNICODE_STRING             ValueName,
	KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass,
	PVOID                       KeyValueInformation,
	ULONG                       Length,
	PULONG                      ResultLength
) {
	return fun_NtQueryValueKey(KeyHandle, ValueName, KeyValueInformationClass, KeyValueInformation, Length, ResultLength);
}
MYNTSTATUS myNtEnumerateKey(
	IN HANDLE               KeyHandle,
	IN ULONG                Index,
	IN KEY_INFORMATION_CLASS KeyInformationClass,
	OUT PVOID               KeyInformation,
	IN ULONG                Length,
	OUT PULONG              ResultLength
) {
	return fun_NtEnumerateKey(KeyHandle, Index, KeyInformationClass, KeyInformation, Length, ResultLength);
}
MYNTSTATUS myNtOpenKeyEx(
	PHANDLE            KeyHandle,
	ACCESS_MASK        DesiredAccess,
	PMYOBJECT_ATTRIBUTES ObjectAttributes,
	ULONG              OpenOptions
) {
	return fun_NtOpenKeyEx(KeyHandle, DesiredAccess, ObjectAttributes, OpenOptions);
}
MYNTSTATUS myNtDeleteKey(IN HANDLE KeyHandle) {
	return fun_NtDeleteKey(KeyHandle);
}
MYNTSTATUS myNtDeleteValueKey(
	IN HANDLE               KeyHandle,
	IN PMYUNICODE_STRING      ValueName
) {
	return fun_NtDeleteValueKey(KeyHandle, ValueName);
}
MYNTSTATUS myNtClose(HANDLE Handle) {
	return fun_NtClose(Handle);
}
MYNTSTATUS myNtOpenFile(
	OUT PHANDLE           FileHandle,
	IN ACCESS_MASK        DesiredAccess,
	IN PMYOBJECT_ATTRIBUTES ObjectAttributes,
	OUT PMYIO_STATUS_BLOCK  IoStatusBlock,
	IN ULONG              ShareAccess,
	IN ULONG              OpenOptions
) {
	return fun_NtOpenFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, ShareAccess, OpenOptions);
}
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
) {
	return fun_NtCreateFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength);
}
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
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, HANDLE, PMYIO_APC_ROUTINE, PVOID, PMYIO_STATUS_BLOCK, PVOID, ULONG, PLARGE_INTEGER, PULONG);
	return ((Originfn)(fun_NtReadFile))(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, Buffer, Length, ByteOffset, Key);
}
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
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, HANDLE, PMYIO_APC_ROUTINE, PVOID, PMYIO_STATUS_BLOCK, PVOID, ULONG, PLARGE_INTEGER, PULONG);
	return ((Originfn)(fun_NtWriteFile))(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, Buffer, Length, ByteOffset, Key);
}
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
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, HANDLE, PMYIO_APC_ROUTINE, PVOID, PMYIO_STATUS_BLOCK, ULONG, PVOID, ULONG, PVOID, ULONG);
	return ((Originfn)(fun_NtDeviceIoControlFile))(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, IoControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength);
}
MYNTSTATUS myNtProtectVirtualMemory(
	IN HANDLE               ProcessHandle,
	IN OUT PVOID            *BaseAddress,
	IN OUT PULONG           NumberOfBytesToProtect,
	IN ULONG                NewAccessProtection,
	OUT PULONG              OldAccessProtection
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, PVOID, PULONG, ULONG, PULONG);
	return ((Originfn)(fun_NtProtectVirtualMemory))(ProcessHandle, BaseAddress, NumberOfBytesToProtect, NewAccessProtection, OldAccessProtection);
}
MYNTSTATUS myNTReadVirtualMemory(
	IN HANDLE               ProcessHandle,
	IN PVOID                BaseAddress,
	OUT PVOID               Buffer,
	IN ULONG                NumberOfBytesToRead,
	OUT PULONG              NumberOfBytesReaded OPTIONAL
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, PVOID, PVOID, ULONG, PULONG);
	return ((Originfn)(fun_NTReadVirtualMemory))(ProcessHandle, BaseAddress, Buffer, NumberOfBytesToRead, NumberOfBytesReaded);
}
MYNTSTATUS myNTWriteVirtualMemory(
	IN HANDLE               ProcessHandle,
	IN PVOID                BaseAddress,
	IN PVOID                Buffer,
	IN ULONG                NumberOfBytesToWrite,
	OUT PULONG              NumberOfBytesWritten OPTIONAL
) {
	typedef MYNTSTATUS(*Originfn)(HANDLE, PVOID, PVOID, ULONG, PULONG);
	return ((Originfn)(fun_NTWriteVirtualMemory))(ProcessHandle, BaseAddress, Buffer, NumberOfBytesToWrite, NumberOfBytesWritten);
}
MYNTSTATUS myNtQueryVirtualMemory(
	IN HANDLE               ProcessHandle,
	IN PVOID                BaseAddress,
	IN ULONG64 MemoryInformationClass,
	OUT PVOID               Buffer,
	IN ULONG64                Length,
	OUT PULONG              ResultLength OPTIONAL
) {
	return fun_NtQueryVirtualMemory(ProcessHandle, BaseAddress, MemoryInformationClass, Buffer, Length, ResultLength);
}
MYNTSTATUS myNtQueryPerformanceCounter(
	_Out_     PLARGE_INTEGER PerformanceCounter,
	_Out_opt_ PLARGE_INTEGER PerformanceFrequency
) {
	return fun_NtQueryPerformanceCounter(PerformanceCounter, PerformanceFrequency);
}
MYNTSTATUS myNtAllocateVirtualMemory(
	_In_ HANDLE ProcessHandle,
	_Inout_ PVOID *BaseAddress,
	_In_ ULONG_PTR ZeroBits,
	_Inout_ PSIZE_T RegionSize,
	_In_ ULONG AllocationType,
	_In_ ULONG Protect
) {
	return fun_NtAllocateVirtualMemory(ProcessHandle, BaseAddress, ZeroBits, RegionSize, AllocationType, Protect);
}
MYNTSTATUS myNtFreeVirtualMemory(
	HANDLE  ProcessHandle,
	PVOID   *BaseAddress,
	PSIZE_T RegionSize,
	ULONG   FreeType
) {
	return fun_NtFreeVirtualMemory(ProcessHandle, BaseAddress, RegionSize, FreeType);
}
MYNTSTATUS myNtQueryObject(
	HANDLE                   Handle,
	MYOBJECT_INFORMATION_CLASS ObjectInformationClass,
	PVOID                    ObjectInformation,
	ULONG                    ObjectInformationLength,
	PULONG                   ReturnLength
) {
	return fun_NtQueryObject(Handle, ObjectInformationClass, ObjectInformation, ObjectInformationLength, ReturnLength);
}
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
	OUT PVOID lpBytesBuffer) {
	
	return fun_NtCreateThreadEx(hThread, DesiredAccess, ObjectAttributes, ProcessHandle, lpStartAddress, lpParameter, Flags, StackZeroBits, SizeOfStackCommit, SizeOfStackReserve, lpBytesBuffer);

}
#pragma clang optimize off
#pragma optimize( "", off )
static ULONG g_BuildNumber = 0;
ULONG myGetNtBuildNumber() {
	if (g_BuildNumber == 0) {
		MYRTL_OSVERSIONINFOW ow;
		ULONG64 ntdll = (ULONG64)GetMemModuleHandleA(XorStr("ntdll.dll"));
		typedef MYNTSTATUS(*fnRtlGetVersion)(MYRTL_OSVERSIONINFOW *info);
		fnRtlGetVersion fn = (fnRtlGetVersion)GetMemProcAddress((PVOID)ntdll, XorStr("RtlGetVersion"));
		if (!MYNT_SUCCESS(fn(&ow))) {
			return 0;
		}
		g_BuildNumber = ow.dwBuildNumber;
	}
	return g_BuildNumber;
}
#pragma optimize( "", on )
#pragma clang optimize on
short myGetAsyncKeyState(int vCode) {
	if (index_NtUserGetAsyncKeyState >= 0x1000 && index_NtUserGetAsyncKeyState <= 0x1FFF) {
		typedef SHORT(*Originfn)(ULONG);
		SHORT result = ((Originfn)(fun_NtUserGetAsyncKeyState))(vCode);
		return result;
	}
	return 0;
}
void mySleep(ULONG mill) {
	LARGE_INTEGER micro;
	micro.QuadPart = ((ULONG64)mill) * -10000;
	myNtDelayExecution(0, &micro);
}
BOOL myTerminateProcess(
	IN HANDLE               ProcessHandle OPTIONAL,
	IN MYNTSTATUS             ExitStatus
) {
	return (BOOL)(MYNT_SUCCESS(myNtTerminateProcess(ProcessHandle, ExitStatus)));
}
HANDLE myOpenProcess(
	_In_ DWORD dwDesiredAccess,
	_In_ BOOL bInheritHandle,
	_In_ DWORD dwProcessId
) {
	MYOBJECT_ATTRIBUTES oa;
	if (bInheritHandle) {
		MYInitializeObjectAttributes(&oa, 0, MYOBJ_INHERIT, 0, 0);
	}
	else {
		MYInitializeObjectAttributes(&oa, 0, 0, 0, 0);
	}

	MYCLIENT_ID cid;
	RtlZeroMemory(&cid, sizeof(cid));
	cid.UniqueProcess = (HANDLE)dwProcessId;
	cid.UniqueThread = 0;
	HANDLE hProcess = INVALID_HANDLE_VALUE;
	MYNTSTATUS stats = myNtOpenProcess(&hProcess, dwDesiredAccess, &oa, &cid);
	if (MYNT_SUCCESS(stats)) {
		return hProcess;
	}
	return INVALID_HANDLE_VALUE;
}
ULONG64 myGetFileSize(HANDLE hFile) {
	MYIO_STATUS_BLOCK iosb;
	FILE_STANDARD_INFORMATION info;
	MYNTSTATUS stats = myNtQueryInformationFile(hFile, &iosb, &info, sizeof(FILE_STANDARD_INFORMATION), myFileStandardInformation);
	if (MYNT_SUCCESS(stats)) {
		return info.EndOfFile.QuadPart;
	}
	return 0;
}
DWORD myGetFileAttributesW(LPCWSTR lpFileName) {
	MYOBJECT_ATTRIBUTES oa;
	MYUNICODE_STRING str;
	myRtlInitUnicodeString(&str, lpFileName);
	MYInitializeObjectAttributes(&oa, &str, MYOBJ_CASE_INSENSITIVE, 0, 0);
	FILE_BASIC_INFORMATION info;
	MYNTSTATUS stats = myNtQueryAttributesFile(&oa, &info);
	if (MYNT_SUCCESS(stats)) {
		return info.FileAttributes;
	}
	return -1;
}
DWORD myGetFileAttributesA(LPCSTR lpFileName) {
	if (strlen(lpFileName) >= 260) {
		return FALSE;
	}
	WCHAR wFileName[260];
	RtlZeroMemory(wFileName, sizeof(wFileName));

	AnsiToUnicode(lpFileName, wFileName, 260);
	return myGetFileAttributesW(wFileName);
}
BOOL myPathFileExistsW(LPCWSTR lpFileName) {
	return (BOOL)(myGetFileAttributesW(lpFileName) != (DWORD)(-1));
}
BOOL myPathFileExistsA(LPCSTR lpFileName) {
	return (BOOL)(myGetFileAttributesA(lpFileName) != (DWORD)(-1));
}
BOOL myGetTokenInformation(
	HANDLE                  TokenHandle,
	TOKEN_INFORMATION_CLASS TokenInformationClass,
	LPVOID                  TokenInformation,
	DWORD                   TokenInformationLength,
	PDWORD                  ReturnLength
) {
	MYNTSTATUS stats = myNtQueryInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength);
	return (BOOL)(MYNT_SUCCESS(stats));
}
HANDLE myCreateFileW(
	LPCWSTR               lpFileName,
	DWORD                 dwDesiredAccess,
	DWORD                 dwShareMode,
	DWORD                 dwCreationDisposition
) {
	HANDLE FileHandle = 0;
	MYUNICODE_STRING name;
	myRtlInitUnicodeString(&name, lpFileName);

	MYOBJECT_ATTRIBUTES oa;
	MYInitializeObjectAttributes(&oa, &name, MYOBJ_CASE_INSENSITIVE, 0, 0);
	MYIO_STATUS_BLOCK iosb;
	RtlZeroMemory(&iosb, sizeof(MYIO_STATUS_BLOCK));

	MYNTSTATUS stats = myNtCreateFile(&FileHandle, dwDesiredAccess, &oa, &iosb, 0, FILE_ATTRIBUTE_NORMAL, dwShareMode, dwCreationDisposition, MYFILE_SYNCHRONOUS_IO_NONALERT | MYFILE_NON_DIRECTORY_FILE, 0, 0);
	if (MYNT_SUCCESS(stats))return FileHandle;

	return INVALID_HANDLE_VALUE;
}
HANDLE myCreateFileDeviceW(
	LPCWSTR               lpFileName,
	DWORD                 dwDesiredAccess,
	DWORD                 dwShareMode,
	DWORD                 dwCreationDisposition
) {
	HANDLE FileHandle = 0;
	MYUNICODE_STRING name;
	myRtlInitUnicodeString(&name, lpFileName);

	MYOBJECT_ATTRIBUTES oa;
	MYInitializeObjectAttributes(&oa, &name, 0, 0, 0);
	MYIO_STATUS_BLOCK iosb;
	RtlZeroMemory(&iosb, sizeof(MYIO_STATUS_BLOCK));

	MYNTSTATUS stats = myNtCreateFile(&FileHandle, 3, &oa, &iosb, 0, 0, 3, 3, 0, 0, 0);
	if (MYNT_SUCCESS(stats))return FileHandle;

	return INVALID_HANDLE_VALUE;
}
HANDLE myCreateFileA(
	LPCSTR                lpFileName,
	DWORD                 dwDesiredAccess,
	DWORD                 dwShareMode,
	DWORD                 dwCreationDisposition
) {
	if (strlen(lpFileName) >= 260) {
		return INVALID_HANDLE_VALUE;
	}
	WCHAR wFileName[260];
	RtlZeroMemory(wFileName, sizeof(wFileName));

	AnsiToUnicode(lpFileName, wFileName, 260);
	return myCreateFileW(wFileName, dwDesiredAccess, dwShareMode, dwCreationDisposition);

}
HANDLE myCreateFileDeviceA(
	LPCSTR                lpFileName,
	DWORD                 dwDesiredAccess,
	DWORD                 dwShareMode,
	DWORD                 dwCreationDisposition
) {
	if (strlen(lpFileName) >= 260) {
		return INVALID_HANDLE_VALUE;
	}
	WCHAR wFileName[260];
	RtlZeroMemory(wFileName, sizeof(wFileName));

	AnsiToUnicode(lpFileName, wFileName, 260);
	return myCreateFileDeviceW(wFileName, dwDesiredAccess, dwShareMode, dwCreationDisposition);

}
BOOL myReadFile(
	_In_ HANDLE hFile,
	_Out_writes_bytes_to_opt_(nNumberOfBytesToRead, *lpNumberOfBytesRead) __out_data_source(FILE) LPVOID lpBuffer,
	_In_ DWORD nNumberOfBytesToRead,
	_Out_opt_ LPDWORD lpNumberOfBytesRead
) {
	MYIO_STATUS_BLOCK iosb;
	RtlZeroMemory(&iosb, sizeof(MYIO_STATUS_BLOCK));
	MYNTSTATUS stats = myNtReadFile(hFile, NULL, NULL, NULL, &iosb, lpBuffer, nNumberOfBytesToRead, NULL, NULL);
	if (lpNumberOfBytesRead) {
		*lpNumberOfBytesRead = iosb.Information;
	}
	return (BOOL)(MYNT_SUCCESS(stats));
}
BOOL myWriteFile(
	_In_ HANDLE hFile,
	_In_reads_bytes_opt_(nNumberOfBytesToWrite) LPCVOID lpBuffer,
	_In_ DWORD nNumberOfBytesToWrite,
	_Out_opt_ LPDWORD lpNumberOfBytesWritten
) {
	MYIO_STATUS_BLOCK iosb;
	RtlZeroMemory(&iosb, sizeof(MYIO_STATUS_BLOCK));
	MYNTSTATUS stats = myNtWriteFile(hFile, 0, 0, 0, &iosb, (PVOID)lpBuffer, nNumberOfBytesToWrite, 0, 0);
	if (lpNumberOfBytesWritten) {
		*lpNumberOfBytesWritten = iosb.Information;
	}
	return (BOOL)(MYNT_SUCCESS(stats));
}
BOOL myDeviceIoControl(
	_In_ HANDLE hDevice,
	_In_ DWORD dwIoControlCode,
	_In_reads_bytes_opt_(nInBufferSize) LPVOID lpInBuffer,
	_In_ DWORD nInBufferSize,
	_Out_writes_bytes_to_opt_(nOutBufferSize, *lpBytesReturned) LPVOID lpOutBuffer,
	_In_ DWORD nOutBufferSize,
	_Out_opt_ LPDWORD lpBytesReturned
) {
	MYIO_STATUS_BLOCK iosb;
	MYNTSTATUS stats = myNtDeviceIoControlFile(hDevice, 0, 0, 0, &iosb, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize);
	if (lpBytesReturned) {
		*lpBytesReturned = iosb.Information;
	}
	return (BOOL)(MYNT_SUCCESS(stats));
}
BOOL myDeleteFileW(LPCWSTR lpFileName) {
	
	HANDLE hFile = 0;
	MYOBJECT_ATTRIBUTES oa;
	MYUNICODE_STRING str;
	myRtlInitUnicodeString(&str, lpFileName);
	MYInitializeObjectAttributes(&oa, &str, MYOBJ_CASE_INSENSITIVE, 0, 0);
	MYIO_STATUS_BLOCK iosb;
	RtlZeroMemory(&iosb, sizeof(MYIO_STATUS_BLOCK));
	myNtOpenFile(&hFile, 0x10080, &oa, &iosb, 0, MYFILE_DELETE_ON_CLOSE);

	if (hFile == INVALID_HANDLE_VALUE) {
		return FALSE;
	}
	
	MYNTSTATUS stats = myNtClose(hFile);
	return (BOOL)(MYNT_SUCCESS(stats));
}
BOOL myDeleteFileA(LPCSTR lpFileName) {
	if (strlen(lpFileName) >= 260) {
		return FALSE;
	}
	WCHAR wFileName[260];
	RtlZeroMemory(wFileName, sizeof(wFileName));

	AnsiToUnicode(lpFileName, wFileName, 260);
	return myDeleteFileW(wFileName);

}

HANDLE myRegCreateKeyW(
	LPCWSTR KeyName,
	ACCESS_MASK DesiredAccess
) {
	MYOBJECT_ATTRIBUTES oa;
	MYUNICODE_STRING wKey;
	myRtlInitUnicodeString(&wKey, KeyName);
	
	MYInitializeObjectAttributes(&oa, &wKey, MYOBJ_CASE_INSENSITIVE, 0, 0);
	HANDLE hKey = 0;
	ULONG dis = 0;
	MYNTSTATUS stats = myNtCreateKey(&hKey, DesiredAccess, &oa, 0, 0, 0, &dis);
	//printf("status:%x\n", stats);
	//printf("keyName:%ws\n", wKey.Buffer);
	if (MYNT_SUCCESS(stats)) {
		return hKey;
	}
	return INVALID_HANDLE_VALUE;
}
HANDLE myRegCreateKeyA(
	LPCSTR KeyName,
	ACCESS_MASK DesiredAccess
) {
	if (strlen(KeyName) >= 260) {
		return INVALID_HANDLE_VALUE;
	}
	WCHAR wFileName[260];
	RtlZeroMemory(wFileName, sizeof(wFileName));

	AnsiToUnicode(KeyName, wFileName, 260);

	return myRegCreateKeyW(wFileName, DesiredAccess);

}
BOOL myRegEnumKeyW(
	HANDLE KeyHandle,
	ULONG dwIndex,
	LPWSTR lpName,
	ULONG cchName
) {
	struct {
		KEY_BASIC_INFORMATION info;
		WCHAR Str[260];
	}FullInfo;
	RtlZeroMemory(&FullInfo, sizeof(FullInfo));
	ULONG result = 0;
	MYNTSTATUS stats = myNtEnumerateKey(KeyHandle, dwIndex, KeyBasicInformation, &FullInfo, sizeof(FullInfo), &result);
	wcscpy_s(lpName, cchName, FullInfo.info.Name);
	return (BOOL)(MYNT_SUCCESS(stats));
}
BOOL myRegEnumKeyA(
	HANDLE KeyHandle,
	ULONG dwIndex,
	LPSTR lpName,
	ULONG cchName
) {
	WCHAR wStr[260];
	RtlZeroMemory(wStr, sizeof(wStr));
	BOOL result = myRegEnumKeyW(KeyHandle, dwIndex, wStr, cchName);
	if (result) {
		UnicodeToAnsi(wStr, lpName, 260);
	}
	return result;
}
BOOL myRegSetValueExW(
	_In_ HANDLE KeyHandle,
	_In_opt_ LPCWSTR lpValueName,
	_In_ DWORD dwType,
	_In_reads_bytes_opt_(cbData) CONST BYTE* lpData,
	_In_ DWORD cbData
) {
	MYUNICODE_STRING str;
	myRtlInitUnicodeString(&str, lpValueName);
	MYNTSTATUS stats = myNtSetValueKey(KeyHandle, &str, 0, dwType, (PVOID)lpData, cbData);
	return (BOOL)(MYNT_SUCCESS(stats));
}
BOOL myRegSetValueExA(
	_In_ HANDLE KeyHandle,
	_In_opt_ LPCSTR lpValueName,
	_In_ DWORD dwType,
	_In_reads_bytes_opt_(cbData) CONST BYTE* lpData,
	_In_ DWORD cbData
) {
	if (strlen(lpValueName) >= 260) {
		return FALSE;
	}
	WCHAR wFileName[260];
	RtlZeroMemory(wFileName, sizeof(wFileName));

	AnsiToUnicode(lpValueName, wFileName, 260);
	return myRegSetValueExW(KeyHandle, wFileName, dwType, lpData, cbData);
}
BOOL myRegQueryValueExW(
	_In_ HANDLE KeyHandle,
	_In_opt_ LPCWSTR lpValueName,
	_Out_opt_ LPDWORD lpType,
	_Out_writes_bytes_to_opt_(*lpcbData, *lpcbData) __out_data_source(REGISTRY) LPBYTE lpData,
	_When_(lpData == NULL, _Out_opt_) _When_(lpData != NULL, _Inout_opt_) LPDWORD lpcbData
) {
	struct {
		KEY_VALUE_FULL_INFORMATION info;
		UCHAR Data[0x400];
	}FullInfo;
	RtlZeroMemory(&FullInfo, sizeof(FullInfo));
	MYUNICODE_STRING str;
	myRtlInitUnicodeString(&str, lpValueName);
	ULONG Lenth = 0;
	MYNTSTATUS stats = myNtQueryValueKey(KeyHandle, &str, KeyValueFullInformation, &FullInfo, sizeof(FullInfo), &Lenth);
	if (!MYNT_SUCCESS(stats)) {
		return FALSE;
	}
	ULONG buffersize = *lpcbData;
	ULONG DataLenth = FullInfo.info.DataLength;
	if (DataLenth > buffersize) {
		*lpcbData = DataLenth;
		return FALSE;
	}
	PVOID pData = ((PUCHAR)&FullInfo) + FullInfo.info.DataOffset;
	memcpy(lpData, pData, DataLenth);
	if (lpType) {
		*lpType = FullInfo.info.Type;
	}
	*lpcbData = DataLenth;
	return (BOOL)(MYNT_SUCCESS(stats));
}
BOOL myRegQueryValueExA(
	_In_ HANDLE KeyHandle,
	_In_opt_ LPCSTR lpValueName,
	_Out_opt_ LPDWORD lpType,
	_Out_writes_bytes_to_opt_(*lpcbData, *lpcbData) __out_data_source(REGISTRY) LPBYTE lpData,
	_When_(lpData == NULL, _Out_opt_) _When_(lpData != NULL, _Inout_opt_) LPDWORD lpcbData
) {
	if (strlen(lpValueName) >= 260) {
		return FALSE;
	}
	WCHAR wFileName[260];
	RtlZeroMemory(wFileName, sizeof(wFileName));

	AnsiToUnicode(lpValueName, wFileName, 260);
	return myRegQueryValueExW(KeyHandle, wFileName, lpType, lpData, lpcbData);
}
BOOL myOpenProcessToken(
	_In_ HANDLE ProcessHandle,
	_In_ DWORD DesiredAccess,
	_Outptr_ PHANDLE TokenHandle
) {
	return (BOOL)(MYNT_SUCCESS(myNtOpenProcessToken(ProcessHandle, DesiredAccess, TokenHandle)));
}
BOOL myAdjustTokenPrivileges(
	_In_ HANDLE TokenHandle,
	_In_ BOOL DisableAllPrivileges,
	_In_opt_ PTOKEN_PRIVILEGES NewState,
	_In_ DWORD BufferLength,
	_Out_writes_bytes_to_opt_(BufferLength, *ReturnLength) PTOKEN_PRIVILEGES PreviousState,
	_Out_opt_ PDWORD ReturnLength
) {
	return (BOOL)(MYNT_SUCCESS(myNtAdjustPrivilegesToken(TokenHandle, DisableAllPrivileges, NewState, BufferLength, PreviousState, ReturnLength)));
}
BOOL myCloseHandle(HANDLE Handle) {
	return (BOOL)(MYNT_SUCCESS(myNtClose(Handle)));
}
BOOL myVirtualProtect(
	LPVOID lpAddress,
	SIZE_T dwSize,
	DWORD  flNewProtect,
	PDWORD lpflOldProtect
) {
	LPVOID Address = lpAddress;
	SIZE_T Num = dwSize;
	MYNTSTATUS stats = myNtProtectVirtualMemory((HANDLE)-1, &Address, (PULONG)&Num, flNewProtect, lpflOldProtect);
	//printf("status:%x\n", stats);
	return (BOOL)(MYNT_SUCCESS(stats));
}
SIZE_T myVirtualQuery(LPCVOID lpAddress, PMEMORY_BASIC_INFORMATION lpBuffer, SIZE_T dwLength) {
	unsigned int v3; // eax
	SIZE_T v5; // [rsp+58h] [rbp+20h]

	v3 = myNtQueryVirtualMemory((HANDLE)-1, (PVOID)lpAddress, 0, lpBuffer, dwLength, (PULONG)&v5);
	if ((v3 & 0x80000000) == 0)
		return v5;
	return 0;
}
ULONG myGetCurrentThreadId() {
	PMYTEB self = (PMYTEB)__readgsqword(0x30);
	return (ULONG)self->ClientId.UniqueThread;
}

