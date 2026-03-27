; main.asm
BITS 16
ORG 0x8000

init:
        
        mov ax, 0x7000
        mov ss, ax
        xor sp, sp

        push cs
        pop es
start:
        mov ax, 0x55
        out 00010000b, ax
loop:
        jmp loop



    ; end of code space
    times 32752 - ($ - $$) db 0x90
