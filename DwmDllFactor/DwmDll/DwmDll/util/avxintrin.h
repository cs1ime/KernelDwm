#ifndef _AVX_INTRIN_H_
#define _AVX_INTRIN_H_

#define __inline__ __forceinline
#define __DEFAULT_FN_ATTRS256 __attribute__((__always_inline__, __nodebug__, __target__("avx2"), __min_vector_width__(256)))
#define __DEFAULT_FN_ATTRS128 __attribute__((__always_inline__, __nodebug__, __target__("avx2"), __min_vector_width__(128)))
#define __DEFAULT_FN_ATTRS __attribute__((__always_inline__, __nodebug__, __target__("avx"), __min_vector_width__(256)))
#define __DEFAULT_FN_ATTRS



typedef unsigned long long __v4du __attribute__((__vector_size__(32)));
typedef long long ___m256i __attribute__((__vector_size__(32)));

static __inline__ ___m256i __DEFAULT_FN_ATTRS256
__mm256_xor_si256(___m256i __a, ___m256i __b)
{
	return (___m256i)((__v4du)__a ^ (__v4du)__b);
}
static __inline void __DEFAULT_FN_ATTRS
__mm256_store_si256(___m256i *__p, ___m256i __a)
{
	*__p = __a;
}
static __inline ___m256i __DEFAULT_FN_ATTRS
__mm256_load_si256(___m256i const *__p)
{
	return *__p;
}


#define __DEFAULT_FN_ATTRS_sse __attribute__((__always_inline__, __nodebug__, __target__("sse2"), __min_vector_width__(128)))
#define __DEFAULT_FN_ATTRS_MMX __attribute__((__always_inline__, __nodebug__, __target__("mmx,sse2"), __min_vector_width__(64)))

typedef long long ___m128i __attribute__((__vector_size__(16), __aligned__(16)));
typedef unsigned long long ___v2du __attribute__((__vector_size__(16)));

static __inline__ ___m128i __DEFAULT_FN_ATTRS_sse
__mm_load_si128(___m128i const *__p)
{
	return *__p;
}
static __inline__ ___m128i __DEFAULT_FN_ATTRS
__mm_xor_si128(___m128i __a, ___m128i __b)
{
	return (___m128i)((___v2du)__a ^ (___v2du)__b);
}
static __inline__ void __DEFAULT_FN_ATTRS
__mm_store_si128(___m128i *__p, ___m128i __b)
{
	*__p = __b;
}

#endif // !_AVX_INTRIN_H_
