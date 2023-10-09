#pragma once 

#ifndef __MyMempryIO64___Included___
#define __MyMempryIO64___Included___
#include "ntifs.h"
#include "ntimage.h"
#include "XorStr.hpp"
#include "KernelAsm.h"

struct HardwarePteX64 {
	union
	{
		ULONG64 all;
		struct {
			ULONG64 valid : 1;               //!< [0]
			ULONG64 write : 1;               //!< [1]
			ULONG64 owner : 1;               //!< [2]
			ULONG64 write_through : 1;       //!< [3]     PWT
			ULONG64 cache_disable : 1;       //!< [4]     PCD
			ULONG64 accessed : 1;            //!< [5]
			ULONG64 dirty : 1;               //!< [6]
			ULONG64 large_page : 1;          //!< [7]     PAT
			ULONG64 global : 1;              //!< [8]
			ULONG64 copy_on_write : 1;       //!< [9]
			ULONG64 prototype : 1;           //!< [10]
			ULONG64 reserved0 : 1;           //!< [11]
			ULONG64 page_frame_number : 36;  //!< [12:47]
			ULONG64 reserved1 : 4;           //!< [48:51]
			ULONG64 software_ws_index : 11;  //!< [52:62]
			ULONG64 no_execute : 1;          //!< [63]
		};
	};

};
struct CR4 {
	union {
		ULONG64 all;
		struct {
			ULONG64 VME : 1;
			ULONG64 PVI : 1;
			ULONG64 TSD : 1;
			ULONG64 DE : 1;
			ULONG64 PSE : 1;
			ULONG64 PAE : 1;
			ULONG64 MCE : 1;
			ULONG64 PGE : 1;
			ULONG64 PCE : 1;
			ULONG64 OSFXSR : 1;
			ULONG64 OSXMMEXCPT : 1;
			ULONG64 UMIP : 1;
			ULONG64 LA57 : 1;
			ULONG64 VMXE : 1;
			ULONG64 SMXE : 1;
			ULONG64 Reversed1 : 1;
			ULONG64 FSGSBASE : 1;
			ULONG64 PCIDE : 1;
			ULONG64 OSXSAVE : 1;
			ULONG64 Reversed2 : 1;
			ULONG64 SMEP : 1;
			ULONG64 SMAP : 1;
			ULONG64 PKE : 1;
		};
	};
};

typedef struct _MyVirtualAddress {
	union {
		struct {
			ULONG64 offset : 12;
			ULONG64 pte_index : 9;
			ULONG64 pde_index : 9;
			ULONG64 ppe_index : 9;
			ULONG64 pxe_index : 9;
		};
		ULONG64 VirtualAddress;
	};
}MyVirtualAddress, *PMyVirtualAddress;

typedef struct _MyPageTableEntry {
	union {
		struct {
			ULONG64 Present				 : 1;
			ULONG64 Writable			 : 1;
			ULONG64 UserAccessible		 : 1;
			ULONG64 WriteThrough		 : 1;
			ULONG64 DisableCache		 : 1;
			ULONG64 Accessd				 : 1;
			ULONG64 Dirty				 : 1;
			ULONG64 HugePage			 : 1;
			ULONG64 Global				 : 1;
			ULONG64 Available1			 : 3;
			ULONG64 PhysicalAddress		 : 40;
			ULONG64 Available2			 : 11;
			ULONG64 NoExecute			 : 1;
		};	
		ULONG64 Value;
	};
}MyPageTableEntry, *PMyPageTableEntry;

#define MmiInvaildAddressValue ((PVOID64)~0)

#define MmiEntryToAddress(v)			(((ULONG64)v)&0x000FFFFFFFFFF000)
#define MmiEntryFlag_Present			((ULONG64)0x0000000000000001)
#define MmiEntryFlag_Write				((ULONG64)0x0000000000000002)
#define MmiEntryFlag_UserAccessible		((ULONG64)0x0000000000000004)
#define MmiEntryFlag_WriteThrough		((ULONG64)0x0000000000000008)
#define MmiEntryFlag_DisableCache		((ULONG64)0x0000000000000010)
#define MmiEntryFlag_Accessed			((ULONG64)0x0000000000000020)
#define MmiEntryFlag_Dirty				((ULONG64)0x0000000000000040)
#define MmiEntryFlag_HugePage			((ULONG64)0x0000000000000080)
#define MmiEntryFlag_Global				((ULONG64)0x0000000000000100)
#define MmiEntryFlag_NoExecute			((ULONG64)0x8000000000000000)

