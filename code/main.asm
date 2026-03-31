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

        mov al, 'T'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'E'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'S'
        out LCD_DATA, al

        call lcd_delay

        mov al, 'T'
        out LCD_DATA, al

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
