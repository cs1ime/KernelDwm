#include "dxhook.h"
#include "common.h"
#include "d3d11.h"
#include "LoadMemLibrary.h"

extern "C" ULONG64 HookCallBackFunction;
extern "C" ULONG64 HookCallBackFunction2;
extern "C" ULONG64 hook_origin_present;
extern "C" ULONG64 HookProc();
extern "C" ULONG64 HookCallBackFunction_1;
extern "C" ULONG64 HookCallBackFunction2_1;
extern "C" ULONG64 hook_origin_present_1;
extern "C" ULONG64 HookProc_1();
extern "C" VOID AsmInt3();

static FnDxgiCallback g_hook_callback = 0;

volatile static ULONG64 origin_present = 0;
volatile static ULONG64 origin_hook = 0;
UCHAR origin_data[12] = { 0 };
UCHAR g_hooked_data[12] = { 0 };

volatile static ULONG64 origin_present_1 = 0;
volatile static ULONG64 origin_hook_1 = 0;
UCHAR origin_data_1[12] = { 0 };
UCHAR g_hooked_data_1[12] = { 0 };

ULONG_PTR GetFunctionBegin(ULONG_PTR pModule, ULONG_PTR r) {
	ULONG rva = r - pModule;
	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)pModule;
	IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(pModule + idh->e_lfanew);
	PRUNTIME_FUNCTION table = (PRUNTIME_FUNCTION)(pModule + inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].VirtualAddress);
	ULONG sz = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXCEPTION].Size / 0xC;
	for (int i = 0; i < sz; i++) {
		if (rva >= table[i].BeginAddress && rva < table[i].EndAddress) {
			return pModule + table[i].BeginAddress;
		}
	}
	return 0;
}

ULONG64 GetDx11PresentImpl() {
	ULONG64 pdxgi = (ULONG64)GetMemModuleHandleA("dxgi.dll");
	myDbgPrint1("[112233] pdxgi:%p\n", pdxgi);
	ULONG bn = myGetNtBuildNumber();
	ULONG64 dxgi = pdxgi;

	myDbgPrint1("[112233] dxg2i:%p\n", dxgi);

	if (bn < WIN10) {
		//PresentImpl
		//E8 ?? ?? ?? ?? 3D 01 00 7A 08
		//E8 ?? ?? ?? ?? 8B ?? ?? ?? 02 00 7A 08

		ULONG64 pos = Common::ScanSection((LPCVOID)dxgi, ".text", "E8????????3D01007A08");
		if (pos) {
			return *(LONG*)(pos + 1) + pos + 5;
		}
	}
	else {
		//PresentImplCore
		//E8 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 02 00 7A 08 ?? ?? 83 F9 03
		
		ULONG64 pos = Common::ScanSection((LPCVOID)dxgi, ".text", "E8??????????????????????02007A08????83F903");
		myDbgPrint1("[112233] search pos:%p\n", pos);
		//return 0;
		if (pos) {
			return *(LONG*)(pos + 1) + pos + 5;
		}
		else {
			//8B ?? E8 ?? ?? ?? ?? ?? ?? ?? ?? 02 00 7A 08
			
			pos = Common::ScanSection((LPCVOID)dxgi, ".text", "8B??E8????????????????02007A08");
			return *(LONG*)(pos + 3) + pos + 7;
		}
	}

	return 0;
}
ULONG64 GetDx11MultiplanePresent() {
	ULONG64 pdxgi = (ULONG64)GetMemModuleHandleA("dxgi.dll");
	ULONG64 dxgi = pdxgi;
	ULONG bn = myGetNtBuildNumber();
	if (bn < WIN10) {

	}
	else {
		//48 8B C4 55 56 57 41 54 41 55 41 56 41 57 48 81 EC ?? ?? 00 00 48 ?? ?? ?? FE FF FF FF 48 89 58 10
		
		ULONG64 pos = Common::ScanSection((LPCVOID)pdxgi, ".text", "488BC455565741544155415641574881EC????000048??????FEFFFFFF48895810");
		if (pos) {
			return pos;
		}
		else {
			//41 B8 04 00 00 00 48 8D ?? ?? ?? 48 8D ?? ?? ?? E8
			//41B804000000488D??????488D??????E8
			pos = Common::ScanSection((LPCVOID)pdxgi, ".text", "41B804000000488D??????488D??????E8");
			if (pos) {
				ULONG_PTR begin = GetFunctionBegin(dxgi, pos);
				if (begin)
					return begin;
			}
			else {
				
				//89 54 24 10 55 56 57 41 54 41 55 41 56 41 57 48
				
				pos = Common::ScanSection((LPCVOID)pdxgi, ".text", "89542410555657415441554156415748");
				if (pos) {
					ULONG_PTR begin = GetFunctionBegin(dxgi, pos);
					if (begin)
						return begin;
				}
			}
		}
	}

	return 0;
}