#define MmiEntryFlag_EntryPage			(MmiEntryFlag_Present | MmiEntryFlag_Write | MmiEntryFlag_Accessed | MmiEntryFlag_Dirty)
#define MmiEntryFlag_ReadOnlyPage			(MmiEntryFlag_Present | MmiEntryFlag_Accessed | MmiEntryFlag_Dirty)

#define MmiCheckFlag(e,f) (e&f)

#define MmiMakeVirtualAddressHigh16(pxe) ((pxe&0x100)?((ULONG64)0xFFFF000000000000):((ULONG64)0x0000000000000000))
#define MmiMakeVirtualAddress_PXE(pxe) (MmiMakeVirtualAddressHigh16(pxe)|(((ULONG64)pxe)<<39))
#define MmiMakeVirtualAddress_PPE(pxe,ppe) (MmiMakeVirtualAddressHigh16(pxe)|(((ULONG64)pxe)<<39)|(((ULONG64)ppe)<<30))
#define MmiMakeVirtualAddress_PDE(pxe,ppe,pde) (MmiMakeVirtualAddressHigh16(pxe)|(((ULONG64)pxe)<<39)|(((ULONG64)ppe)<<30)|(((ULONG64)pde)<<21))
#define MmiMakeVirtualAddress_PTE(pxe,ppe,pde,pte) (MmiMakeVirtualAddressHigh16(pxe)|(((ULONG64)pxe)<<39)|(((ULONG64)ppe)<<30)|(((ULONG64)pde)<<21)|(((ULONG64)pte)<<12))
#define MmiMakeVirtualAddress(pxe,ppe,pde,pte,o) (MmiMakeVirtualAddressHigh16(pxe)|(((ULONG64)pxe)<<39)|(((ULONG64)ppe)<<30)|(((ULONG64)pde)<<21)|(((ULONG64)pte)<<12)|((ULONG64)o))


#define MmiVA_GetPXEIndex(v)	((((ULONG64)v)&((ULONG64)0x0000FF8000000000))>>39)
#define MmiVA_GetPPEIndex(v)	((((ULONG64)v)&((ULONG64)0x0000007FC0000000))>>30)
#define MmiVA_GetPDEIndex(v)	((((ULONG64)v)&((ULONG64)0x000000003FE00000))>>21)
#define MmiVA_GetPTEIndex(v)	((((ULONG64)v)&((ULONG64)0x00000000001FF000))>>12)
#define MmiVA_GetOFFSET(v)		(((ULONG64)v)&((ULONG64)0x0000000000000FFF))

#define MmiGetPhysicalPFN(p) (((ULONG64)(p)&0x0000FFFFFFFFF000)>>12)
#define MmiGetCr3() (MmiEntryToAddress(AsmReadCr3()))

#define PTE_BASE_KEY (0xdb7c2358933e371e)
#define PDE_BASE_KEY (0xb55287428c9b9a91)
#define PPE_BASE_KEY (0x33545cdbf8d8d766)
#define PXE_BASE_KEY (0x3dc5933e8df400fd)

extern DWORD64 g_PteBase;
extern DWORD64 g_PdeBase;
extern DWORD64 g_PpeBase;
extern DWORD64 g_PxeBase;

//BOOLEAN MmiSafeMemcpy(void *dst, void *src, size_t size);

