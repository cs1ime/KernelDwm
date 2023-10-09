#include "LoadMemLibrary.h"
#include "windows.h"

typedef struct _MYSTRING
{
	/*+0x000*/    USHORT Length;
	/*+0x002*/    USHORT MaximumLength;
	/*+0x008*/    PCHAR Buffer;
}MYSTRING, * PMYSTRING;

typedef struct _MYUNICODE_STRING {
	USHORT Length;
	USHORT MaximumLength;
	PWSTR  Buffer;
} MYUNICODE_STRING, * PMYUNICODE_STRING;

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
#include "intrin.h"
PMYPEB GetPeb() {

#ifdef _WIN64
	return (PMYPEB)__readgsqword(0x60);
#else
	return (PMYPEB)__readfsdword(0x30);
#endif // _AMD64

}
#include "stdio.h"

int mywcslen(LPCWSTR str) {
	int cnt = 0;
	while (*str++) {
		cnt++;
	}
	return cnt;
}
WCHAR wcharlow(WCHAR c) {
	if (c >= L'A' && c <= L'Z') {
		return c - 'A' + 'a';
	}
	return c;
}
bool mywcscmpi(LPCWSTR str1, LPCWSTR str2) {
	int len1 = mywcslen(str1);
	int len2 = mywcslen(str2);

	if (len1 == len2) {
		for (int i = 0; i < len1; i++) {
			WCHAR low1 = wcharlow(str1[i]);
			WCHAR low2 = wcharlow(str2[i]);
			if (low1 != low2) {
				return false;
			}
		}
		return true;
	}
	return false;
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
PVOID GetMemModuleHandleW(LPCWSTR ModuleName) {
    
	PMYPEB peb = GetPeb();
	if (peb) {
		PMYPEB_LDR_DATA ldr = (PMYPEB_LDR_DATA)peb->Ldr;
		if (ldr) {
			PLIST_ENTRY First = &ldr->InLoadOrderModuleList;
			PLIST_ENTRY query = First->Blink;

			while (First != query && query) {
				PMYLDR_DATA_TABLE_ENTRY entry = (PMYLDR_DATA_TABLE_ENTRY)query;
				WCHAR name[80];
				RtlZeroMemory(name, sizeof(name));
				PMYUNICODE_STRING Name = &entry->BaseDllName;
				if (Name->Buffer && Name->Length < sizeof(name)) {
					memcpy(name, Name->Buffer, Name->Length);
					if (StrStrIW(name, ModuleName)) {
						return entry->DllBase;
					}
				}
				query = query->Blink;
			}

		}
	}
	return NULL;
}
void Ansi2Unicode(LPCSTR ansi, LPWSTR uni, SIZE_T max_char_cnt) {
	int len = strlen(ansi);
	if (len >= max_char_cnt)
		return;
	for (int i = 0; i < len; i++) {
		uni[i] = ansi[i];
	}
	uni[len] = 0;
}
PVOID GetMemModuleHandleA(LPCSTR ModuleName) {
	WCHAR wModuleName[81];
	memset(wModuleName, 0, sizeof(wModuleName));
	Ansi2Unicode(ModuleName, wModuleName, 80);

	return GetMemModuleHandleW(wModuleName);
}
PVOID GetMemProcAddress(PVOID pModule, LPCSTR ProcName) {
    PUCHAR uModule = (PUCHAR)pModule;

    IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)uModule;
    IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(idh->e_lfanew + uModule);
    IMAGE_EXPORT_DIRECTORY* ied = (IMAGE_EXPORT_DIRECTORY*)(inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + uModule);
    if (ied) {
        PULONG pNameList = (PULONG)(ied->AddressOfNames + uModule);
        PWORD pIndices = (PWORD)(ied->AddressOfNameOrdinals + uModule);
        PULONG pAddress = (PULONG)(ied->AddressOfFunctions + uModule);
        for (int i = 0; i < ied->NumberOfNames; i++) {
            ULONG NameRva = pNameList[i];
            if (NameRva) {
                LPCSTR Name = (LPCSTR)(uModule + NameRva);
                //printf("%s\n", Name);
                if (!strcmp(Name, ProcName)) {
                    WORD idx = pIndices[i];
                    PVOID result = pAddress[idx] + (PUCHAR)uModule;
                    LPCSTR addr = pAddress[idx] + (LPCSTR)uModule;

                    LONG last_len = 0;
                    bool is_bound = false;
                    for (int j = 0; j < 100; j++) {
                        if ((addr[j] >= '0' && addr[j] <= '9') || (addr[j] >= 'a' && addr[j] <= 'z') || (addr[j] >= 'A' && addr[j] <= 'Z')) {
                            last_len++;
                            continue;
                        }
                        if (addr[j] == '.') {
                            if (last_len > 0) {
                                is_bound = true;
                            }
                            break;
                            //continue;
                        }
                        break;
                    }
                    if (is_bound && last_len > 0) {
                        CHAR DllName[260];
                        memcpy(DllName, addr, last_len);
                        *(ULONG*)(DllName + last_len) = 'lld.';
                        DllName[last_len + 4] = 0;
                        LPCSTR NewFuncName = addr + last_len + 1;
                        //printf("%s\n", DllName);
                        //printf("%s\n", NewFuncName);
                        PVOID NewModuleAddress = GetMemModuleHandleA(DllName);
                        if (NewModuleAddress == NULL)
                            return NULL;
                        return GetMemProcAddress(NewModuleAddress, NewFuncName);
                    }
                    return (PVOID)result;
                }
            }

        }
    }

    return NULL;
}

