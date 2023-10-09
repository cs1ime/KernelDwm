#pragma once

#ifndef _DXGKHOOK_H_
#define _DXGKHOOK_H_

namespace Dxgk {
	VOID InstallHook();
	VOID RemoveHook();
	VOID TryFreeMem();
	bool isRemoved();
	void set_for_report();
	void resetvalue();
}

#endif // !_DXGKHOOK_H_

