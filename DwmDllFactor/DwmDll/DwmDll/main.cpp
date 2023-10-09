#include "windows.h"
#include "iostream"
#include "common.h"
#include "dxhook.h"
#include "NtHelperX64.h"

ULONG64 g_SwapChain = 0;


ULONG64 g_pNtUserGetThreadState = 0;
ULONG64 g_PcwpSendIoctl = 0;

ULONG64 g_Beep = 0;
ULONG64 g_userbuffer = 0;

extern "C" _declspec(dllexport) PVOID exp_swapchain = &g_SwapChain;
extern "C" _declspec(dllexport) PVOID exp_beep = &g_Beep;
extern "C" _declspec(dllexport) PVOID exp_buffer = &g_userbuffer;

extern PVOID allocmemnx(size_t sz);
extern void install_kerneldxhook();
static bool g_cleared = false;

extern "C" void Entry_() {
	static bool is_execed = false;
	if (is_execed)
		return;
	is_execed = true;

	Common::Init(TRUE);
	PVOID pntdll = GetMemModuleHandleA("ntdll.dll");
	memset((PUCHAR)pntdll + g_userbuffer, 0, 0x300);

	myDbgPrint1("[112233] g_userbuffer:%p", g_userbuffer);

	install_kerneldxhook();

} 


extern "C" _declspec(dllexport) __attribute__((naked)) void Entry() {
	_asm {
		; int 3

		push   rax
		push   rbx
		push   rcx
		push   rdx
		push   rsi
		push   rdi
		push   rbp
		push   r8
		push   r9
		push   r10
		push   r11
		push   r12
		push   r13
		push   r14
		push   r15
		pushf

		call WinAPI_EnterStack
		call Entry_;
		call WinAPI_ExitStack

		popf
		pop    r15
		pop    r14
		pop    r13
		pop    r12
		pop    r11
		pop    r10
		pop    r9
		pop    r8
		pop    rbp
		pop    rdi
		pop    rsi
		pop    rdx
		pop    rcx
		pop    rbx
		pop    rax

		ret

		WinAPI_EnterStack :
			lea    r11, [rsp + 8h]
			and rsp, 0fffffffffffffff0h
			push   r11
			push   r11
			sub    rsp, 30h
			push   QWORD PTR[r11 - 8h]
			ret
		WinAPI_ExitStack :
			pop    r11
			add    rsp, 38h
			pop    rsp
			push   r11
			ret
	}
}


