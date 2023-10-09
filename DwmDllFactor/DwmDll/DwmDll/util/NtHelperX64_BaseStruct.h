#pragma once
#ifndef _NTHELPER_BASESTRUCT__INCLUDED__
#define _NTHELPER_BASESTRUCT__INCLUDED__

#include "windef.h"
//#include "winternl.h"

typedef LONG MYKPRIORITY;
typedef LONG MYNTSTATUS;

#define MYNT_SUCCESS(Status) ((MYNTSTATUS)(Status) >= 0)
#define MYInitializeObjectAttributes(p,n,a,r,s) \
{ \
	(p)->Length = sizeof(MYOBJECT_ATTRIBUTES); \
	(p)->ObjectName = n; \
	(p)->Attributes = a; \
	(p)->RootDirectory = r; \
	(p)->SecurityDescriptor = s; \
	(p)->SecurityQualityOfService = NULL; \
}
#define MYOBJ_INHERIT                         0x00000002L
#define MYOBJ_PERMANENT                       0x00000010L
#define MYOBJ_EXCLUSIVE                       0x00000020L
#define MYOBJ_CASE_INSENSITIVE                0x00000040L
#define MYOBJ_OPENIF                          0x00000080L
#define MYOBJ_OPENLINK                        0x00000100L
#define MYOBJ_KERNEL_HANDLE                   0x00000200L
#define MYOBJ_FORCE_ACCESS_CHECK              0x00000400L
#define MYOBJ_IGNORE_IMPERSONATED_DEVICEMAP   0x00000800L
#define MYOBJ_DONT_REPARSE                    0x00001000L
#define MYOBJ_VALID_ATTRIBUTES                0x00001FF2L
//
// Define the create/open option flags
//

#define MYFILE_DIRECTORY_FILE                     0x00000001
#define MYFILE_WRITE_THROUGH                      0x00000002
#define MYFILE_SEQUENTIAL_ONLY                    0x00000004
#define MYFILE_NO_INTERMEDIATE_BUFFERING          0x00000008

#define MYFILE_SYNCHRONOUS_IO_ALERT               0x00000010
#define MYFILE_SYNCHRONOUS_IO_NONALERT            0x00000020
#define MYFILE_NON_DIRECTORY_FILE                 0x00000040
#define MYFILE_CREATE_TREE_CONNECTION             0x00000080

#define MYFILE_COMPLETE_IF_OPLOCKED               0x00000100
#define MYFILE_NO_EA_KNOWLEDGE                    0x00000200
#define MYFILE_OPEN_REMOTE_INSTANCE               0x00000400
#define MYFILE_RANDOM_ACCESS                      0x00000800

#define MYFILE_DELETE_ON_CLOSE                    0x00001000
#define MYFILE_OPEN_BY_FILE_ID                    0x00002000
#define MYFILE_OPEN_FOR_BACKUP_INTENT             0x00004000
#define MYFILE_NO_COMPRESSION                     0x00008000

#if (_WIN32_WINNT >= _WIN32_WINNT_WIN7)
#define MYFILE_OPEN_REQUIRING_OPLOCK              0x00010000
#endif

#define MYFILE_RESERVE_OPFILTER                   0x00100000
#define MYFILE_OPEN_REPARSE_POINT                 0x00200000
#define MYFILE_OPEN_NO_RECALL                     0x00400000
#define MYFILE_OPEN_FOR_FREE_SPACE_QUERY          0x00800000

#define MYFILE_VALID_OPTION_FLAGS                 0x00ffffff
#define MYFILE_VALID_PIPE_OPTION_FLAGS            0x00000032
#define MYFILE_VALID_MAILSLOT_OPTION_FLAGS        0x00000032
#define MYFILE_VALID_SET_FLAGS                    0x00000036

