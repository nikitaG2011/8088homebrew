; vector.asm
BITS 16
ORG 0xFFF0          ; The reset vector offset in segment F000

reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes