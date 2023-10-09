#pragma once

#ifndef _XOR_CRYPT_H_
#define _XOR_CRYPT_H_


#define E(v)((decltype(v))(((ULONG64)(v))^0x78228d8bfe58f625))


#define MOU_XORKEY (0x78228d8bfe58f625)
#define MOU_XOR(v)((decltype(v))(((ULONG64)(v))^MOU_XORKEY))

#define SPOOFCALL_XORKEY (0x78228d8bfe58f625)
#define SPOOFCALL_XOR(v)((decltype(v))(((ULONG64)(v))^SPOOFCALL_XORKEY))

#define RENDER_XORKEY (0x78228d8bfe58f625)
#define RENDER_XOR(v)((decltype(v))(((ULONG64)(v))^RENDER_XORKEY))

#define DYNEMU_XORKEY (0x78228d8bfe58f625)
#define DYNEMU_XOR(v)((decltype(v))(((ULONG64)(v))^DYNEMU_XORKEY))

#define HOOK_XORKEY (0x78228d8bfe58f625)
#define HOOK_XOR(v)((decltype(v))(((ULONG64)(v))^HOOK_XORKEY))

#endif



