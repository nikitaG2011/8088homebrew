; main.asm

BITS 16
ORG 0x8000



LCD_CMD     EQU 0x00
LCD_DATA    EQU 0x01

init:
        mov ax, 0x7000
        mov ss, ax
        xor sp, sp

        push cs
        pop es
code:

    call lcd_start

        
	call lcd_delay
	MOV AL, 'A'
	OUT LCD_DATA, AL



loop:
    jmp loop
    hlt



%include "functions.asm"
    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

