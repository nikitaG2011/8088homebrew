        CPU 8086
        BITS 16

        %include "system_def.inc"

        SECTION .text

        GLOBAL delay
        GLOBAL print_char

;--------------------------------------
; void delay(uint16_t steps)
;--------------------------------------
delay:
        push bp
        mov bp, sp

        mov cx, [bp + 4]
.1:     dec cx
        jnz .1

        mov sp, bp
        pop bp
        ret

print_char:
        push bp
        mov bp, sp
        mov cx, 500

        mov al, [bp + 4]
        out 0, al 

PRINT_DELAY:   
        NOP 
        LOOP PRINT_DELAY    


        pop bp
        ret 

