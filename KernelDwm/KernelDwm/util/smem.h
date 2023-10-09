#pragma once

#ifndef _SMEM_INCLUDED_
#define _SMEM_INCLUDED_

#include "DDKCommon.h"

namespace smem {
	bool read_data(const void *address, void *buffer, size_t size);
	bool read_data(unsigned long long address, void* buffer, size_t size);
	bool write_data(void *address, const void *buffer, size_t size);

	template <typename T>
	bool read(void *address, T *buffer) {
		return read_data(address, buffer, sizeof(T));
	}
	template <typename T>
	bool write(void *address, T *buffer) {
		return write_data(address, buffer, sizeof(T));
	}
	template <typename T>
	bool read(unsigned long long address, T *buffer) {
		return read<T>((void *)address, buffer);
	}
	template <typename T>
	bool write(unsigned long long address, T *buffer) {
		return write<T>((void *)address, buffer);
	}
	bool read_string(const char *str, char *buffer, size_t buffer_size);
	bool read_string_quick(const char* str, char* buffer, size_t buffer_size);
}

namespace mem {
	extern UCHAR readCache[0x1000];
	extern ULONG64 readCacheVa;
	template <typename T>
	T read(ULONG64 address) {
		T v;
		if (MmiReadVirtualAddressSafe(address, &v, sizeof(T)))
			return v;
		else
			memset(&v, 0, sizeof(v));
		return v;
	}
	template <typename T>
	T r(ULONG64 address) {
		T v;
		if (MmiReadVirtualAddressSafe(address, &v, sizeof(T)))
			return v;
		else
			memset(&v, 0, sizeof(v));
		return v;
	}
	template <typename T>
	T r(PVOID address) {
		return r<T>((ULONG64)address);
	}
	template <typename T>
	bool w(ULONG64 address, T v) {
		if (MmiWriteVirtualAddressSafe(address, &v, sizeof(T)))
			return true;
		return false;
	}
	template <typename T>
	bool w(PVOID address, T v) {
		return w<T>((ULONG64)address, v);
	}

	template <typename T>
	T read2(ULONG64 address) {
		T v;
		if (MemCachedReadMemory(address, &v, sizeof(T), &readCacheVa, readCache))
			return v;
		else
			memset(&v, 0, sizeof(v));
		return v;
	}
	template <typename T>
	bool read_t(ULONG64 address, T* ret) {
		return MmiReadVirtualAddressSafe(address, ret, sizeof(T));
	}
	bool read(ULONG64 address, PVOID buffer, SIZE_T sz);
	bool w_t(ULONG64 address, PVOID buffer, SIZE_T sz);
}

#endif // !_SMEM_INCLUDED_
