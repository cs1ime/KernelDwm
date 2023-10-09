#pragma once

#ifndef _COMPILE_CONTROL_
#define _COMPILE_CONTROL_


// #define CSGO_RELEASE

// #define DISABLE_PRINT
// #define ANTI_CRACK 
// #define DISABLE_BUGCHECK 
// #define DISABLE_KD
// #define ANTI_VM
//
#ifdef CSGO_RELEASE
#define DISABLE_PRINT
#define ANTI_CRACK 
#define DISABLE_BUGCHECK 
#define DISABLE_KD
#define ANTI_VM
#endif // CSGO_RELEASE


//#define ALLOW_REPEAT






#define _ptb(fo,...)DbgPrint(xs("[112233]"#fo"\n"),__VA_ARGS__)
#define _pt _ptb
#define pt _pt

#define p1x(v1)DbgPrint(xs("[112233] "#v1"=%08llX\n"),v1)
#define p1d(v1)DbgPrint(xs("[112233] "#v1"=%08lld\n"),v1)

#ifdef DISABLE_PRINT
#define printf
#define DbgPrint
#define _ptb
#define pt
#define p1x
#define p1d

#else
#define printf DbgPrint
#endif // DISABLE_PRINT


#endif
