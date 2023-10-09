// GetGlyph.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <iostream>
#include "Vector"
#include <ft2build.h>
#include FT_FREETYPE_H
#include "windows.h"
using namespace std;

#ifdef _AMD64_
#ifdef _DEBUG
#pragma comment(lib, "freetype64d.lib")
#else
#pragma comment(lib, "freetype64.lib")
#endif// DEBUG
#else
#ifdef _DEBUG
#pragma comment(lib, "freetype32d.lib")
#else
#pragma comment(lib, "freetype32.lib")
#endif// DEBUG
#endif // AMD64

static FT_Library g_ft;
static FT_Face g_face;

struct CharInfo {
    wchar_t Char;
    size_t size;
    int bitmap_left;
    int bitmap_top;
    int bitmap_width;
    int bitmap_height;
    unsigned char* bitmap;
	int bitmap_sz;
	int stroke_sz;
} ;

std::vector<CharInfo> g_CharList;

bool IsInList(wchar_t Char) {
    for (int i = 0; i < g_CharList.size(); i++) {
        if (g_CharList[i].Char == Char) {
            return true;
        }
    }
    return false;
}
int strokeWid = 1;
unsigned char * GetStorke(unsigned char *bitmap, int w, int h) {
	
	auto RenderChar = [](int startx, int starty, unsigned char *dst, int dstw, unsigned char *bitmap, int w, int h) {
		for (int y = 0; y < h; y++) {
			for (int x = 0; x < w; x++) {
				unsigned char *row = dst + starty * dstw + y * dstw;
				if (bitmap[y*w + x] > row[startx + x])
					row[startx + x] = bitmap[y*w + x];
			}
		}
	};
	auto ClearChar = [](int startx, int starty, unsigned char *dst, int dstw, unsigned char *bitmap, int w, int h) {
		for (int y = 0; y < h; y++) {
			for (int x = 0; x < w; x++) {
				unsigned char *row = dst + starty * dstw + y * dstw;
				if (bitmap[y*w + x] == 0xFF) {
					row[startx + x] = 0;
				}
				
			}
		}
	};

	int nw = w + strokeWid * 2;
	int nh = h + strokeWid * 2;
	unsigned char *newmap = (unsigned char *)malloc(nw*nh);
	memset(newmap, 0, nw*nh);

	RenderChar(0, 0, newmap, nw, bitmap, w, h);
	RenderChar(0, 1, newmap, nw, bitmap, w, h);
	RenderChar(0, 2, newmap, nw, bitmap, w, h);
	RenderChar(1, 0, newmap, nw, bitmap, w, h);
	RenderChar(1, 2, newmap, nw, bitmap, w, h);

	RenderChar(0, 2, newmap, nw, bitmap, w, h);
	RenderChar(1, 2, newmap, nw, bitmap, w, h);
	RenderChar(2, 2, newmap, nw, bitmap, w, h);

	ClearChar(1, 1, newmap, nw, bitmap, w, h);

	return newmap;
}
float map[0x10000] = { 0 };
CharInfo *LoadChar(wchar_t Char, size_t Size) {
    FT_Set_Pixel_Sizes(g_face, Size, Size);
    FT_Set_Char_Size(g_face, FT_F26Dot6(Size * 64), FT_F26Dot6(Size * 64), 96, 96);
    if (FT_Load_Char(g_face, Char, FT_LOAD_RENDER | FT_LOAD_TARGET_NORMAL)) {
        return NULL;
    }

    FT_GlyphSlot ftslot = g_face->glyph;
    if (ftslot->bitmap.pixel_mode != FT_PIXEL_MODE_GRAY) {
        return NULL;
    }
    FT_Bitmap bitmap = ftslot->bitmap;
    if (bitmap.buffer == NULL) {
        return NULL;
    }
    //FT_Curve_Tag_On

    /*for (int i = 0; i < ftslot->outline.n_points; i++) {
        printf("%d,%d tag:%d\n", ftslot->outline.points[i].x, ftslot->outline.points[i].y, ftslot->outline.tags[i]);
    }*/

    CharInfo info;
    memset(&info, 0, sizeof(CharInfo));
   
	

	size_t charHeight = bitmap.rows;
    size_t charWidth = bitmap.width;
    size_t bitmap_size = charHeight * charWidth;
    info.bitmap = (unsigned char *)malloc(bitmap_size);
    memset(info.bitmap, 0, bitmap_size);

    unsigned char* buffer = (unsigned char*)(bitmap.buffer);
    /*printf("left:%d\n", ftslot->bitmap_left);
    for (int i = 0; i < charHeight; i++) {
        unsigned char* src = buffer + (i * bitmap.pitch);
        for (int j = 0; j < charWidth; j++) {
            printf("%2x ", src[j]);
        }
        printf("\n");
    }*/
    for (int i = 0; i < charHeight; i++) {
        unsigned char* src = buffer + (i * bitmap.pitch);
        memcpy(info.bitmap + i * (charWidth), src, charWidth);
        //printf("\n");
    }
	int sw = charWidth + strokeWid * 2;
	int sh = charHeight + strokeWid * 2;
	unsigned char *stroke = GetStorke(info.bitmap, charWidth, charHeight);

	struct posmap {
		UCHAR x, y;
		UCHAR alpha;
		UCHAR pad;
	};
	vector<UCHAR> newmap;
	int bm_ref = 0;
	for (int y = 0; y < charHeight; y++) {
		for (int x = 0; x < charWidth; x++) {
			UCHAR v = info.bitmap[y*charWidth + x];
			if (v != 0) {
				newmap.push_back(x);
				newmap.push_back(y);
				newmap.push_back(v);
				bm_ref++;
			}
			
		}
	}
	int stroke_ref = 0;
	for (int y = 0; y < sh; y++) {
		for (int x = 0; x < sw; x++) {
			UCHAR v = stroke[y*sw + x];
			if (v != 0) {
				newmap.push_back(x);
				newmap.push_back(y);
				newmap.push_back(v);
				stroke_ref++;
			}

		}
	}
	info.bitmap_sz = bm_ref;
	info.stroke_sz = stroke_ref;
	free(info.bitmap);
	free(stroke);
	void *newbuf = malloc(newmap.size());
	memcpy(newbuf, newmap.data(), newmap.size());
	info.bitmap = (UCHAR *)newbuf;

    info.bitmap_height = bitmap.rows;
    info.bitmap_width = bitmap.width;
    //if (Char == 'e')
        //DebugBreak();
    info.bitmap_left = ftslot->bitmap_left;
    info.bitmap_top = ftslot->bitmap_top;

    info.Char = Char;
    info.size = Size;

    //if (Char == L'_') {
        //info.bitmap_top = info.bitmap_height;
    //}
    if (Size == 14) {
        map[Char] = info.bitmap_width;
    }
    

    g_CharList.push_back(info);
	return NULL;
}