__forceinline DWORD64 MmiGetPteAddress(PVOID64 Address) {
	return ((((((DWORD64)Address) & 0x0000FFFFFFFFF000) >> 12) << 3) + (g_PteBase^PTE_BASE_KEY));
}
__forceinline DWORD64 MmiGetPdeAddress(PVOID64 Address) {
	return ((((((DWORD64)Address) & 0x0000FFFFFFFFF000) >> 21) << 3) + (g_PdeBase^PDE_BASE_KEY));
}
__forceinline DWORD64 MmiGetPpeAddress(PVOID64 Address) {
	return ((((((DWORD64)Address) & 0x0000FFFFFFFFF000) >> 30) << 3) + (g_PpeBase^PPE_BASE_KEY));
}
__forceinline DWORD64 MmiGetPxeAddress(PVOID64 Address) {
	return ((((((DWORD64)Address) & 0x0000FFFFFFFFF000) >> 39) << 3) + (g_PxeBase^PXE_BASE_KEY));
}

BOOLEAN Mmi_Init();

__forceinline VOID MmiFlushTLB(PVOID LinearAddress) {
	AsmInvlpg((ULONG64)LinearAddress);

}

struct MMI_PEND {
	PVOID64 Pending;
	PULONG64 Pending_Pte;
	ULONG64 OriginEntry;
	USHORT lock;
};

#define MAX_PEND_SIZE (10)
extern MMI_PEND g_pd[MAX_PEND_SIZE];

extern BOOLEAN g_Physical_Inited;

__forceinline ULONG64 MmiGetPhysicalAddress(PVOID va) {
	HardwarePteX64 PageEntry[3] = { 0 };
	HardwarePteX64 page;

	PULONG64 p_pxe = (PULONG64)MmiGetPxeAddress(va);
	page.all = *p_pxe;
	if (page.valid == 0)
		return 0;
	if (page.large_page) {
		//ULONG64 off = (ULONG64)va & 0x7FFFFFFFFF;
		//ULONG64 PhyAdd = page.page_frame_number << 12;
		//PhyAdd += off;
		//return PhyAdd;
		return 0;
	}
	PULONG64 p_ppe = (PULONG64)MmiGetPpeAddress(va);
	page.all = *p_ppe;
	if (page.valid == 0)
		return 0;
	if (page.large_page) {
		ULONG64 off = (ULONG64)va & 0x3FFFFFFF;
		ULONG64 PhyAdd = page.page_frame_number << 12;
		PhyAdd += off;
		return PhyAdd;
	}
	PULONG64 p_pde = (PULONG64)MmiGetPdeAddress(va);
	page.all = *p_pde;
	if (page.valid == 0)
		return 0;
	if (page.large_page) {
		ULONG64 off = (ULONG64)va & 0x1FFFFF;
		ULONG64 PhyAdd = page.page_frame_number << 12;
		PhyAdd += off;
		return PhyAdd;
	}
	PULONG64 p_pte = (PULONG64)MmiGetPteAddress(va);
	page.all = *p_pte;
	if (page.valid == 0)
		return 0;
	ULONG64 off = (ULONG64)va & 0xFFF;
	ULONG64 PhyAdd = page.page_frame_number << 12;
	PhyAdd += off;
	return PhyAdd;
}

__forceinline bool MmiCheckBigPage(PVOID64 Address) {
	PVOID va = Address;

	HardwarePteX64 PageEntry[3] = { 0 };
	HardwarePteX64 page;

	PULONG64 p_pxe = (PULONG64)MmiGetPxeAddress(va);
	page.all = *p_pxe;
	if (page.valid == 0) return 0;
	if (page.large_page) {
		//return true;
		return false;
	}
	PULONG64 p_ppe = (PULONG64)MmiGetPpeAddress(va);
	page.all = *p_ppe;
	if (page.valid == 0) return 0;
	if (page.large_page) {
		return true;
	}
	PULONG64 p_pde = (PULONG64)MmiGetPdeAddress(va);
	page.all = *p_pde;
	if (page.valid == 0) return false;
	if (page.large_page) {
		return true;
	}
	return false;
}

