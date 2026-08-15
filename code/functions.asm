lcd_start:
    push ax
    push cx
        mov cx, 0x0600
.1:     dec cx
        jnz .1

        mov al, 0x30
        out LCD_CMD, al

        mov cx, 0x0100
.2:     dec cx
        jnz .2

        mov al, 0x30
        out LCD_CMD, al

        mov cx, 0x0020
.3:     dec cx
        jnz .3

        mov al, 0x38    ; function set
        out LCD_CMD, al

        mov cx, 0x0010
.4:     dec cx
        jnz .4

        mov al, 0x08    ; display off
        out LCD_CMD, al

        mov cx, 0x0010
.5:     dec cx
        jnz .5

        mov al, 0x01    ; clear display
        out LCD_CMD, al

        mov cx, 0x0200
.6:     dec cx
        jnz .6

        mov al, 0x02    ; return home
        out LCD_CMD, al

        mov cx, 0x0200
.7:     dec cx
        jnz .7

        mov al, 0x06    ; entry mode set
        out LCD_CMD, al

        mov cx, 0x0010
.8:     dec cx
        jnz .8

        mov al, 0x0c    ; display on, no cursor
        out LCD_CMD, al
    pop cx
    pop ax


        ret
    
lcd_delay:
        push cx
                    mov cx, 0x0010
lcd_delay_loop:     dec cx
                    jnz lcd_delay_loop
        pop cx
        ret
		
		
