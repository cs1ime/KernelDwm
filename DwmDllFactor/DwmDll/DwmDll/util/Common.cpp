

#include "Common.h"

typedef struct
{
	PVOID section;
	PVOID MappedBase;
	PVOID ImageBase;
	ULONG ImageSize;
	ULONG Flags;
	USHORT LoadOrderIndex;
	USHORT InitOrderIndex;
	USHORT LoadCount;
	USHORT PathLength;
	char ImageName[256];

}SYSTEM_MODULE, *PSYSTEM_MODULE;
#define NT_SUCCESS(Status) (((NTSTATUS)(Status)) >= 0)

typedef struct _SBYTEINFO_3 {
	UCHAR RawByte;
	BOOLEAN Hi; //Hi 4 bit is ??
	BOOLEAN Lo; //Lo 4 bit is ??
	BOOLEAN All;
	BOOLEAN No;
}SBYTEINFO_3, * PSBYTEINFO_3;
typedef struct _SBYTEINFO_2 {
	UCHAR RawByte;
	BOOLEAN All;
}SBYTEINFO_2, * PSBYTEINFO_2;
char RandomChartable[] = { '0','1','2','3','4','5','6','7','8','9',
						 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
						 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z' };

template<typename T>
std::string to_string(T i)
{
	char buf[21] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 };
	if (sizeof(T) == 8)
		crt::sprintf(buf, "%I64d", i);
	else
		crt::sprintf(buf, "%d", i);
	return buf;
}

typedef VOID(*FnOutputDebugStringA)(...);
FnOutputDebugStringA m_pOutputDebugStringA = 0;
VOID myOutputDebugStringA(LPCSTR str) {
	m_pOutputDebugStringA(str);
}
namespace Common {

	BOOLEAN Init(BOOL IsManualMap) {
		m_pOutputDebugStringA = (FnOutputDebugStringA)GetMemProcAddress(GetMemModuleHandleA(xs("kernel32.dll")), xs("OutputDebugStringA"));
		return nthelper_init(IsManualMap) && crt::init(IsManualMap);
	}


