#pragma once
#ifndef _KHOOK3_H
#define _KHOOK3_H

#include <ntifs.h>
namespace khook3 {
	VOID Init();
	VOID InstallHook();
	extern PVOID m_hookcb[100];
	extern int m_hookcb_cnt;
	extern ULONG_PTR g_pShellcode;
	__forceinline VOID SetShellcodeThread(PETHREAD Thread) {
		//*(ULONG_PTR*)(g_pShellcode + 0x2F) = (ULONG_PTR)Thread;
		//*(ULONG*)(g_pShellcode + 0x23) = 1;
		*(ULONG_PTR*)(HOOK_XOR(g_pShellcode) + 0xA0) = (ULONG_PTR)Thread;
		*(ULONG*)(HOOK_XOR(g_pShellcode) + 0x8E) = 1;
	}
	__forceinline VOID AddCB(PVOID cb) {
		m_hookcb[m_hookcb_cnt] = (PVOID)(cb);
		m_hookcb_cnt = ((m_hookcb_cnt) + 1);
	}

}

#endif // !_KHOOK3_H


