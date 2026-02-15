; main.asm
BITS 16
ORG 0x8000

;uart starts at i/o 0

start:

    mov al, 11111111b ; set port B to output
    out 2, al
    
    mov al, 0x55
    out 0, al

    mov ax, 0xF000  ; Setup segments
    mov ds, ax
    mov ss, ax
    mov sp, 0xFFFE  ; Stack at top of segment


    loop1:

    jmp loop1

    ; end of code space
    times 32752 - ($ - $$) db 0x90
