        CPU 8086
        BITS 16

        %include "system_def.inc"

        SECTION .reset

        GLOBAL reset
        EXTERN init

reset:
        jmp far [reset_jmp]

reset_jmp: dw init, 0
