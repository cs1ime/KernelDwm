PUBLIC HookCallBackFunction
PUBLIC HookCallBackFunction2
PUBLIC hook_origin_present

PUBLIC HookCallBackFunction_1
PUBLIC HookCallBackFunction2_1
PUBLIC hook_origin_present_1

.data
HookCallBackFunction dq 0
HookCallBackFunction2 dq 0
hook_origin_present dq 0
ret_rip dq 0

HookCallBackFunction_1 dq 0
HookCallBackFunction2_1 dq 0
hook_origin_present_1 dq 0
ret_rip_1 dq 0

.code

HookProc2 PROC
	push rax
	push rbx
	push rcx
	push rdx
	push rsi
	push rdi
	push rbp
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf

	call WinAPI_EnterStack
	call HookCallBackFunction2
	call WinAPI_ExitStack

	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rbp
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	pop rax

	jmp ret_rip

WinAPI_EnterStack:
	lea r11,[rsp+8]
	and rsp,0fffffffffffffff0h 
	push r11
	push r11
	sub rsp,30h
	jmp qword ptr[r11-8]
WinAPI_ExitStack:
	pop r11
	add rsp,38h
	pop rsp
	jmp r11
HookProc2 ENDP

HookProc PROC
	mov rax,rsp

	push rbx
	push rcx
	push rdx
	push rsi
	push rdi
	push rbp
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf
	;sub rsp,8

	mov rdx,rax
	call WinAPI_EnterStack
	call HookCallBackFunction
	call WinAPI_ExitStack

	;add rsp,8
	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rbp
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx

	mov rax,[rsp]
	mov ret_rip,rax
	lea rax,HookProc2
	mov [rsp],rax
	jmp hook_origin_present
	;ret

WinAPI_EnterStack:
	lea r11,[rsp+8]
	and rsp,0fffffffffffffff0h 
	push r11
	push r11
	sub rsp,30h
	jmp qword ptr[r11-8]
WinAPI_ExitStack:
	pop r11
	add rsp,38h
	pop rsp
	jmp r11


HookProc ENDP

HookProc2_1 PROC
	push rax
	push rbx
	push rcx
	push rdx
	push rsi
	push rdi
	push rbp
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf

	call WinAPI_EnterStack
	call HookCallBackFunction2_1
	call WinAPI_ExitStack

	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rbp
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	pop rax

	jmp ret_rip_1

WinAPI_EnterStack:
	lea r11,[rsp+8]
	and rsp,0fffffffffffffff0h 
	push r11
	push r11
	sub rsp,30h
	jmp qword ptr[r11-8]
WinAPI_ExitStack:
	pop r11
	add rsp,38h
	pop rsp
	jmp r11
HookProc2_1 ENDP

HookProc_1 PROC
	mov rax,rsp

	push rbx
	push rcx
	push rdx
	push rsi
	push rdi
	push rbp
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf
	;sub rsp,8

	mov rdx,rax
	call WinAPI_EnterStack
	call HookCallBackFunction_1
	call WinAPI_ExitStack

	;add rsp,8
	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rbp
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx

	mov rax,[rsp]
	mov ret_rip_1,rax
	lea rax,HookProc2_1
	mov [rsp],rax
	jmp hook_origin_present_1
	;ret

WinAPI_EnterStack:
	lea r11,[rsp+8]
	and rsp,0fffffffffffffff0h 
	push r11
	push r11
	sub rsp,30h
	jmp qword ptr[r11-8]
WinAPI_ExitStack:
	pop r11
	add rsp,38h
	pop rsp
	jmp r11


HookProc_1 ENDP

AsmInt3 PROC

int 3
ret

AsmInt3 ENDP

END
