; main.asm
BITS 16
ORG 0x8000

;uart starts at i/o 0

start:
    cli             ; Disable interrupts
    mov ax, 0xF000  ; Setup segments
    mov ds, ax
    mov ss, ax
    mov sp, 0xFFFE  ; Stack at top of segment

    mov al, 0
    out 1, al 
    mov al, 00011111b ;baud rate 19,200
    out 3, al
    mov al, 00001011b ; no parity no echo, dtr low
    out 2, al

    mov al, 'A'
    out 0, al
    loop1:

    jmp loop1

    ; end of code space
    times 32752 - ($ - $$) db 0x90