__forceinline MMI_PEND* AcquirePendingPte() {
	for (int i = 0; i < MAX_PEND_SIZE; i++) {
		if (InterlockedCompareExchange16((volatile SHORT*)&g_pd[i].lock, 1, 0) == 0) {
			return &g_pd[i];
		}
	}
	return NULL;
}
__forceinline void ReleasePendingPte(MMI_PEND* pd) {
	pd->lock = 0;
}
__forceinline BOOLEAN MmiReadPhysicalMemory(DWORD64 PhysicalAddress, PVOID64 Dst, ULONG Lenth) {
	if (Lenth == 0)return TRUE;

	ULONG old_irql = AsmReadCr8();
	if (old_irql < 2)
		AsmWriteCr8(2);

	MMI_PEND* pd = AcquirePendingPte();
	if (pd == NULL) {
		if (old_irql < 2)
			AsmWriteCr8(old_irql);
		return FALSE;
	}

	PULONG64 Pending_Pte = pd->Pending_Pte;
	PVOID Pending = pd->Pending;

	ULONG64 StartPhysicalAddress = (ULONG64)PhysicalAddress;
	ULONG64 EndPhysicalAddress = StartPhysicalAddress + Lenth - 1;
	ULONG64 StartPhysicalAddressPage = StartPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 EndPhysicalAddressPage = EndPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 StartPFN = MmiGetPhysicalPFN(StartPhysicalAddress);
	ULONG64 EndPFN = MmiGetPhysicalPFN(EndPhysicalAddress);
	ULONG ThroughPages = EndPFN - StartPFN;
	if (ThroughPages == 0) {
		ULONG64 offset = StartPhysicalAddress & 0x0000000000000FFF;
		*Pending_Pte = StartPhysicalAddressPage | MmiEntryFlag_ReadOnlyPage;
		MmiFlushTLB(Pending);
		memcpy(Dst, ((PUCHAR)Pending) + offset, Lenth);
	}
	else {
		ULONG64 FirstReadPage = StartPhysicalAddressPage;
		ULONG FirstReadOffset = StartPhysicalAddress & 0x0000000000000FFF;
		ULONG FirstReadSize = PAGE_SIZE - FirstReadOffset;

		*Pending_Pte = FirstReadPage | MmiEntryFlag_ReadOnlyPage;
		MmiFlushTLB(Pending);
		memcpy(Dst, ((PUCHAR)Pending) + FirstReadOffset, FirstReadSize);

		ULONG64 EndReadPage = EndPhysicalAddressPage;
		ULONG EndReadSize = (EndPhysicalAddress & 0x0000000000000FFF) + 1;
		ULONG EndReadDstOffset = (ThroughPages - 1) * PAGE_SIZE + FirstReadSize;

		*Pending_Pte = EndReadPage | MmiEntryFlag_ReadOnlyPage;
		MmiFlushTLB(Pending);
		memcpy(((PUCHAR)Dst) + EndReadDstOffset, Pending, EndReadSize);

		ULONG FullPageNum = ThroughPages - 1;
		if (FullPageNum) {
			for (ULONG i = 0; i < FullPageNum; ++i) {
				ULONG64 FullPageAddress = FirstReadPage + PAGE_SIZE + i * PAGE_SIZE;
				PUCHAR pDst = (PUCHAR)Dst + FirstReadSize + (i * PAGE_SIZE);
				*Pending_Pte = FullPageAddress | MmiEntryFlag_ReadOnlyPage;
				MmiFlushTLB(Pending);
				memcpy(pDst, Pending, PAGE_SIZE);
			}
		}


	}

	//*Pending_Pte = OriginEntry;
	//MmiFlushTLB(Pending);
	ReleasePendingPte(pd);

	if (old_irql < 2)
		AsmWriteCr8(old_irql);

	return TRUE;
}
__forceinline BOOLEAN MmiWritePhysicalMemory(DWORD64 PhysicalAddress, PVOID64 Src, ULONG Lenth) {
	PVOID64 Dst = Src;
	if (Lenth == 0)return TRUE;

	ULONG old_irql = AsmReadCr8();
	if (old_irql < 2)
		AsmWriteCr8(2);

	MMI_PEND* pd = AcquirePendingPte();
	if (pd == NULL) {
		if (old_irql < 2)
			AsmWriteCr8(old_irql);
		return FALSE;
	}
	PULONG64 Pending_Pte = pd->Pending_Pte;
	PVOID Pending = pd->Pending;

	ULONG64 StartPhysicalAddress = (ULONG64)PhysicalAddress;
	ULONG64 EndPhysicalAddress = StartPhysicalAddress + Lenth - 1;
	ULONG64 StartPhysicalAddressPage = StartPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 EndPhysicalAddressPage = EndPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 StartPFN = MmiGetPhysicalPFN(StartPhysicalAddress);
	ULONG64 EndPFN = MmiGetPhysicalPFN(EndPhysicalAddress);
	ULONG ThroughPages = EndPFN - StartPFN;
	if (ThroughPages == 0) {
		ULONG64 offset = StartPhysicalAddress & 0x0000000000000FFF;
		*Pending_Pte = StartPhysicalAddress | MmiEntryFlag_EntryPage;
		MmiFlushTLB(Pending);
		memcpy(((PUCHAR)Pending) + offset, Dst, Lenth);
	}
	else {
		ULONG64 FirstReadPage = StartPhysicalAddressPage;
		ULONG FirstReadOffset = StartPhysicalAddress & 0x0000000000000FFF;
		ULONG FirstReadSize = PAGE_SIZE - FirstReadOffset;

		*Pending_Pte = FirstReadPage | MmiEntryFlag_EntryPage;
		MmiFlushTLB(Pending);
		memcpy(((PUCHAR)Pending) + FirstReadOffset, Dst, FirstReadSize);

		ULONG64 EndReadPage = EndPhysicalAddressPage;
		ULONG EndReadSize = (EndPhysicalAddress & 0x0000000000000FFF) + 1;
		ULONG EndReadDstOffset = (ThroughPages - 1) * PAGE_SIZE + FirstReadSize;

		*Pending_Pte = EndReadPage | MmiEntryFlag_EntryPage;
		MmiFlushTLB(Pending);
		memcpy(Pending, ((PUCHAR)Dst) + EndReadDstOffset, EndReadSize);

		ULONG FullPageNum = ThroughPages - 1;
		if (FullPageNum) {
			for (ULONG i = 0; i < FullPageNum; ++i) {
				ULONG64 FullPageAddress = FirstReadPage + PAGE_SIZE + i * PAGE_SIZE;
				PUCHAR pDst = (PUCHAR)Dst + FirstReadSize + (i * PAGE_SIZE);
				*Pending_Pte = FullPageAddress | MmiEntryFlag_EntryPage;
				MmiFlushTLB(Pending);
				memcpy(Pending, pDst, PAGE_SIZE);
			}
		}


	}

	//*Pending_Pte = OriginEntry;
	//MmiFlushTLB(Pending);
	ReleasePendingPte(pd);

	if (old_irql < 2)
		AsmWriteCr8(old_irql);


	return TRUE;
}
__forceinline BOOLEAN MmiZeroPhysicalMemory(DWORD64 PhysicalAddress, ULONG Lenth) {
	if (Lenth == 0)return TRUE;

	ULONG old_irql = AsmReadCr8();
	if (old_irql < 2)
		AsmWriteCr8(2);
	MMI_PEND* pd = AcquirePendingPte();
	if (pd == NULL) {
		if (old_irql < 2)
			AsmWriteCr8(old_irql);
		return FALSE;
	}
	PULONG64 Pending_Pte = pd->Pending_Pte;
	PVOID Pending = pd->Pending;

	ULONG64 StartPhysicalAddress = (ULONG64)PhysicalAddress;
	ULONG64 EndPhysicalAddress = StartPhysicalAddress + Lenth - 1;
	ULONG64 StartPhysicalAddressPage = StartPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 EndPhysicalAddressPage = EndPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 StartPFN = MmiGetPhysicalPFN(StartPhysicalAddress);
	ULONG64 EndPFN = MmiGetPhysicalPFN(EndPhysicalAddress);
	ULONG ThroughPages = EndPFN - StartPFN;
	if (ThroughPages == 0) {
		ULONG64 offset = StartPhysicalAddress & 0x0000000000000FFF;
		*Pending_Pte = StartPhysicalAddress | MmiEntryFlag_EntryPage;
		MmiFlushTLB(Pending);
		//memcpy(((PUCHAR)Pending) + offset, Dst, Lenth);
		memset(((PUCHAR)Pending) + offset, 0, Lenth);
	}
	else {
		ULONG64 FirstReadPage = StartPhysicalAddressPage;
		ULONG FirstReadOffset = StartPhysicalAddress & 0x0000000000000FFF;
		ULONG FirstReadSize = PAGE_SIZE - FirstReadOffset;

		*Pending_Pte = FirstReadPage | MmiEntryFlag_EntryPage;
		MmiFlushTLB(Pending);
		//memcpy(((PUCHAR)Pending) + FirstReadOffset, Dst, FirstReadSize);
		memset(((PUCHAR)Pending) + FirstReadOffset, 0, FirstReadSize);

		ULONG64 EndReadPage = EndPhysicalAddressPage;
		ULONG EndReadSize = (EndPhysicalAddress & 0x0000000000000FFF) + 1;
		ULONG EndReadDstOffset = (ThroughPages - 1) * PAGE_SIZE + FirstReadSize;

		*Pending_Pte = EndReadPage | MmiEntryFlag_EntryPage;
		MmiFlushTLB(Pending);
		//memcpy(Pending, ((PUCHAR)Dst) + EndReadDstOffset, EndReadSize);
		memset(Pending, 0, EndReadSize);

		ULONG FullPageNum = ThroughPages - 1;
		if (FullPageNum) {
			for (ULONG i = 0; i < FullPageNum; ++i) {
				ULONG64 FullPageAddress = FirstReadPage + PAGE_SIZE + i * PAGE_SIZE;
				//PUCHAR pDst = (PUCHAR)Dst + FirstReadSize + (i * PAGE_SIZE);
				*Pending_Pte = FullPageAddress | MmiEntryFlag_EntryPage;
				MmiFlushTLB(Pending);
				//memcpy(Pending, pDst, PAGE_SIZE);
				memset(Pending, 0, PAGE_SIZE);
			}
		}


	}

	//*Pending_Pte = OriginEntry;
	//MmiFlushTLB(Pending);
	ReleasePendingPte(pd);

	if (old_irql < 2)
		AsmWriteCr8(old_irql);

	return TRUE;
}

