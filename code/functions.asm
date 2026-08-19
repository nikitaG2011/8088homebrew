LCD_CHECK:
        push ax
LCD_CHECK_LOOP:
        in al, 0x00
        test al, 0x80
        jnz LCD_CHECK_LOOP
        pop ax
        ret

