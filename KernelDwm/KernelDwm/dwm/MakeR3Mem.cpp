#include "MakeR3Mem.h"
#include "DDKCommon.h"
#include "smem.h"
#include "kernelasm.h"
#include "xorstr.hpp"
#include "compilecontrol.h"
#include "importencrypt.h"
#include "MyMemoryIo64.h"

namespace r3mem {
	/// nt!_HARDWARE_PTE on x64 Windows
	struct AllocItem {
		ULONG type;
		HardwarePteX64 *pPageEntry;
		PVOID poolAddr;
	};
	struct PageHistory{
		int cnt;
		AllocItem his[0x10000];
	};
	PVOID NewHistory() {
		PVOID p = ExAllocatePool(NonPagedPoolNx, sizeof(PageHistory));;
		memset(p, 0, sizeof(PageHistory));
		return p;
	}
	VOID DeleteHistory(PVOID h) {
		memset(h, 0, sizeof(PageHistory));
		ExFreePool(h);
	}
	bool FreeHistory(PVOID a_his) {
		auto his = (PageHistory *)a_his;
		if (his->cnt == 0)
			return false;
		for (int i = 0; i < his->cnt; i++) {
			if (his->his[i].type == 1) {
				his->his[i].pPageEntry->all = 0;
				his->his[i].type = 0;
				//KFreePool(his->his[i].poolAddr, 0x1000);
				memset((PVOID)his->his[i].poolAddr, 0, 0x1000);
				ExFreePool(his->his[i].poolAddr);
			}
		}
		for (int i = 0; i < his->cnt; i++) {
			if (his->his[i].type == 2) {
				his->his[i].pPageEntry->all = 0;
				his->his[i].type = 0;
				//KFreePool(his->his[i].poolAddr, 0x1000);
				memset((PVOID)his->his[i].poolAddr, 0, 0x1000);
				ExFreePool(his->his[i].poolAddr);
			}
		}
		for (int i = 0; i < his->cnt; i++) {
			if (his->his[i].type == 3) {
				his->his[i].pPageEntry->all = 0;
				his->his[i].type = 0;
				//KFreePool(his->his[i].poolAddr, 0x1000);
				memset((PVOID)his->his[i].poolAddr, 0, 0x1000);
				ExFreePool(his->his[i].poolAddr);
			}
		}
		his->cnt = 0;
		return true;
	}

	__forceinline VOID AddHis(PageHistory *his, HardwarePteX64* e, PVOID p, int t) {
		his->his[his->cnt].pPageEntry = e;
		his->his[his->cnt].poolAddr = p;
		his->his[his->cnt].type = t;
		his->cnt++;
	}

	__forceinline HardwarePteX64 AllocPageEntry(PVOID *ppool) {
		PHYSICAL_ADDRESS HighestAcceptableAddress;
		HighestAcceptableAddress.QuadPart = 0xFFFFFFFF00000000;
		//PVOID addr = MmAllocateContiguousMemory(0x1000, HighestAcceptableAddress);
		//PVOID addr = KAllocateHeap(0x1000);
		//if ((ULONG64)addr & 0xFFF) {
		//	KFreePool(addr, 0x1000);
		//	while ((ULONG64)(addr = KAllocateHeap(0x1000)) & 0xFFF) {
		//		KFreePool(addr, 0x1000);
		//		Sleep(100);
		//	}
		//}
		PVOID addr = ExAllocatePool(NonPagedPoolNx, 0x1000);
		if ((ULONG64)addr & 0xFFF) {
			ExFreePool(addr);
			while ((ULONG64)(addr = ExAllocatePool(NonPagedPoolNx, 0x1000)) & 0xFFF) {
				ExFreePool(addr);
				Sleep(100);
			}
		}

		RtlZeroMemory(addr, 0x1000);
		PHYSICAL_ADDRESS phy;
		phy.QuadPart = MmiGetPhysicalAddress(addr);
		//DbgPrint("[112233] Alloc Entry:%p\n", phy.QuadPart);
		ULONG64 pfn = phy.QuadPart >> 12;

		HardwarePteX64 pte = { 0 };
		pte.page_frame_number = pfn;
		pte.valid = 1;
		//pte.accessed = 1;
		//pte.dirty = 1;
		pte.write = 1;
		pte.owner = 1;

		*ppool = addr;
		return pte;
	}
	__forceinline BOOLEAN AllocAndOverWritePte(ULONG64 Address, PageHistory *a_his) {
		auto his = (PageHistory *)a_his;

		DWORD64 pxe = MmiGetPxeAddress((PVOID64)Address);
		//DbgPrint("[112233] pxe:%p\n", pxe);
		bool fsh = false;
		if (*(DWORD64*)pxe == 0) {
			return FALSE;
			//HardwarePteX64 pte = AllocPageEntry();
			//pte.software_ws_index = 7;
			//*(DWORD64*)pxe = pte.all;
			//fsh = true;
		}
		DWORD64 ppe = MmiGetPpeAddress((PVOID64)Address);
		//DbgPrint("[112233] ppe:%p\n", ppe);
		if (fsh) {
			MmiFlushTLB((PVOID)ppe);
		}
		if (*(DWORD64*)ppe == 0) {
			PVOID pool = 0;
			HardwarePteX64 pte = AllocPageEntry(&pool);
			pte.software_ws_index = 8;
			*(DWORD64*)ppe = pte.all;

			AddHis(his, (HardwarePteX64*)ppe, pool, 3);
			fsh = true;
		}
		DWORD64 pde = MmiGetPdeAddress((PVOID64)Address);
		//DbgPrint("[112233] pde:%p\n", pde);
		if (fsh) {
			MmiFlushTLB((PVOID)pde);
		}
		if (*(DWORD64*)pde == 0) {
			PVOID pool = 0;
			HardwarePteX64 pte = AllocPageEntry(&pool);
			pte.software_ws_index = 9;
			*(DWORD64*)pde = pte.all;

			AddHis(his, (HardwarePteX64*)pde, pool, 2);
			fsh = true;
		}
		DWORD64 pte = MmiGetPteAddress((PVOID64)Address);
		//DbgPrint("[112233] pte:%p\n", pte);
		if (fsh) {
			MmiFlushTLB((PVOID)pte);
		}
		if (*(DWORD64*)pte == 0) {
			PVOID pool = 0;
			HardwarePteX64 dpte = AllocPageEntry(&pool);
			*(DWORD64*)pte = dpte.all;

			AddHis(his, (HardwarePteX64*)pte, pool, 1);
		}

		//MmiFlushTLB((PVOID)Address);

		//DbgBreakPoint();
		//while (1)
			//Sleep(100);

		return TRUE;
	}
	__forceinline BOOLEAN MakeR3Memory(ULONG64 start, ULONG64 size, PVOID a_his) {
		PageHistory *his = (PageHistory *)a_his;

		for (int i = 0; i < size / 0x1000; i++) {
			if (AllocAndOverWritePte(start + i * 0x1000, his) == FALSE) {
				return FALSE;
			}
		}
		ULONG64 uVa = (ULONG64)start;
		for (int i = 0; i < size / 0x1000; i++) {
			MmiFlushTLB((PVOID)(uVa + i * 0x1000));
		}
		return TRUE;
	}