__forceinline BOOLEAN MmiReadVirtualAddressSafe(DWORD64 VirtualAddress, PVOID64 Dst, ULONG Lenth) {
	if (Lenth == 0)return TRUE;
	//DbgBreakPoint();

	ULONG64 StartPhysicalAddress = (ULONG64)VirtualAddress;
	ULONG64 EndPhysicalAddress = StartPhysicalAddress + Lenth - 1;
	ULONG64 StartPhysicalAddressPage = StartPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 EndPhysicalAddressPage = EndPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 StartPFN = MmiGetPhysicalPFN(StartPhysicalAddress);
	ULONG64 EndPFN = MmiGetPhysicalPFN(EndPhysicalAddress);
	ULONG ThroughPages = EndPFN - StartPFN;
	if (ThroughPages == 0) {
		ULONG64 phy = MmiGetPhysicalAddress((PVOID)VirtualAddress);
		if (phy == 0)
			return FALSE;
		//memcpy(Dst, ((PUCHAR)Pending) + offset, Lenth);
		MmiReadPhysicalMemory(phy, Dst, Lenth);
	}
	else {
		ULONG64 FirstReadPage = StartPhysicalAddressPage;
		ULONG FirstReadOffset = StartPhysicalAddress & 0x0000000000000FFF;
		ULONG FirstReadSize = PAGE_SIZE - FirstReadOffset;
		ULONG64 phy = MmiGetPhysicalAddress((PVOID)VirtualAddress);
		if (phy == 0)
			return FALSE;
		MmiReadPhysicalMemory(phy, Dst, FirstReadSize);

		ULONG64 EndReadPage = EndPhysicalAddressPage;
		ULONG EndReadSize = (EndPhysicalAddress & 0x0000000000000FFF) + 1;
		ULONG EndReadDstOffset = (ThroughPages - 1) * PAGE_SIZE + FirstReadSize;

		phy = MmiGetPhysicalAddress((PVOID)EndReadPage);
		if (phy == 0)
			return FALSE;
		//*Pending_Pte = EndReadPage | MmiEntryFlag_EntryPage;
		//MmiFlushTLB(Pending);
		//memcpy(((PUCHAR)Dst) + EndReadDstOffset, Pending, EndReadSize);
		MmiReadPhysicalMemory(phy, ((PUCHAR)Dst) + EndReadDstOffset, EndReadSize);

		ULONG FullPageNum = ThroughPages - 1;
		if (FullPageNum) {
			for (ULONG i = 0; i < FullPageNum; ++i) {
				ULONG64 FullPageAddress = FirstReadPage + PAGE_SIZE + i * PAGE_SIZE;
				PUCHAR pDst = (PUCHAR)Dst + FirstReadSize + (i * PAGE_SIZE);
				//*Pending_Pte = FullPageAddress | MmiEntryFlag_EntryPage;
				//MmiFlushTLB(Pending);
				//memcpy(pDst, Pending, PAGE_SIZE);

				phy = MmiGetPhysicalAddress((PVOID)FullPageAddress);
				if (phy == 0)
					return FALSE;
				MmiReadPhysicalMemory(phy, pDst, PAGE_SIZE);

			}
		}
	}
	return TRUE;
}
__forceinline BOOLEAN MmiWriteVirtualAddressSafe(DWORD64 VirtualAddress, PVOID64 Src, ULONG Lenth) {
	PVOID64 Dst = Src;
	if (Lenth == 0)return TRUE;

	ULONG64 StartPhysicalAddress = (ULONG64)VirtualAddress;
	ULONG64 EndPhysicalAddress = StartPhysicalAddress + Lenth - 1;
	ULONG64 StartPhysicalAddressPage = StartPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 EndPhysicalAddressPage = EndPhysicalAddress & 0xFFFFFFFFFFFFF000;
	ULONG64 StartPFN = MmiGetPhysicalPFN(StartPhysicalAddress);
	ULONG64 EndPFN = MmiGetPhysicalPFN(EndPhysicalAddress);
	ULONG ThroughPages = EndPFN - StartPFN;
	if (ThroughPages == 0) {
		ULONG64 phy = MmiGetPhysicalAddress((PVOID)VirtualAddress);
		if (phy == 0)
			return FALSE;
		//memcpy(Dst, ((PUCHAR)Pending) + offset, Lenth);
		MmiWritePhysicalMemory(phy, Dst, Lenth);
	}
	else {
		ULONG64 FirstReadPage = StartPhysicalAddressPage;
		ULONG FirstReadOffset = StartPhysicalAddress & 0x0000000000000FFF;
		ULONG FirstReadSize = PAGE_SIZE - FirstReadOffset;
		ULONG64 phy = MmiGetPhysicalAddress((PVOID)VirtualAddress);
		if (phy == 0)
			return FALSE;
		MmiWritePhysicalMemory(phy, Dst, FirstReadSize);

		ULONG64 EndReadPage = EndPhysicalAddressPage;
		ULONG EndReadSize = (EndPhysicalAddress & 0x0000000000000FFF) + 1;
		ULONG EndReadDstOffset = (ThroughPages - 1) * PAGE_SIZE + FirstReadSize;

		phy = MmiGetPhysicalAddress((PVOID)EndReadPage);
		if (phy == 0)
			return FALSE;
		//*Pending_Pte = EndReadPage | MmiEntryFlag_EntryPage;
		//MmiFlushTLB(Pending);
		//memcpy(((PUCHAR)Dst) + EndReadDstOffset, Pending, EndReadSize);
		MmiWritePhysicalMemory(phy, ((PUCHAR)Dst) + EndReadDstOffset, EndReadSize);

		ULONG FullPageNum = ThroughPages - 1;
		if (FullPageNum) {
			for (ULONG i = 0; i < FullPageNum; ++i) {
				ULONG64 FullPageAddress = FirstReadPage + PAGE_SIZE + i * PAGE_SIZE;
				PUCHAR pDst = (PUCHAR)Dst + FirstReadSize + (i * PAGE_SIZE);
				//*Pending_Pte = FullPageAddress | MmiEntryFlag_EntryPage;
				//MmiFlushTLB(Pending);
				//memcpy(pDst, Pending, PAGE_SIZE);

				phy = MmiGetPhysicalAddress((PVOID)FullPageAddress);
				if (phy == 0)
					return FALSE;
				MmiWritePhysicalMemory(phy, pDst, PAGE_SIZE);

			}
		}


	}
	return TRUE;
}
__forceinline BOOLEAN MmiReadVirtualAddressStringSafe(DWORD64 VirtualAddress, PVOID64 Dst, ULONG MaxLenth) {
	ULONG off = 0;
	while (1) {
		UCHAR v = 0;

		if (MmiReadVirtualAddressSafe(VirtualAddress + off, &v, 1) == FALSE)
			return FALSE;
		*(PUCHAR)((PUCHAR)Dst + off) = v;
		if (v == 0)
			return TRUE;
		off++;
		if (off >= MaxLenth)
			break;
	}
	return TRUE;
}
__forceinline BOOLEAN MmiReadVirtualAddressWStringSafe(DWORD64 VirtualAddress, PVOID64 Dst, ULONG MaxWCharCount) {
	ULONG off = 0;
	while (1) {
		WCHAR v = 0;
		if (MmiReadVirtualAddressSafe(VirtualAddress + off * 2, &v, 2) == FALSE)
			return FALSE;
		*(LPWSTR)((PUCHAR)Dst + off * 2) = v;
		if (v == 0)
			return TRUE;
		off++;
		if (off >= MaxWCharCount)
			break;
	}
	return TRUE;
}

