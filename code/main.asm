cpu 8086
org 0xF8000

start:
    mov al, 1h
    out 0, al
    
loop:
    jmp loop


delay:
    push dx
    push cx
    mov cx, 0xFF
delay_loop1:
    mov dx, 0xFF
delay_loop2:
    sub dx, 1
    cmp dx, 0
    jne delay_loop2
    sub cx, 1
    cmp cx, 0
    jne delay_loop1
    pop dx
    pop cx
    ret

    




times (0x7FF0 - ($ - $$)) db 0x90

reset_vector:
    jmp start  

times (0x8000 - ($ - $$)) db 0x0