bool GetWin7Present(ULONG64* pos1, ULONG64* pos2) {
	//E8 ?? ?? ?? ?? 8B ?? ?? ?? 02 00 7A 08
	ULONG64 pdxgi = (ULONG64)GetMemModuleHandleA("dxgi.dll");
	myDbgPrint1("[112233] pdxgi:%p\n", pdxgi);
	ULONG64 dxgi = pdxgi;

	IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)(dxgi);
	if (idh->e_magic != 'ZM')return 0;
	IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(dxgi + idh->e_lfanew);
	if (inh->Signature != 'EP')return 0;
	IMAGE_SECTION_HEADER* ish = IMAGE_FIRST_SECTION(inh);
	//IMAGE_SCN_MEM_PURGEABLE
	for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
		if (ish[i].Characteristics & IMAGE_SCN_MEM_PURGEABLE)continue;
		CHAR Name[9];
		memcpy(Name, ish[i].Name, 8);
		Name[8] = 0;
		if (!strcmp(Name, ".text")) {
			PUCHAR start = (PUCHAR)(dxgi + ish[i].VirtualAddress);

			INT64 result = Common::FindSignatureCode((LPCVOID)(start), ish[i].Misc.VirtualSize, "E8????????8B??????02007A08", 0);
			if (result != -1) {
				*pos1 = (ULONG64)(*(LONG*)(start + result + 1) + start + result + 5);
				result = Common::FindSignatureCode((LPCVOID)(start), ish[i].Misc.VirtualSize, "E8????????8B??????02007A08", result + 1);
				if (result != -1) {
					*pos2 = (ULONG64)(*(LONG*)(start + result + 1) + start + result + 5);
					return true;
				}
			}
			return false;
		}

	}
	return false;
}

VOID CALLBACK Callback(IDXGISwapChain* SwapChain, ULONG64 stack) {
	volatile ULONG64 local_SwapChain = (ULONG64)SwapChain;
	//PULONG64 vTable = *(PULONG64*)local_SwapChain;
	volatile ULONG64 stck = stack;

	g_hook_callback(local_SwapChain, 0);

	memcpy(g_hooked_data, (PVOID)origin_present, 12);
	Common::StrongWrite((PVOID)origin_present, origin_data, 12);
}
VOID CALLBACK Callback2() {
	//myDbgPrint("[112233] Callback2\n");

	//Common::StrongWrite((PVOID)origin_present, g_hooked_data, 12);
	return;
}
VOID CALLBACK Callback_1(IDXGISwapChain* SwapChain, ULONG64 stack) {
	//Dx11MultiplanePresent
	volatile ULONG64 local_SwapChain = (ULONG64)SwapChain;
	//PULONG64 vTable = *(PULONG64*)local_SwapChain;
	volatile ULONG64 stck = stack;

	g_hook_callback(local_SwapChain, 1);

	memcpy(g_hooked_data_1, (PVOID)origin_present_1, 12);
	Common::StrongWrite((PVOID)origin_present_1, origin_data_1, 12);
}
VOID CALLBACK Callback2_1() {
	//myDbgPrint("[112233] Callback2\n");

	//Common::StrongWrite((PVOID)origin_present_1, g_hooked_data_1, 12);
	return;
}

