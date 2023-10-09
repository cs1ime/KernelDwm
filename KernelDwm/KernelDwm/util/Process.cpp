#include "util.h"

namespace Process {
	typedef ULONG64(*EXPLOOPUPHANDLETABLEENTRY)(
		IN ULONG64 HandleTable,
		IN ULONG64 Handle
		);

	EXPLOOPUPHANDLETABLEENTRY ExpLookupHandleTableEntry = 0;
	ULONG64 PspCidTable = 0;

	__forceinline ULONG64 FindExpLookupHandleTableEntry() {
		ULONG BuildNumber = KGetBuildNumber();
		if (BuildNumber < 10240) {
			//win7
			//49 8B CD E8 ?? ?? ?? ?? 49 3B C2
			ULONG64 pos = ScanSection(xs("PAGE"), xs("49 8B CD E8 ?? ?? ?? ?? 49 3B C2"));

			if (pos) {
				return *(LONG*)(pos + 4) + pos + 8;
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
	__forceinline ULONG64 FindPspCidTable() {
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


	VOID Init() {
		if (PspCidTable != 0)
			return;
		PspCidTable = FindPspCidTable();
		if (!PspCidTable)
			KeBugCheck(0x881221);
		PspCidTable = *(ULONG64*)PspCidTable;
		if (!PspCidTable)
			KeBugCheck(0x881221);

	}
}


