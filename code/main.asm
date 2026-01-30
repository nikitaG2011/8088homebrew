; main.asm
BITS 16
ORG 0x8000

start:
    cli             ; Disable interrupts
    mov ax, 0xF000  ; Setup segments
    mov ds, ax
    mov ss, ax
    mov sp, 0xFFFE  ; Stack at top of segment
    
    ; --- Your code starts here ---
    mov al, 0xAA
    out 0, al
    loop1:
    jmp loop1
    times 32752 - ($ - $$) db 0x90 ; Pad with NOPs up to the vector space