; main.asm

BITS 16
ORG 0x8000



RT_TXT     EQU 0x00


init:
        mov ax, 0x7000
        mov ss, ax
        xor sp, sp

        xor ax, ax
        mov es, ax
        mov di, 0xAA * 4
        mov ax, INT_handler
        stosw
        mov ax, cs
        stosw
        sti
    
code:
; Example 8088 Assembly Initialization for 65C51 at I/O ports 300H-303H
MOV DX, 0x03       ; Point to Control Register
MOV AL, 0x1F        ; 19200 baud, 8 bits, 1 stop bit
OUT DX, AL          ; Send configuration

MOV DX, 0x02       ; Point to Command Register
MOV AL, 0x0B        ; Normal operation, no parity, no echo, no tx/rx int
OUT DX, AL
CheckTx:
  MOV DX, 0x01     ; Status register
  IN AL, DX
  TEST AL, 0x10      ; Test bit 4 (TDRE)
  JZ CheckTx        ; Loop until empty
  
  MOV DX, 0x00     ; Data register
  MOV AL, 'A'       ; Character to send
  OUT DX, AL



hang:
        jmp hang
        

    
subroutine:
        mov al, 0x55
        out RT_TXT, al 
        ret
;interrupt handler
INT_handler:
        push ax
        pop ax
        iret



;include things here
%include "functions.asm"




    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