bool set_presenthook() {
	ULONG64 pos = GetDx11PresentImpl();

	myDbgPrint("[112233] 2233\n");
	myDbgPrint1("[112233] present:%p\n", pos);
	if (pos) {
		origin_present = pos;
		hook_origin_present = origin_present;
		memcpy(origin_data, (PVOID)origin_present, 12);

		HookCallBackFunction = (ULONG64)Callback;
		HookCallBackFunction2 = (ULONG64)Callback2;

		UCHAR jmpcode[12] = { 0x48, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xFF, 0xE0 };

		*(ULONG64*)(jmpcode + 2) = (ULONG64)HookProc;

		Common::StrongWrite((LPVOID)origin_present, jmpcode, 12);

	}

	return true;
}
bool set_presenthook2() {
	ULONG64 pos = GetDx11MultiplanePresent();
	myDbgPrint1("[112233] new_present:%p\n", pos);
	if (pos) {
		origin_present_1 = pos;
		hook_origin_present_1 = origin_present_1;
		memcpy(origin_data_1, (PVOID)origin_present_1, 12);

		HookCallBackFunction_1 = (ULONG64)Callback_1;
		HookCallBackFunction2_1 = (ULONG64)Callback2_1;
		ULONG64 dxgi = (ULONG64)GetMemModuleHandleA("dxgi.dll");
		UCHAR jmpcode[12] = { 0x48, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xFF, 0xE0 };
		*(ULONG64*)(jmpcode + 2) = (ULONG64)HookProc_1;

		Common::StrongWrite((LPVOID)origin_present_1, jmpcode, 12);

	}

	return true;
}
bool set_presenthook_win7() {
	//PresentImpl
	//E8 ?? ?? ?? ?? 3D 01 00 7A 08
	//E8 ?? ?? ?? ?? 8B ?? ?? ?? 02 00 7A 08

	ULONG64 pos1 = 0;
	ULONG64 pos2 = 0;
	GetWin7Present(&pos1, &pos2);
	myDbgPrint2("[112233] pos1:%p pos2:%p\n", pos1, pos2);
	if (pos1) {
		origin_present = pos1;
		hook_origin_present = origin_present;
		memcpy(origin_data, (PVOID)origin_present, 12);

		HookCallBackFunction = (ULONG64)Callback;
		HookCallBackFunction2 = (ULONG64)Callback2;

		UCHAR jmpcode[12] = { 0x48, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xFF, 0xE0 };

		*(ULONG64*)(jmpcode + 2) = (ULONG64)HookProc;

		Common::StrongWrite((LPVOID)origin_present, jmpcode, 12);

	}
	if (pos2) {
		origin_present_1 = pos2;
		hook_origin_present_1 = origin_present_1;
		memcpy(origin_data_1, (PVOID)origin_present_1, 12);

		//DWORD old = 0;
		//myVirtualProtect(&SwapChain[8], 8, PAGE_READWRITE, &old);
		HookCallBackFunction_1 = (ULONG64)Callback_1;
		HookCallBackFunction2_1 = (ULONG64)Callback2_1;

		ULONG64 dxgi = (ULONG64)GetMemModuleHandleA("dxgi.dll");
		UCHAR jmpcode[12] = { 0x48, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xFF, 0xE0 };
		//UCHAR jmpcode[5] = { 0xE9, 0x00, 0x00, 0x00, 0x00 };
		*(ULONG64*)(jmpcode + 2) = (ULONG64)HookProc_1;
		//LONG offset1 = ((LONG64)jmp_target) - (((LONG64)origin_present_1) + 5);
		//*(LONG*)(jmpcode + 1) = offset1;

		Common::StrongWrite((LPVOID)origin_present_1, jmpcode, 12);

	}

	return true;
}
void install_dxhook(FnDxgiCallback callback) {
	g_hook_callback = callback;
	ULONG bn = myGetNtBuildNumber();

	
	if (bn < WIN10) {
		set_presenthook_win7();
	}
	else {
		set_presenthook();
		set_presenthook2();
	}
	


}
void remove_dxhook() {
	Common::StrongWrite((PVOID)origin_present, origin_data, 12);
	Common::StrongWrite((PVOID)origin_present_1, origin_data_1, 12);
}
