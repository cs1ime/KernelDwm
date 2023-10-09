#include "Math.h"
#include "mymemoryio64.h"
#include "font.h"
typedef UCHAR uint8_t;
typedef USHORT uint16_t;
typedef ULONG uint32_t;
typedef ULONG64 uint64_t;

float roundf(float a) {
	int ia = (int)a;
	float xs = a - (float)ia;
	if (xs >= .5f) {
		return a + 1.f;
	}
	return a;
}
float floorf(float a) {
	int ia = (int)a;
	float xs = a - (float)ia;
	if (xs > 0.f) {
		return a + 1.f;
	}
	return a;
}

 
class FColor
{
public:
	uint8_t RGBA[4];

	__forceinline FColor(uint8_t R, uint8_t G, uint8_t B, uint8_t A = 255) {
		RGBA[0] = R; RGBA[1] = G; RGBA[2] = B; RGBA[3] = A;
	}

	__forceinline FColor(uint32_t val) {
		*(uint32_t*)&RGBA = val;
	}

	__forceinline auto Get() const {
		return *(uint32_t*)&RGBA;
	}
};
__forceinline size_t mywcslen(LPCWSTR s)
{
	size_t len = 0;

	while (s[len] != L'\0')
	{
		if (s[++len] == L'\0')
			return len;
		if (s[++len] == L'\0')
			return len;
		if (s[++len] == L'\0')
			return len;
		++len;
	}

	return len;
}
class ByteRender
{
private:
	int w, h;
	bool align;
	uint32_t* Arr;

	//
	int OddNumber(int val) {
		return (val % 2) ? val : val + 1;
	}

	int EvenNumber(int val) {
		return (val % 2) ? val + 1 : val;
	}

	//pixel
	FColor GetPixel(int x, int y) {
		return FColor(Arr[(y * w) + x]);
	}

	FColor ColorBlend(FColor prev, FColor cur)
	{
		//pixels rgba to float
		int ca = cur.RGBA[3];
		int pa = prev.RGBA[3];
		float added[] = { cur.RGBA[0], cur.RGBA[1], cur.RGBA[2], (float)ca / 255.f };
		float base[] = { prev.RGBA[0], prev.RGBA[1], prev.RGBA[2], (float)pa / 255.f };

		//mix colors
		float mix[4];
		mix[3] = 1 - (1 - added[3]) * (1 - base[3]); // alpha
		mix[0] = roundf((added[0] * added[3] / mix[3]) + (base[0] * base[3] * (1 - added[3]) / mix[3])); // red
		mix[1] = roundf((added[1] * added[3] / mix[3]) + (base[1] * base[3] * (1 - added[3]) / mix[3])); // green
		mix[2] = roundf((added[2] * added[3] / mix[3]) + (base[2] * base[3] * (1 - added[3]) / mix[3])); // blue

		//set new pixel color
		return FColor(mix[0], mix[1], mix[2], (mix[3] * 255.f));
	}

	void SetPixel(int x, int y, FColor color, int br = 0)
	{
		if ((x >= w) || (y >= h))
			return;
		if (x < 0 || y < 0)
			return;
		//need fix color
		//
		//
		//
		//
		//
		//
		//
		//
		//
		//

		//apply pixels
		PVOID ppix = &Arr[(y * w) + x];
		
		int pageidx = ((ULONG_PTR)ppix - (ULONG_PTR)Arr) / 0x1000;
		if (pageidx < 0x10000) {
			if (pagehit[pageidx] == 0) {
				int edgeidx = (((h * w) + w - 1) * 4) / 0x1000;
				if (pageidx > edgeidx)
					return;
				PVOID prevpix = 0;
				PVOID nextpix = 0;
				if (pageidx == 0) {
					prevpix = ppix;
					nextpix = (PVOID)((ULONG_PTR)ppix + 0x1000);
				}
				else if (pageidx == edgeidx) {
					prevpix = (PVOID)((ULONG_PTR)ppix - 0x1000);
					nextpix = ppix;
				}
				else {
					prevpix = (PVOID)((ULONG_PTR)ppix - 0x1000);
					nextpix = (PVOID)((ULONG_PTR)ppix + 0x1000);
				}
				pagevaild[pageidx] = (MmiGetPhysicalAddress(ppix) == 0 || MmiGetPhysicalAddress(prevpix) == 0 || MmiGetPhysicalAddress(nextpix) == 0) ? false : true;
				pagehit[pageidx] = 1;
			}


			//if (MmiGetPhysicalAddress(ppix)) {
			if (pagevaild[pageidx]) {
				if (br)
				{
					//apply brightness
					//color.RGBA[3] = 255 - br;
					auto prevPx = GetPixel(x, y);

					//need color blend
					if (prevPx.RGBA[3])
						color = ColorBlend(prevPx, color);
				}
				Arr[(y * w) + x] = color.Get();
			}
			
			//}
		}
		
		
	}

