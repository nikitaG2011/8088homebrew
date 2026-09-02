        DELAY_500ms:
        PUSH CX
        MOV CX, 25000       ; [4 T-states] Initialize 16-bit loop counter

        DELAY_LOOP:
        NOP                 ; [3 T-states] No operation padding
        LOOP DELAY_LOOP     ; [17 T-states if jump / 5 T-states if fall-through]
        POP CX 
        RET      
