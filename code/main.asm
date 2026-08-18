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
        mov cx, 0x1200
.1:     dec cx
        jnz .1

        mov al, 0x30
        out LCD_CMD, al

        mov cx, 0x0200
.2:     dec cx
        jnz .2

        mov al, 0x30
        out LCD_CMD, al

        mov cx, 0x0040
.3:     dec cx
        jnz .3

        mov al, 0x38    ; function set
        out LCD_CMD, al

        mov cx, 0x0020
.4:     dec cx
        jnz .4

        mov al, 0x08    ; display off
        out LCD_CMD, al

        mov cx, 0x0020
.5:     dec cx
        jnz .5

        mov al, 0x01    ; clear display
        out LCD_CMD, al

        mov cx, 0x0400
.6:     dec cx
        jnz .6

        mov al, 0x02    ; return home
        out LCD_CMD, al

        mov cx, 0x0400
.7:     dec cx
        jnz .7

        mov al, 0x06    ; entry mode set
        out LCD_CMD, al

        mov cx, 0x0020
.8:     dec cx
        jnz .8

        mov al, 0x0c    ; display on, no cursor
        out LCD_CMD, al

        mov cx, 0x0020
.9:     dec cx
        jnz .9

        mov al, 'T'
        out LCD_DATA, al

        mov cx, 0x0020
.10:    dec cx
        jnz .10

        mov al, 'E'
        out LCD_DATA, al

        mov cx, 0x0020
.11:    dec cx
        jnz .11

        mov al, 'S'
        out LCD_DATA, al

        mov cx, 0x0020
.12:    dec cx
        jnz .12

        mov al, 'T'
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

