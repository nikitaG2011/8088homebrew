; main.asm

BITS 16
ORG 0x8000

usart_data 	equ 0x00
usart_ctrl 	equ 0x01
led_port	equ	0x10

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
	
code:
	mov		al,			0xAA
	out 	led_port, 	al 
	call	DELAY_500ms
	mov		al,			0x55
	out 	led_port, 	al
	call	DELAY_500ms
	jmp		code
	
	
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

