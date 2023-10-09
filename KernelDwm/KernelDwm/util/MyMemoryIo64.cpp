
#include "KernelAsm.h"
#include "DDKCommon.h"

#include "ImportEncrypt.h"
#include "xorstr.hpp"
#include "MyMemoryIo64.h"



DWORD64 g_PteBase = PTE_BASE_KEY ^ 0;
DWORD64 g_PdeBase = PDE_BASE_KEY ^ 0;
DWORD64 g_PpeBase = PPE_BASE_KEY ^ 0;
DWORD64 g_PxeBase = PXE_BASE_KEY ^ 0;


#define MAX_PEND_SIZE (10)
MMI_PEND g_pd[MAX_PEND_SIZE] = { 0 };

BOOLEAN g_Physical_Inited = FALSE;

#include "khookutil.h"

__forceinline PVOID AllocateTinyPage() {
	PULONG_PTR tempPool = (PULONG_PTR)ExAllocatePool(NonPagedPoolNx, 8 * 10000);
	int tempPoolCount = 0;

	PVOID result = 0;
	for (int i = 0; i < 10000; i++) {
		//PHYSICAL_ADDRESS HighestAcceptableAddress;
		//HighestAcceptableAddress.QuadPart = 0xFFFFFFFF00000000;
		//PVOID pool =
		//	MmAllocateContiguousMemory(PAGE_SIZE * 5, HighestAcceptableAddress);
		//RtlZeroMemory(pool, PAGE_SIZE * 5);
		PVOID pool = KAllocateHeap(PAGE_SIZE * 5);
		PVOID po = pool;
		//PVOID po = ExAllocatePool(NonPagedPoolNx, 0x5000);
		PVOID origin_po = po;
		po = (PVOID)(((ULONG64)po + 0x2000)&((ULONG64)(~(ULONG64)0xFFF)));
		if (!MmiCheckBigPage(po)) {
			result = po;
			break;
		}
		tempPool[tempPoolCount++] = (ULONG_PTR)origin_po;
	}
	for (int i = 0; i < tempPoolCount; i++) {
		//ExFreePool((PVOID)tempPool[i]);
		//MmFreeContiguousMemory((PVOID)tempPool[i]);
		KFreePool((PVOID)tempPool[i], PAGE_SIZE * 5);
	}

	ExFreePool(tempPool);
	if (result == 0)
		KeBugCheck(0x91002);
	return result;
}
__forceinline VOID MmiInitReadWritePhysical() {
	if (g_Physical_Inited == TRUE)
		return;
	PHYSICAL_ADDRESS pa;
	pa.QuadPart = 0;
	for (int i = 0; i < MAX_PEND_SIZE; i++) {
		PHYSICAL_ADDRESS HighestAcceptableAddress;
		HighestAcceptableAddress.QuadPart = 0xFFFFFFFF00000000;
		ULONG64 pool = (ULONG64)AllocateTinyPage();
		RtlZeroMemory((PVOID)pool, 0x1000);
		//if (!RemoveFromBigPool(pool))
			//KeBugCheck(0x866771);
		pool &= 0xFFFFFFFFFFFFF000;
		g_pd[i].Pending = (PVOID)(pool);
		g_pd[i].Pending_Pte = (PULONG64)MmiGetPteAddress((PUCHAR)g_pd[i].Pending);
		g_pd[i].OriginEntry = *g_pd[i].Pending_Pte;
		g_pd[i].lock = 0;
	}

	g_Physical_Inited = TRUE;
}
__forceinline PVOID64 KGetPteBase_Signature() {
	DWORD64 Ntoskrnl = (DWORD64)KGetNtoskrnl();
	DWORD64 Fun =
		(DWORD64)utilinc::GetProcAddress((PVOID)Ntoskrnl, xs("MmGetVirtualForPhysical"));
	DWORD64 pos =
		utilinc::FindSignatureCode_nocheck((LPCVOID)Fun, 0x200, xs("48 BA ?? ?? ?? ?? ?? ?? ?? ?? 48 C1 E2 19"), 0);
	if (pos == -1)return NULL;
	return *(PVOID64 *)(pos + Fun + 2);
}
__forceinline PVOID64 KGetPteBase() {
	ULONG BuildNumber = KGetBuildNumber();
	ULONG64 pte_base = 0;
	if (BuildNumber < 14316) {
		//win10
		pte_base = 0xFFFFF68000000000;
	}
	else {
		pte_base = (ULONG64)KGetPteBase_Signature();
		if (pte_base)
			return (PVOID64)pte_base;
		else {
			ULONG64 cr3_mask = ~(ULONG64)0xFFF;
			ULONG64 cr3 = AsmReadCr3() & cr3_mask;
			PHYSICAL_ADDRESS phy;
			phy.QuadPart = cr3;
			ULONG64 vir = (ULONG64)MmGetVirtualForPhysical(phy);
			if (vir) {
				for (int i = 0; i < 0x200; i++) {
					HardwarePteX64 v;
					v.all = *(ULONG64*)(vir + i * 8);
					if ((v.page_frame_number << 12) == cr3) {
						ULONG64 addon = (ULONG64)i << 39;
						pte_base = 0xFFFF000000000000 | addon;
						//DbgPrint("[112233] pte_base: %p %p\n", (ULONG64)KGetPteBase_Signature(), pte_base);
						break;
					}
				}
			}
		}


	}
	return (PVOID64)pte_base;

}

BOOLEAN Mmi_Init() {
	if ((g_PteBase^PTE_BASE_KEY) != 0)
		return TRUE;
	g_PteBase = (DWORD64)KGetPteBase();
	if (g_PteBase == 0) {
		KeBugCheck(0x8787878);
		return FALSE;
	}
	g_PteBase ^= PTE_BASE_KEY;

	g_PdeBase = MmiGetPteAddress((PVOID)(g_PteBase^PTE_BASE_KEY)) ^ PDE_BASE_KEY;
	g_PpeBase = MmiGetPteAddress((PVOID)(g_PdeBase^PDE_BASE_KEY)) ^ PPE_BASE_KEY;
	g_PxeBase = MmiGetPteAddress((PVOID)(g_PpeBase^PPE_BASE_KEY)) ^ PXE_BASE_KEY;

	MmiInitReadWritePhysical();
	return TRUE;
}


