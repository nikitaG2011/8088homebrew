lcd_start:
    push ax
        
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

        pop ax
        ret
		
		
lcd_delay:
                        push cx
                        mov cx, 0x0600
lcd_delay_loop:         dec cx
                        jnz lcd_delay_loop
                        pop cx
                        ret