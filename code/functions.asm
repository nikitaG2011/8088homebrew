LCD_CHECK:
        push ax
LCD_CHECK_LOOP:
        in al, 0x00
        test al, 0x80
        jnz LCD_CHECK_LOOP
        pop ax
        ret


LCD_DELAY:  
        PUSH cx
        mov cx, 0x0600
LCD_DELAY_LOOP:
        dec cx
        jnz LCD_DELAY_LOOP
        pop cx
        ret