; main.asm

BITS 16
ORG 0x8000



init:
        mov ax, 0x7000
        mov ss, ax
        xor sp, sp

        mov ax, cs
        mov ds, ax

        xor ax, ax
        mov es, ax
        mov di, 0x80 * 4
        mov ax, INT80
        stosw
        mov ax, cs
        stosw
        sti



code:   
        
        MOV SI,  MSG 
        CALL PRINT_STRING

cycle:   
        IN AL, 0x10
        CMP AL, 0
        JNZ ECHO
        jmp cycle

ECHO:   
        CALL PRINT_CHAR
        XOR AL, AL
        JMP cycle


        
MSG DB 'HELLO_WORLD', 0x0D, 0x0A, 0

;interrupt handler
INT80:
        iret



;include things here
%include "functions.asm"




    ; end of code space
    times 32752 - ($ - $$) db 0x90
reset_vector:
    jmp 0xF000:0x8000 ; Jump back to the 'start' label in main.asm
    times 16 - ($ - reset_vector) db 0 ; Final 16 bytes

