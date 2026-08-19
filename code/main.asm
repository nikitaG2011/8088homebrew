; main.asm

BITS 16
ORG 0x8000


LCD_CMD     EQU 0x00
LCD_DATA    EQU 0x01

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


        mov al, 0x38
        call LCD_CHECK
        out LCD_CMD, al

        mov al, 0x0C
        call LCD_CHECK
        out LCD_CMD, al

        mov al, 0x01
        call LCD_CHECK
        out LCD_CMD, al

        mov al, 0x06
        call LCD_CHECK
        out LCD_CMD, al

        mov al, 'T'
        call LCD_CHECK
        out LCD_DATA, al

        mov al, 'E'
        call LCD_CHECK
        out LCD_DATA, al
        
        mov al, 'S'
        call LCD_CHECK
        out LCD_DATA, al
        
        mov al, 'T'
        call LCD_CHECK
        out LCD_DATA, al
        
        jmp $
hang:
        jmp hang
        

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

