#pragma once

#ifndef _KernelAsm_INCLUDED_
#define _KernelAsm_INCLUDED_
#include "ntifs.h"


#ifdef __cplusplus
#define KernelAsm_EXTERN extern "C"  
#elif
#define KernelAsm_EXTERN extern
#endif // __cplusplus

typedef struct _CPUID_RET {
	ULONG EAX;
	ULONG EBX;
	ULONG ECX;
	ULONG EDX;
}CPUID_RET;

typedef union
{
	ULONG64 all;
	struct {
		ULONG64 PE : 1;
		ULONG64 MP : 1;
		ULONG64 EM : 1;
		ULONG64 TS : 1;
		ULONG64 ET : 1;
		ULONG64 NE : 1;
		ULONG64 Reserved_1 : 10;
		ULONG64 WP : 1;
		ULONG64 Reserved_2 : 1;
		ULONG64 AM : 1;
		ULONG64 Reserved_3 : 10;
		ULONG64 NW : 1;
		ULONG64 CD : 1;
		ULONG64 PG : 1;
		ULONG64 Reserved_64 : 32;
	};
	
}_CR0;

typedef union
{
	ULONG64 all;
	struct {
		ULONG64 VME : 1;		//0
		ULONG64 PVI : 1;		//1
		ULONG64 TSD : 1;		//2
		ULONG64 DE : 1;			//3
		ULONG64 PSE : 1;		//4
		ULONG64 PAE : 1;		//5
		ULONG64 MCE : 1;		//6
		ULONG64 PGE : 1;		//7
		ULONG64 PCE : 1;		//8
		ULONG64 OSFXSR : 1;		//9
		ULONG64 OSXMMEXCPT : 1;	//10
		ULONG64 UMIP : 1;		//11
		ULONG64 LA57 : 1;		//12
		ULONG64 VMXE : 1;		//13
		ULONG64 SMXE : 1;		//14
		ULONG64 Reversed1 : 1;	//15
		ULONG64 FSGSBASE : 1;	//16
		ULONG64 PCIDE : 1;		//17
		ULONG64 OSXSAVE : 1;	//18
		ULONG64 Reversed2 : 1;	//19
		ULONG64 SMEP : 1;		//20
		ULONG64 SMAP : 1;		//21
		ULONG64 PKE : 1;
		ULONG64 CET : 1;
		ULONG64 PKS : 1;
	};
}_CR4;

typedef union
{
	ULONG64 all;
	struct {
		unsigned CF : 1;
		unsigned Unknown_1 : 1;	//Always 1
		unsigned PF : 1;
		unsigned Unknown_2 : 1;	//Always 0
		unsigned AF : 1;
		unsigned Unknown_3 : 1;	//Always 0
		unsigned ZF : 1;
		unsigned SF : 1;
		unsigned TF : 1;
		unsigned IF : 1;
		unsigned DF : 1;
		unsigned OF : 1;
		unsigned TOPL : 2;
		unsigned NT : 1;
		unsigned Unknown_4 : 1;
		unsigned RF : 1;
		unsigned VM : 1;
		unsigned AC : 1;
		unsigned VIF : 1;
		unsigned VIP : 1;
		unsigned ID : 1;
		unsigned Reserved : 10;	//Always 0
		unsigned Reserved_64 : 32;	//Always 0
	};
}_EFLAGS;

typedef union
{
	ULONG32 all;
	struct {
		ULONG32 sse3 : 1;       //!< [0] Streaming SIMD Extensions 3 (SSE3)
		ULONG32 pclmulqdq : 1;  //!< [1] PCLMULQDQ
		ULONG32 dtes64 : 1;     //!< [2] 64-bit DS Area
		ULONG32 monitor : 1;    //!< [3] MONITOR/WAIT
		ULONG32 ds_cpl : 1;     //!< [4] CPL qualified Debug Store
		ULONG32 vmx : 1;        //!< [5] Virtual Machine Technology
		ULONG32 smx : 1;        //!< [6] Safer Mode Extensions
		ULONG32 est : 1;        //!< [7] Enhanced Intel Speedstep Technology
		ULONG32 tm2 : 1;        //!< [8] Thermal monitor 2
		ULONG32 ssse3 : 1;      //!< [9] Supplemental Streaming SIMD Extensions 3
		ULONG32 cid : 1;        //!< [10] L1 context ID
		ULONG32 sdbg : 1;       //!< [11] IA32_DEBUG_INTERFACE MSR
		ULONG32 fma : 1;        //!< [12] FMA extensions using YMM state
		ULONG32 cx16 : 1;       //!< [13] CMPXCHG16B
		ULONG32 xtpr : 1;       //!< [14] xTPR Update Control
		ULONG32 pdcm : 1;       //!< [15] Performance/Debug capability MSR
		ULONG32 reserved : 1;   //!< [16] Reserved
		ULONG32 pcid : 1;       //!< [17] Process-context identifiers
		ULONG32 dca : 1;        //!< [18] prefetch from a memory mapped device
		ULONG32 sse4_1 : 1;     //!< [19] SSE4.1
		ULONG32 sse4_2 : 1;     //!< [20] SSE4.2
		ULONG32 x2_apic : 1;    //!< [21] x2APIC feature
		ULONG32 movbe : 1;      //!< [22] MOVBE instruction
		ULONG32 popcnt : 1;     //!< [23] POPCNT instruction
		ULONG32 reserved3 : 1;  //!< [24] one-shot operation using a TSC deadline
		ULONG32 aes : 1;        //!< [25] AESNI instruction
		ULONG32 xsave : 1;      //!< [26] XSAVE/XRSTOR feature
		ULONG32 osxsave : 1;    //!< [27] enable XSETBV/XGETBV instructions
		ULONG32 avx : 1;        //!< [28] AVX instruction extensions
		ULONG32 f16c : 1;       //!< [29] 16-bit floating-point conversion
		ULONG32 rdrand : 1;     //!< [30] RDRAND instruction
		ULONG32 not_used : 1;   //!< [31] Always 0 (a.k.a. HypervisorPresent)
	} fields;
}_CPUID_ECX;

