.8086

ROM SEGMENT USE16
org 0F8000h

start:
    cli
    xor ax, ax
    mov ss, ax
    mov sp, 0FFFEh
    mov ds, ax
    mov es, ax

    mov dx, 0
    mov al, 0FFh
    out dx, al
loop1:
    jmp loop1

org 0FFFF0h

    mov dx, 0
    mov al, 55h
    out dx, al

db 0EAh, 00h, 00h, 80h, 0Fh

ROM ENDS

end
