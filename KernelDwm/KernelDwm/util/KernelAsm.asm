
.code

_text SEGMENT

ReadSsQ PROC

db 36h,48h, 08bh, 01h
ret

ReadSsQ ENDP

AsmInt2F PROC

int 2Fh
ret

AsmInt2F ENDP

AsmIntE1 PROC

int 0E1h
ret

AsmIntE1 ENDP

AsmRdtsc PROC

rdtsc
and rax,0FFFFFFFFh
and rdx,0FFFFFFFFh
rol rdx,32
or rax,rdx
ret

AsmRdtsc ENDP

AsmReadRFlags PROC

pushfq
pop rax
ret

AsmReadRFlags ENDP

AsmReadRSP PROC

mov rax,rsp
add rax,8
ret

AsmReadRSP ENDP

AsmReadCr0 PROC
mov rax,cr0
ret
AsmReadCr0 ENDP

AsmReadCr2 PROC
mov rax,cr2
ret
AsmReadCr2 ENDP

AsmReadCr3 PROC
mov rax,cr3
ret
AsmReadCr3 ENDP

AsmReadCr4 PROC
mov rax,cr4
ret
AsmReadCr4 ENDP

AsmReadCr8 PROC
mov rax,cr8
ret
AsmReadCr8 ENDP

AsmReadMsr PROC

and rcx,0FFFFFFFFh
rdmsr
and rax,0FFFFFFFFh
and rdx,0FFFFFFFFh
rol rdx,32
or rax,rdx
ret

AsmReadMsr ENDP

AsmWriteMsr PROC

and rcx,0FFFFFFFFh
mov eax,edx
shr rdx,32
wrmsr
ret

AsmWriteMsr ENDP

AsmReadGs PROC

mov rax,gs:[rcx]
ret

AsmReadGs ENDP

AsmWriteCr4 PROC
mov cr4,rcx
ret
AsmWriteCr4 ENDP

AsmWriteCr3 PROC
mov cr3,rcx
ret
AsmWriteCr3 ENDP

AsmWriteCr0 PROC
mov cr0,rcx
ret
AsmWriteCr0 ENDP

AsmWriteCr8 PROC
mov cr8,rcx
ret
AsmWriteCr8 ENDP

AsmCpuid PROC
;rcx=eax rdx=ecx r8=pcpuidret

push rbx
push r11

mov r11,r8

mov eax,ecx
mov ecx,edx
cpuid
mov dword ptr[r11],eax
mov dword ptr[r11+4],ebx
mov dword ptr[r11+8],ecx
mov dword ptr[r11+12],edx

pop r11
pop rbx
ret

AsmCpuid ENDP

AsmGetLDTR PROC
    sldt ax
    ret
AsmGetLDTR ENDP

AsmGetEs PROC

xor rax,rax
mov ax,es
ret

AsmGetEs ENDP

AsmGetCs PROC

xor rax,rax
mov ax,cs
ret

AsmGetCs ENDP

AsmGetDs PROC

xor rax,rax
mov ax,ds
ret

AsmGetDs ENDP

AsmGetFs PROC

xor rax,rax
mov ax,fs
ret

AsmGetFs ENDP

AsmGetGs PROC

xor rax,rax
mov ax,gs
ret

AsmGetGs ENDP

AsmGetSs PROC

xor rax,rax
mov ax,ss
ret

AsmGetSs ENDP

AsmGetTr PROC
xor rax,rax
str	rax
ret
AsmGetTr ENDP

AsmGetIdtBase PROC
sub rsp,10h
sidt qword ptr[rsp]
mov rax,qword ptr[rsp+2]
add rsp,10h
ret
AsmGetIdtBase ENDP

AsmGetIdtLimit PROC
sub rsp,10h
sidt qword ptr[rsp]
xor rax,rax
mov ax,word ptr[rsp]
add rsp,10h
ret
AsmGetIdtLimit ENDP

AsmGetGdtBase PROC
sub rsp,10h
sgdt qword ptr[rsp]
mov rax,qword ptr[rsp+2]
add rsp,10h
ret
AsmGetGdtBase ENDP

AsmGetGdtLimit PROC
sub rsp,10h
sgdt qword ptr[rsp]
xor rax,rax
mov ax,word ptr[rsp]
add rsp,10h
ret
AsmGetGdtLimit ENDP

AsmGetDr7 PROC

xor rax,rax
mov rax,dr7
ret

AsmGetDr7 ENDP

AsmSti Proc
sti
ret
AsmSti Endp

AsmCli Proc
cli
ret
AsmCli Endp

AsmLoadAccessRightsByte PROC
lar rax, rcx
ret
AsmLoadAccessRightsByte ENDP

AsmInvpcid Proc
invpcid rcx,oword ptr[rdx]
ret
AsmInvpcid Endp

AsmInvlpg Proc

invlpg [rcx]
ret

AsmInvlpg Endp

_text ENDS

END
