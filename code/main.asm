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

        call lcd_delay
        mov al, 0x30
        out LCD_CMD, al
		
        call lcd_delay

        mov al, 0x30
        out LCD_CMD, al

        call lcd_delay

        mov al, 0x38    ; function set
        out LCD_CMD, al

        call lcd_delay

        mov al, 0x08    ; display off
        out LCD_CMD, al

        call lcd_delay

        mov al, 0x01    ; clear display
        out LCD_CMD, al

        call lcd_delay

        mov al, 0x02    ; return home
        out LCD_CMD, al

        call lcd_delay

        mov al, 0x06    ; entry mode set
        out LCD_CMD, al

        call lcd_delay

        mov al, 0x0c    ; display on, no cursor
        out LCD_CMD, al

        call lcd_delay

        mov al, 'H'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'E'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'L'
        out LCD_DATA, al
		
		call lcd_delay
		
		        mov al, 'L'
        out LCD_DATA, al


        call lcd_delay

        mov al, 'O'
        out LCD_DATA, al
		
		call lcd_delay

        mov al, '_'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'W'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'O'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'R'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'L'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'D'
        out LCD_DATA, al

        call lcd_delay


loop:
        jmp loop
        hlt



lcd_delay:
                        mov cx, 0x0600
lcd_delay_loop:         dec cx
                        jnz lcd_delay_loop
                        ret

    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

