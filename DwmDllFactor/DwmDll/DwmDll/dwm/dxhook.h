#pragma once 
#ifndef _DXHOOK_H_
#define _DXHOOK_H_
#include "windows.h"

typedef VOID(*FnDxgiCallback)(ULONG64 pSwapChain, ULONG way);

ULONG64 GetDx11PresentImpl();
ULONG64 GetDx11MultiplanePresent();

void install_dxhook(FnDxgiCallback callback);
void remove_dxhook();


#endif // !_DXHOOK_H_

