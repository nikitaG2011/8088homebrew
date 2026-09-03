; main.asm

BITS 16
ORG 0x8000






init:
        mov ax, 0x7000
        mov ss, ax
        xor sp, sp

        xor ax, ax
        mov es, ax
        mov di, 0x80 * 4
        mov ax, INT80
        stosw
        mov ax, cs
        stosw
        sti

        MOV AL, 0x0
        OUT 0x00, AL

hang:
        jmp hang


;interrupt handler
INT80:
        ADD AL, 0x1
        OUT 0x00, AL

        iret



;include things here
%include "functions.asm"


    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

