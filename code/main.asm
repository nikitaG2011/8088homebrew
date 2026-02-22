; main.asm
BITS 16
ORG 0x8000

;uart starts at i/o 0

start:
    mov ax, 0xF000  ; Setup segments
    mov ds, ax
    mov ss, ax
    mov sp, 0xFFFE  ; Stack at top of segment

code:
    mov al, 0x55 
    out 0, al
    mov ax, 1 
    out 0, ax

loop1:
    out 0, ax
    call delay
    add ax, 1
    jmp loop1

delay:
    push ax
    mov ax, 0xFF
delay_loop:
    sub ax, 1
    cmp ax, 0
    jne delay_loop
    pop ax
    ret




    ; end of code space
    times 32752 - ($ - $$) db 0x90