void LoadStr(const wchar_t* Str, size_t size) {
    for (int i = 0; i < wcslen(Str); i++) {
        if (IsInList(Str[i]) == false) {
            LoadChar(Str[i], size);
            //if (size == 15.f) {
                //map[Str[i]] = g_CharList[g_CharList.size() - 1].bitmap_width;
            //}
        }
        
    }
}
bool WriteToFile(const char *filename) {
    struct FileHeader {
        ULONG tag;
        ULONG Count;
    };
    int allsize = g_CharList.size() * 8 * 4;
    for (int i = 0; i < g_CharList.size(); i++) {
        allsize += g_CharList[i].bitmap_sz * 3+ g_CharList[i].stroke_sz * 3;
    }
    allsize += sizeof(FileHeader);
    printf("%d\n", allsize);
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
    unsigned char* FileBuffer = (unsigned char*)malloc(allsize);
    memset(FileBuffer, 0, allsize);
    ((FileHeader*)FileBuffer)->tag = '  ';
    ((FileHeader*)FileBuffer)->Count = g_CharList.size();
    unsigned char* CurrentPos = FileBuffer + sizeof(FileHeader);
    for (int i = 0; i < g_CharList.size(); i++) {
        CharFileInfo fileinfo;
        memset(&fileinfo, 0, sizeof(CharFileInfo));
        fileinfo.Char = g_CharList[i].Char;
        fileinfo.size = g_CharList[i].size;
        fileinfo.bitmap_left = g_CharList[i].bitmap_left;
        fileinfo.bitmap_top = g_CharList[i].bitmap_top;
        fileinfo.bitmap_width = g_CharList[i].bitmap_width;
        fileinfo.bitmap_height = g_CharList[i].bitmap_height;
		fileinfo.bitmap_sz = g_CharList[i].bitmap_sz;
		fileinfo.stroke_sz = g_CharList[i].stroke_sz;

        memcpy(CurrentPos, &fileinfo, sizeof(CharFileInfo));
		int bitmap_size = fileinfo.bitmap_sz * 3 + fileinfo.stroke_sz * 3;
        CurrentPos += sizeof(CharFileInfo);
        memcpy(CurrentPos, g_CharList[i].bitmap, bitmap_size);
        
        CurrentPos += bitmap_size;

    }
    
    FILE* fp = fopen(filename, "wb+");
    fwrite(FileBuffer, 1, allsize, fp);
    fclose(fp);

    return true;
}
#include <string>
using namespace std;
void dumpmap() {
    printf("static float map[]={");
    for (int i = 0; i < 0x10000; i++) {
        if (i)
            printf(",");
        printf("%1.1f", map[i]);
    }
   printf("};");
}
int main(int argc,char *argv[])
{
    const char* filename = 0;
    int size = 0;
    for (int i = 0; i < argc; i++) {
        if (!strcmp(argv[i], "-f")) {
            filename = argv[i + 1];
        }
        if (!strcmp(argv[i], "-S")) {
            size = atoi(argv[i + 1]);
        }
    }
	if (filename == 0 || size == 0) {
		puts("usage: GetGlyph -f font file -S font max size\n");
		return 1;
	}

    HANDLE hFile = CreateFileA("chars.txt", GENERIC_READ, 0, 0, OPEN_EXISTING, 0, 0);
    ULONG Size = GetFileSize(hFile, 0);
    char* str = (char *)malloc(Size);
    ULONG read = 0;
    ReadFile(hFile, str, Size, &read, 0);

    /*char filename[100];
    printf("Font file:");
    scanf("%s", &filename);*/
   // printf("%s\n", str);
    
    FT_Init_FreeType(&g_ft);
    if (FT_New_Face(g_ft, filename, 0, &g_face) != 0) {
        printf("Freetype Init Error!\n");
        return 1;
    }
    LPWSTR buf = (LPWSTR)malloc(strlen(str) * 2 + 2);
    MultiByteToWideChar(0, 0, str, strlen(str) + 1, buf, strlen(str) * 2 + 2);


    LoadStr(buf, size);
    //dumpmap();
    WriteToFile("1.hjf");


	return 0;
}

// 运行程序: Ctrl + F5 或调试 >“开始执行(不调试)”菜单
// 调试程序: F5 或调试 >“开始调试”菜单

// 入门使用技巧: 
//   1. 使用解决方案资源管理器窗口添加/管理文件
//   2. 使用团队资源管理器窗口连接到源代码管理
//   3. 使用输出窗口查看生成输出和其他消息
//   4. 使用错误列表窗口查看错误
//   5. 转到“项目”>“添加新项”以创建新的代码文件，或转到“项目”>“添加现有项”以将现有代码文件添加到项目
//   6. 将来，若要再次打开此项目，请转到“文件”>“打开”>“项目”并选择 .sln 文件