	//line
	__forceinline void plotLineWidth(int x0, int y0, int x1, int y1, FColor clr, float th)
	{                              /* plot an anti-aliased line of width th pixel */
		auto dx = abs(x1 - x0), sx = x0 < x1 ? (float)1 : (float)-1;
		auto dy = abs(y1 - y0), sy = y0 < y1 ? (float)1 : (float)-1;
		float err, e2 = sqrt(dx * dx + dy * dy);                            /* length */

		//if (th <= 1 || e2 == 0) return plotLineAA(x0, y0, x1, y1, clr);    /* assert */
		dx *= 255 / e2; dy *= 255 / e2; th = 255 * (th - 1);               /* scale values */

		if (dx < dy) {                                               /* steep line */
			x1 = (int)roundf((e2 + th / 2) / dy);                          /* start offset */
			err = x1 * dy - th / 2;                  /* shift error value to offset width */
			for (x0 -= x1 * sx; ; y0 += sy) {
				SetPixel(x1 = x0, y0, clr, err);                  /* aliasing pre-pixel */
				for (e2 = dy - err - th; e2 + dy < 255; e2 += dy)
					SetPixel(x1 += sx, y0, clr);                      /* pixel on the line */
				SetPixel(x1 + sx, y0, clr, e2);                    /* aliasing post-pixel */
				if (y0 == y1) break;
				err += dx;                                                 /* y-step */
				if (err > 255) { err -= dy; x0 += sx; }                    /* x-step */
			}
		}
		else {                                                      /* flat line */
			y1 = (int)roundf((e2 + th / 2) / dx);                          /* start offset */
			err = y1 * dx - th / 2;                  /* shift error value to offset width */
			for (y0 -= y1 * sy; ; x0 += sx) {
				SetPixel(x0, y1 = y0, clr, err);                  /* aliasing pre-pixel */
				for (e2 = dx - err - th; e2 + dx < 255; e2 += dx)
					SetPixel(x0, y1 += sy, clr);                      /* pixel on the line */
				SetPixel(x0, y1 + sy, clr, e2);                    /* aliasing post-pixel */
				if (x0 == x1) break;
				err += dy;                                                 /* x-step */
				if (err > 255) { err -= dx; y0 += sy; }                    /* y-step */
			}
		}
	}


public:
	//init render
	template<typename T>
	__forceinline void Setup(int Width, int Height, T pixelsArr) {
		w = Width; h = Height;
		Arr = (uint32_t*)pixelsArr;
		align = true;
	}

