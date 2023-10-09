#pragma once

#ifndef __MYCRT__INCLUDED__
#define  __MYCRT__INCLUDED__
#include "nthelperx64.h"
#include "stb_sprintf.h"



typedef int(_cdecl *_CRT_SPRINTF)(LPSTR buf, LPCSTR fstr, ...);
namespace crt {
	

	bool init(bool manualmap);
	void *malloc(size_t size);
	void free(void *address);
	int sprintf(char* buf, const char* fmt, ...);
	void exit();

}

void UTF8ToUnicode(LPCSTR utf8, LPWSTR uni, SIZE_T MaxCount);

#endif // !__MYCRT__INCLUDED__