typedef struct _MYOSVERSIONINFOW {
	ULONG dwOSVersionInfoSize;
	ULONG dwMajorVersion;
	ULONG dwMinorVersion;
	ULONG dwBuildNumber;
	ULONG dwPlatformId;
	WCHAR  szCSDVersion[128];     // Maintenance string for PSS usage
} MYOSVERSIONINFOW, * PMYOSVERSIONINFOW, * LPMYOSVERSIONINFOW, MYRTL_OSVERSIONINFOW, * PMYRTL_OSVERSIONINFOW;

typedef struct _MYSTRING
{
	/*+0x000*/    USHORT Length;
	/*+0x002*/    USHORT MaximumLength;
	/*+0x008*/    PCHAR Buffer;
}MYSTRING, * PMYSTRING;
typedef struct _MYSTRING32
{
	/*+0x000*/    USHORT Length;
	/*+0x002*/    USHORT MaximumLength;
	/*+0x004*/    ULONG Buffer;
}MYSTRING32, * PMYSTRING32;
typedef struct _MYSTRING64
{
	/*+0x000*/    USHORT Length;
	/*+0x002*/    USHORT MaximumLength;
	/*+0x008*/    UINT64 Buffer;
}MYSTRING64, * PMYSTRING64;
typedef struct _MYUNICODE_STRING32
{
	USHORT Length;
	USHORT MaximumLength;
	ULONG Buffer;
} MYUNICODE_STRING32, * PMYUNICODE_STRING32;

typedef struct _MYPEB32
{
	UCHAR InheritedAddressSpace;
	UCHAR ReadImageFileExecOptions;
	UCHAR BeingDebugged;
	UCHAR BitField;
	ULONG Mutant;
	ULONG ImageBaseAddress;
	ULONG Ldr;
	ULONG ProcessParameters;
	ULONG SubSystemData;
	ULONG ProcessHeap;
	ULONG FastPebLock;
	ULONG AtlThunkSListPtr;
	ULONG IFEOKey;
	ULONG CrossProcessFlags;
	ULONG UserSharedInfoPtr;
	ULONG SystemReserved;
	ULONG AtlThunkSListPtr32;
	ULONG ApiSetMap;
} MYPEB32, * PMYPEB32;

typedef struct _MYPEB_LDR_DATA32
{
	ULONG Length;
	BOOLEAN Initialized;
	ULONG SsHandle;
	LIST_ENTRY32 InLoadOrderModuleList;
	LIST_ENTRY32 InMemoryOrderModuleList;
	LIST_ENTRY32 InInitializationOrderModuleList;
	ULONG EntryInProgress;
} MYPEB_LDR_DATA32, * PMYPEB_LDR_DATA32;
typedef struct _MYLDR_DATA_TABLE_ENTRY32
{
	LIST_ENTRY32 InLoadOrderLinks;
	LIST_ENTRY32 InMemoryOrderModuleList;
	LIST_ENTRY32 InInitializationOrderModuleList;
	ULONG DllBase;
	ULONG EntryPoint;
	ULONG SizeOfImage;
	MYUNICODE_STRING32 FullDllName;
	MYUNICODE_STRING32 BaseDllName;
	ULONG Flags;
	USHORT LoadCount;
	USHORT TlsIndex;
	union
	{
		LIST_ENTRY32 HashLinks;
		ULONG SectionPointer;
	};
	ULONG CheckSum;
	union
	{
		ULONG TimeDateStamp;
		ULONG LoadedImports;
	};
	ULONG EntryPointActivationContext;
	ULONG PatchInformation;
} MYLDR_DATA_TABLE_ENTRY32, * PMYLDR_DATA_TABLE_ENTRY32;

typedef struct _MYUNICODE_STRING {
	USHORT Length;
	USHORT MaximumLength;
	PWSTR  Buffer;
} MYUNICODE_STRING, * PMYUNICODE_STRING;

