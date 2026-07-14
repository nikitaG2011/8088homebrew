        CPU 8086
        BITS 16

        %include "system_def.inc"

        SECTION .text

        GLOBAL delay
        GLOBAL portout

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

portout:
        push bp
        mov bp, sp

        mov al, [bp + 4]
        out 0, al 

        pop bp
        ret 

