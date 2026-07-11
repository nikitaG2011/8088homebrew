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
        int 0xAA
        mov al, 0xFF
        out RT_TXT, al



hang:
        jmp hang
        

    

;interrupt handler
INT_handler:
        push ax
        mov al, 0xAA
        out RT_TXT, al 
        pop ax
        iret



;include things here
%include "functions.asm"




    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