typedef struct _MYUNICODE_STRING64 {
	USHORT Length;
	USHORT MaximumLength;
	ULONGLONG  Buffer;
} MYUNICODE_STRING64, * PMYUNICODE_STRING64;
typedef struct _MYPEB_LDR_DATA64
{
	DWORD Length;
	UCHAR Initialized;
	ULONGLONG SsHandle;
	LIST_ENTRY64 InLoadOrderModuleList;
	LIST_ENTRY64 InMemoryOrderModuleList;
	LIST_ENTRY64 InInitializationOrderModuleList;
	ULONGLONG EntryInProgress;
}MYPEB_LDR_DATA64, * PMYPEB_LDR_DATA64;

typedef struct _MYLDR_DATA_TABLE_ENTRY64
{
	LIST_ENTRY64 InLoadOrderLinks;
	LIST_ENTRY64 InMemoryOrderLinks;
	LIST_ENTRY64 InInitializationOrderLinks;
	ULONGLONG DllBase;
	ULONGLONG EntryPoint;
	DWORD SizeOfImage;
	MYUNICODE_STRING64 FullDllName;
	MYUNICODE_STRING64 BaseDllName;
	DWORD Flags;
	WORD LoadCount;
	WORD TlsIndex;
	LIST_ENTRY64 HashLinks;
	ULONGLONG SectionPointer;
	DWORD CheckSum;
	DWORD TimeDateStamp;
	ULONGLONG LoadedImports;
	ULONGLONG EntryPointActivationContext;
	ULONGLONG PatchInformation;
}MYLDR_DATA_TABLE_ENTRY64, * PMYLDR_DATA_TABLE_ENTRY64;

typedef struct _MYPEB64
{
	UCHAR InheritedAddressSpace;
	UCHAR ReadImageFileExecOptions;
	UCHAR BeingDebugged;
	UCHAR SpareBool;
	ULONGLONG Mutant;
	ULONGLONG ImageBaseAddress;
	ULONGLONG Ldr;
}MYPEB64, * PMYPEB64;

typedef struct _MYPEB_LDR_DATA
{
	DWORD Length;
	UCHAR Initialized;
	PVOID SsHandle;
	LIST_ENTRY InLoadOrderModuleList;
	LIST_ENTRY InMemoryOrderModuleList;
	LIST_ENTRY InInitializationOrderModuleList;
	PVOID EntryInProgress;
}MYPEB_LDR_DATA, * PMYPEB_LDR_DATA;

typedef struct _MYLDR_DATA_TABLE_ENTRY
{
	LIST_ENTRY InLoadOrderLinks;
	LIST_ENTRY InMemoryOrderLinks;
	LIST_ENTRY InInitializationOrderLinks;
	PVOID DllBase;
	PVOID EntryPoint;
	DWORD SizeOfImage;
	MYUNICODE_STRING FullDllName;
	MYUNICODE_STRING BaseDllName;
	DWORD Flags;
	WORD LoadCount;
	WORD TlsIndex;
	LIST_ENTRY HashLinks;
	PVOID SectionPointer;
	DWORD CheckSum;
	DWORD TimeDateStamp;
	PVOID LoadedImports;
	PVOID EntryPointActivationContext;
	PVOID PatchInformation;
}MYLDR_DATA_TABLE_ENTRY, * PMYLDR_DATA_TABLE_ENTRY;
typedef struct _MYCURDIR
{
	/*+0x000*/    struct _MYUNICODE_STRING DosPath;
	/*+0x010*/    PVOID Handle;
}MYCURDIR, * PMYCURDIR;