DWORD __forceinline RvaToOffset(IMAGE_NT_HEADERS* inh, DWORD Rva) {
	IMAGE_SECTION_HEADER* ish;
	ish = IMAGE_FIRST_SECTION(inh);
	for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
		if (Rva >= ish[i].VirtualAddress && Rva < ish[i].Misc.VirtualSize + ish[i].VirtualAddress) {
			return Rva - ish[i].VirtualAddress + ish[i].PointerToRawData;
		}
	}
	return 0;
}
typedef HMODULE(*WINAPI LOADLIBRARY)(LPCSTR ModuleName);
PVOID LoadMemLibrary(PVOID pDllData, PVOID MappedDllBuffer, PVOID Arg3) {
	PUCHAR uDllData = (PUCHAR)pDllData;
	PUCHAR uMappedDllBuffer = (PUCHAR)MappedDllBuffer;
	
	int libname[5];
	libname[0] = 'nrek'; libname[1] = '23le'; libname[2] = 'lld.'; libname[3] = 0;
	PVOID kernel32 = GetMemModuleHandleA((LPCSTR)&libname);

	libname[0] = 'daoL'; libname[1] = 'rbiL'; libname[2] = 'Ayra'; libname[3] = 0;
	LOADLIBRARY LoadLibrary_ = (LOADLIBRARY)GetMemProcAddress(kernel32, (LPCSTR)libname);

	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)uDllData;
	IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(idh->e_lfanew + uDllData);
	IMAGE_SECTION_HEADER* ish = IMAGE_FIRST_SECTION(inh);

	memcpy(uMappedDllBuffer, uDllData, inh->OptionalHeader.SizeOfHeaders);
	for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
		memcpy(uMappedDllBuffer + ish[i].VirtualAddress, uDllData + RvaToOffset(inh, ish[i].VirtualAddress), ish[i].SizeOfRawData);
	}
	//修复IAT
	if (inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress != 0)
	{
		PVOID Value;
		DWORD iidbase = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress;
		DWORD size = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].Size;

		for (DWORD i = 0; i < size; i += sizeof(IMAGE_IMPORT_DESCRIPTOR)) {

			IMAGE_IMPORT_DESCRIPTOR* iid = (IMAGE_IMPORT_DESCRIPTOR*)(uMappedDllBuffer + iidbase + i);
			if (iid->Name == 0 && iid->FirstThunk == 0)break;
			PVOID* FirstThunk = (PVOID*)(iid->FirstThunk + uMappedDllBuffer);//
			if ((BYTE*)FirstThunk == uMappedDllBuffer)break;

			if (iid->Name == 0)continue;
			LPCSTR DllName = (LPCSTR)(uMappedDllBuffer + iid->Name);

			PVOID hmod = GetMemModuleHandleA(DllName);
			if (hmod == 0) {
				hmod = LoadLibrary_(DllName);
			}

			if (hmod == 0) {
				return 0;
			}
			ULONG j = 0;
			while (Value = FirstThunk[j]) {
				ULONG_PTR hi_val = (ULONG_PTR)1 << (sizeof(PVOID) * 8 - 1);
				if ((ULONG_PTR)Value & hi_val || !Value)continue;
				LPCSTR Name = (LPCSTR)(uMappedDllBuffer + (ULONG_PTR)Value + 2);
				//printf("%s\n", Name);
				PVOID addr = GetMemProcAddress(hmod, Name);
				if (!addr)continue;
				FirstThunk[j] = addr;
				++j;
			}

		}
	}
	//处理重定位
	if (inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress) {
		IMAGE_BASE_RELOCATION* ibr = (IMAGE_BASE_RELOCATION*)(uMappedDllBuffer + inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress);
		PUCHAR max = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size + (PUCHAR)ibr;
		while (ibr->VirtualAddress) {
			ULONG len = (ibr->SizeOfBlock - sizeof(IMAGE_BASE_RELOCATION)) / 2;
			PVOID pAddr = ibr->VirtualAddress + uMappedDllBuffer;
			WORD* relocs = (WORD*)((BYTE*)ibr + sizeof(IMAGE_BASE_RELOCATION));
			for (int i = 0; i < len; i++) {
				WORD RelocValue = relocs[i];
#ifdef _WIN64
				WORD cpval = 0xA000;
#else
				WORD cpval = 0x3000;
#endif // _AMD64
				if ((RelocValue & 0xF000) != cpval)continue;
				ULONG_PTR* prelocv = (ULONG_PTR*)((BYTE*)pAddr + (RelocValue & 0x0FFF));
				*prelocv = *prelocv - inh->OptionalHeader.ImageBase + (ULONG_PTR)uMappedDllBuffer;
				//printf("%llx\n", *prelocv);
			}
			ibr = (IMAGE_BASE_RELOCATION*)((PBYTE)ibr + ibr->SizeOfBlock);
			if ((PUCHAR)ibr >= max)break;
		}
	}
	DWORD(WINAPI * Entry)(PVOID hDll, DWORD, LPVOID) = (DWORD(WINAPI*)(PVOID hDll, DWORD, LPVOID))(inh->OptionalHeader.AddressOfEntryPoint + (PUCHAR)uMappedDllBuffer);
	//__debugbreak();
	Entry((PVOID)kernel32, 1, Arg3);

	return 0;
}
