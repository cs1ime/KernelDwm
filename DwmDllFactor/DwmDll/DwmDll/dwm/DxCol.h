#pragma once

#ifndef _DXCOL_H_
#define _DXCOL_H_

#include "windef.h"

#define DX_RGBA(r, g, b, a) (DWORD)(((((a) & 0xff) << 24) | (((b) & 0xff) << 16) | (((g) & 0xff) << 8) | ((r) & 0xff)))
#define DX_ARGB(a, r, g, b) (DX_RGBA(r, g, b, a))
#define DX_XRGB(r, g, b) (DX_RGBA(r, g, b, 255))

namespace Color {
	static DWORD Red = DX_XRGB(255, 0, 0);
	static DWORD Green = DX_XRGB(0, 255, 0);
	static DWORD Blue = DX_XRGB(0, 0, 255);
	static DWORD Gold = DX_XRGB(255, 255, 0);
	static DWORD Yellow = DX_XRGB(255, 255, 0);
	static DWORD Purple = DX_XRGB(255, 0, 255);

	static DWORD White = DX_XRGB(255, 255, 255);
	static DWORD Black = DX_XRGB(0, 0, 0);

}

#endif // !_DXCOL_H_