	int DrawChar(class Font *f, const Vector2& Start, wchar_t ch, const FColor& Color) {
		CFontInfo *chfont = f->GetChar(ch);
		if (chfont) {
			int w = chfont->Width;
			int h = chfont->Height;
			int top = chfont->Top;
			int sz = (float)chfont->Size / 1.3f;
			unsigned char *pstroke = chfont->bitmap + chfont->bitmap_sz * 3;
			for (int i = 0; i < chfont->stroke_sz; i++) {
				unsigned char *pc = (unsigned char *)pstroke + i * 3;
				int x = pc[0];
				int y = pc[1];
				int a = pc[2];
				FColor col = PM_BLACK;
				col.RGBA[3] = a;
				SetPixel(Start.x + x - 1, Start.y + y - top + sz - 1, col, 1);
			}

			for (int i = 0; i < chfont->bitmap_sz; i++) {
				unsigned char *pc = (unsigned char *)chfont->bitmap + i * 3;
				int x = pc[0];
				int y = pc[1];
				int a = pc[2];
				FColor col = Color;
				col.RGBA[3] = a;
				SetPixel(Start.x + x, Start.y + y - top + sz, col, 1);
			}

			return chfont->Width + chfont->Left;
		}
		return 0;
	}
	void String(class Font *f, const Vector2& Start, LPCWSTR str, const FColor& Color = FColor(255, 255, 255)) {
		
		int len = mywcslen(str);
		int xoff = 0;
		for (int i = 0; i < len; i++) {
			if (str[i] == (WCHAR)L' ') {
				xoff += f->GetChar(L'9')->Width;
				continue;
			}
			CFontInfo *chfont = f->GetChar(str[i]);
			if (chfont) {
				if (i != 0) {
					xoff += chfont->Left;
				}

				Vector2 pos = Start;
				pos.x += xoff;
				DrawChar(f, pos, str[i], Color);
				xoff += chfont->Width + 1;
				//xoff += f->GetChar(L'M')->Width;
			}
			
		}
		
	}
	void StringA(class Font *f, const Vector2& Start, LPCSTR str, const FColor& Color = FColor(255, 255, 255)) {
		WCHAR wstr[50];
		DxUTF8ToUnicode(str, wstr, 49);
		String(f, Start, wstr, Color);
	}
	int StringWidth(class Font *f, const wchar_t* str) {
		int len = mywcslen(str);
		int xoff = 0;
		for (int i = 0; i < len; i++) {
			if (str[i] == ' ') {
				xoff += f->GetChar(L'M')->Width;
				continue;
			}
			CFontInfo *chfont = f->GetChar(str[i]);
			if (chfont) {
				if (i != 0) {
					xoff += chfont->Left;
				}
				xoff += chfont->Width + 1;
			}
			
		}
		return xoff;
	}
	int CharHeight(class Font *f) {
		auto fp = f->GetChar(L'M');
		if (fp)
			return fp->Height;
		return 0;
	}

	__forceinline void Line(const Vector2& Start, const Vector2& End, const FColor& Color, int Thickness = 1) {
		plotLineWidth(Start.x, Start.y, End.x, End.y, Color, 0);
	}

	void Rectangle(const Vector2& Start, const Vector2& Size, const FColor& Color, int Thickness = 1)
	{
		int fix = Thickness / 2;
		Thickness = OddNumber(Thickness);

		align = false;

		plotLineWidth(Start.x - fix, Start.y, Start.x + Size.x + fix, Start.y, Color, Thickness);
		plotLineWidth(Start.x, Start.y, Start.x, Start.y + Size.y, Color, Thickness);
		plotLineWidth(Start.x + Size.x, Start.y, Start.x + Size.x, Start.y + Size.y, Color, Thickness);
		plotLineWidth(Start.x - fix, Start.y + Size.y, Start.x + Size.x + fix, Start.y + Size.y, Color, Thickness);

		align = true;
	}
	
	void FillRectangle(const Vector2& arg_Start, const Vector2& arg_Size, const FColor& Color) {
		Rectangle(arg_Start, arg_Size, Color);
		return;
	}

	__forceinline void LineY(int x, int y, int d, FColor col) {
		if (d < 0) {
			d = -d;
			y -= d;
		}
		for (int i = 0; i < d + 1; i++) {
			SetPixel(x, y + i, col, 0);
		}
	}
	__forceinline void LineX(int x, int y, int d, FColor col) {
		if (d < 0) {
			d = -d;
			x -= d;
		}
		for (int i = 0; i < d + 1; i++) {
			SetPixel(x + i, y, col, 0);
		}
	}

};