__forceinline BOOLEAN MmiIsExecutableAddress(PVOID64 Address) {
	PULONG64 pxe = (PULONG64)MmiGetPxeAddress(Address);
	ULONG64 Entry = *pxe;
	if (MmiCheckFlag(Entry, MmiEntryFlag_Present)) {
		PULONG64 ppe = (PULONG64)MmiGetPpeAddress(Address);
		Entry = *ppe;
		if (MmiCheckFlag(Entry, MmiEntryFlag_Present)) {
			if (MmiCheckFlag(Entry, MmiEntryFlag_HugePage)) {
				return !MmiCheckFlag(Entry, MmiEntryFlag_NoExecute);
			}
			PULONG64 pde = (PULONG64)MmiGetPdeAddress(Address);
			Entry = *pde;
			if (MmiCheckFlag(Entry, MmiEntryFlag_Present)) {
				if (MmiCheckFlag(Entry, MmiEntryFlag_HugePage)) {
					return !MmiCheckFlag(Entry, MmiEntryFlag_NoExecute);
				}
				PULONG64 pte = (PULONG64)MmiGetPteAddress(Address);
				Entry = *pte;
				return (MmiCheckFlag(Entry, MmiEntryFlag_Present) && !MmiCheckFlag(Entry, MmiEntryFlag_NoExecute));
			}
		}
	}
	return FALSE;
}

