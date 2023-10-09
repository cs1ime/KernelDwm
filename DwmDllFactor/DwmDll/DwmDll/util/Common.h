#pragma once

#ifndef __Ring3_Common_INcluded
#define __Ring3_Common_INcluded

#include "stdio.h"
#include "windows.h"
#include "tlhelp32.h"
#include "vector"
#include "NtHelperX64.h"
#include "iostream"
#include "XorStr.hpp"
#include "mycrt.h"

#define WIN10 (10240)
#define WIN10_1507 (10240)
#define WIN10_1511 (10586)
#define WIN10_1607 (14393)
#define WIN10_1703 (15063)
#define WIN10_1709 (16299)
#define WIN10_1803 (17134)
#define WIN10_1809 (17763)
#define WIN10_1903 (18362)
#define WIN10_1909 (18363)
#define WIN10_2004 (19041)
#define WIN11_22H2 (22621)

typedef struct {
	CHAR Name[256];
}ImageName;

#define myDbgPrint4(s,a,b,c)\
{\
CHAR str[300]; \
mysprintf(str,(LPCSTR)s, a, b, c); \
myOutputDebugStringA(str);\
}
#define myDbgPrint2(s,a,b)\
{\
CHAR str[300]; \
mysprintf(str,(LPCSTR)s, a, b); \
myOutputDebugStringA(str);\
}
#define myDbgPrint1(s,a)\
{\
CHAR str[300]; \
mysprintf(str,(LPCSTR)s, a); \
myOutputDebugStringA(str);\
}
#define myDbgPrint(s)\
{\
CHAR str[300]; \
strcpy(str,(LPCSTR)s); \
myOutputDebugStringA(str);\
}

#define myDbgPrint
#define myDbgPrint1
#define myDbgPrint2
#define myDbgPrint3
#define myDbgPrint4

VOID myOutputDebugStringA(LPCSTR str);
namespace Common {

	BOOLEAN Init(BOOL IsManualMap = FALSE);
	//file
	ULONG GetPathName(LPCSTR FullName, LPSTR Buffer);
	ULONG GetCurrentPath(PCHAR lpbuf, ULONG cbbuf);
	bool IsFileExists(const char *FileName);
	const char *GetPathLowString(const char *FullName);
	BOOL GetFileHash(LPCSTR lpFileName, LPSTR lpHash);
	//system
	ULONG64 GetRealTime();
	void CreateConsole();
	void DestoryConsole();
	void ClearConsole();
	BOOL IsRunasAdmin();
	DWORD GetPidByNameW(const WCHAR *ProcessName);
	DWORD GetPidByNameA(LPCSTR ProcessName);
	BOOL KillProcess(ULONG Pid);
	std::vector<ImageName> EnumDriverModule();
	bool IsDriverActive(const char *DrvName);
	BOOL StrongWrite(LPVOID TargetAddress, LPCVOID Buffer, ULONG Size);
	BOOL StrongWrite_InterLocked64(volatile PULONG64 Addr, ULONG64 v);
	//calc
	std::string GD_(const std::string key, const std::string data, std::string defstr = "");
	std::string wrapped(const std::string f_key, LPCSTR f_val);
	std::string wrapped(const std::string f_key, const std::string f_val);
	std::string wrapped(const std::string f_key, const int f_val);

	void confusion_data(PVOID data, ULONG size);
	void confusion_str(PSTR str);
	std::string RandomStringA(size_t lenth);
	std::wstring RandomStringW(size_t lenth);
	INT64 FindSignatureCode(LPCVOID Memory, UINT64 MemoryLenth, LPCSTR SignatureCode, UINT64 Pos = 0);
	ULONG64 FindPattern(LPCVOID hImage, LPCSTR Pattern);
	ULONG64 ScanSection(LPCVOID hImage, LPCSTR SectionName, LPCSTR Pattern);
	std::vector<ULONG64> FindPattern2(LPCVOID hImage, LPCSTR Pattern);

	PVOID ManualMapPE(PVOID peData);
	LPWSTR WINAPI StrStrIW(LPCWSTR lpszStr, LPCWSTR lpszSearch);
	LPWSTR WINAPI StrStrNIW(LPCWSTR lpszStr, LPCWSTR lpszSearch, SIZE_T max_chars);
	LPSTR WINAPI StrStrIA(LPCSTR lpszStr, LPCSTR lpszSearch);
	LPSTR WINAPI StrStrNIA(LPCSTR lpszStr, LPCSTR lpszSearch, SIZE_T max_chars);

}

#endif