#pragma once

#ifndef _ASYNC_RENDER_TASK_
#define _ASYNC_RENDER_TASK_

#include "ntifs.h"
#include <windef.h>
#include "pmcol.h"

#define DRAW_BUFFER_NEED_SIZE (0x100000)
#define ELEMENT_STRING_MAX_LENGTH (260)
#define ELEMENT_BLOCK_MAX_SIZE (300)

struct TaskShareData {
	ULONG PlaneWidth;
	ULONG PlaneHeight;
	ULONG WindowOffsetX;
	ULONG WindowOffsetY;
	ULONG WindowWidth;
	ULONG WindowHeight;
};
struct TaskBuffer {
	ULONG Magic;
	TaskShareData Share;
	bool have_render_data;
	bool have_sec_render_data;
	ULONG lock;
	ULONG ele_count;
	ULONG SizeOfBuffer;
	UCHAR Data;
};
struct ReleasedTaskBuffer {
	TaskBuffer Task;
	UCHAR DrawBuffer[DRAW_BUFFER_NEED_SIZE];
	ULONG Second_ele_count;
	UCHAR SecondDrawBuffer[DRAW_BUFFER_NEED_SIZE];
};
struct TaskSenderCache {
	ULONG ele_count;
	ULONG SizeOfBuffer;
	UCHAR Data;
};
struct ReleasedTaskSenderCache {
	TaskSenderCache Cache;
	UCHAR DrawBuffer[DRAW_BUFFER_NEED_SIZE];
};
#define TaskElementHeaderSize ((long)&((TaskElement *)0)->Data)
struct TaskElement {
	ULONG SizeOfBlock;
	ULONG Type;
	UCHAR Data;
};
enum ElementType {
	ELEMENT_LINE = 1,
	ELEMENT_CIRCLE,
	ELEMENT_STRING,
	ELEMENT_STROKESTRING,
	ELEMENT_SOILDRECT,
	ELEMENT_SOILDTRIANGLE, 
	ELEMENT_SOILDCIRCLE,

};
struct ElementLine {
	float x1;
	float y1;
	float x2;
	float y2;
	DWORD col;
};
struct ElementCircle {
	float centerx;
	float centery;
	float rad;
	long pointCount;
	DWORD col;
};
struct ElementString {
	float x;
	float y;
	ULONG size;
	DWORD col;
	CHAR str;
};
struct ElementStrokeString {
	float x;
	float y;
	ULONG size;
	DWORD col;
	DWORD StrokeCol;
	CHAR str;
};
struct ElementSoildRect {
	float x;
	float y;
	float w;
	float h;
	DWORD col;
};
struct ElementSoildTriangle {
	float x1;
	float y1;
	float x2;
	float y2;
	float x3;
	float y3;
	DWORD col;
};
struct ElementSoildCircle {
	float centerx;
	float centery;
	float rad;
	long pointCount;
	DWORD col;
};

typedef void(*TaskDispatchRoutine)(TaskElement*);

namespace TaskRecv {
	__forceinline void InitNewTaskBuffer(TaskBuffer &Buffer) {
		Buffer.ele_count = 0;
		Buffer.have_render_data = false;
		Buffer.lock = 0;
		Buffer.Share.PlaneHeight = 0;
		Buffer.Share.PlaneWidth = 0;
		Buffer.Share.WindowOffsetX = 0;
		Buffer.Share.WindowOffsetY = 0;
		Buffer.Share.WindowHeight = 0;
		Buffer.Share.WindowWidth = 0;
		Buffer.SizeOfBuffer = sizeof(Buffer);
		Buffer.Magic = 'LUXE';
	}
	__forceinline void UpdateShareData(TaskBuffer& Buffer, TaskShareData& Share) {
		Buffer.Share = Share;
	}