	__forceinline ULONG64 get_ntdll_end(int type) {
		if (type == 0) {
			return 0x7FFCFFFE0000;
		}
		else if (type == 1) {
			return 0x7FFBFDAE0000;
		}
		ULONG64 ntdll = (ULONG64)GetUserModeModuleBaseX64A("ntdll.dll");
		printf("[112233] ntdll:%p\n", ntdll);
		if (!ntdll)
			return 0;
		//ULONG64 ntdll = 0x7FFBFFFE0000;
		//return 0x100000;
		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)(ntdll);
		LONG off = 0;
		MmiReadVirtualAddressSafe((ULONG64)&idh->e_lfanew, &off, 4);
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(ntdll + off);
		ULONG sz = 0;
		MmiReadVirtualAddressSafe((ULONG64)&inh->OptionalHeader.SizeOfImage, &sz, 4);
		return ntdll + sz;

		ULONG64 base = 0x7FFBFDAE0000;
		while (MmiGetPhysicalAddress((PVOID)base) != 0) {
			base += 0x1000;
		}
		return base;
	}

	__forceinline ULONG64 FnAllocR3Mem(ULONG Size, PVOID his) {
		{
			if (Size % 0x1000) {
				Size += 0x1000 - (Size % 0x1000);
			}
			ULONG64 start = 0x800000000000 - Size - (AsmRdtsc() % 0x3000) * 0x100000;

			BOOLEAN r = r3mem::MakeR3Memory(start, Size, his);
			//DbgPrint("[112233] r:%x\n", r);

			if (r)
				return start;
			return 0;
		}
		


		ULONG64 start = get_ntdll_end(2);
		
		if (start == 0)
			return 0;
		//DbgPrint("[112233] ndllend:%p\n", start);

		ULONG64 rstart = start;
		bool flag_ok = false;
		for (int i = 0; i < 100; i++) {
			rstart = start;
			rstart += 15 * 0x200000;
			rstart += (AsmRdtsc() % 0x3000) * 0x100000;
			rstart += (AsmRdtsc() % 0x3000) * 0x100000;
			if (rstart < 0x800000000000 && (rstart + Size + 1) < 0x800000000000) {
				flag_ok = true;
				start = rstart;
				break;
			}
			
		}
		if (flag_ok == false)
			return false;

		//DbgPrint("[112233] start:%p\n", start);

		if (Size % 0x1000) {
			Size += 0x1000 - (Size % 0x1000);
		}
		//MmiFlushTlbAllProcessor((PVOID)Address);
		BOOLEAN r = r3mem::MakeR3Memory(start, Size, his);
		//DbgPrint("[112233] r:%x\n", r);

		if (r)
			return start;
		return 0;
		start = get_ntdll_end(1);
		start += 15 * 0x200000;
		start += (AsmRdtsc() % 0x1000) * 0x1000;
		start += (AsmRdtsc() % 0x1000) * 0x1000;

		//DbgPrint("[112233] start:%p\n", start);

		if (Size % 0x1000) {
			Size += 0x1000 - (Size % 0x1000);
		}
		for (int i = 0; i < 5; i++) {
			r = r3mem::MakeR3Memory(start, Size, his);
			if (r)
				break;
		}
		
		if (r)
			return start;
		start = get_ntdll_end(0);
		start += 15 * 0x200000;
		start += (AsmRdtsc() % 0x1000) * 0x1000;
		start += (AsmRdtsc() % 0x1000) * 0x1000;

		//DbgPrint("[112233] start:%p\n", start);

		if (Size % 0x1000) {
			Size += 0x1000 - (Size % 0x1000);
		}
		for (int i = 0; i < 5; i++) {
			r = r3mem::MakeR3Memory(start, Size, his);
			if (r)
				break;
		}

		if (r)
			return start;
		return 0;
	}
	ULONG64 AllocR3Mem(ULONG Size, PVOID his) {
		for (int i = 0; i < 5; i++) {

			ULONG64 r = FnAllocR3Mem(Size, his);

			if (r)
				return r;
		}
		return 0;
	}
}