typedef struct _MYRTL_DRIVE_LETTER_CURDIR
{
	/*+0x000*/    USHORT Flags;
	/*+0x002*/    USHORT Length;
	/*+0x004*/    ULONG TimeStamp;
	/*+0x008*/    struct _MYSTRING DosPath;
}MYRTL_DRIVE_LETTER_CURDIR, * PMYRTL_DRIVE_LETTER_CURDIR;
typedef struct _MYRTL_USER_PROCESS_PARAMETERS
{
	/*+0x000*/    ULONG MaximumLength;
	/*+0x004*/    ULONG Length;
	/*+0x008*/    ULONG Flags;
	/*+0x00c*/    ULONG DebugFlags;
	/*+0x010*/    PVOID ConsoleHandle;
	/*+0x018*/    ULONG ConsoleFlags;
	/*+0x020*/    PVOID StandardInput;
	/*+0x028*/    PVOID StandardOutput;
	/*+0x030*/    PVOID StandardError;
	/*+0x038*/    struct _MYCURDIR CurrentDirectory;
	/*+0x050*/    struct _MYUNICODE_STRING DllPath;
	/*+0x060*/    struct _MYUNICODE_STRING ImagePathName;
	/*+0x070*/    struct _MYUNICODE_STRING CommandLine;
	/*+0x080*/    PVOID Environment;
	/*+0x088*/    ULONG StartingX;
	/*+0x08c*/    ULONG StartingY;
	/*+0x090*/    ULONG CountX;
	/*+0x094*/    ULONG CountY;
	/*+0x098*/    ULONG CountCharsX;
	/*+0x09c*/    ULONG CountCharsY;
	/*+0x0a0*/    ULONG FillAttribute;
	/*+0x0a4*/    ULONG WindowFlags;
	/*+0x0a8*/    ULONG ShowWindowFlags;
	/*+0x0b0*/    struct _MYUNICODE_STRING WindowTitle;
	/*+0x0c0*/    struct _MYUNICODE_STRING DesktopInfo;
	/*+0x0d0*/    struct _MYUNICODE_STRING ShellInfo;
	/*+0x0e0*/    struct _MYUNICODE_STRING RuntimeData;
	/*+0x0f0*/    struct _MYRTL_DRIVE_LETTER_CURDIR CurrentDirectores[32];
	/*+0x3f0*/    UINT64 EnvironmentSize;
	/*+0x3f8*/    UINT64 EnvironmentVersion;
	/*+0x400*/    PVOID PackageDependencyData;
	/*+0x408*/    ULONG ProcessGroupId;
	/*+0x40c*/    ULONG LoaderThreads;
	/*+0x410*/    struct _MYUNICODE_STRING RedirectionDllName;
}MYRTL_USER_PROCESS_PARAMETERS, * PMYRTL_USER_PROCESS_PARAMETERS;
typedef struct _MYPEB
{
	UCHAR InheritedAddressSpace;
	UCHAR ReadImageFileExecOptions;
	UCHAR BeingDebugged;
	UCHAR SpareBool;
	PVOID Mutant;
	PVOID ImageBaseAddress;
	PMYPEB_LDR_DATA Ldr;
	PMYRTL_USER_PROCESS_PARAMETERS ProcessParameters;
}MYPEB, * PMYPEB;




typedef enum _KEY_VALUE_INFORMATION_CLASS {
	KeyValueBasicInformation,
	KeyValueFullInformation,
	KeyValuePartialInformation,
	KeyValueFullInformationAlign64,
	KeyValuePartialInformationAlign64,
	KeyValueLayerInformation,
	MaxKeyValueInfoClass
} KEY_VALUE_INFORMATION_CLASS;
typedef struct _KEY_VALUE_FULL_INFORMATION {
	ULONG TitleIndex;
	ULONG Type;
	ULONG DataOffset;
	ULONG DataLength;
	ULONG NameLength;
	WCHAR Name[1];
} KEY_VALUE_FULL_INFORMATION, * PKEY_VALUE_FULL_INFORMATION;
typedef enum _KEY_INFORMATION_CLASS {
	KeyBasicInformation,
	KeyNodeInformation,
	KeyFullInformation,
	KeyNameInformation,
	KeyCachedInformation,
	KeyFlagsInformation,
	KeyVirtualizationInformation,
	KeyHandleTagsInformation,
	KeyTrustInformation,
	KeyLayerInformation,
	MaxKeyInfoClass
} KEY_INFORMATION_CLASS;
typedef struct _KEY_BASIC_INFORMATION {
	LARGE_INTEGER LastWriteTime;
	ULONG         TitleIndex;
	ULONG         NameLength;
	WCHAR         Name[1];
} KEY_BASIC_INFORMATION, * PKEY_BASIC_INFORMATION;
typedef struct _KEY_VALUE_BASIC_INFORMATION {
	ULONG TitleIndex;
	ULONG Type;
	ULONG NameLength;
	WCHAR Name[1];
} KEY_VALUE_BASIC_INFORMATION, * PKEY_VALUE_BASIC_INFORMATION;

