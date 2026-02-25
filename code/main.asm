; main.asm
BITS 16
ORG 0x8000

LCD_CMD     EQU 0x00
LCD_DATA    EQU 0x01


start:
    mov ax, 0xF000  ; Setup segments
    mov ds, ax
    mov ss, ax
    mov sp, 0xFFFE  ; Stack at top of segment

LCD_CMD     EQU 0x00
LCD_DATA    EQU 0x01

init:
        
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


        mov al, 'D'
        out LCD_DATA, al

        jmp $


lcd_delay:
                    push cx
                    mov cx, 0x0100
lcd_delay_loop:     dec cx
                    jnz lcd_delay_loop
                    pop cx
                    ret

hello_str:
        db 'Hello, World!'
hello_str_end:

    ; end of code space
    times 32752 - ($ - $$) db 0x90
