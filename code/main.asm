; main.asm

BITS 16
ORG 0x8000

%include "functions.asm"

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

        



	MOV CX, END_MESSAGE - MESSAGE
	MOV AX, CS
	MOV DS, AX
	MOV BX, MESSAGE

MESS_LOOP:
	MOV AL, [BX]
	INC BX
	call lcd_delay
	OUT LCD_DATA, AL
	LOOP MESS_LOOP
	RET


loUop:
    jmp loUop
    hlt

MESSAGE:
DB "HELLORLD!"
END_MESSAGE:



    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

