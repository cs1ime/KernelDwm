#include "DDkCommon.h"

#include "XorCrypt.h"
#include "khookutil.h"

#include "ImportEncrypt.h"

void APCKernelRoutine(PKAPC apc) {
	ExFreePool(apc);
}
 VOID ApcpKernelRoutineAlertThreadCallback(
	_In_ PKAPC Apc
)
{
	typedef VOID(*FnKeTestAlertThread)(UINT64 mode);
	FnKeTestAlertThread KeTestAlertThread = (decltype(KeTestAlertThread))(KGetProcAddress(ntos(), "KeTestAlertThread"));


	KeTestAlertThread(UserMode);
	ExFreePool(Apc);
}

PVOID g_KiSignalThreadForApc = MOU_XOR((PVOID)0);

void kapc_init() {
	static int inited = 0;
	if (inited == 1) {
		return;
	}
	//45 33 C9 41 B8 00 01 00 00 48 8B ?? E8 ?? ?? ?? ?? 80
	ULONG_PTR pos = utilinc::ScanSection_Image(ntos(), xs(".text"), xs("45 33 C9 41 B8 00 01 00 00 48 8B ?? E8 ?? ?? ?? ?? 80"));
	if (pos) {
		//g_KiSignalThreadForApc = (PVOID)(*(LONG*)(pos + 13) + pos + 17);
		g_KiSignalThreadForApc = KGetFunctionBegin(KGetNtoskrnl(), (PVOID)pos);
		g_KiSignalThreadForApc = MOU_XOR(g_KiSignalThreadForApc);
	}
	if (MOU_XOR(g_KiSignalThreadForApc) == 0)
		KeBugCheck(0xCEFCDDAA);
	inited = 1;
}
