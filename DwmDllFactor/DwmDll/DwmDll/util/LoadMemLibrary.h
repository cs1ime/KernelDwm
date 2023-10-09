#pragma once

#ifndef _LOADMEMLIBRARY_C_INCLUDED__
#define _LOADMEMLIBRARY_C_INCLUDED__

#include "windows.h"

PVOID GetMemModuleHandleW(LPCWSTR ModuleName);
PVOID GetMemModuleHandleA(LPCSTR ModuleName);
PVOID GetMemProcAddress(PVOID pModule, LPCSTR ProcName);
PVOID LoadMemLibrary(PVOID pDllData, PVOID MappedDllBuffer, PVOID Arg3);

#endif // !_LOADMEMLIBRARY_C_INCLUDED_

