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
; set the index register:
        mov     si, 0

next_char:

; get current character:
        mov     al, msg[si]
; is it zero?
; if so stop printing:
        cmp     al, 0           
        je      end_printing

; print character in teletype mode:
        call lcd_delay
	    MOV AL, 'a'
       	OUT LCD_DATA, AL
; update index register by 1:
        inc     si

; go back to print another char:
        jmp     next_char

end_printing:

loop:
    jmp loop
    hlt


msg db 'Hello, world!', 0

%include "functions.asm"
    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