	//file
	const char *GetPathLowString(const char *FullName) {
		int lastPos = -1;
		int current = 0;
		int len = strlen(FullName);
		while (current != len) {

			if (FullName[current] == '\\') {
				lastPos = current;
			}

			current++;
		}
		if (current == -1)return NULL;
		return FullName + lastPos + 1;
	}
	ULONG GetPathName(LPCSTR FullName, LPSTR Buffer) {
		ULONG len = strlen(FullName);
		if (len >= 260)return 0;
		ULONG LastIndex = len;
		for (int i = 0; i < len; i++) {
			if (FullName[i] == '\\') {
				LastIndex = i;
			}
		}
		memcpy(Buffer, FullName, LastIndex);
		Buffer[LastIndex] = 0;
		return LastIndex;
	};
	ULONG GetCurrentPath(PCHAR lpbuf, ULONG cbbuf) {
		CHAR Buffer[260];
		DWORD size = GetModuleFileNameA(NULL, Buffer, 260);

		CHAR FullPath[260];
		ULONG NameLenth = GetPathName(Buffer, FullPath);
		if (NameLenth && NameLenth <= cbbuf) {
			strcpy_s(lpbuf, 260, FullPath);
			return NameLenth;
		}
		return 0;
	}
	bool IsFileExists(const char *FileName) {
		CHAR Buffer[260];
		strcpy_s(Buffer, 260, FileName);

		return myPathFileExistsA(Buffer);
	}
	BOOL GetFileHash(LPCSTR lpFileName, LPSTR lpHash)
	{
		BOOL bResult = FALSE;

		HANDLE hFile = myCreateFileA(lpFileName, FILE_GENERIC_READ, 0, OPEN_EXISTING);

		if (hFile != INVALID_HANDLE_VALUE)
		{
			DWORD dwFileSize = myGetFileSize(hFile);

			if (dwFileSize > 0)
			{
				PBYTE lpBuffer = (PBYTE)VirtualAlloc(NULL, dwFileSize, MEM_COMMIT, PAGE_READWRITE);

				if (lpBuffer != NULL)
				{
					DWORD dwNumOfRead;

					if (myReadFile(hFile, lpBuffer, dwFileSize, &dwNumOfRead) != FALSE)
					{
						HCRYPTPROV hProv;

						if (CryptAcquireContext(&hProv, NULL, NULL, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT) != FALSE)
						{
							HCRYPTHASH hHash;

							if (CryptCreateHash(hProv, CALG_MD5, NULL, NULL, &hHash) != FALSE)
							{
								if (CryptHashData(hHash, lpBuffer, dwFileSize, NULL) != FALSE)
								{
									BYTE bData[16]; DWORD dwDataLen;

									if (CryptGetHashParam(hHash, HP_HASHVAL, bData, &dwDataLen, NULL) != FALSE)
									{
										if (dwDataLen == 16)
										{
											LPSTR lpStr = lpHash;

											for (DWORD i = 0; i < dwDataLen; i++, lpStr += 2)
											{
												crt::sprintf(lpStr, "%02X", bData[i]);
											}

											bResult = TRUE;
										}
									}
								}

								CryptDestroyHash(hHash);
							}

							CryptReleaseContext(hProv, NULL);
						}
					}

					VirtualFree(lpBuffer, 0, MEM_RELEASE);
				}
			}

			CloseHandle(hFile);
		}

		return bResult;
	}
	//system
	static ULONG64 g_per = 0;
	static bool g_first = true;
	//返回毫秒数
	ULONG64 GetRealTime() {
		if (g_first) {
			g_first = false;

			ULONG64 fir, sec;
			fir = __rdtsc();
			mySleep(50);
			sec = __rdtsc();

			g_per = (sec - fir) / 50;

		}

		return __rdtsc() / g_per;
		/*LARGE_INTEGER per, cnt;
		cnt.QuadPart = 0;
		per.QuadPart = 0;
		myNtQueryPerformanceCounter(&cnt, &per);
		//printf("%lld %lld\n", cnt.QuadPart, per.QuadPart);
		return cnt.QuadPart / (per.QuadPart / 1000);*/
		//return GetTickCount64();
	}
	void CreateConsole() {
		AllocConsole();
		freopen(XorStr("CONIN$"), "r+t", stdin);
		freopen(XorStr("CONOUT$"), "w+t", stdout);
	}
	void ClearConsole() {
		COORD c;
		c.X = 0;
		c.Y = 0;
		SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), c);

		CONSOLE_SCREEN_BUFFER_INFO info;
		ZeroMemory(&info, sizeof(info));
		GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &info);
		DWORD write = 0;
		FillConsoleOutputCharacterA(GetStdHandle(STD_OUTPUT_HANDLE), ' ', info.dwSize.X * info.dwSize.Y, c, &write);

	}
	void DestoryConsole() {
		FreeConsole();
	}
	BOOL IsRunasAdmin()
	{
		BOOL bElevated = FALSE;
		HANDLE hToken = NULL;

		// Get current process token
		if (!NT_SUCCESS(myNtOpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, &hToken)))
			return FALSE;

		TOKEN_ELEVATION tokenEle;
		DWORD dwRetLen = 0;

		// Retrieve token elevation information
		if (myGetTokenInformation(hToken, TokenElevation, &tokenEle, sizeof(tokenEle), &dwRetLen))
		{
			if (dwRetLen == sizeof(tokenEle))
			{
				bElevated = tokenEle.TokenIsElevated;
			}
		}

		myNtClose(hToken);
		return bElevated;
	}
	DWORD GetPidByNameW(const WCHAR *ProcessName) {
		PMYSYSTEM_PROCESS_INFORMATION info;
		ULONG Ret = 0;
		NTSTATUS stats = myNtQuerySystemInformation(mySystemProcessInformation, 0, 0, &Ret);
		ULONG BUfferLenth = Ret;
		info = (PMYSYSTEM_PROCESS_INFORMATION)VirtualAlloc(0, Ret, MEM_COMMIT, PAGE_READWRITE);
		RtlZeroMemory(info, BUfferLenth);
		while ((stats = myNtQuerySystemInformation(mySystemProcessInformation, info, BUfferLenth, &Ret)) == 0xC0000004) {
			VirtualFree(info, BUfferLenth, MEM_DECOMMIT);
			info = (PMYSYSTEM_PROCESS_INFORMATION)VirtualAlloc(0, Ret, MEM_COMMIT, PAGE_READWRITE);
			RtlZeroMemory(info, BUfferLenth);
			BUfferLenth = Ret;
		}
		PMYSYSTEM_PROCESS_INFORMATION NowInfo = info;
		ULONG cur_pid = GetCurrentProcessId();
		while (NowInfo->NextEntryOffset) {
			if (NowInfo->ImageName.Buffer && (DWORD)NowInfo->UniqueProcessId != cur_pid) {
				if (!wcsicmp(NowInfo->ImageName.Buffer, ProcessName)) {
					ULONG pidret = (DWORD)NowInfo->UniqueProcessId;
					VirtualFree(info, Ret, MEM_DECOMMIT);
					return pidret;
				}
			}

			NowInfo = (PMYSYSTEM_PROCESS_INFORMATION)(((PUCHAR)NowInfo) + NowInfo->NextEntryOffset);
		}
		VirtualFree(info, Ret, MEM_DECOMMIT);
		return 0;
	}
	DWORD GetPidByNameA(LPCSTR ProcessName) {
		WCHAR NameStr[300];
		ZeroMemory(NameStr, sizeof(NameStr));
		AnsiToUnicode(ProcessName, NameStr, 260);
		return GetPidByNameW(NameStr);
	}
	BOOL KillProcess(ULONG Pid) {
		HANDLE hProcess = myOpenProcess(PROCESS_TERMINATE, FALSE, Pid);
		if (hProcess == INVALID_HANDLE_VALUE) {
			return FALSE;
		}
		BOOL result = myTerminateProcess(hProcess, 0);
		myNtClose(hProcess);
		return result;
	}
	bool IsDriverActive(const char *DrvName) {
		std::vector<ImageName> names = EnumDriverModule();
		for (int i = 0; i < names.size(); ++i) {
			const char *str = GetPathLowString(names[i].Name);
			if (str) {
				if (!strcmpi(str, DrvName)) {
					return true;
				}
			}

		}
		return false;
	}
	std::vector<ImageName> EnumDriverModule() {
		PSYSTEM_MODULE pModule = 0;
		ULONG Lenth = 0;
		NTSTATUS status = myNtQuerySystemInformation(mySystemModuleInformation, 0, 0, &Lenth);
		//printf("%x\n", Lenth);
		while (status == 0xC0000004L) {
			if (pModule) {
				free(pModule);
			}
			pModule = (PSYSTEM_MODULE)malloc(Lenth);
			status = myNtQuerySystemInformation(mySystemModuleInformation, pModule, Lenth, &Lenth);
		}
		std::vector<ImageName> result;
		ULONG size = Lenth / sizeof(SYSTEM_MODULE);
		for (ULONG i = 0; i < size; ++i) {

			ULONG NameStart = 0;

			while (pModule[i].ImageName[NameStart] != '\\')NameStart++;

			ImageName name;
			memcpy(&name.Name, &pModule[i].ImageName[NameStart], 256 - NameStart);
			//printf("%s\n", name.Name);
			result.push_back(name);
		}
		free(pModule);
		return result;
	}
	BOOL StrongWrite(LPVOID TargetAddress, LPCVOID Buffer, ULONG Size) {
		DWORD old = 0;
		DWORD old2 = 0;
		if (myVirtualProtect(TargetAddress, Size, PAGE_EXECUTE_READWRITE, &old)) {
			memcpy(TargetAddress, Buffer, Size);
			myVirtualProtect(TargetAddress, Size, old, &old2);
			return TRUE;
		}
		return FALSE;
	}
	BOOL StrongWrite_InterLocked64(PULONG64 Addr, ULONG64 v) {
		DWORD old = 0;
		if (myVirtualProtect(Addr, 8, PAGE_EXECUTE_READWRITE, &old)) {
			*Addr = v;
			myVirtualProtect(Addr, 8, old, &old);
			return TRUE;
		}
		return FALSE;
	}
	//calc
	std::string GD_(const std::string key, const std::string data, std::string defstr)
	{
		std::string result = "";
		std::string stag = "<" + key + ">";
		std::string etag = "</" + key + ">";

		size_t spos = data.find(stag);
		if (spos != std::string::npos)
		{
			size_t epos = data.find(etag);  //0123xx678
			if (epos != std::string::npos &&  epos > spos)
			{
				result = data.substr(spos + stag.size(), epos - spos - stag.size());
			}
		}
		if (result == "")result = defstr;
		return result;
	}
	std::string trim(std::string s)
	{
		if (s.empty())return s;
		s.erase(0, s.find_first_not_of(" "));
		s.erase(s.find_last_not_of(" ") + 1);
		return s;
	}
	std::string wrapped(const std::string f_key, LPCSTR f_val)
	{
		std::string s_val = f_val;
		s_val = trim(s_val);
		if (s_val != "")
			s_val = "<" + f_key + ">" + s_val + "</" + f_key + ">";
		return s_val;
	}

	std::string wrapped(const std::string f_key, const std::string f_val)
	{
		std::string s_val = trim(f_val);
		if (s_val != "")
			s_val = "<" + f_key + ">" + s_val + "</" + f_key + ">";
		return s_val;
	}

	std::string wrapped(const std::string f_key, const int f_val)
	{
		std::string s_val = trim(to_string(f_val));
		s_val = "<" + f_key + ">" + s_val + "</" + f_key + ">";
		return s_val;
	}

	void confusion_data(PVOID data, ULONG size) {
		//混淆数据
		int xorkey = 128;
		for (ULONG i = 0; i < size; i++) {
			((PUCHAR)data)[i] ^= xorkey;
			if (xorkey == 255) {
				xorkey = 128;
			}
			xorkey++;
		}
	}
	void confusion_str(PSTR str) {
		//混淆str
		int xorkey = 128;
		int len = strlen(str);
		for (ULONG i = 0; i < len; i++) {
			((PUCHAR)str)[i] ^= xorkey;
			if (xorkey == 255) {
				xorkey = 128;
			}
			xorkey++;
		}
	}
	char RandomChar() {
		return RandomChartable[(int)(rand()) % 61];
	}
	std::string RandomStringA(size_t lenth) {
		srand(__rdtsc());
		std::string str;
		for (int i = 0; i < lenth; i++) {
			str += RandomChar();
		}
		return str;
	}
	std::wstring RandomStringW(size_t lenth) {
		srand(__rdtsc());
		std::wstring str;
		for (int i = 0; i < lenth; i++) {
			str += (WCHAR)RandomChar();
		}
		return str;
	}

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

	BOOLEAN __forceinline CompareByte_3(UCHAR byte, PSBYTEINFO_3 sbyte) {
		if (sbyte->No)return byte == sbyte->RawByte;
		if (sbyte->All) return TRUE;
		if (sbyte->Hi) {
			return sbyte->RawByte == LO4BIT(byte);
		}
		if (sbyte->Lo) {
			return sbyte->RawByte == HI4BIT(byte);
		}
		return FALSE;
	}
	VOID __forceinline convert_scode_sbyte_3(LPCSTR SignatureCode, PSBYTEINFO_3 rawbyte) {
		ULONG len = __strlen__(SignatureCode) / 2;
		memset(rawbyte, 0, len * sizeof(SBYTEINFO_3));
		for (int i = 0; i < len; i++) {
			LPCSTR scode = SignatureCode + i * 2;
			if (scode[0] == '?' && scode[1] == '?') {
				rawbyte[i].All = TRUE;
				continue;
			}
			if (scode[0] == '?') {
				rawbyte[i].Hi = TRUE;
				rawbyte[i].RawByte = CharToByte(scode[1]);
				continue;
			}
			if (scode[1] == '?') {
				rawbyte[i].Lo = TRUE;
				rawbyte[i].RawByte = CharToByte(scode[0]);
				continue;
			}
			rawbyte[i].RawByte = STRTOBYTE(scode);
			rawbyte[i].No = TRUE;
		}
	}
	INT64 FindSignatureCode_3(const PUCHAR Memory, UINT64 MemoryLenth, LPCSTR SignatureCode, UINT64 Pos) {
		ULONG len = __strlen__(SignatureCode) / 2;
		SBYTEINFO_3 rawbyte[200] = { 0 };
		convert_scode_sbyte_3(SignatureCode, rawbyte);

		PSBYTEINFO_3 sbyte = rawbyte;
		UINT64 opos = 0;
		UINT64 cmppos = 0;
		BOOLEAN Hit = FALSE;
		for (UINT64 i = Pos; i < MemoryLenth; ++i) {
			if (CompareByte_3(Memory[i], sbyte)) {
				if (!Hit) {
					opos = i;
					Hit = TRUE;
				}
				++sbyte;
				if (++cmppos == len) {
					//crt::free(rawbyte);
					return i - (len - 1);
				}
			}
			else {
				if (Hit) {
					if (Hit)i = opos;
					Hit = FALSE;
					cmppos = 0;
					sbyte = rawbyte;
				}
			}
		}
		//crt::free(rawbyte);
		return -1;
	}

	VOID __forceinline convert_scode_sbyte_2(LPCSTR SignatureCode, PSBYTEINFO_2 rawbyte) {
		ULONG len = __strlen__(SignatureCode) / 2;
		memset(rawbyte, 0, len * sizeof(SBYTEINFO_2));
		for (int i = 0; i < len; i++) {
			LPCSTR scode = SignatureCode + i * 2;
			if (scode[0] == '?') {
				rawbyte[i].All = TRUE;
				continue;
			}
			rawbyte[i].RawByte = STRTOBYTE(scode);
		}
	}
	INT64 FindSignatureCode_2(const PUCHAR Memory, UINT64 MemoryLenth, LPCSTR SignatureCode, UINT64 Pos) {
		ULONG len = __strlen__(SignatureCode) / 2;
		SBYTEINFO_2 rawbyte[200] = { 0 };
		convert_scode_sbyte_2(SignatureCode, rawbyte);

		PSBYTEINFO_2 sbyte = rawbyte;
		UINT64 opos = 0;
		UINT64 cmppos = 0;
		BOOLEAN Hit = FALSE;
		for (UINT64 i = Pos; i < MemoryLenth; ++i) {
			if (sbyte->All || (Memory[i] == sbyte->RawByte)) {
				if (!Hit) {
					opos = i;
					Hit = TRUE;
				}
				++sbyte;
				if (++cmppos == len) {
					//crt::free(rawbyte);
					return i - (len - 1);
				}
			}
			else {
				if (Hit) {
					i = opos;
					Hit = FALSE;
					cmppos = 0;
					sbyte = rawbyte;
				}
			}

		}
		//crt::free(rawbyte);
		return -1;
	}
	INT64 FindSignatureCode(LPCVOID Memory, UINT64 MemoryLenth, LPCSTR SignatureCode, UINT64 Pos) {
		ULONG type = CheckForSignureCode(SignatureCode);
		if (!type)return -1;
		if (type == 3)return FindSignatureCode_3((const PUCHAR)Memory, MemoryLenth, SignatureCode, Pos);
		if (type == 2 || type == 1) return FindSignatureCode_2((const PUCHAR)Memory, MemoryLenth, SignatureCode, Pos);

		return -1;
	}
	ULONG64 FindPattern(LPCVOID hImage, LPCSTR Pattern) {
		const PUCHAR Image = (const PUCHAR)hImage;
		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)(Image);
		if (idh->e_magic != 'ZM')return 0;
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(Image + idh->e_lfanew);
		if (inh->Signature != 'EP')return 0;
		IMAGE_SECTION_HEADER* ish = IMAGE_FIRST_SECTION(inh);
		//IMAGE_SCN_MEM_PURGEABLE
		for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
			if (ish[i].Characteristics & IMAGE_SCN_MEM_PURGEABLE)continue;
			PUCHAR start = Image + ish[i].VirtualAddress;
			INT64 result = FindSignatureCode((LPCVOID)(start), ish[i].Misc.VirtualSize, Pattern, 0);
			if (result != -1) {
				return (ULONG64)(start + result);
			}
		}
		return NULL;

	}
	ULONG64 ScanSection(LPCVOID hImage, LPCSTR SectionName, LPCSTR Pattern) {
		const PUCHAR Image = (const PUCHAR)hImage;
		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)(Image);
		if (idh->e_magic != 'ZM')return 0;
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(Image + idh->e_lfanew);
		if (inh->Signature != 'EP')return 0;
		IMAGE_SECTION_HEADER* ish = IMAGE_FIRST_SECTION(inh);
		//IMAGE_SCN_MEM_PURGEABLE
		for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
			if (ish[i].Characteristics & IMAGE_SCN_MEM_PURGEABLE)continue;
			CHAR Name[9];
			memcpy(Name, ish[i].Name, 8);
			Name[8] = 0;
			if (!strcmp(Name, SectionName)) {
				PUCHAR start = Image + ish[i].VirtualAddress;
				INT64 result = FindSignatureCode((LPCVOID)(start), ish[i].Misc.VirtualSize, Pattern, 0);
				if (result != -1) {
					return (ULONG64)(start + result);
				}
				return 0;
			}

		}
		return NULL;

	}
	std::vector<ULONG64> FindPattern2(LPCVOID hImage, LPCSTR Pattern) {
		std::vector<ULONG64>result;
		const PUCHAR Image = (const PUCHAR)hImage;
		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)(Image);
		if (idh->e_magic != 'ZM')return result;
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(Image + idh->e_lfanew);
		if (inh->Signature != 'EP')return result;
		IMAGE_SECTION_HEADER* ish = IMAGE_FIRST_SECTION(inh);
		//IMAGE_SCN_MEM_PURGEABLE
		for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
			if (ish[i].Characteristics & IMAGE_SCN_MEM_PURGEABLE)continue;
			PUCHAR start = Image + ish[i].VirtualAddress;
			INT64 pos = -1;
			while ((pos = FindSignatureCode((LPCVOID)(start), ish[i].Misc.VirtualSize, Pattern, pos + 1)) != -1) {
				result.push_back((ULONG64)(start + pos));
				if ((pos + 1) >= (ish[i].Misc.VirtualSize)) {
					break;
				}
			}
		}
		return result;

	}

	PVOID ManualMapPE(PVOID peData) {
		IMAGE_DOS_HEADER *idh = (IMAGE_DOS_HEADER *)peData;
		IMAGE_NT_HEADERS64 *inh = (IMAGE_NT_HEADERS64 *)((PUCHAR)peData + idh->e_lfanew);
		IMAGE_SECTION_HEADER *ish = IMAGE_FIRST_SECTION(inh);
		PUCHAR ModuleHandle = (PUCHAR)crt::malloc(inh->OptionalHeader.SizeOfImage);

		memcpy(ModuleHandle, peData, inh->OptionalHeader.SizeOfHeaders);
		for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
			memcpy(ModuleHandle + ish[i].VirtualAddress, (PUCHAR)peData + ish[i].PointerToRawData, ish[i].SizeOfRawData);
		}
		return ModuleHandle;
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


}