__forceinline BOOLEAN MmiIsRangeVaild(DWORD64 va, ULONG sz) {
	if (sz == 0)
		return TRUE;
	DWORD64 LastPfn = (va + sz - 1) & 0xFFFFFFFFFFFFF000;
	DWORD64 StartPfn = va & 0xFFFFFFFFFFFFF000;

	DWORD64 through = LastPfn - StartPfn;

	for (int i = 0; i < through / 0x1000; i++) {
		if (MmiGetPhysicalAddress((PVOID)(StartPfn + i * 0x1000)) == 0)
			return FALSE;
	}
	return TRUE;
}

__forceinline UCHAR MemCachedReadByte(ULONG64 va, PVOID Cache) {
	return *((PUCHAR)Cache + (va & 0xFFF));
}
__forceinline BOOLEAN MemCachedReadMemory(ULONG64 address, PVOID buffer, ULONG64 size, ULONG64* CacheVa, PVOID Cache) {
	for (int i = 0; i < size; i++) {
		ULONG64 read_va = address + i;
		ULONG64 cur_cache = read_va & 0xFFFFFFFFFFFFF000;
		if (*CacheVa != cur_cache) {
			if (!MmiReadVirtualAddressSafe(cur_cache, Cache, 0x1000))
				return false;
			*CacheVa = cur_cache;
		}
		*(UCHAR*)((PUCHAR)buffer + i) = MemCachedReadByte(read_va, Cache);
	}
	return true;
}





#endif // !__MempryIO___Included___
