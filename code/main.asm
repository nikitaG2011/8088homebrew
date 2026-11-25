; main.asm

BITS 16
ORG 0x8000

lcd_cmd		equ 0x0030
lcd_data	equ 0x0031
led_port	equ	0x0000

init:
    mov ax, 0x7000
    mov ss, ax
    xor sp, sp

    mov ax, cs
    mov ds, ax

    xor ax, ax
    mov es, ax
    mov di, 0x80 * 4
    mov ax, INT80
    stosw
    mov ax, cs
    stosw
	sti

    call LCD_INIT
	
code:
	mov		al,			0xAA
	out 	led_port, 	al 
	
	mov 	al, 		'h'
	call LCD_PRINT
	mov 	al, 		'e'
	call LCD_PRINT
	mov 	al, 		'l'
	call LCD_PRINT
	mov 	al, 		'o'
	call LCD_PRINT
	
	HLT
	
	
;interrupt handler
INT80:
    iret



;include things here
%include "functions.asm"

message:
    db "hello, world", 0x00


    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