typedef struct _FILE_BASIC_INFORMATION {
	LARGE_INTEGER CreationTime;
	LARGE_INTEGER LastAccessTime;
	LARGE_INTEGER LastWriteTime;
	LARGE_INTEGER ChangeTime;
	ULONG         FileAttributes;
} FILE_BASIC_INFORMATION, * PFILE_BASIC_INFORMATION;
typedef struct _FILE_STANDARD_INFORMATION {
	LARGE_INTEGER AllocationSize;
	LARGE_INTEGER EndOfFile;
	ULONG         NumberOfLinks;
	BOOLEAN       DeletePending;
	BOOLEAN       Directory;
} FILE_STANDARD_INFORMATION, * PFILE_STANDARD_INFORMATION;

typedef enum _MYSYSTEM_INFORMATION_CLASS {
	mySystemBasicInformation = 0,
	mySystemProcessorInformation,
	mySystemPerformanceInformation,
	mySystemTimeOfDayInformation,
	mySystemPathInformation,
	mySystemProcessInformation,
	mySystemCallCountInformation,
	mySystemDeviceInformation,
	mySystemProcessorPerformanceInformation,
	mySystemFlagsInformation,
	mySystemCallTimeInformation,
	mySystemModuleInformation,
	mySystemLocksInformation,
	mySystemStackTraceInformation,
	mySystemPagedPoolInformation,
	mySystemNonPagedPoolInformation,
	mySystemHandleInformation,
	mySystemObjectInformation,
	mySystemPageFileInformation,
	mySystemVdmInstemulInformation,
	mySystemVdmBopInformation,
	mySystemFileCacheInformation,
	mySystemPoolTagInformation,
	mySystemInterruptInformation,
	mySystemDpcBehaviorInformation,
	mySystemFullMemoryInformation,
	mySystemLoadGdiDriverInformation,
	mySystemUnloadGdiDriverInformation,
	mySystemTimeAdjustmentInformation,
	mySystemSummaryMemoryInformation,
	mySystemNextEventIdInformation,
	mySystemEventIdsInformation,
	mySystemCrashDumpInformation,
	mySystemExceptionInformation,
	mySystemCrashDumpStateInformation,
	mySystemKernelDebuggerInformation,
	mySystemContextSwitchInformation,
	mySystemRegistryQuotaInformation,
	mySystemExtendServiceTableInformation,
	mySystemPrioritySeperation,
	mySystemPlugPlayBusInformation,
	mySystemDockInformation,
	mySystemPowerInformation,
	mySystemProcessorSpeedInformation,
	mySystemCurrentTimeZoneInformation,
	mySystemLookasideInformation
} MYSYSTEM_INFORMATION_CLASS, * PMYSYSTEM_INFORMATION_CLASS;


typedef struct _MYSYSTEM_PROCESS_INFORMATION {
	ULONG NextEntryOffset;
	ULONG NumberOfThreads;
	BYTE Reserved1[48];
	MYUNICODE_STRING ImageName;
	MYKPRIORITY BasePriority;
	HANDLE UniqueProcessId;
	PVOID Reserved2;
	ULONG HandleCount;
	ULONG SessionId;
	PVOID Reserved3;
	SIZE_T PeakVirtualSize;
	SIZE_T VirtualSize;
	ULONG Reserved4;
	SIZE_T PeakWorkingSetSize;
	SIZE_T WorkingSetSize;
	PVOID Reserved5;
	SIZE_T QuotaPagedPoolUsage;
	PVOID Reserved6;
	SIZE_T QuotaNonPagedPoolUsage;
	SIZE_T PagefileUsage;
	SIZE_T PeakPagefileUsage;
	SIZE_T PrivatePageCount;
	LARGE_INTEGER Reserved7[6];
} MYSYSTEM_PROCESS_INFORMATION, * PMYSYSTEM_PROCESS_INFORMATION;