	__forceinline void RenderTask(TaskBuffer& Task, TaskDispatchRoutine Dispatch) {
		PUCHAR pData = &Task.Data;
		PULONG pSec_ele_count = (PULONG)(pData + DRAW_BUFFER_NEED_SIZE);
		PUCHAR pSecData = pData + DRAW_BUFFER_NEED_SIZE + sizeof(ULONG);
		for (int i = 0; i < *pSec_ele_count; i++) {
			TaskElement* ele = (TaskElement*)pSecData;
			Dispatch(ele);
			pSecData += ele->SizeOfBlock;
		}
	}
	__forceinline bool ProcessTask(TaskBuffer& Task, TaskDispatchRoutine Dispatch) {
		if (Task.have_render_data == false) {
			if (Task.have_sec_render_data) {
				RenderTask(Task, Dispatch);
				return true;
			}
			else {
				return false;
			}
		}

		if (InterlockedCompareExchange((LONG*)&Task.lock, 1, 0) == 1)
			return false;
		PUCHAR pData = &Task.Data;

		PUCHAR pSecData = pData + DRAW_BUFFER_NEED_SIZE + sizeof(ULONG);
		PULONG pSec_ele_count = (PULONG)(pData + DRAW_BUFFER_NEED_SIZE);
		*pSec_ele_count = Task.ele_count;
		memcpy(pSecData, pData, Task.SizeOfBuffer);

		Task.have_render_data = false;
		Task.have_sec_render_data = true;
		Task.lock = 0;

		RenderTask(Task, Dispatch);

		return true;


	}

}
namespace TaskSender {
	__forceinline void Begin(TaskSenderCache& Cache) {
		Cache.SizeOfBuffer = 0;
		Cache.ele_count = 0;
	}
	__forceinline bool PresentToTask(TaskBuffer* Task, TaskSenderCache& Cache) {
		if (Task->have_render_data)
			return false;
		if (InterlockedCompareExchange((LONG*)&Task->lock, 1, 0) == 1)
			return false;

		Task->SizeOfBuffer = Cache.SizeOfBuffer;
		Task->ele_count = Cache.ele_count;
		memcpy(&Task->Data, &Cache.Data, Task->SizeOfBuffer);
		Task->have_render_data = true;

		Task->lock = 0;

		return true;
	}

