#include "../util/util.h"


#include "../util/khookutil.h"
namespace khook3 {
	struct REG_CTX {
		ULONG_PTR rfl;
		ULONG_PTR r15;
		ULONG_PTR r14;
		ULONG_PTR r13;
		ULONG_PTR r12;
		ULONG_PTR r11;
		ULONG_PTR r10;
		ULONG_PTR r9;
		ULONG_PTR r8;
		ULONG_PTR rbp;
		ULONG_PTR rdi;
		ULONG_PTR rsi;
		ULONG_PTR rdx;
		ULONG_PTR rcx;
		ULONG_PTR rbx;
		ULONG_PTR rax;
		ULONG_PTR retaddr;
	};

	typedef VOID(*HOOK_CB)(REG_CTX*);

	struct HOOK_INFO_BLOCK {
		ULONG_PTR addr;
		SIZE_T hde_sz;
		UCHAR ori_ins[50];
		UCHAR* shellcode;
	};

	extern PVOID m_hookcb[100];
	extern int m_hookcb_cnt;
	extern PVOID m_orifunc;
	extern int stiretGadgetType;

	namespace walker {
		extern ULONG_PTR g_DxgkGetDeviceStateRetaddr;

		extern ULONG_PTR m_retaddr_offset;
		extern ULONG_PTR m_stacksize;
		BOOL IsDWM(PEPROCESS Process) {
			CHAR ProcName[16];
			memset(ProcName, 0, 16);
			memcpy(ProcName, PsGetProcessImageFileName(Process), 15);
			if (!stricmp(ProcName, xs("dwm.exe"))) {
				return TRUE;
			}
			return FALSE;
		}
		PULONG64 GetUserRspPtr() {
			ULONG64 pSyscall = ((ULONG64)AsmReadMsr(0xC0000082));
			if (!pSyscall)return 0;
			ULONG offset = *(ULONG*)(pSyscall + 8);
			return (PULONG64)__readgsqword(offset);


		}
		VOID TryGetRetaddrOffset(ULONG_PTR pRsp) {
			if (m_retaddr_offset == 0) {
				ULONG64 Low = 0, High = 0;
				IoGetStackLimits(&Low, &High);
				PULONG64 Rsp = (PULONG64)pRsp;

				ULONG64 MarkRsp = 0;
				bool flagMagic = 0;
				bool flagExFree = 0;
				for (int i = 0; (ULONG64)Rsp < High - 8; Rsp++, i++) {
					if (Rsp[0] == g_DxgkGetDeviceStateRetaddr) {
						MarkRsp = (ULONG64)Rsp;
						m_retaddr_offset = MarkRsp - pRsp;
						m_stacksize = m_retaddr_offset + 0x28;
						p1x(m_stacksize);
					}
				}
			}
		}
	}
	VOID GeneralCB(REG_CTX* regs) {
		walker::TryGetRetaddrOffset((ULONG_PTR)regs);
		if (walker::m_stacksize != 0 && *(ULONG_PTR*)((ULONG_PTR)regs + walker::m_retaddr_offset) == walker::g_DxgkGetDeviceStateRetaddr) {
			if (walker::IsDWM(PsGetCurrentThreadProcess())) {
				ULONG_PTR rsp = (ULONG_PTR)regs;
				for (int i = 0; i < (m_hookcb_cnt); i++) {
					typedef VOID(*FNCB)(...);
					auto cbcb = (FNCB)((PVOID)(m_hookcb[i]));
					if (cbcb)
						cbcb(regs);
				}
			}
		}

		typedef DWORD(*fnUserScreenAccessCheck)(...);
		fnUserScreenAccessCheck fn = (decltype(fn))(HOOK_XOR(m_orifunc));
		DWORD ret = 1;

		regs->rax = ret;

		if (stiretGadgetType == 1) {
			regs->rbx = ret;
		}
	}

}