typedef enum _MYFILE_INFORMATION_CLASS {
	myFileDirectoryInformation = 1,
	myFileFullDirectoryInformation,
	myFileBothDirectoryInformation,
	myFileBasicInformation,
	myFileStandardInformation,
	myFileInternalInformation,
	myFileEaInformation,
	myFileAccessInformation,
	myFileNameInformation,
	myFileRenameInformation,
	myFileLinkInformation,
	myFileNamesInformation,
	myFileDispositionInformation,
	myFilePositionInformation,
	myFileFullEaInformation,
	myFileModeInformation,
	myFileAlignmentInformation,
	myFileAllInformation,
	myFileAllocationInformation,
	myFileEndOfFileInformation,
	myFileAlternateNameInformation,
	myFileStreamInformation,
	myFilePipeInformation,
	myFilePipeLocalInformation,
	myFilePipeRemoteInformation,
	myFileMailslotQueryInformation,
	myFileMailslotSetInformation,
	myFileCompressionInformation,
	myFileObjectIdInformation,
	myFileCompletionInformation,
	myFileMoveClusterInformation,
	myFileQuotaInformation,
	myFileReparsePointInformation,
	myFileNetworkOpenInformation,
	myFileAttributeTagInformation,
	myFileTrackingInformation,
	myFileIdBothDirectoryInformation,
	myFileIdFullDirectoryInformation,
	myFileValidDataLengthInformation,
	myFileShortNameInformation,
	myFileIoCompletionNotificationInformation,
	myFileIoStatusBlockRangeInformation,
	myFileIoPriorityHintInformation,
	myFileSfioReserveInformation,
	myFileSfioVolumeInformation,
	myFileHardLinkInformation,
	myFileProcessIdsUsingFileInformation,
	myFileNormalizedNameInformation,
	myFileNetworkPhysicalNameInformation,
	myFileIdGlobalTxDirectoryInformation,
	myFileIsRemoteDeviceInformation,
	myFileUnusedInformation,
	myFileNumaNodeInformation,
	myFileStandardLinkInformation,
	myFileRemoteProtocolInformation,
	myFileRenameInformationBypassAccessCheck,
	myFileLinkInformationBypassAccessCheck,
	myFileVolumeNameInformation,
	myFileIdInformation,
	myFileIdExtdDirectoryInformation,
	myFileReplaceCompletionInformation,
	myFileHardLinkFullIdInformation,
	myFileIdExtdBothDirectoryInformation,
	myFileDispositionInformationEx,
	myFileRenameInformationEx,
	myFileRenameInformationExBypassAccessCheck,
	myFileDesiredStorageClassInformation,
	myFileStatInformation,
	myFileMemoryPartitionInformation,
	myFileStatLxInformation,
	myFileCaseSensitiveInformation,
	myFileLinkInformationEx,
	myFileLinkInformationExBypassAccessCheck,
	myFileStorageReserveIdInformation,
	myFileCaseSensitiveInformationForceAccessCheck,
	myFileMaximumInformation
} MYFILE_INFORMATION_CLASS, * PMYFILE_INFORMATION_CLASS;
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
	MYUNICODE_STRING TypeName;
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

typedef struct _MYOBJECT_BASIC_INFORMATION
{
	ULONG Attributes;
	ACCESS_MASK GrantedAccess;
	ULONG HandleCount;
	ULONG PointerCount;
	ULONG PagedPoolUsage;
	ULONG NonPagedPoolUsage;
	ULONG Reserved[3];
	ULONG NameInformationLength;
	ULONG TypeInformationLength;
	ULONG SecurityDescriptorLength;
	LARGE_INTEGER CreateTime;
} MYOBJECT_BASIC_INFORMATION, * PMYOBJECT_BASIC_INFORMATION;

