__attribute__((naked)) float mysqrt(float v) {
	
	_asm {
		sqrtss xmm0, xmm0;
		retn;
	}
}
float myabs(float x) {
	if (x < 0)
		return -x;
	return x;
}
