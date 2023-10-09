#include <ntifs.h>
#include "ddkcommon.h"
#include "compilecontrol.h"
#include "kcall.h"
#include "kernelasm.h"

#include "smem.h"
#include "AsyncRenderTask.h"
#include "pmcol.h"
#include "xorstr.hpp"
#include "ImportEncrypt.h"
#include "InjectDwm.h"
#include "../PMI.h"

namespace Flag {
	extern volatile float aimbot_smooth;
	extern bool SmartAimbot;
	extern bool user_aimbot_continue;
	extern int AimKey;
	extern int AimKey2;
	extern int AimPart;
	extern volatile float aimbot_range;
}

extern PEPROCESS g_CsgoProcess;

bool pagehit[0x10000] = { 0 };
bool pagevaild[0x10000] = { 0 };
__forceinline void DxUTF8ToUnicode(LPCSTR utf8, LPWSTR uni, SIZE_T MaxCount) {
	unsigned char v;
	int unidx = 0;
	for (int i = 0; v = utf8[i]; i++) {
		if ((v & 0b10000000) == 0) {
			uni[unidx] = v;
		}
		else if ((v & 0b11100000) == 0b11000000) {
			unsigned short c = (unsigned short)((v & 0b00011111)) << 6;
			v = utf8[++i];
			if ((v & 0b11000000) == 0b10000000) {
				c |= (v & 0b00111111);
				uni[unidx] = c;
			}
			else
				continue;
		}
		else if ((v & 0b11110000) == 0b11100000) {
			unsigned short c = (unsigned short)((v & 0b00001111)) << 12;
			v = utf8[++i];
			if ((v & 0b11000000) == 0b10000000) {
				c |= (unsigned short)((v & 0b00111111)) << 6;
				v = utf8[++i];
				if ((v & 0b11000000) == 0b10000000) {
					c |= (unsigned short)((v & 0b00111111));
					uni[unidx] = c;
				}
				else
					continue;
			}
			else
				continue;
		}
		else
			continue;
		unidx++;
		if (unidx >= MaxCount)
			break;
	}
	uni[unidx] = 0;
	return;
}
#include "LegacyRender.h"
#include "fontdata.h"
#include "../util/util.h"

namespace krd {
	PEPROCESS DWMProcess = RENDER_XOR((PEPROCESS)0);
	ULONG64 DWMSwapChain = RENDER_XOR((ULONG64)0);
	ProcessContext dwmctx = { 0 };
	ProcessContext*ctx = &dwmctx;
	ULONG_PTR ubuffer = 0;
	ReleasedTaskBuffer g_tsk;
	Font g_Font;

	bool m_bSpecRes = false;
	LONG m_uSpecResX = 0;
	LONG m_uSpecResY = 0;
	ByteRender rend;
	ByteRender *g_rend = &rend;
	bool g_pass = false;
	ULONG64 g_starttime = 0;

	 VOID SetDWM(PEPROCESS proc, ULONG64 SwapChain, ULONG64 userbuffer) {
		DWMProcess = RENDER_XOR(proc);
		DWMSwapChain = RENDER_XOR(SwapChain);
		ubuffer = userbuffer;
	}
	 VOID SetResolution(LONG x, LONG y) {
		m_bSpecRes = true;
		m_uSpecResX = x;
		m_uSpecResY = y;
	}
	
