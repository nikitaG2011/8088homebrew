

        DELAY_500ms:
        PUSH CX
        MOV CX, 25000       ; [4 T-states] Initialize 16-bit loop counter

        DELAY_LOOP:
        NOP                 ; [3 T-states] No operation padding
        LOOP DELAY_LOOP     ; [17 T-states if jump / 5 T-states if fall-through]
        POP CX 
        RET      


    PRINT_STRING:
    MOV AL, [SI]
    INC SI
    OR   AL, AL
    JZ   .DONE

    CALL PRINT_CHAR
    JMP  PRINT_STRING

.DONE:
    RET


PRINT_CHAR:
    PUSH CX
    OUT 0x00, AL
    MOV CX, 100
PRINT_DELAY:
    
    NOP                 ; [3 T-states] No operation padding
    LOOP PRINT_DELAY    


    POP CX
    RET