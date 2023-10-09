#include "HandleTable.h"
#include "XorStr.hpp"

#include "ImportEncrypt.h"

EXPLOOPUPHANDLETABLEENTRY ExpLookupHandleTableEntry = 0;
ULONG64 PspCidTable = 0;
ULONG64 ObpKernelHandleTable = 0;

ULONG64 FindExpLookupHandleTableEntry() {
	ULONG BuildNumber = KGetBuildNumber();
	if (BuildNumber < 10240) {
		//win7
		//49 8B CD E8 ?? ?? ?? ?? 49 3B C2
		ULONG64 pos = ScanSection(xs("PAGE"), xs("49 8B CD E8 ?? ?? ?? ?? 49 3B C2"));

		if (pos) {
			return *(LONG *)(pos + 4) + pos + 8;
		}

	}
	else if (BuildNumber >= 10240) {
		//win10
		//49 8B D1 E8 ?? ?? ?? ?? 48 8B F8
		//8B D1 E8 ?? ?? ?? ?? B9 FF 00 00 00
		ULONG64 pos = ScanSection(xs("PAGE"), xs("49 8B D1 E8 ?? ?? ?? ?? 48 8B F8"));

		if (pos) {
			return *(LONG*)(pos + 4) + pos + 8;
		}
		else {
			pos = ScanSection(xs("PAGE"), xs("8B D1 E8 ?? ?? ?? ?? B9 FF 00 00 00"));

			if (pos) {
				return *(LONG*)(pos + 3) + pos + 7;
			}
		}
	}
	return 0;
}
ULONG64 FindPspCidTable() {
	ULONG BuildNumber = KGetBuildNumber();
	if (BuildNumber < 10240) {
		//win7
		//48 8B D1 48 8B 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 45
		//00 00 ?? ?? ?? 48 8B D1 48 8B 0D ?? ?? ?? ?? E8
		ULONG64 pos = ScanSection(xs("PAGE"), xs("48 8B D1 48 8B 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 45"));

		if (pos) {
			return *(LONG*)(pos + 6) + pos + 10;
		}
		else {
			pos = ScanSection(xs("PAGE"), xs("00 00 ?? ?? ?? 48 8B D1 48 8B 0D ?? ?? ?? ?? E8"));
			if (pos) {
				return *(LONG*)(pos + 11) + pos + 15;
			}
		}

	}
	else if (BuildNumber >= 10240 && BuildNumber <= WIN10_1607) {
		//win10 1503-win10 1607
		//48 8B 05 ?? ?? ?? ?? ?? ?? ?? F7 C1
		//E8 02 00 00 48 8B 0D ?? ?? ?? ?? E8
		//30 06 00 00 48 8B 0D ?? ?? ?? ?? E8
		ULONG64 pos = ScanSection(xs("PAGE"), xs("E8 02 00 00 48 8B 0D ?? ?? ?? ?? E8"));

		if (pos) {
			return *(LONG*)(pos + 7) + pos + 11;
		}
		else {
			pos = ScanSection(xs("PAGE"), xs("30 06 00 00 48 8B 0D ?? ?? ?? ?? E8"));
			if (pos) {
				return *(LONG*)(pos + 7) + pos + 11;
			}
			else {
				pos = ScanSection(xs("PAGE"), xs("48 8B 05 ?? ?? ?? ?? ?? ?? ?? F7 C1"));
				if (pos) {
					return *(LONG*)(pos + 3) + pos + 7;
				}
			}
		}
	}
	else if (BuildNumber >= WIN10_1703) {
		//win10 1903 - win10 2004
		//48 8B 05 ?? ?? ?? ?? F7 C1 ?? ?? ?? ?? 74
		//E8 ?? ?? ?? ?? 48 8B 0D ?? ?? ?? ?? ?? ?? ?? ?? ?? 45 33 C9 45 33 C0 ?? ?? ?? E8
		//00 00 48 8B 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 48 85 C0
		ULONG64 pos = ScanSection(xs("PAGE"), xs("E8 ?? ?? ?? ?? 48 8B 0D ?? ?? ?? ?? ?? ?? ?? ?? ?? 45 33 C9 45 33 C0 ?? ?? ?? E8"));
		if (pos) {
			return *(LONG*)(pos + 8) + pos + 12;
		}
		else {
			pos = ScanSection(xs("PAGE"), xs("00 00 48 8B 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 48 85 C0"));
			if (pos) {
				return *(LONG*)(pos + 5) + pos + 9;
			}
		}
	}
	return 0;
}
ULONG64 FindObpKernelHandleTable() {
	//win7 NtWriteFile->00 00 00 80 ?? 8B ?? ?? ?? ?? ?? 
	//win7 E8 ?? ?? ?? ?? ?? ?? ?? 00 02 00 00 48 89 05 ?? ?? ?? ?? 
	//48 8B 1D ?? ?? ?? ?? ?? ?? ?? 00 00 00 80 ?? 8B
	ULONG bn = KGetBuildNumber();
	ULONG64 nt = (ULONG64)KGetNtoskrnl();
	if (bn < WIN10) {
		ULONG64 mntos = (ULONG64)KLoadNtoskrnl();
		ULONG64 pos = ScanSection_Image((LPCVOID)mntos, xs("INIT"), xs("E8 ?? ?? ?? ?? ?? ?? ?? 00 02 00 00 48 89 05 ?? ?? ?? ??"));
		if (pos) {
			ULONG64 off = pos - mntos;
			return *(LONG*)(pos + 15) + nt + off + 19;
		}
		else {
			ULONG64 pNtWriteFile = (ULONG64)KGetProcAddress(ntos(), xs("NtReadFile"));
			pos = FindSignatureCode_nocheck((LPCVOID)pNtWriteFile, 0x1000, xs("00 00 00 80 ?? 8B ?? ?? ?? ?? ??"), 0);
			if (pos != -1) {
				return *(LONG*)(pos + pNtWriteFile + 7) + pos + pNtWriteFile + 11;
			}
		}

	}
	else {
		ULONG64 nt = (ULONG64)KGetNtoskrnl();
		ULONG64 pos = ScanSection(xs("PAGE"), xs("48 8B 1D ?? ?? ?? ?? ?? ?? ?? 00 00 00 80 ?? 8B"));
		if (pos) {
			return *(LONG*)(pos + 3) + pos + 7;
		}
	}
	return NULL;

}
BOOL FindFunction() {
	if (ExpLookupHandleTableEntry != 0 && PspCidTable != 0 && ObpKernelHandleTable != 0)
		return TRUE;
	ExpLookupHandleTableEntry = (EXPLOOPUPHANDLETABLEENTRY)FindExpLookupHandleTableEntry();
	//DbgPrint("[112233] ExpLookupHandleTableEntry:%p\n", ExpLookupHandleTableEntry);
	if (ExpLookupHandleTableEntry == 0)return FALSE;
	PspCidTable = FindPspCidTable();
	//DbgPrint("[112233] PspCidTable:%p\n", PspCidTable);
	if (PspCidTable == 0)return FALSE;
	PspCidTable = *(ULONG64*)PspCidTable;

	ObpKernelHandleTable = FindObpKernelHandleTable();
	if (ObpKernelHandleTable == 0)return FALSE;
	ObpKernelHandleTable = *(ULONG64*)ObpKernelHandleTable;
	//DbgPrint("[112233] ObpKernelHandleTable:%p\n", ObpKernelHandleTable);

	return TRUE;
}

VOID InitTableValues() {
	FindFunction();
}

PEPROCESS GetEprocessByPid(ULONG64 Pid) {
	if (FindFunction()) {
		ULONG64 Entry = ExpLookupHandleTableEntry(PspCidTable, Pid);
		//DbgPrint("Entry:%p\n", Entry);
		ULONG64 value = *(ULONG64*)Entry;
		if (Entry) {
			if (KGetBuildNumber() < WIN10) {
				//win7
				ULONG64 mask = ~(ULONG64)7;
				value = value & mask;
				return (PEPROCESS)value;
			}
			else {
				value = value >> 0x10;
				value = value | 0xFFFF000000000000;
				return (PEPROCESS)value;
			}
			
		}

	}
	return NULL;
}
PETHREAD GetEthreadBytid(ULONG64 Tid) {
	return (PETHREAD)GetEprocessByPid(Tid);
}