	__forceinline bool CheckTask(TaskSenderCache& ctx) {
		if (DRAW_BUFFER_NEED_SIZE - ctx.SizeOfBuffer < ELEMENT_BLOCK_MAX_SIZE) {
			return false;
		}
		return true;
	}
	__forceinline void AddLine(TaskSenderCache& ctx, float x1, float y1, float x2, float y2, DWORD color) {
		if (!CheckTask(ctx))
			return;
		TaskElement* pEle = (TaskElement*)((PUCHAR)&ctx.Data + ctx.SizeOfBuffer);

		pEle->Type = ELEMENT_LINE;
		ElementLine* ele = (ElementLine*)&pEle->Data;
		ele->x1 = x1;
		ele->x2 = x2;
		ele->y1 = y1;
		ele->y2 = y2;
		ele->col = color;

		pEle->SizeOfBlock = TaskElementHeaderSize + sizeof(ElementLine);
		ctx.ele_count++;
		ctx.SizeOfBuffer += pEle->SizeOfBlock;
	}
	__forceinline void AddBox(TaskSenderCache& ctx, float x, float y, float w, float h, DWORD col) {
		AddLine(ctx, x, y, x + w, y, col);//top
		AddLine(ctx, x, y, x, y + h, col);//left
		AddLine(ctx, x + w, y, x + w, y + h, col);//right
		AddLine(ctx, x, y + h, x + w, y + h, col);//bottom
	}
	__forceinline void AddCornBox(TaskSenderCache& ctx, float x, float y, float w, float h, DWORD col) {
		float xm = w / 4;
		float ym = h / 4;

		AddLine(ctx, x, y, x + xm, y, col); AddLine(ctx, x, y, x, y + ym, col);
		AddLine(ctx, x, y + h, x + xm, y + h, col); AddLine(ctx, x, y + h, x, y + h - ym, col);
		AddLine(ctx, x + w, y, x + w - xm, y, col); AddLine(ctx, x + w, y, x + w, y + ym, col);
		AddLine(ctx, x + w, y + h, x + w - xm, y + h, col); AddLine(ctx, x + w, y + h, x + w, y + h - ym, col);
	}
	__forceinline void AddCircle(TaskSenderCache& ctx, float centerx, float centery, float rad, long pointCount, DWORD col) {
		if (!CheckTask(ctx))
			return;
		TaskElement* pEle = (TaskElement*)((PUCHAR)&ctx.Data + ctx.SizeOfBuffer);

		pEle->Type = ELEMENT_CIRCLE;
		ElementCircle* ele = (ElementCircle*)&pEle->Data;
		ele->centerx = centerx;
		ele->centery = centery;
		ele->rad = rad;
		ele->pointCount = pointCount;
		ele->col = col;

		pEle->SizeOfBlock = TaskElementHeaderSize + sizeof(ElementCircle);
		ctx.ele_count++;
		ctx.SizeOfBuffer += pEle->SizeOfBlock;
	}
	__forceinline void AddSoildCircle(TaskSenderCache& ctx, float centerx, float centery, float rad, long pointCount, DWORD col) {
		if (!CheckTask(ctx))
			return;
		TaskElement* pEle = (TaskElement*)((PUCHAR)&ctx.Data + ctx.SizeOfBuffer);

		pEle->Type = ELEMENT_SOILDCIRCLE;
		ElementSoildCircle* ele = (ElementSoildCircle*)&pEle->Data;
		ele->centerx = centerx;
		ele->centery = centery;
		ele->rad = rad;
		ele->pointCount = pointCount;
		ele->col = col;

		pEle->SizeOfBlock = TaskElementHeaderSize + sizeof(ElementSoildCircle);
		ctx.ele_count++;
		ctx.SizeOfBuffer += pEle->SizeOfBlock;
	}
	__forceinline void FillRect(TaskSenderCache& ctx, float x, float y, float w, float h, DWORD col) {
		if (!CheckTask(ctx))
			return;
		TaskElement* pEle = (TaskElement*)((PUCHAR)&ctx.Data + ctx.SizeOfBuffer);

		pEle->Type = ELEMENT_SOILDRECT;
		ElementSoildRect* ele = (ElementSoildRect*)&pEle->Data;
		ele->x = x;
		ele->y = y;
		ele->w = w;
		ele->h = h;
		ele->col = col;

		pEle->SizeOfBlock = TaskElementHeaderSize + sizeof(ElementSoildRect);
		ctx.ele_count++;
		ctx.SizeOfBuffer += pEle->SizeOfBlock;
	}
	__forceinline void AddSoildTriangle(TaskSenderCache& ctx, float x1, float y1, float x2, float y2, float x3, float y3, DWORD col) {
		if (!CheckTask(ctx))
			return;
		TaskElement* pEle = (TaskElement*)((PUCHAR)&ctx.Data + ctx.SizeOfBuffer);

		pEle->Type = ELEMENT_SOILDTRIANGLE;
		ElementSoildTriangle* ele = (ElementSoildTriangle*)&pEle->Data;
		ele->x1 = x1;
		ele->y1 = y1;
		ele->x2 = x2;
		ele->y2 = y2;
		ele->x3 = x3;
		ele->y3 = y3;
		ele->col = col;

		pEle->SizeOfBlock = TaskElementHeaderSize + sizeof(ElementSoildTriangle);
		ctx.ele_count++;
		ctx.SizeOfBuffer += pEle->SizeOfBlock;
	}
	__forceinline void AddString(TaskSenderCache& ctx, float x, float y, LPCSTR Str, ULONG Size, DWORD col) {
		if (!CheckTask(ctx))
			return;
		TaskElement* pEle = (TaskElement*)((PUCHAR)&ctx.Data + ctx.SizeOfBuffer);

		pEle->Type = ELEMENT_STRING;
		ElementString* ele = (ElementString*)&pEle->Data;
		int len = strlen(Str);
		if (len > ELEMENT_STRING_MAX_LENGTH) {
			len = ELEMENT_STRING_MAX_LENGTH;
		}
		PCHAR pstr = (PCHAR)&ele->str;
		memcpy(pstr, Str, len);
		pstr[len] = 0;
		ele->col = col;
		ele->x = x;
		ele->y = y;
		ele->size = Size;

		pEle->SizeOfBlock = TaskElementHeaderSize + sizeof(ElementString) + len;
		ctx.ele_count++;
		ctx.SizeOfBuffer += pEle->SizeOfBlock;

	}
	__forceinline void AddStringStroke(TaskSenderCache& ctx, float x, float y, LPCSTR Str, ULONG Size, DWORD col, DWORD StrokeColor) {
		if (!CheckTask(ctx))
			return;
		TaskElement* pEle = (TaskElement*)((PUCHAR)&ctx.Data + ctx.SizeOfBuffer);

		pEle->Type = ELEMENT_STROKESTRING;
		ElementStrokeString* ele = (ElementStrokeString*)&pEle->Data;
		int len = strlen(Str);
		if (StrokeColor == 0x22334455)
			len = wcslen((LPCWSTR)Str) * 2;
		if (len > ELEMENT_STRING_MAX_LENGTH) {
			len = ELEMENT_STRING_MAX_LENGTH;
		}
		PCHAR pstr = (PCHAR)&ele->str;
		memcpy(pstr, Str, len);
		pstr[len] = 0;
		if (StrokeColor == 0x22334455)
			pstr[len + 1] = 0;
		ele->col = col;
		ele->StrokeCol = StrokeColor;
		ele->x = x;
		ele->y = y;
		ele->size = Size;

		pEle->SizeOfBlock = TaskElementHeaderSize + sizeof(ElementStrokeString) + len;
		ctx.ele_count++;
		ctx.SizeOfBuffer += pEle->SizeOfBlock;
	}
	__forceinline void AddVerticalHealthLine(TaskSenderCache& ctx, float x, float y, float w, float h, int health, int max_health, DWORD HealthColor) {
		float l_health = health;
		float l_max_health = max_health;
		if (health > max_health)l_health = l_max_health;
		float abs = (float)l_health / (float)l_max_health;
		float startx = x;
		float starty = y;
		float high = h;
		float width = w;
		float calchigh = high * abs;
		float off = high - calchigh;
		starty += off;
		high -= off;
		FillRect(ctx, startx, starty, width, high, HealthColor);
		AddBox(ctx, x, y, w, h, PM_BLACK);
	}

}

#endif // !_ASYNC_RENDER_TASK_RECV_

