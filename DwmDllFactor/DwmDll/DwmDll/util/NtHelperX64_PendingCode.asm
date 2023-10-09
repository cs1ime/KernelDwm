	.code
_text SEGMENT

myDebugPrint PROC

mov     r9d, r8d
mov     r8d, edx
mov     dx, [rcx]
mov     rcx, [rcx+8]
mov     eax, 1
int     2Dh
ret
ret

myDebugPrint ENDP

PendingCode PROC


    mov eax,00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,020h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,021h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,022h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,023h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,024h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,025h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,026h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,027h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,028h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,029h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,030h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,031h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,032h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,033h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,034h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,035h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,036h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,037h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,038h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,039h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,040h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,041h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,042h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,043h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,044h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,045h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,046h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,047h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,048h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,049h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,050h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,051h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,052h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,053h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,054h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,055h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,056h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,057h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,058h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,059h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,060h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,061h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,062h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,063h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,064h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,065h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,066h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,067h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,068h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,069h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,070h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,071h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,072h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,073h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,074h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,075h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,076h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,077h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,078h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,079h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,080h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,081h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,082h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,083h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,084h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,085h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,086h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,087h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,088h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,089h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,090h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,091h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,092h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,093h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,094h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,095h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,096h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,097h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,098h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,099h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0100h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0101h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0102h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0103h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0104h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0105h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0106h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0107h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0108h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0109h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0110h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0111h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0112h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0113h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0114h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0115h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0116h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0117h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0118h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0119h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0120h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0121h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0122h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0123h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0124h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0125h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0126h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0127h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0128h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0129h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0130h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0131h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0132h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0133h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0134h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0135h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0136h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0137h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0138h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0139h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0140h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0141h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0142h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0143h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0144h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0145h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0146h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0147h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0148h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0149h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0150h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0151h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0152h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0153h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0154h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0155h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0156h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0157h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0158h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0159h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0160h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0161h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0162h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0163h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0164h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0165h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0166h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0167h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0168h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0169h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0170h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0171h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0172h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0173h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0174h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0175h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0176h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0177h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0178h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0179h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0180h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0181h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0182h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0183h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0184h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0185h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0186h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0187h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0188h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0189h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0190h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0191h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0192h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0193h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0194h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0195h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0196h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0197h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0198h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0199h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0200h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0201h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0202h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0203h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0204h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0205h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0206h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0207h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0208h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0209h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,020ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,020bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,020ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,020dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,020eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,020fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0210h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0211h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0212h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0213h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0214h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0215h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0216h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0217h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0218h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0219h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,021ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,021bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,021ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,021dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,021eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,021fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0220h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0221h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0222h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0223h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0224h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0225h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0226h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0227h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0228h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0229h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,022ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,022bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,022ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,022dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,022eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,022fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0230h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0231h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0232h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0233h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0234h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0235h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0236h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0237h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0238h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0239h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,023ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,023bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,023ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,023dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,023eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,023fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0240h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0241h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0242h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0243h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0244h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0245h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0246h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0247h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0248h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0249h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,024ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,024bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,024ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,024dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,024eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,024fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0250h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0251h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0252h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0253h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0254h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0255h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0256h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0257h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0258h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0259h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,025ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,025bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,025ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,025dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,025eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,025fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0260h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0261h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0262h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0263h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0264h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0265h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0266h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0267h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0268h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0269h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,026ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,026bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,026ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,026dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,026eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,026fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0270h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0271h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0272h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0273h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0274h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0275h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0276h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0277h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0278h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0279h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,027ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,027bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,027ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,027dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,027eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,027fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0280h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0281h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0282h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0283h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0284h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0285h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0286h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0287h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0288h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0289h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,028ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,028bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,028ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,028dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,028eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,028fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0290h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0291h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0292h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0293h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0294h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0295h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0296h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0297h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0298h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0299h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,029ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,029bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,029ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,029dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,029eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,029fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,02ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0300h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0301h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0302h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0303h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0304h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0305h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0306h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0307h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0308h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0309h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,030ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,030bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,030ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,030dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,030eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,030fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0310h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0311h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0312h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0313h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0314h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0315h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0316h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0317h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0318h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0319h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,031ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,031bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,031ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,031dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,031eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,031fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0320h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0321h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0322h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0323h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0324h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0325h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0326h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0327h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0328h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0329h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,032ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,032bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,032ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,032dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,032eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,032fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0330h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0331h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0332h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0333h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0334h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0335h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0336h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0337h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0338h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0339h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,033ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,033bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,033ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,033dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,033eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,033fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0340h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0341h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0342h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0343h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0344h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0345h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0346h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0347h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0348h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0349h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,034ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,034bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,034ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,034dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,034eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,034fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0350h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0351h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0352h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0353h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0354h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0355h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0356h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0357h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0358h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0359h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,035ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,035bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,035ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,035dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,035eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,035fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0360h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0361h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0362h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0363h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0364h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0365h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0366h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0367h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0368h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0369h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,036ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,036bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,036ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,036dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,036eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,036fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0370h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0371h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0372h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0373h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0374h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0375h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0376h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0377h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0378h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0379h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,037ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,037bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,037ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,037dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,037eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,037fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0380h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0381h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0382h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0383h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0384h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0385h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0386h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0387h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0388h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0389h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,038ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,038bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,038ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,038dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,038eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,038fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0390h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0391h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0392h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0393h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0394h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0395h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0396h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0397h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0398h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0399h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,039ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,039bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,039ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,039dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,039eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,039fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,03ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0400h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0401h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0402h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0403h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0404h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0405h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0406h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0407h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0408h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0409h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,040ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,040bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,040ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,040dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,040eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,040fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0410h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0411h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0412h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0413h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0414h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0415h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0416h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0417h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0418h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0419h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,041ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,041bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,041ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,041dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,041eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,041fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0420h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0421h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0422h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0423h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0424h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0425h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0426h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0427h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0428h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0429h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,042ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,042bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,042ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,042dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,042eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,042fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0430h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0431h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0432h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0433h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0434h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0435h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0436h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0437h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0438h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0439h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,043ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,043bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,043ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,043dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,043eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,043fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0440h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0441h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0442h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0443h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0444h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0445h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0446h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0447h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0448h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0449h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,044ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,044bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,044ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,044dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,044eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,044fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0450h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0451h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0452h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0453h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0454h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0455h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0456h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0457h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0458h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0459h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,045ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,045bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,045ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,045dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,045eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,045fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0460h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0461h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0462h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0463h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0464h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0465h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0466h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0467h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0468h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0469h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,046ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,046bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,046ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,046dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,046eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,046fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0470h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0471h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0472h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0473h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0474h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0475h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0476h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0477h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0478h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0479h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,047ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,047bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,047ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,047dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,047eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,047fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0480h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0481h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0482h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0483h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0484h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0485h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0486h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0487h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0488h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0489h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,048ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,048bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,048ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,048dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,048eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,048fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0490h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0491h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0492h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0493h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0494h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0495h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0496h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0497h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0498h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0499h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,049ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,049bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,049ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,049dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,049eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,049fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,04ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0500h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0501h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0502h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0503h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0504h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0505h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0506h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0507h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0508h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0509h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,050ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,050bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,050ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,050dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,050eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,050fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0510h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0511h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0512h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0513h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0514h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0515h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0516h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0517h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0518h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0519h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,051ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,051bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,051ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,051dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,051eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,051fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0520h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0521h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0522h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0523h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0524h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0525h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0526h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0527h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0528h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0529h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,052ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,052bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,052ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,052dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,052eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,052fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0530h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0531h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0532h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0533h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0534h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0535h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0536h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0537h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0538h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0539h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,053ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,053bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,053ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,053dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,053eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,053fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0540h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0541h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0542h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0543h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0544h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0545h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0546h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0547h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0548h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0549h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,054ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,054bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,054ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,054dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,054eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,054fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0550h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0551h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0552h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0553h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0554h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0555h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0556h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0557h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0558h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0559h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,055ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,055bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,055ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,055dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,055eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,055fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0560h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0561h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0562h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0563h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0564h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0565h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0566h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0567h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0568h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0569h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,056ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,056bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,056ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,056dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,056eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,056fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0570h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0571h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0572h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0573h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0574h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0575h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0576h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0577h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0578h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0579h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,057ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,057bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,057ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,057dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,057eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,057fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0580h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0581h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0582h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0583h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0584h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0585h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0586h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0587h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0588h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0589h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,058ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,058bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,058ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,058dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,058eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,058fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0590h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0591h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0592h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0593h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0594h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0595h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0596h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0597h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0598h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0599h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,059ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,059bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,059ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,059dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,059eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,059fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,05ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0600h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0601h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0602h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0603h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0604h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0605h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0606h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0607h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0608h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0609h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,060ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,060bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,060ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,060dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,060eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,060fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0610h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0611h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0612h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0613h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0614h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0615h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0616h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0617h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0618h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0619h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,061ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,061bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,061ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,061dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,061eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,061fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0620h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0621h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0622h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0623h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0624h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0625h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0626h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0627h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0628h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0629h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,062ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,062bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,062ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,062dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,062eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,062fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0630h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0631h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0632h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0633h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0634h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0635h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0636h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0637h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0638h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0639h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,063ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,063bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,063ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,063dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,063eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,063fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0640h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0641h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0642h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0643h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0644h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0645h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0646h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0647h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0648h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0649h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,064ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,064bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,064ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,064dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,064eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,064fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0650h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0651h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0652h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0653h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0654h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0655h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0656h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0657h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0658h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0659h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,065ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,065bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,065ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,065dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,065eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,065fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0660h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0661h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0662h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0663h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0664h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0665h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0666h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0667h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0668h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0669h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,066ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,066bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,066ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,066dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,066eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,066fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0670h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0671h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0672h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0673h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0674h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0675h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0676h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0677h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0678h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0679h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,067ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,067bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,067ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,067dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,067eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,067fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0680h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0681h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0682h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0683h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0684h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0685h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0686h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0687h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0688h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0689h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,068ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,068bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,068ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,068dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,068eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,068fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0690h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0691h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0692h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0693h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0694h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0695h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0696h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0697h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0698h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0699h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,069ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,069bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,069ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,069dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,069eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,069fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,06ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0700h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0701h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0702h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0703h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0704h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0705h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0706h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0707h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0708h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0709h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,070ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,070bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,070ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,070dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,070eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,070fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0710h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0711h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0712h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0713h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0714h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0715h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0716h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0717h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0718h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0719h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,071ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,071bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,071ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,071dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,071eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,071fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0720h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0721h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0722h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0723h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0724h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0725h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0726h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0727h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0728h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0729h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,072ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,072bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,072ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,072dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,072eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,072fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0730h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0731h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0732h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0733h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0734h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0735h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0736h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0737h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0738h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0739h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,073ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,073bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,073ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,073dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,073eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,073fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0740h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0741h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0742h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0743h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0744h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0745h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0746h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0747h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0748h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0749h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,074ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,074bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,074ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,074dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,074eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,074fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0750h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0751h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0752h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0753h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0754h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0755h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0756h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0757h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0758h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0759h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,075ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,075bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,075ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,075dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,075eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,075fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0760h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0761h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0762h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0763h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0764h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0765h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0766h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0767h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0768h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0769h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,076ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,076bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,076ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,076dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,076eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,076fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0770h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0771h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0772h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0773h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0774h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0775h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0776h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0777h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0778h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0779h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,077ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,077bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,077ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,077dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,077eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,077fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0780h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0781h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0782h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0783h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0784h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0785h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0786h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0787h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0788h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0789h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,078ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,078bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,078ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,078dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,078eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,078fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0790h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0791h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0792h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0793h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0794h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0795h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0796h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0797h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0798h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0799h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,079ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,079bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,079ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,079dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,079eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,079fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,07ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0800h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0801h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0802h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0803h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0804h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0805h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0806h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0807h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0808h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0809h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,080ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,080bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,080ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,080dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,080eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,080fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0810h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0811h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0812h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0813h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0814h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0815h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0816h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0817h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0818h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0819h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,081ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,081bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,081ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,081dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,081eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,081fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0820h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0821h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0822h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0823h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0824h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0825h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0826h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0827h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0828h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0829h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,082ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,082bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,082ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,082dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,082eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,082fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0830h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0831h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0832h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0833h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0834h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0835h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0836h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0837h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0838h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0839h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,083ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,083bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,083ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,083dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,083eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,083fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0840h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0841h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0842h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0843h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0844h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0845h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0846h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0847h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0848h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0849h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,084ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,084bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,084ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,084dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,084eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,084fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0850h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0851h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0852h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0853h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0854h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0855h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0856h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0857h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0858h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0859h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,085ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,085bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,085ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,085dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,085eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,085fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0860h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0861h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0862h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0863h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0864h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0865h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0866h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0867h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0868h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0869h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,086ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,086bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,086ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,086dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,086eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,086fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0870h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0871h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0872h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0873h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0874h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0875h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0876h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0877h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0878h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0879h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,087ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,087bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,087ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,087dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,087eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,087fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0880h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0881h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0882h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0883h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0884h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0885h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0886h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0887h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0888h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0889h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,088ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,088bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,088ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,088dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,088eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,088fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0890h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0891h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0892h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0893h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0894h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0895h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0896h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0897h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0898h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0899h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,089ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,089bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,089ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,089dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,089eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,089fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,08ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0900h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0901h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0902h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0903h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0904h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0905h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0906h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0907h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0908h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0909h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,090ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,090bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,090ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,090dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,090eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,090fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0910h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0911h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0912h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0913h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0914h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0915h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0916h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0917h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0918h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0919h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,091ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,091bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,091ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,091dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,091eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,091fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0920h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0921h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0922h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0923h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0924h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0925h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0926h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0927h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0928h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0929h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,092ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,092bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,092ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,092dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,092eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,092fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0930h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0931h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0932h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0933h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0934h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0935h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0936h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0937h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0938h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0939h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,093ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,093bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,093ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,093dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,093eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,093fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0940h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0941h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0942h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0943h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0944h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0945h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0946h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0947h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0948h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0949h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,094ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,094bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,094ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,094dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,094eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,094fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0950h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0951h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0952h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0953h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0954h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0955h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0956h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0957h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0958h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0959h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,095ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,095bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,095ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,095dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,095eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,095fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0960h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0961h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0962h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0963h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0964h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0965h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0966h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0967h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0968h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0969h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,096ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,096bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,096ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,096dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,096eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,096fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0970h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0971h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0972h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0973h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0974h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0975h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0976h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0977h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0978h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0979h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,097ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,097bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,097ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,097dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,097eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,097fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0980h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0981h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0982h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0983h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0984h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0985h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0986h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0987h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0988h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0989h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,098ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,098bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,098ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,098dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,098eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,098fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0990h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0991h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0992h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0993h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0994h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0995h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0996h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0997h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0998h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0999h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,099ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,099bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,099ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,099dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,099eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,099fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,09ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0a9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aa9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aaah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aaeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ab9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0abah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0abbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0abch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0abdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0abeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0abfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ac9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0acah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0acbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0acch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0acdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0acfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ad9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0adah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0adbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0adch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0addh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0adeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0adfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ae9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aeah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aeeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0aefh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0af9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0afah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0afbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0afch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0afdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0afeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0affh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0b9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ba9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0baah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0babh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0badh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0baeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bb9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bbah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bbbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bbch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bbdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bbeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bbfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bc9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bcah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bcbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bcch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bcdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bcfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bd9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bdah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bdbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bdch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bdeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bdfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0be9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0beah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0beeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0befh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bf9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bfah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bfbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bfch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bfdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bfeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0bffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0c9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ca9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0caah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0caeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cb9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cbah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cbbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cbch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cbdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cbeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cbfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cc9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ccah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ccbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ccch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ccdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ccfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cd9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cdah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cdbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cdch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cdeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cdfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ce9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ceah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ceeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cefh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cf9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cfah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cfbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cfch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cfdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cfeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0cffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0d9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0da9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0daah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0daeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0db9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dbah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dbbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dbch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dbdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dbeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dbfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dc9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dcah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dcbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dcch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dcdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dcfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dd9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ddah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ddbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ddch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ddeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ddfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0de9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0deah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0debh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0deeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0defh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0df9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dfah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dfbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dfch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dfdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dfeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0dffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0e9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ea9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eaah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0each
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eaeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eb9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ebah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ebbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ebch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ebdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ebeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ebfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ec9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ecah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ecbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ecch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ecdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ecfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ed9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0edah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0edbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0edch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0edeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0edfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ee9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eeah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eeeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0eefh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ef9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0efah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0efbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0efch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0efdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0efeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0effh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0f9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fa9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0faah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0faeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fb9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fbah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fbbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fbch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fbdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fbeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fbfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fc9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fcah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fcbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fcch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fcdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fcfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fd9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fdah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fdbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fdch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fdeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fdfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fe9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0feah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0febh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0feeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fefh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ff9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ffah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ffbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ffch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ffdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0ffeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0fffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01000h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01001h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01002h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01003h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01004h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01005h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01006h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01007h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01008h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01009h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0100ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0100bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0100ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0100dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0100eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0100fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01010h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01011h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01012h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01013h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01014h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01015h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01016h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01017h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01018h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01019h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0101ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0101bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0101ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0101dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0101eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0101fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01020h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01021h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01022h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01023h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01024h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01025h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01026h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01027h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01028h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01029h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0102ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0102bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0102ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0102dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0102eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0102fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01030h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01031h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01032h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01033h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01034h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01035h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01036h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01037h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01038h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01039h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0103ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0103bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0103ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0103dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0103eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0103fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01040h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01041h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01042h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01043h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01044h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01045h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01046h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01047h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01048h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01049h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0104ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0104bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0104ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0104dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0104eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0104fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01050h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01051h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01052h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01053h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01054h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01055h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01056h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01057h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01058h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01059h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0105ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0105bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0105ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0105dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0105eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0105fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01060h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01061h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01062h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01063h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01064h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01065h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01066h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01067h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01068h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01069h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0106ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0106bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0106ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0106dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0106eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0106fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01070h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01071h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01072h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01073h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01074h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01075h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01076h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01077h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01078h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01079h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0107ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0107bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0107ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0107dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0107eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0107fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01080h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01081h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01082h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01083h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01084h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01085h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01086h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01087h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01088h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01089h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0108ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0108bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0108ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0108dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0108eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0108fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01090h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01091h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01092h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01093h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01094h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01095h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01096h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01097h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01098h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01099h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0109ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0109bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0109ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0109dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0109eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0109fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,010ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01100h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01101h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01102h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01103h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01104h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01105h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01106h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01107h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01108h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01109h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0110ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0110bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0110ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0110dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0110eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0110fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01110h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01111h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01112h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01113h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01114h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01115h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01116h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01117h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01118h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01119h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0111ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0111bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0111ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0111dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0111eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0111fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01120h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01121h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01122h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01123h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01124h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01125h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01126h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01127h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01128h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01129h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0112ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0112bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0112ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0112dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0112eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0112fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01130h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01131h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01132h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01133h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01134h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01135h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01136h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01137h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01138h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01139h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0113ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0113bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0113ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0113dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0113eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0113fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01140h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01141h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01142h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01143h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01144h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01145h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01146h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01147h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01148h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01149h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0114ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0114bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0114ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0114dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0114eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0114fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01150h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01151h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01152h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01153h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01154h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01155h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01156h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01157h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01158h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01159h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0115ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0115bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0115ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0115dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0115eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0115fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01160h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01161h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01162h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01163h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01164h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01165h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01166h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01167h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01168h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01169h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0116ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0116bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0116ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0116dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0116eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0116fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01170h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01171h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01172h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01173h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01174h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01175h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01176h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01177h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01178h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01179h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0117ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0117bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0117ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0117dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0117eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0117fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01180h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01181h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01182h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01183h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01184h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01185h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01186h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01187h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01188h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01189h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0118ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0118bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0118ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0118dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0118eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0118fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01190h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01191h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01192h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01193h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01194h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01195h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01196h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01197h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01198h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01199h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0119ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0119bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0119ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0119dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0119eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0119fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,011ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01200h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01201h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01202h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01203h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01204h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01205h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01206h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01207h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01208h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01209h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0120ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0120bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0120ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0120dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0120eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0120fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01210h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01211h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01212h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01213h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01214h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01215h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01216h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01217h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01218h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01219h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0121ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0121bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0121ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0121dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0121eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0121fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01220h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01221h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01222h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01223h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01224h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01225h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01226h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01227h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01228h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01229h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0122ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0122bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0122ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0122dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0122eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0122fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01230h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01231h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01232h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01233h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01234h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01235h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01236h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01237h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01238h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01239h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0123ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0123bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0123ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0123dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0123eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0123fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01240h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01241h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01242h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01243h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01244h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01245h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01246h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01247h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01248h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01249h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0124ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0124bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0124ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0124dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0124eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0124fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01250h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01251h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01252h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01253h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01254h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01255h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01256h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01257h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01258h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01259h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0125ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0125bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0125ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0125dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0125eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0125fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01260h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01261h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01262h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01263h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01264h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01265h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01266h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01267h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01268h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01269h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0126ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0126bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0126ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0126dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0126eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0126fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01270h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01271h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01272h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01273h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01274h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01275h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01276h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01277h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01278h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01279h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0127ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0127bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0127ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0127dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0127eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0127fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01280h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01281h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01282h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01283h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01284h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01285h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01286h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01287h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01288h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01289h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0128ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0128bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0128ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0128dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0128eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0128fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01290h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01291h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01292h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01293h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01294h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01295h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01296h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01297h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01298h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01299h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0129ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0129bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0129ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0129dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0129eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0129fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,012ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01300h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01301h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01302h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01303h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01304h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01305h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01306h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01307h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01308h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01309h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0130ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0130bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0130ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0130dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0130eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0130fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01310h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01311h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01312h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01313h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01314h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01315h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01316h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01317h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01318h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01319h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0131ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0131bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0131ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0131dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0131eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0131fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01320h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01321h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01322h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01323h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01324h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01325h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01326h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01327h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01328h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01329h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0132ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0132bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0132ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0132dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0132eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0132fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01330h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01331h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01332h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01333h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01334h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01335h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01336h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01337h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01338h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01339h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0133ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0133bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0133ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0133dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0133eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0133fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01340h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01341h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01342h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01343h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01344h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01345h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01346h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01347h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01348h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01349h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0134ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0134bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0134ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0134dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0134eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0134fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01350h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01351h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01352h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01353h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01354h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01355h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01356h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01357h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01358h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01359h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0135ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0135bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0135ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0135dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0135eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0135fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01360h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01361h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01362h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01363h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01364h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01365h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01366h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01367h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01368h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01369h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0136ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0136bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0136ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0136dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0136eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0136fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01370h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01371h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01372h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01373h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01374h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01375h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01376h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01377h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01378h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01379h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0137ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0137bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0137ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0137dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0137eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0137fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01380h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01381h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01382h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01383h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01384h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01385h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01386h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01387h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01388h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01389h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0138ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0138bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0138ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0138dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0138eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0138fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01390h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01391h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01392h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01393h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01394h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01395h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01396h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01397h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01398h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01399h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0139ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0139bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0139ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0139dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0139eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0139fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,013ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01400h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01401h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01402h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01403h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01404h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01405h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01406h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01407h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01408h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01409h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0140ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0140bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0140ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0140dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0140eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0140fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01410h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01411h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01412h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01413h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01414h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01415h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01416h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01417h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01418h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01419h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0141ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0141bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0141ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0141dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0141eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0141fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01420h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01421h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01422h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01423h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01424h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01425h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01426h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01427h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01428h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01429h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0142ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0142bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0142ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0142dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0142eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0142fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01430h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01431h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01432h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01433h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01434h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01435h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01436h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01437h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01438h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01439h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0143ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0143bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0143ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0143dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0143eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0143fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01440h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01441h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01442h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01443h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01444h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01445h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01446h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01447h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01448h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01449h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0144ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0144bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0144ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0144dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0144eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0144fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01450h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01451h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01452h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01453h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01454h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01455h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01456h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01457h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01458h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01459h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0145ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0145bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0145ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0145dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0145eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0145fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01460h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01461h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01462h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01463h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01464h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01465h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01466h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01467h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01468h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01469h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0146ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0146bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0146ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0146dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0146eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0146fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01470h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01471h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01472h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01473h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01474h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01475h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01476h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01477h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01478h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01479h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0147ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0147bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0147ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0147dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0147eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0147fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01480h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01481h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01482h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01483h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01484h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01485h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01486h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01487h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01488h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01489h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0148ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0148bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0148ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0148dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0148eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0148fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01490h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01491h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01492h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01493h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01494h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01495h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01496h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01497h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01498h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01499h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0149ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0149bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0149ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0149dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0149eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0149fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,014ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01500h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01501h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01502h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01503h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01504h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01505h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01506h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01507h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01508h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01509h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0150ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0150bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0150ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0150dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0150eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0150fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01510h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01511h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01512h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01513h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01514h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01515h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01516h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01517h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01518h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01519h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0151ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0151bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0151ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0151dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0151eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0151fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01520h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01521h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01522h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01523h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01524h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01525h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01526h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01527h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01528h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01529h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0152ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0152bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0152ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0152dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0152eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0152fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01530h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01531h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01532h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01533h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01534h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01535h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01536h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01537h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01538h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01539h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0153ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0153bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0153ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0153dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0153eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0153fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01540h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01541h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01542h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01543h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01544h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01545h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01546h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01547h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01548h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01549h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0154ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0154bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0154ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0154dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0154eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0154fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01550h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01551h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01552h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01553h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01554h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01555h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01556h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01557h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01558h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01559h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0155ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0155bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0155ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0155dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0155eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0155fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01560h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01561h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01562h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01563h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01564h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01565h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01566h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01567h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01568h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01569h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0156ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0156bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0156ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0156dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0156eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0156fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01570h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01571h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01572h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01573h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01574h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01575h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01576h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01577h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01578h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01579h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0157ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0157bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0157ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0157dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0157eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0157fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01580h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01581h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01582h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01583h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01584h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01585h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01586h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01587h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01588h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01589h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0158ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0158bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0158ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0158dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0158eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0158fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01590h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01591h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01592h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01593h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01594h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01595h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01596h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01597h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01598h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01599h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0159ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0159bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0159ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0159dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0159eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0159fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,015ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01600h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01601h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01602h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01603h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01604h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01605h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01606h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01607h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01608h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01609h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0160ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0160bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0160ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0160dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0160eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0160fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01610h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01611h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01612h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01613h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01614h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01615h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01616h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01617h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01618h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01619h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0161ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0161bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0161ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0161dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0161eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0161fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01620h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01621h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01622h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01623h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01624h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01625h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01626h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01627h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01628h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01629h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0162ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0162bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0162ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0162dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0162eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0162fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01630h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01631h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01632h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01633h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01634h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01635h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01636h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01637h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01638h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01639h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0163ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0163bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0163ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0163dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0163eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0163fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01640h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01641h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01642h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01643h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01644h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01645h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01646h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01647h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01648h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01649h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0164ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0164bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0164ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0164dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0164eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0164fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01650h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01651h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01652h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01653h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01654h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01655h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01656h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01657h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01658h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01659h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0165ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0165bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0165ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0165dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0165eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0165fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01660h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01661h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01662h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01663h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01664h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01665h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01666h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01667h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01668h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01669h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0166ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0166bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0166ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0166dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0166eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0166fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01670h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01671h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01672h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01673h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01674h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01675h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01676h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01677h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01678h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01679h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0167ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0167bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0167ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0167dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0167eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0167fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01680h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01681h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01682h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01683h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01684h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01685h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01686h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01687h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01688h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01689h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0168ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0168bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0168ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0168dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0168eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0168fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01690h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01691h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01692h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01693h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01694h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01695h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01696h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01697h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01698h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01699h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0169ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0169bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0169ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0169dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0169eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0169fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,016ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01700h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01701h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01702h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01703h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01704h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01705h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01706h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01707h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01708h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01709h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0170ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0170bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0170ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0170dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0170eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0170fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01710h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01711h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01712h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01713h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01714h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01715h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01716h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01717h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01718h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01719h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0171ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0171bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0171ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0171dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0171eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0171fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01720h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01721h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01722h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01723h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01724h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01725h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01726h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01727h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01728h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01729h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0172ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0172bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0172ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0172dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0172eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0172fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01730h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01731h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01732h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01733h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01734h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01735h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01736h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01737h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01738h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01739h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0173ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0173bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0173ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0173dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0173eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0173fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01740h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01741h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01742h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01743h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01744h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01745h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01746h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01747h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01748h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01749h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0174ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0174bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0174ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0174dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0174eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0174fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01750h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01751h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01752h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01753h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01754h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01755h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01756h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01757h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01758h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01759h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0175ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0175bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0175ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0175dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0175eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0175fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01760h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01761h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01762h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01763h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01764h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01765h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01766h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01767h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01768h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01769h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0176ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0176bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0176ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0176dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0176eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0176fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01770h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01771h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01772h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01773h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01774h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01775h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01776h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01777h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01778h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01779h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0177ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0177bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0177ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0177dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0177eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0177fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01780h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01781h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01782h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01783h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01784h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01785h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01786h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01787h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01788h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01789h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0178ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0178bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0178ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0178dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0178eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0178fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01790h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01791h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01792h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01793h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01794h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01795h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01796h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01797h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01798h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01799h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0179ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0179bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0179ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0179dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0179eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0179fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,017ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01800h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01801h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01802h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01803h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01804h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01805h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01806h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01807h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01808h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01809h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0180ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0180bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0180ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0180dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0180eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0180fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01810h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01811h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01812h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01813h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01814h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01815h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01816h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01817h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01818h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01819h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0181ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0181bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0181ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0181dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0181eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0181fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01820h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01821h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01822h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01823h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01824h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01825h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01826h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01827h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01828h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01829h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0182ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0182bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0182ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0182dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0182eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0182fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01830h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01831h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01832h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01833h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01834h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01835h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01836h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01837h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01838h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01839h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0183ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0183bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0183ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0183dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0183eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0183fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01840h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01841h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01842h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01843h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01844h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01845h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01846h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01847h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01848h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01849h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0184ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0184bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0184ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0184dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0184eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0184fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01850h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01851h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01852h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01853h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01854h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01855h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01856h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01857h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01858h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01859h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0185ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0185bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0185ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0185dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0185eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0185fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01860h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01861h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01862h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01863h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01864h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01865h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01866h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01867h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01868h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01869h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0186ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0186bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0186ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0186dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0186eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0186fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01870h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01871h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01872h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01873h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01874h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01875h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01876h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01877h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01878h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01879h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0187ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0187bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0187ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0187dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0187eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0187fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01880h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01881h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01882h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01883h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01884h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01885h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01886h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01887h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01888h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01889h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0188ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0188bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0188ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0188dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0188eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0188fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01890h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01891h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01892h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01893h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01894h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01895h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01896h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01897h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01898h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01899h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0189ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0189bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0189ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0189dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0189eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0189fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,018ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01900h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01901h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01902h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01903h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01904h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01905h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01906h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01907h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01908h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01909h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0190ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0190bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0190ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0190dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0190eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0190fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01910h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01911h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01912h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01913h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01914h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01915h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01916h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01917h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01918h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01919h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0191ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0191bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0191ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0191dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0191eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0191fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01920h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01921h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01922h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01923h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01924h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01925h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01926h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01927h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01928h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01929h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0192ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0192bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0192ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0192dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0192eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0192fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01930h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01931h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01932h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01933h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01934h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01935h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01936h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01937h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01938h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01939h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0193ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0193bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0193ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0193dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0193eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0193fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01940h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01941h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01942h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01943h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01944h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01945h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01946h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01947h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01948h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01949h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0194ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0194bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0194ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0194dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0194eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0194fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01950h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01951h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01952h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01953h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01954h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01955h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01956h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01957h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01958h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01959h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0195ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0195bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0195ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0195dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0195eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0195fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01960h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01961h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01962h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01963h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01964h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01965h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01966h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01967h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01968h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01969h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0196ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0196bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0196ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0196dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0196eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0196fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01970h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01971h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01972h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01973h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01974h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01975h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01976h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01977h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01978h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01979h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0197ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0197bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0197ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0197dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0197eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0197fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01980h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01981h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01982h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01983h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01984h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01985h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01986h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01987h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01988h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01989h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0198ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0198bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0198ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0198dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0198eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0198fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01990h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01991h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01992h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01993h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01994h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01995h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01996h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01997h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01998h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01999h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0199ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0199bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0199ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0199dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0199eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,0199fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019a9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019aah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019abh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019ach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019adh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019aeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019afh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019b9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019bah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019bbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019bch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019bdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019beh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019bfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019c9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019cah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019cbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019cch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019cdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019ceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019cfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019d9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019dah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019dbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019dch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019ddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019deh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019dfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019e9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019eah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019ebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019ech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019edh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019eeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019efh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019f9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019fah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019fbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019fch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019fdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019feh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,019ffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01a9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aa9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aaah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aaeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ab9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01abah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01abbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01abch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01abdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01abeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01abfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ac9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01acah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01acbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01acch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01acdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01acfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ad9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01adah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01adbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01adch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01addh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01adeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01adfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ae9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aeah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aeeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01aefh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01af9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01afah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01afbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01afch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01afdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01afeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01affh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01b9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ba9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01baah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01babh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01badh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01baeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bb9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bbah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bbbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bbch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bbdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bbeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bbfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bc9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bcah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bcbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bcch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bcdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bcfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bd9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bdah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bdbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bdch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bdeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bdfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01be9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01beah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01beeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01befh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bf9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bfah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bfbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bfch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bfdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bfeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01bffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01c9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ca9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01caah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01caeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cb9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cbah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cbbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cbch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cbdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cbeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cbfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cc9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ccah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ccbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ccch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ccdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ccfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cd9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cdah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cdbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cdch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cdeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cdfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ce9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ceah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ceeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cefh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cf9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cfah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cfbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cfch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cfdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cfeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01cffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01d9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01da9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01daah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01daeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01db9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dbah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dbbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dbch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dbdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dbeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dbfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dc9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dcah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dcbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dcch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dcdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dcfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dd9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ddah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ddbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ddch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ddeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ddfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01de9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01deah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01debh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01deeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01defh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01df9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dfah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dfbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dfch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dfdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dfeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01dffh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01e9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ea9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eaah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01each
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eaeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eb9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ebah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ebbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ebch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ebdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ebeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ebfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ec9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ecah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ecbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ecch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ecdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ecfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ed9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01edah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01edbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01edch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01edeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01edfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ee9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eeah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eebh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eeeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01eefh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ef9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01efah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01efbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01efch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01efdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01efeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01effh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f00h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f01h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f02h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f03h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f04h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f05h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f06h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f07h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f08h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f09h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f0ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f0bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f0ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f0dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f0eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f0fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f10h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f11h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f12h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f13h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f14h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f15h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f16h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f17h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f18h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f19h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f1ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f1bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f1ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f1dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f1eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f1fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f20h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f21h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f22h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f23h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f24h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f25h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f26h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f27h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f28h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f29h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f2ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f2bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f2ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f2dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f2eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f2fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f30h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f31h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f32h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f33h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f34h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f35h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f36h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f37h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f38h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f39h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f3ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f3bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f3ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f3dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f3eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f3fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f40h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f41h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f42h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f43h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f44h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f45h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f46h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f47h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f48h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f49h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f4ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f4bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f4ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f4dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f4eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f4fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f50h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f51h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f52h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f53h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f54h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f55h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f56h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f57h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f58h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f59h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f5ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f5bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f5ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f5dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f5eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f5fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f60h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f61h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f62h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f63h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f64h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f65h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f66h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f67h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f68h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f69h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f6ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f6bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f6ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f6dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f6eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f6fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f70h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f71h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f72h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f73h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f74h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f75h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f76h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f77h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f78h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f79h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f7ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f7bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f7ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f7dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f7eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f7fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f80h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f81h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f82h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f83h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f84h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f85h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f86h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f87h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f88h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f89h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f8ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f8bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f8ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f8dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f8eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f8fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f90h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f91h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f92h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f93h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f94h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f95h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f96h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f97h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f98h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f99h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f9ah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f9bh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f9ch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f9dh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f9eh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01f9fh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fa9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01faah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fabh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fach
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fadh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01faeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fafh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fb9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fbah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fbbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fbch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fbdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fbeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fbfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fc9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fcah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fcbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fcch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fcdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fceh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fcfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fd9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fdah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fdbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fdch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fddh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fdeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fdfh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fe9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01feah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01febh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fech
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fedh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01feeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fefh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff0h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff1h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff2h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff3h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff4h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff5h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff6h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff7h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff8h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ff9h
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ffah
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ffbh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ffch
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ffdh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01ffeh
    mov r10,rcx
    nop
    syscall
    ret
    
    mov eax,01fffh
    mov r10,rcx
    nop
    syscall
    ret
    



PendingCode ENDP

_text ENDS

	END