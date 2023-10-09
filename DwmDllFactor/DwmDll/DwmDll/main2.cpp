#include "windows.h"
#include "iostream"
#include "common.h"
#include "dxhook.h"
#include "NtHelperX64.h"

extern ULONG64 g_userbuffer;
extern ULONG64 g_SwapChain;

extern ULONG64 g_Beep;

ULONG g_MultplaneSwapChainOff = 0;
ULONG g_TableOff = 0;
ULONG g_ContextOff = 0;
ULONG GetPresentOff() {
	ULONG bn = myGetNtBuildNumber();
	if (bn < WIN10) {

	}
	else if (bn <= WIN10_1607) {
		return 0x48;
	}
	else {
		return 0x40;
	}
	return 0;
}

ULONG GetMultplaneSwapChainOff() {
	ULONG bn = myGetNtBuildNumber();
	if (bn < WIN10) {

	}
	else if (bn == WIN10_1511) {
		return 40;
	}
	else if (bn >= WIN10_1607 && bn <= WIN10_1909) {
		return 120;
	}
	else if (bn >= WIN10_2004 && bn < WIN11_22H2) {
		return 88;
	}
	else if (bn >= WIN11_22H2) {
		return 168;
	}
	return 0;
}
ULONG GetTableOff() {
	ULONG bn = myGetNtBuildNumber();

	if (bn < WIN10) {
		return 0x28;
	}
	else if (bn == WIN10_1511) {
		return 0x60;
	}
	else if (bn >= WIN10_1607 && bn <= WIN10_1809) {
		return 0xD8;
	}
	else if (bn >= WIN10_1903 && bn <= WIN10_1909) {
		return 0xB0;
	}
	else if (bn >= WIN10_2004 && bn < WIN11_22H2) {
		return 0x90;
	}
	else if (bn >= WIN11_22H2) {
		return 0xE0;
	}
	return 0;

}
ULONG GetContextOff() {
	ULONG bn = myGetNtBuildNumber();
	if (bn < WIN10) {
		return 0x50;
	}
	else if (bn == WIN10_1511) {
		return 0x90;
	}
	else if (bn >= WIN10_1607 && bn <= WIN10_1909) {
		return 0xE0;
	}
	else if (bn >= WIN10_2004 && bn < WIN11_22H2) {
		return 0xC0;
	}
	else if (bn >= WIN11_22H2) {
		return 0x108;
	}
	return 0;
}

void kerneldxhook_callback(ULONG64 SwapChain, ULONG way) {
	myDbgPrint1("[112233] way:%d\n", way);
	if (way == 1) {
		SwapChain -= g_MultplaneSwapChainOff;
	}
	g_SwapChain = SwapChain;
	myDbgPrint1("[112233] g_SwapChain:%p\n", g_SwapChain);
	remove_dxhook();
}

void install_kerneldxhook() {
	g_MultplaneSwapChainOff = GetMultplaneSwapChainOff();
	g_TableOff = GetTableOff();
	g_ContextOff = GetContextOff();

	myDbgPrint1("[112233] g_TableOff:%X\n", g_TableOff);

	install_dxhook(kerneldxhook_callback);
}
typedef VOID(*FnMemset)(ULONG_PTR, ULONG_PTR, ULONG_PTR);

typedef LPVOID (*FnVirtualAlloc)(
	LPVOID lpAddress,
	SIZE_T dwSize,
	DWORD  flAllocationType,
	DWORD  flProtect
);
PVOID allocmemnx(size_t sz) {
	return 0;
}

