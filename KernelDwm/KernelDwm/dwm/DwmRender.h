#pragma once
#ifndef _DWM_RENDER_H_
#define _DWM_RENDER_H_

#include <ntifs.h>
#include "AsyncRenderTask.h"

PEPROCESS getDwm();
void SetDwm(PEPROCESS Dwm, ULONG64 RenderTaskPointer, ULONG64 FlagPointer, ULONG64 TitlePointer);
bool PresentToDWM(ReleasedTaskSenderCache* Cache);
bool ReadFlags(PVOID Buffer, ULONG64 Size);
bool UpdateTitle(LPCSTR NewTitle);
bool CheckRender();


#endif // !_DWM_RENDER_H_
