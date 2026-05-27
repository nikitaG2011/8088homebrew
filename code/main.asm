; main.asm

BITS 16
ORG 0x8000



TV_TXT     EQU 0x00


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

        mov al, 'p'
        out TV_TXT, al
        mov al, 'e'
        out TV_TXT, al
        mov al, 'e'
        out TV_TXT, al
        int 0xAA



hang:
        jmp hang
        

    

;interrupt handler
INT_handler:
        push ax


        mov al, 'i'
        out TV_TXT, al
        mov al, 'n'
        out TV_TXT, al

        pop ax
        iret



;include things here
%include "functions.asm"




    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

