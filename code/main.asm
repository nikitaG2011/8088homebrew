; main.asm

BITS 16
ORG 0x8000


USART_DATA    equ 00H           ; Data Port (A0 = 0)
USART_CTRL    equ 01H           ; Control/Status Port (A0 = 1)



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


        MOV DX, 0x0010
code:   
        
        MOV AL, 'H'
        CALL send_char
        MOV AL, 'E'
        CALL send_char
        MOV AL, 'L'
        CALL send_char
        MOV AL, 'L'
        CALL send_char
        MOV AL, 'O'
        CALL send_char
        MOV AL, '_'
        CALL send_char
        MOV AL, 'W'
        CALL send_char
        MOV AL, 'O'
        CALL send_char
        MOV AL, 'R'
        CALL send_char
        MOV AL, 'L'
        CALL send_char
        MOV AL, 'D'
        CALL send_char
        MOV AL, 0x0A
        CALL send_char


        HLT
        


;interrupt handler
INT80:
        iret



;include things here
%include "functions.asm"


    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

