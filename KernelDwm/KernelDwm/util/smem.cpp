#include "smem.h"
#include "xorstr.hpp"
#include "MyMemoryIo64.h"

#include "ImportEncrypt.h"
namespace smem {
	BOOL ReadUserModeMemory(PVOID64 TargetAddress, PVOID64 Buffer, SIZE_T Size) {
		if (TargetAddress == 0 || Buffer == 0)
			return FALSE;
		if ((ULONG64)TargetAddress >= MmUserProbeAddress)
			return FALSE;
		return MmiReadVirtualAddressSafe((DWORD64)TargetAddress, Buffer, Size);
	}
	BOOL WriteUserModeMemory(PVOID64 TargetAddress, PVOID64 Buffer, SIZE_T Size) {
		if (TargetAddress == 0 || Buffer == 0)
			return FALSE;
		if ((ULONG64)TargetAddress >= MmUserProbeAddress)
			return FALSE;
		return MmiWriteVirtualAddressSafe((DWORD64)TargetAddress, Buffer, Size);
	}
	UCHAR PageCache2[0x1000];

	bool read_data(const void *address, void *buffer, size_t size) {
		return ReadUserModeMemory((PVOID64)address, buffer, size);
	}
	bool read_data(unsigned long long address, void* buffer, size_t size) {
		return ReadUserModeMemory((PVOID64)address, buffer, size);
	}
	bool write_data(void *address, const void *buffer, size_t size) {
		return WriteUserModeMemory((PVOID64)address, (PVOID64)buffer, size);
	}
	UCHAR PageCache[0x1000];
}

namespace mem {
	UCHAR readCache[0x1000];
	ULONG64 readCacheVa = -1;
	bool read(ULONG64 address, PVOID buffer, SIZE_T sz) {
		return MmiReadVirtualAddressSafe(address, buffer, sz);
	}
	bool w_t(ULONG64 address, PVOID buffer, SIZE_T sz) {
		return MmiWriteVirtualAddressSafe(address, buffer, sz);
	}
}
