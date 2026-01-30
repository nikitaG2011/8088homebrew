.8086

ROM SEGMENT USE16
org 0F8000h

start:
    nop
    nop
    nop
    nop
    nop
    cli
    xor ax, ax
    mov ss, ax
    mov sp, 0FFFEh
    mov ds, ax
    mov es, ax

    mov al, 0FFh
    out 0, al
loop1:
    jmp loop1

org 0FFFF0h
    db 0EAh         ; Far Jump Opcode
    dw 0000h        ; Offset 0000
    dw 0F800h       ; Segment F800

ROM ENDS

end
