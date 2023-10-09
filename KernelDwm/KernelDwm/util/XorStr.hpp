#pragma once

#ifndef _XORSTR_HPP_
#define _XORSTR_HPP_

#define xs(a) (a)
#define XorStr(a)  (a)


namespace XorCompileTime {
	constexpr auto time = __TIME__;
	constexpr auto seed = static_cast<int>(time[7]) + static_cast<int>(time[6]) * 10 + static_cast<int>(time[4]) * 60 + static_cast<int>(time[3]) * 600 + static_cast<int>(time[1]) * 3600 + static_cast<int>(time[0]) * 36000;

}

#define RAND64TEMPLATE(x1,x2) (((unsigned long long)XorCompileTime::seed * (unsigned long long)x1 + (unsigned long long)x2))
#define RAND64 (RAND64TEMPLATE(0xC49173dd6f1c8369,0xecd4934aa5198241))
#define RAND8  (RAND64TEMPLATE(0x1797b8fe4d667aaf,0x024e8f5ec75cbc0a)%0xFF)
#define RAND16 (RAND64TEMPLATE(0x2e22143188825844,0xe9aeabbde2c43d44)%0xFFFF)
#define RAND32 (RAND64TEMPLATE(0x96ce59db9d27599f,0x22762feae0c90cd8)%0xFFFFFFFF)

#define XORAND64(v)(RAND64^v)
#define XORAND32(v)(RAND32^v)
#define XORAND16(v)(RAND16^v)
#define XORAND8(v)(RAND8^v)

#endif