typedef struct _MYOBJECT_NAME_INFORMATION
{
	MYUNICODE_STRING Name;
} MYOBJECT_NAME_INFORMATION, * PMYOBJECT_NAME_INFORMATION;

typedef struct _MYCLIENT_ID {
	HANDLE UniqueProcess;
	HANDLE UniqueThread;
} MYCLIENT_ID, * PMYCLIENT_ID;

typedef struct _MYNT_TIB {
	PVOID ExceptionList;
	PVOID StackBase;
	PVOID StackLimit;
	PVOID SubSystemTib;
#if defined(_MSC_EXTENSIONS)
	union {
		PVOID FiberData;
		DWORD Version;
	};
#else
	PVOID FiberData;
#endif
	PVOID ArbitraryUserPointer;
	struct _MYNT_TIB* Self;
} MYNT_TIB;
typedef struct _MYTEB
{
	/*+0x000*/    MYNT_TIB NtTib;
	/*+0x038*/    PVOID EnvironmentPointer;
	/*+0x040*/    MYCLIENT_ID ClientId;
	/*+0x050*/    PVOID ActiveRpcHandle;
	/*+0x058*/    PVOID ThreadLocalStoragePointer;
	/*+0x060*/    PMYPEB ProcessEnvironmentBlock;
	/*+0x068*/    ULONG LastErrorValue;
	/*+0x06c*/    ULONG CountOfOwnedCriticalSections;
	/*+0x070*/    PVOID CsrClientThread;
	/*+0x078*/    PVOID Win32ThreadInfo;
}MYTEB, * PMYTEB;
typedef enum _MYMEMORY_INFORMATION_CLASS {
	myMemoryBasicInformation
} MYMEMORY_INFORMATION_CLASS, * PMYMEMORY_INFORMATION_CLASS;

typedef struct _MYOBJECT_ATTRIBUTES
{
	ULONG Length;
	PVOID RootDirectory;
	PMYUNICODE_STRING ObjectName;
	ULONG Attributes;
	PVOID SecurityDescriptor;
	PVOID SecurityQualityOfService;
} MYOBJECT_ATTRIBUTES, * PMYOBJECT_ATTRIBUTES;
typedef struct _MYIO_STATUS_BLOCK {
	union {
		MYNTSTATUS Status;
		PVOID Pointer;
	};
	ULONG_PTR Information;
} MYIO_STATUS_BLOCK, * PMYIO_STATUS_BLOCK;

typedef struct _MYSYSTEM_HANDLE_INFORMATION {
	USHORT ProcessId;
	USHORT CreatorBackTraceIndex;
	UCHAR ObjectTypeNumber;
	UCHAR Flags;
	USHORT Handle;
	PVOID Object;
	ACCESS_MASK GrantedAccess;
} MYSYSTEM_HANDLE_INFORMATION, * PMYSYSTEM_HANDLE_INFORMATION;
typedef struct _MYSYSTEM_HANDLE_INFORMATION_EX {
	ULONG NumberOfHandles;
	MYSYSTEM_HANDLE_INFORMATION Information[1];
} MYSYSTEM_HANDLE_INFORMATION_EX, * PMYSYSTEM_HANDLE_INFORMATION_EX;
typedef struct _MYPUBLIC_OBJECT_TYPE_INFORMATION {
	MYUNICODE_STRING TypeName;
	ULONG          Reserved[22];
} MYPUBLIC_OBJECT_TYPE_INFORMATION, * PMYPUBLIC_OBJECT_TYPE_INFORMATION;

typedef
VOID
(NTAPI* PMYIO_APC_ROUTINE) (
	IN PVOID ApcContext,
	IN PMYIO_STATUS_BLOCK IoStatusBlock,
	IN ULONG Reserved
	);

#endif // !_NTHELPER_BASESTRUCT__INCLUDED__
