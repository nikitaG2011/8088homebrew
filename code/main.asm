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
        mov di, 0x55 * 4
        mov ax, INT_handler
        stosw
        mov ax, cs
        stosw
        call lcd_start
        sti
    
code:
        call lcd_delay  
        mov al, 'p'
        out LCD_DATA, al
        call lcd_delay       
        mov al, 'e'
        out LCD_DATA, al
        call lcd_delay
        mov al, 'e'
        out LCD_DATA, al



hang:
        jmp hang
        

    

;interupt handler
INT_handler:
        push ax

        call lcd_delay
        
        mov al, 'i'
        out LCD_DATA, al
        
        call lcd_delay

        mov al, 'n'
        out LCD_DATA, al

        hlt
          
        pop ax
        iret 



;include things here
%include "functions.asm"




    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

