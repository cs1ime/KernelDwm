
	.data
_data SEGMENT
g_offset_stack dd 0
g_kvashadow dd 0
_data ENDS

PUBLIC g_offset_stack
PUBLIC g_kvashadow

	.code
_text SEGMENT

__KiCallUserMode2 PROC 
 int 3
		jmp local_codestart;
		local_offset_stack:
		nop;
		nop;
		nop;
		nop;
		local_kvashadow:
		nop;
		nop;
		nop;
		nop;
		local_codestart:
		mov rax, 0ee4h
		xor rax, 0FDCh
		sub rsp, rax
		add rsp, 10h
		jz __KiCallUserMode2_stub1
		jnz __KiCallUserMode2_stub1
		nop
		nop
		nop
		nop
		__KiCallUserMode2_stub1 :
		sub rsp, 10h
			movaps xmmword ptr[rsp + 70h], xmm10
			movaps xmmword ptr[rsp + 40h], xmm7
			lea rax, [rsp + 100h]
			movaps xmmword ptr[rax - 80h], xmm11
			movaps xmmword ptr[rax - 50h], xmm14
			movaps xmmword ptr[rsp + 30h], xmm6
			movaps xmmword ptr[rax - 60h], xmm13
			movaps xmmword ptr[rsp + 50h], xmm8
			movaps xmmword ptr[rax - 40h], xmm15
			movaps xmmword ptr[rsp + 60h], xmm9
			movaps xmmword ptr[rax - 70h], xmm12

			mov[rax - 8], rbp
			mov rbp, rsp
			mov[rax], rbx
			mov[rax + 8], rdi
			mov[rax + 10h], rsi
			mov[rax + 20h], r13
			mov[rax + 30h], r15
			mov[rax + 18h], r12
			mov[rax + 28h], r14

			mov[rbp + 0D8h], rcx
			lea rax, [r8 - 30h]
			mov[rbp + 0E0h], rax
			push 901h
			xor qword ptr[rsp], 889h
			pop rax
			mov rbx, gs:[rax]
			mov[r8 + 20h], rsp
			mov rsi, [rbx + 90h]
			mov[rbp + 0D0h], rsi

			cli
			mov[rbx + 28h], r8
			lea r9, [r8 + 50h]
			mov[rbx + 38h], r9
			call locate_data;
		locate_data:
			pop rax;
			sub rax, offset locate_data - offset local_kvashadow;
			cmp dword PTR[rax], 0
			je _nokvashadow
			call locate_data2;
		locate_data2:
			pop rax;
			sub rax, offset locate_data2 - offset local_offset_stack;
			mov eax, dword PTR[rax]
			mov gs : [eax], r8
			jmp _kvashadow_end
			_nokvashadow :
		mov rdi, gs : [8]
			mov[rdi + 4], r8
			_kvashadow_end :
		mov ecx, 6000h
			sub r9, rcx
			mov gs : [1A8h], r8
			mov[rbx + 30h], r9
			lea rsp, [r8 - 190h]
			mov rdi, rsp
			mov ecx, 32h
			rep movsq

			lea rbp, [rsi - 110h]
			ldmxcsr dword ptr[rbp - 54h]

			mov r11, [rbp + 0F8h]
			mov rbp, [rbp + 0D8h]

			mov rax, [rdx + 10h]
			mov rsp, [rdx + 8]
			mov rcx, [rdx]

			movss xmm0, dword ptr[rdx + 18h]
			movss xmm2, dword ptr[rdx + 28h]
			movss xmm1, dword ptr[rdx + 20h]
			movss xmm3, dword ptr[rdx + 30h]

			cmp qword ptr[rdx + 38h], 0
			jz Sw2UserMode
			mov r13, [rdx + 38h]

			Sw2UserMode:
		call _km_1
			_km_1 :
		add qword ptr[rsp], 7
			ret
			db 01h,0Fh,01h,0F8h
			sysretq
			pop rcx
			iret
			out dx, eax
__KiCallUserMode2 ENDP 

__KiCallUserMode2_1 PROC 
	;int 3
	mov rax,0ee4h
	xor rax,0FDCh
	sub rsp, rax
	add rsp,10h
	jz __KiCallUserMode2_stub1
	jnz __KiCallUserMode2_stub1
	nop
	nop
	nop
	nop
	__KiCallUserMode2_stub1:
	sub rsp,10h
	movaps xmmword ptr[rsp + 70h], xmm10
	movaps xmmword ptr[rsp + 40h], xmm7
	lea rax, [rsp + 100h]
	movaps xmmword ptr[rax - 80h], xmm11
	movaps xmmword ptr[rax - 50h], xmm14
	movaps xmmword ptr[rsp + 30h], xmm6
	movaps xmmword ptr[rax - 60h], xmm13
	movaps xmmword ptr[rsp + 50h], xmm8
	movaps xmmword ptr[rax - 40h], xmm15
	movaps xmmword ptr[rsp + 60h], xmm9
	movaps xmmword ptr[rax - 70h], xmm12

	mov[rax - 8], rbp
	mov rbp, rsp
	mov[rax], rbx
	mov[rax + 8], rdi
	mov[rax + 10h], rsi
	mov[rax + 20h], r13
	mov[rax + 30h], r15
	mov[rax + 18h], r12
	mov[rax + 28h], r14

	mov[rbp + 0D8h], rcx
	lea rax, [r8 - 30h]
	mov[rbp + 0E0h], rax
	push 901h
	xor qword ptr[rsp],889h
	pop rax
	mov rbx, gs:[rax]
	mov[r8 + 20h], rsp
	mov rsi, [rbx + 90h]
	mov[rbp + 0D0h], rsi

	cli
	mov[rbx + 28h], r8 
	lea r9, [r8 + 50h] 
	mov[rbx + 38h], r9 
	
	cmp g_kvashadow,0
	je _nokvashadow
	mov eax,dword ptr[g_offset_stack]
	mov gs:[eax],r8
	jmp _kvashadow_end
_nokvashadow:
	mov rdi, gs:[8] 
	mov[rdi + 4], r8 
_kvashadow_end:
	mov ecx, 6000h
	sub r9, rcx
	mov gs:[1A8h], r8 
	mov [rbx + 30h], r9
	lea rsp, [r8 - 190h]
	mov rdi, rsp
	mov ecx, 32h
	rep movsq

	lea rbp, [rsi - 110h]
	ldmxcsr dword ptr [rbp - 54h]

	mov r11, [rbp + 0F8h] 
	mov rbp, [rbp + 0D8h]

	mov rax, [rdx + 10h]
	mov rsp, [rdx + 8]
	mov rcx, [rdx]

	movss xmm0, dword ptr [rdx + 18h]
	movss xmm2, dword ptr [rdx + 28h]
	movss xmm1, dword ptr [rdx + 20h]
	movss xmm3, dword ptr [rdx + 30h]

	cmp qword ptr [rdx + 38h], 0
	jz Sw2UserMode
	mov r13, [rdx + 38h]

	Sw2UserMode:
	call _km_1
	_km_1:
	add qword ptr[rsp],7
	ret
	db 01h,0Fh,01h,0F8h
	sysretq
	pop rcx
	iret
	out dx, eax

__KiCallUserMode2_1 ENDP



_text ENDS

	END