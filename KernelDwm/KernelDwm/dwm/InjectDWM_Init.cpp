#include "../util/khookutil.h"
#include "../util/util.h"
namespace DWM {
	extern ULONG64 m_offset_Context;

	VOID Init2() {
		WCHAR wstr[100];
		AnsiToUnicode(xs("\\SystemRoot\\system32\\ntdll.dll"), wstr, 99);
		KBuffer krnlbase = KLoadLibrary(wstr);

		PVOID krnl = (PVOID)krnlbase.Address;
		ULONG_PTR pos = utilinc::ScanSection_Image(krnl, xs(".text"), xs("48 8D 0D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8B 05 ?? ?? ?? ?? 48 89 ?? ?? ?? 45 33 C0"));
		if (pos) {
			ULONG_PTR v = *(LONG*)(pos + 3) + pos + 7;
			m_offset_Context = v - (ULONG_PTR)krnl;
		}
		else {
			pos = utilinc::ScanSection_Image(krnl, xs(".text"), xs("48 8D 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 48 8B 05 ?? ?? ?? ?? 48 89 ?? ?? ?? 45 33 C0"));
			if (pos) {
				ULONG_PTR v = *(LONG*)(pos + 3) + pos + 7;
				m_offset_Context = v - (ULONG_PTR)krnl;
			}
			else {
				pos = utilinc::ScanSection_Image(krnl, xs(".text"), xs("48 8D 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 48 8B 44 24 ?? 48 89 05"));
				if (pos) {
					ULONG_PTR v = *(LONG*)(pos + 3) + pos + 7;
					m_offset_Context = v - (ULONG_PTR)krnl;
				}
			}
		}
		if (!m_offset_Context)
			KeBugCheck(0x8713C);

		KFreeLibrary(krnlbase);
	}
}
