#include <ntifs.h>
#include "DDKCommon.h"
#include "importencrypt.h"
#include "dwm/InjectDWM.h"
#include "dwm/kdxhook.h"
#include "dwm/DwmRender.h"
#include "xorstr.hpp"
#include "CompileControl.h"
#include "kernelasm.h"
#include "util/util.h"

#include "dwm/dxgkhook.h"
#include "dwm/kdxrender.h"
#include "dwm/kcall.h"
#include "khook/khook3.h"

extern "C" { unsigned int _fltused = 1; }

int
__cdecl atexit(
	__in void(__cdecl* destructor)(void)
)
{
	if (!destructor)
		return 0;
	return 1;
}
extern "C" DWORD64 _handle_nanf(DWORD64) {
	return 0;
}


__forceinline BOOL FeatureInit(PDRIVER_OBJECT drv, PUNICODE_STRING reg_path) {

	if (KGetBuildNumber() < WIN10)
		KeBugCheck(0x100);
	Mmi_Init();
	GetRealTime();
	KGetHaldll();
	KGetNtoskrnl();
	KGetDymOffsets();
	Process::Init();
	KCall::Init();
	DWM::Init();
	DWM::Init2();
	krd::Init();

	return TRUE;
}

extern "C" NTSTATUS DriverEntry(PDRIVER_OBJECT drv, PUNICODE_STRING reg_path) {
	InitNtoskrnl();
	FT::InitAll();
	DynamicEmulator::Init();

	if (!FeatureInit(drv, reg_path)) {
		return STATUS_SUCCESS;
	}
	PEPROCESS process = Process::FindProcess(xs("dwm.exe"));
	ObReferenceObject(process);

	KAPC_STATE apc_state = { 0 };
	KeStackAttachProcess(process, &apc_state);
	khook3::InstallHook();
	KeUnstackDetachProcess(&apc_state);

	ObDereferenceObject(process);
	KCleanUpAllManualMapImage();

	return STATUS_SUCCESS;
}