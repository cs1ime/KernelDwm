#include <ntifs.h>
#include "ddkcommon.h"
#include "compilecontrol.h"
#include "kcall.h"
#include "kernelasm.h"
#include "smem.h"
#include "xorstr.hpp"
#include "ImportEncrypt.h"
#include "InjectDwm.h"
#include "dx11.h"

VOID down() {
	return;
}
namespace krd {
	extern PEPROCESS DWMProcess;
	extern ULONG64 DWMSwapChain;
	extern ULONG_PTR ubuffer;
	extern ULONG64 Device;
	extern ULONG64 DeviceContext;
	extern ULONG64 Surface;
	extern UCHAR cache[0x1000];
	extern ULONG64 cachedva;
	extern ULONG_PTR m_fnBackup_release;
	extern ULONG_PTR m_PreviousRenderTime;
	extern bool g_pass;


	extern ProcessContext*ctx;
#define UCall(p,a1,a2,a3,a4)({\
	ULONG64 crt=GetRealTime();\
	KCall::Call(ctx, p, a1, a2, a3, a4);\
	if(GetRealTime()-crt>=1000)down();\
	})
#define UCall6(p,a1,a2,a3,a4,a5,a6)({\
	KCall::Call(ctx, p, a1, a2, a3, a4,a5,a6);\
	})
	__forceinline ULONG_PTR vfunc(ULONG_PTR Class, ULONG Index) {

		//ULONG_PTR pClass = Class & 0xFFFFFFFFFFFFF000;
		//if (cachedva != pClass) {
		//	if (!MmiReadVirtualAddressSafe(pClass, cache, 0x1000))
		//		return 0;
		//	cachedva = pClass;
		//}
		//
		//ULONG off = Class - pClass;
		//
		//return *(ULONG_PTR*)(cache + off + Index * 8);
		//return (*(ULONG_PTR**)Class)[Index];

		ULONG_PTR vTable = mem::r<ULONG_PTR>(Class);
		return mem::r<ULONG_PTR>(vTable + Index * 8);

	}
	__forceinline void Release(ULONG_PTR Class) {
		UCall(vfunc(Class, 2), Class, 0ull, 0ull, 0ull);
	}
	__forceinline VOID GetUUID(int v, UCHAR *buf) {
		if (v == 0) {
			memcpy(buf, xs("\xDB\x6D\x6F\xDB\x77\xAC\x88\x4E\x82\x53\x81\x9D\xF9\xBB\xF1\x40"), 16);
		}
		else if (v == 1) {
			memcpy(buf, xs("\xf2\xaa\x15\x6f\x08\xd2\x89\x4e\x9a\xb4\x48\x95\x35\xd3\x4f\x9c"), 16);
		}
	}

	VOID WrapRender(PVOID fnRenderSeene) {


		//_ptb("Render!");
		//pt("handler:%p", *(ULONG_PTR*)PMI::m_pHalpPerfInterruptHandler);
		ubuffer = (ULONG_PTR)ctx->shell32 + DWM::m_offset_Context;
		//pt("ubuffer:%p\n", ubuffer); 

		//DbgPrint("[112233] Render!\n");
		if (!MmiGetPhysicalAddress((PVOID)RENDER_XOR(DWMSwapChain))) {
			return;
		}
		if (!MmiGetPhysicalAddress((PVOID)(*(PVOID*)RENDER_XOR(DWMSwapChain)))) {
			return;
		}
		if (!MmiGetPhysicalAddress((PVOID)(ubuffer))) {
			return;
		}
		//DbgPrint("[112233] Swapchain:%p\n", DWMSwapChain);

		//DbgPrint("[112233] ubuffer vaild=%d\n", MmiGetPhysicalAddress((PVOID)ubuffer));
		cachedva = 0;
		if (RENDER_XOR(Device) == 0) {
			UCHAR ID3D11DeviceUUID[16] = { 0 };
			GetUUID(0, ID3D11DeviceUUID);
			mem::w_t(ubuffer, ID3D11DeviceUUID, 16);
			//memcpy((PVOID)ubuffer, (void *)ID3D11DeviceUUID, 16);
			UCall(vfunc(RENDER_XOR(DWMSwapChain), 7), RENDER_XOR(DWMSwapChain), ubuffer, ubuffer + 16, 0);
			//Device = *(ULONG64 *)(ubuffer + 16);
			Device = mem::r<ULONG64>(ubuffer + 16);
			//Release(DWMSwapChain, smap_enable);
			printf("[112233] Device:%p\n", (Device));
			Device = RENDER_XOR(Device);

		}
		if (RENDER_XOR(DeviceContext) == 0) {
			if (RENDER_XOR(Device) != 0 && MmiGetPhysicalAddress((PVOID)RENDER_XOR(Device)) && MmiGetPhysicalAddress(*(PVOID*)RENDER_XOR(Device))) {
				UCall(vfunc(RENDER_XOR(Device), 40), RENDER_XOR(Device), ubuffer, 0, 0);
				//DeviceContext = *(ULONG64*)ubuffer;
				DeviceContext = mem::r<ULONG64>(ubuffer);
				DeviceContext = RENDER_XOR(DeviceContext);
				Release(RENDER_XOR(DeviceContext));
				printf("[112233] DeviceContext:%p\n", RENDER_XOR(DeviceContext));
			}
		}
		if (RENDER_XOR(Surface) == 0) {
			UCHAR ID3D11Texture2DVar[16] = { 0 };
			GetUUID(1, ID3D11Texture2DVar);
			memcpy((PVOID)ubuffer, (PVOID)&ID3D11Texture2DVar, sizeof(ID3D11Texture2DVar));
			UCall(vfunc(RENDER_XOR(DWMSwapChain), 9), RENDER_XOR(DWMSwapChain), 0, ubuffer, ubuffer + 16);
			//Surface = *(ULONG64*)(ubuffer + 16);
			Surface = mem::r<ULONG64>(ubuffer + 16);
			Surface = RENDER_XOR(Surface);
			//Release(RENDER_XOR(Surface), smap_enable);

			printf("[112233] Surface:%p\n", RENDER_XOR(Surface));
		}
		if (RENDER_XOR(Device) == 0 || RENDER_XOR(DeviceContext) == 0 || RENDER_XOR(Surface) == 0)
			return;
		if (!MmiGetPhysicalAddress((PVOID)RENDER_XOR(Device)) || !MmiGetPhysicalAddress((PVOID)RENDER_XOR(DeviceContext)) || !MmiGetPhysicalAddress((PVOID)RENDER_XOR(Surface)))
			return;
		if (!MmiGetPhysicalAddress((PVOID)(*(PVOID*)RENDER_XOR(Device))) || !MmiGetPhysicalAddress((PVOID)(*(PVOID*)RENDER_XOR(DeviceContext))) || !MmiGetPhysicalAddress((PVOID)(*(PVOID*)RENDER_XOR(Surface))))
			return;
		//pt("interval:%d", GetRealTime() - m_PreviousRenderTime);
		static ULONG_PTR slient_start_time = 0;
		//p1x(Rsp);
		//DbgBreakPoint();


		if (slient_start_time) {
			if (GetRealTime() - slient_start_time > 3000) {
				slient_start_time = 0;
			}
			m_PreviousRenderTime = GetRealTime();
			return;
		}
		if (GetRealTime() - m_PreviousRenderTime > 150) {
			m_PreviousRenderTime = GetRealTime();
			slient_start_time = GetRealTime();
			return;
		}

		m_PreviousRenderTime = GetRealTime();




		D3D11_TEXTURE2D_DESC SDesc;
		UCall(vfunc(RENDER_XOR(Surface), 10), RENDER_XOR(Surface), (ULONG_PTR)ubuffer, 0, 0);
		//SDesc = *(D3D11_TEXTURE2D_DESC*)ubuffer;
		SDesc = mem::r<D3D11_TEXTURE2D_DESC>(ubuffer);
		SDesc.BindFlags = 0;
		SDesc.MiscFlags = 0;
		SDesc.Usage = D3D11_USAGE_STAGING;
		SDesc.CPUAccessFlags = D3D11_CPU_ACCESS_READ | D3D11_CPU_ACCESS_WRITE;
		//SDesc.CPUAccessFlags = D3D11_CPU_ACCESS_WRITE;

		//memcpy((PVOID)ubuffer, &SDesc, sizeof(SDesc));
		mem::w_t(ubuffer, &SDesc, sizeof(SDesc));

		//*(ULONG_PTR*)(ubuffer + 0x100) = 0;
		mem::w<ULONG_PTR>(ubuffer + 0x100, 0);
		UCall(vfunc(RENDER_XOR(Device), 5), RENDER_XOR(Device), ubuffer, 0, ubuffer + 0x100);//CreateTexture2D
		//ULONG_PTR tex = *(ULONG_PTR*)(ubuffer + 0x100);
		ULONG_PTR tex = mem::r<ULONG_PTR>(ubuffer + 0x100);
		if (tex) {
			UCall(vfunc(RENDER_XOR(DeviceContext), 47), RENDER_XOR(DeviceContext), tex, RENDER_XOR(Surface), 0);//CopyResource
			D3D11_MAPPED_SUBRESOURCE MapRes;
			memset(&MapRes, 0, sizeof(D3D11_MAPPED_SUBRESOURCE)); //memset((PVOID)ubuffer, 0, sizeof(D3D11_MAPPED_SUBRESOURCE));
			mem::w<D3D11_MAPPED_SUBRESOURCE>(ubuffer, MapRes);
			UCall6(vfunc(RENDER_XOR(DeviceContext), 14), RENDER_XOR(DeviceContext), tex, 0, D3D11_MAP_READ_WRITE, 0, ubuffer);
			//MapRes = *(D3D11_MAPPED_SUBRESOURCE*)ubuffer;
			MapRes = mem::r<D3D11_MAPPED_SUBRESOURCE>(ubuffer);
			PVOID pData = MapRes.Data;
			UINT _w = SDesc.Width;
			UINT _h = SDesc.Height;
			if (_w && _h && pData
				/*&& MmiGetPhysicalAddress((PVOID)((ULONG_PTR)pData + ((_w - 1)*(_h - 1)) * 4))*/) {
				//DbgBreakPoint();
				//DbgPrint("[112233] row:%d\n", MapRes.RowPitch);
				//DbgPrint("[112233] dep:%d\n", MapRes.DepthPitch);
				//DbgPrint("[112233] Data:%p\n", MapRes.Data);
				typedef VOID(*typeFnRenderScene)(...);
				typeFnRenderScene RenderScene = (typeFnRenderScene)fnRenderSeene;
				RenderScene(_w, _h, pData);
			}
			UCall(vfunc(RENDER_XOR(DeviceContext), 15), RENDER_XOR(DeviceContext), tex, 0, 0);
			UCall(vfunc(RENDER_XOR(DeviceContext), 47), RENDER_XOR(DeviceContext), RENDER_XOR(Surface), tex, 0);

			if (MmiGetPhysicalAddress((PVOID)tex) && MmiGetPhysicalAddress(*(PVOID*)tex)) {
				Release(tex);
				if (m_fnBackup_release == 0 || m_fnBackup_release != vfunc(tex, 2)) {
					m_fnBackup_release = vfunc(tex, 2);
				}
			}
			else {
				if (m_fnBackup_release) {
					UCall(m_fnBackup_release, tex, 0, 0, 0);
				}
				else {
					KeBugCheck(0x2C3563);
				}
			}


		}

		g_pass = false;
	}
}