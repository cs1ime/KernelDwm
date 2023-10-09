#define MAX_CHAR_COUNT (256)
#define MAX_CHAR_VALUE (128)

struct CFontInfo {
	UINT Char;
	int Size;
	int Left;
	int Top;
	int Width;
	int Height;
	unsigned char* bitmap;
	int bitmap_sz;
	int stroke_sz;
};
class Font {
private:
	ULONG g_MaxSize = 0;
	CFontInfo g_FontList[MAX_CHAR_COUNT];
	USHORT g_FontIdxList[MAX_CHAR_VALUE];
public:
	BOOL InitFont(const BYTE* file_base, ULONG file_size) {
		RtlZeroMemory(g_FontList, sizeof(g_FontList));
		RtlZeroMemory(g_FontIdxList, sizeof(g_FontIdxList));
		struct FileHeader {
			ULONG tag;
			ULONG Count;
		};
		struct CharFileInfo {
			wchar_t Char;
			int size;
			int bitmap_left;
			int bitmap_top;
			int bitmap_width;
			int bitmap_height;
			int bitmap_sz;
			int stroke_sz;
		};

		FileHeader* header = (FileHeader*)file_base;
		//if (header->tag != 'JH') {
		//	return FALSE;
		//}
		ULONG bitmaps_size = 0;
		CharFileInfo* info = (CharFileInfo*)(file_base + sizeof(FileHeader));
		g_MaxSize = info->size;
		for (int i = 0; i < header->Count; i++) {
			ULONG size = info->bitmap_sz * 3 + info->stroke_sz * 3;
			bitmaps_size += size;
			info = (CharFileInfo*)(((PUCHAR)info) + sizeof(CharFileInfo) + size);
		}
		info = (CharFileInfo*)(file_base + sizeof(FileHeader));
		int fidx = 1;
		for (int i = 0; i < header->Count; i++) {
			ULONG size = info->bitmap_sz * 3 + info->stroke_sz * 3;
			CFontInfo Glyph;
			memset(&Glyph, 0, sizeof(CFontInfo));
			if ((int)info->Char >= MAX_CHAR_VALUE)
				goto loop_cont;
			Glyph.Char = info->Char;
			Glyph.Size = info->size;
			Glyph.Height = info->bitmap_height;
			Glyph.Width = info->bitmap_width;
			Glyph.Left = info->bitmap_left;
			Glyph.Top = info->bitmap_top;
			Glyph.bitmap = (BYTE*)(info + 1);
			Glyph.bitmap_sz = info->bitmap_sz;
			Glyph.stroke_sz = info->stroke_sz;
			//g_FontList.push_back(Glyph);
			g_FontIdxList[Glyph.Char] = fidx;
			g_FontList[fidx] = Glyph;
			fidx++;
			if (fidx >= MAX_CHAR_COUNT)
				break;
		loop_cont:
			info = (CharFileInfo*)(((PUCHAR)info) + sizeof(CharFileInfo) + size);
		}
		return TRUE;
	}

	CFontInfo* GetChar(USHORT ch) {
		if (ch >= MAX_CHAR_VALUE)
			return 0;
		USHORT idx = g_FontIdxList[ch];

		if (idx != 0)
			return &g_FontList[idx];
		return 0;
	}
};