	 void DrawDispatch(TaskElement* ele) {
		if (g_pass)
			return;
		switch (ele->Type)
		{
		case ELEMENT_LINE: {
			auto e = (ElementLine*)&ele->Data;
			if (e->y1 == e->y2) {
				g_rend->LineX(e->x1, e->y1, e->x2 - e->x1, e->col);
			}
			else {
				g_rend->LineY(e->x1, e->y1, e->y2 - e->y1, e->col);
			}
			
			break;
		}
		case ELEMENT_CIRCLE: {
			auto e = (ElementCircle*)&ele->Data;
			//g_rend->Circle({ e->centerx, e->centery }, FColor(e->col), e->rad*2.2f, 1);
			//CRender::DrawCircle(e->centerx, e->centery, e->rad, e->pointCount, e->col);
			break;
		}
		case ELEMENT_SOILDRECT: {
			auto e = (ElementSoildRect*)&ele->Data;
			//g_rend->FillRectangle({ (int)e->x,(int)e->y }, { (int)e->w,(int)e->h }, FColor(e->col));

			break;
		}
		case ELEMENT_STRING: {
			//auto e = (ElementString*)&ele->Data;
			//WCHAR data[100];
			//memset(data, 0, sizeof(data));
			//DxUTF8ToUnicode(&e->str, data, 99);
			//g_rend->String(&g_Font, { e->x, e->y }, data, e->col);
			break;
		}
		case ELEMENT_STROKESTRING: {
			auto e = (ElementStrokeString*)&ele->Data;
			//CRender::DrawStringStrokeA(e->x, e->y, &e->str, e->size, e->col, e->StrokeCol);
			break;
		}
		default:
			break;
		}
		if (GetRealTime() - g_starttime > 5)
			g_pass = true;
	}


	UCHAR cache[0x1000];
	ULONG64 cachedva = 0;
	
	ULONG64 Device = RENDER_XOR((ULONG64)0);
	ULONG64 DeviceContext = RENDER_XOR((ULONG64)0);
	ULONG64 Surface = RENDER_XOR((ULONG64)0);

	ULONG_PTR m_fnBackup_release = RENDER_XOR((ULONG_PTR)0);
	ULONG_PTR m_PreviousRenderTime = RENDER_XOR((ULONG_PTR)0);

	VOID Init() {
		TaskRecv::InitNewTaskBuffer(g_tsk.Task);
		g_Font.InitFont(fontdata::data, sizeof(fontdata::data));
		dwmctx.pKCallU = (UCHAR*)KAllocatePool(0x400);
	}

	VOID RenderScene(UINT _w, UINT _h, PVOID pData) {
		memset(pagehit, 0, sizeof(pagehit));
		memset(pagevaild, 0, sizeof(pagevaild));
		g_starttime = GetRealTime();

		bool i_enable = AsmReadRFlags() & 0x200;
		if (i_enable)
			AsmCli();
		_CR4 cr4 = { 0 };
		cr4.all = AsmReadCr4();
		bool smap = cr4.SMAP == 1;
		if (smap == true) {
			cr4.SMAP = 0;
			AsmWriteCr4(cr4.all);
		}

		g_rend = &rend;
		rend.Setup(_w, _h, pData);

		rend.Line({ 100, 200 }, { 500, 200 }, FColor(AsmRdtsc()), 1);
		rend.String(&g_Font, { 100, 200 }, L"https://github.com/cs1ime", PM_XRGB(255, 0, 0));

		TaskRecv::ProcessTask(g_tsk.Task, DrawDispatch);


		if (smap == true) {
			cr4.SMAP = 1;
			AsmWriteCr4(cr4.all);
		}
		if (i_enable)
			AsmSti();
	}

	extern VOID WrapRender(PVOID fnRenderSeene);
	 VOID TestRender(ULONG_PTR Rsp) {
		//printf("[112233] begin!\n");
		if (PsGetCurrentProcess() == PsGetCurrentThreadProcess() && PsGetCurrentProcess() == RENDER_XOR(DWMProcess)) {
			//printf("[112233] render!\n");
			//return;
			ctx = &dwmctx;
			if (KCall::TryInitProcess(ctx)) {
				
				//bool i_enable = AsmReadRFlags() & 0x200;
				//if (i_enable)
				//	AsmCli();
				_CR4 cr4={0};
				cr4.all = AsmReadCr4();
				bool smap = cr4.SMAP == 1;
				//if (smap == true) {
				//	cr4.SMAP = 0;
				//	AsmWriteCr4(cr4.all);
				//}

				//TestRenderImpl(smap, Rsp);
				WrapRender(RenderScene);

				//if (smap == true) {
				//	cr4.SMAP = 1;
				//	AsmWriteCr4(cr4.all);
				//}
				//if (i_enable)
				//	AsmSti();

			}
		}
	}

}