KernelAsm_EXTERN ULONG64 ReadSsQ(PULONG64);
KernelAsm_EXTERN VOID AsmInt2F();
KernelAsm_EXTERN VOID AsmIntE1();
KernelAsm_EXTERN ULONG64 AsmRdtsc();
KernelAsm_EXTERN ULONG64 AsmReadRFlags();
KernelAsm_EXTERN ULONG64 AsmReadRSP();
KernelAsm_EXTERN ULONG64 AsmReadCr0();
KernelAsm_EXTERN ULONG64 AsmReadCr2();
KernelAsm_EXTERN ULONG64 AsmReadCr3();
KernelAsm_EXTERN ULONG64 AsmReadCr4();
KernelAsm_EXTERN ULONG64 AsmReadCr8();
KernelAsm_EXTERN ULONG64 AsmReadMsr(ULONG Msr);
KernelAsm_EXTERN ULONG64 AsmWriteMsr(ULONG Msr, ULONG64 value);
KernelAsm_EXTERN ULONG64 AsmReadGs(ULONG offset);
KernelAsm_EXTERN VOID AsmWriteCr0(ULONG64 Cr0);
KernelAsm_EXTERN VOID AsmWriteCr3(ULONG64 Cr3);
KernelAsm_EXTERN VOID AsmWriteCr4(ULONG64 Cr4);
KernelAsm_EXTERN VOID AsmWriteCr8(ULONG64 Cr8);
KernelAsm_EXTERN VOID AsmCpuid(ULONG Eax, ULONG Ecx, CPUID_RET* ret);
KernelAsm_EXTERN ULONG64 AsmGetEs();
KernelAsm_EXTERN ULONG64 AsmGetCs();
KernelAsm_EXTERN ULONG64 AsmGetDs();
KernelAsm_EXTERN ULONG64 AsmGetFs();
KernelAsm_EXTERN ULONG64 AsmGetGs();
KernelAsm_EXTERN ULONG64 AsmGetSs();
KernelAsm_EXTERN ULONG64 AsmGetTr();
KernelAsm_EXTERN USHORT AsmGetLDTR();
KernelAsm_EXTERN ULONG64 AsmGetIdtBase();
KernelAsm_EXTERN UINT16 AsmGetIdtLimit();
KernelAsm_EXTERN ULONG64 AsmGetGdtBase();
KernelAsm_EXTERN UINT16 AsmGetGdtLimit();
KernelAsm_EXTERN ULONG64 AsmGetDr7();
KernelAsm_EXTERN ULONG64 AsmLoadAccessRightsByte(ULONG64 segment_selector);
typedef struct _INVPCID_CTX {
	ULONG64 PCID : 12;
	ULONG64 Reserved : 52;
	ULONG64 LinearAddress;
}INVPCID_CTX, * PINVPCID_CTX;
KernelAsm_EXTERN VOID AsmInvpcid(ULONG64 type, PINVPCID_CTX pDesc);
KernelAsm_EXTERN VOID AsmInvlpg(ULONG64 address);
KernelAsm_EXTERN VOID AsmSti();
KernelAsm_EXTERN VOID AsmCli();

#define AsmReadMsr64(a)(AsmReadMsr((ULONG)(a)))
#define AsmWriteMsr64(a,b)(AsmWriteMsr((ULONG)(a),(ULONG64)(b)))
#define AsmRdtsc __rdtsc

#endif // !_KernelAsm_INCLUDED_

