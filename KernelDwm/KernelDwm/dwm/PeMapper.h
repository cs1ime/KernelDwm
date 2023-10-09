#pragma once

#ifndef _PE_MAPPER_H_
#define _PE_MAPPER_H_

#include <ntifs.h>
#include <ntimage.h>
#include <windef.h>
#include "ImportEncrypt.h"


namespace PE {
	__forceinline ULONG RvaToOffset(IMAGE_NT_HEADERS* inh, ULONG Rva) {
		IMAGE_SECTION_HEADER* ish = IMAGE_FIRST_SECTION(inh);
		for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
			if (Rva >= ish[i].VirtualAddress && Rva < ish[i].VirtualAddress + ish[i].Misc.VirtualSize) {
				return (Rva - ish[i].VirtualAddress) + ish[i].PointerToRawData;
			}
		}
		return 0;

	}
	__forceinline ULONG GetSymbolOffset(PVOID PeFile, LPCSTR Symbol) {
		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)PeFile;
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)((PUCHAR)PeFile + idh->e_lfanew);
		IMAGE_EXPORT_DIRECTORY* ied = (IMAGE_EXPORT_DIRECTORY*)((PUCHAR)PeFile + RvaToOffset(inh, inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress));
		PULONG pNames = (PULONG)(RvaToOffset(inh, ied->AddressOfNames) + (PUCHAR)PeFile);
		for (int i = 0; i < ied->NumberOfNames; i++) {
			ULONG NameRva = pNames[i];
			LPCSTR pName = (LPCSTR)(RvaToOffset(inh, NameRva) + (PUCHAR)PeFile);
			//DbgPrint("[112233] %s\n", pName);
			if (!strcmp(pName, Symbol)) {
				PWORD pOrd = (PWORD)(RvaToOffset(inh, ied->AddressOfNameOrdinals) + (PUCHAR)PeFile);
				PULONG pFunc = (PULONG)(RvaToOffset(inh, ied->AddressOfFunctions) + (PUCHAR)PeFile);
				return RvaToOffset(inh, pFunc[pOrd[i]]);
			}
		}
		return 0;
	}
	__forceinline PVOID GetMemProcAddress(PVOID pModule, LPCSTR ProcName) {
		PUCHAR uModule = (PUCHAR)pModule;

		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)uModule;
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(idh->e_lfanew + uModule);
		IMAGE_EXPORT_DIRECTORY* ied = (IMAGE_EXPORT_DIRECTORY*)(inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress + uModule);
		if (ied) {
			PULONG pNameList = (PULONG)(ied->AddressOfNames + uModule);
			PWORD pIndices = (PWORD)(ied->AddressOfNameOrdinals + uModule);
			PULONG pAddress = (PULONG)(ied->AddressOfFunctions + uModule);
			for (int i = 0; i < ied->NumberOfNames; i++) {
				ULONG NameRva = pNameList[i];
				if (NameRva) {
					LPCSTR Name = (LPCSTR)(uModule + NameRva);
					//printf("%s\n", Name);
					if (!strcmp(Name, ProcName)) {
						WORD idx = pIndices[i];
						PVOID result = pAddress[idx] + (PUCHAR)uModule;
						return (PVOID)result;
					}
				}

			}
		}

		return NULL;
	}
	__forceinline ULONG64 MapPE(PUCHAR pDllData, PUCHAR pMappedBuffer) {
		PUCHAR uDllData = (PUCHAR)pDllData;
		PUCHAR uMappedDllBuffer = (PUCHAR)pMappedBuffer;

		IMAGE_DOS_HEADER* idh = (IMAGE_DOS_HEADER*)uDllData;
		IMAGE_NT_HEADERS* inh = (IMAGE_NT_HEADERS*)(idh->e_lfanew + uDllData);
		IMAGE_SECTION_HEADER* ish = IMAGE_FIRST_SECTION(inh);

		memcpy(uMappedDllBuffer, uDllData, inh->OptionalHeader.SizeOfHeaders);
		for (int i = 0; i < inh->FileHeader.NumberOfSections; i++) {
			memcpy(uMappedDllBuffer + ish[i].VirtualAddress, uDllData + RvaToOffset(inh, ish[i].VirtualAddress), ish[i].SizeOfRawData);
		}

		//处理重定位
		if (inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress) {
			IMAGE_BASE_RELOCATION* ibr = (IMAGE_BASE_RELOCATION*)(uMappedDllBuffer + inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].VirtualAddress);
			PUCHAR max = inh->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].Size + (PUCHAR)ibr;
			while (ibr->VirtualAddress) {
				ULONG len = (ibr->SizeOfBlock - sizeof(IMAGE_BASE_RELOCATION)) / 2;
				PVOID pAddr = ibr->VirtualAddress + uMappedDllBuffer;
				WORD* relocs = (WORD*)((BYTE*)ibr + sizeof(IMAGE_BASE_RELOCATION));
				for (int i = 0; i < len; i++) {
					WORD RelocValue = relocs[i];
#ifdef _WIN64
					WORD cpval = 0xA000;
#else
					WORD cpval = 0x3000;
#endif // _AMD64
					if ((RelocValue & 0xF000) != cpval)continue;
					ULONG_PTR* prelocv = (ULONG_PTR*)((BYTE*)pAddr + (RelocValue & 0x0FFF));
					*prelocv = *prelocv - inh->OptionalHeader.ImageBase + (ULONG_PTR)uMappedDllBuffer;
					//printf("%llx\n", *prelocv);
				}
				ibr = (IMAGE_BASE_RELOCATION*)((PBYTE)ibr + ibr->SizeOfBlock);
				if ((PUCHAR)ibr >= max)break;
			}
		}

		return 1;
	}

}

#endif
