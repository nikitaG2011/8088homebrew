        DELAY_500ms:
        PUSH CX
        MOV CX, 25000       ; [4 T-states] Initialize 16-bit loop counter

        DELAY_LOOP:
        NOP                 ; [3 T-states] No operation padding
        LOOP DELAY_LOOP     ; [17 T-states if jump / 5 T-states if fall-through]
        POP CX 
        RET      








        KEYPAD_CHECK:
        PUSH BX 
        PUSH CX

        XCHG BL, AL


        MOV CL, 0b00001000
        MOV AL, CL
        XOR AL, BL
        OUT 0, AL
        XOR AL, 0b00001000


        MOV CL, 0b00000100
        MOV AL, CL
        XOR AL, BL
        OUT 0, AL
        XOR AL, 0b00000100
        

        MOV CL, 0b00000010
        MOV AL, CL
        XOR AL, BL
        OUT 0, AL
        XOR AL, 0b00000010


        MOV CL, 0b00000001
        MOV AL, CL
        XOR AL, BL
        OUT 0, AL
        XOR AL, 0b00000001

        KEYPAD_EXIT:

        XCHG AL, BL

        OUT 0, AL

        POP CX
        POP BX
        RET




CHECK_KEY:
        PUSH AX 

        IN 0x10, AL
        CMP AL, 0b00001000
        JE COL4
        CMP AL, 0b00000100
        JE COL3
        CMP AL, 0b00000010
        JE COL2
        CMP AL, 0b00000001
        JE COL1

        POP AX
        RET



        COL4:
        CMP CL, 0b00001000
        JE OUTK4A
        CMP CL, 0b00000100
        JE OUTK3A
        CMP CL, 0b00000010
        JE OUTK2A
        CMP CL, 0b00000001
        JE OUTK1A

        COL3:
        CMP CL, 0b00001000
        JE OUTK4B
        CMP CL, 0b00000100
        JE OUTK3B
        CMP CL, 0b00000010
        JE OUTK2B
        CMP CL, 0b00000001
        JE OUTK1B

        COL2:
        CMP CL, 0b00001000
        JE OUTK4C
        CMP CL, 0b00000100
        JE OUTK3C
        CMP CL, 0b00000010
        JE OUTK2C
        CMP CL, 0b00000001
        JE OUTK1C

        COL1:
        CMP CL, 0b00001000
        JE OUTK4D
        CMP CL, 0b00000100
        JE OUTK3D
        CMP CL, 0b00000010
        JE OUTK2D
        CMP CL, 0b00000001
        JE OUTK1D




        OUTK4A:
        MOV CL, 0x00
        OUTK3A:
        MOV CL, 0x00
        OUTK2A:
        MOV CL, 0x00
        OUTK1A:
        MOV CL, 0x00

        OUTK4B:
        MOV CL, 0x00
        OUTK3B:
        MOV CL, 0x00
        OUTK2B:
        MOV CL, 0x00
        OUTK1B:
        MOV CL, 0x00

        OUTK4C:
        MOV CL, 0x00
        OUTK3C:
        MOV CL, 0x00
        OUTK2C:
        MOV CL, 0x00
        OUTK1C:
        MOV CL, 0x00

        OUTK4D:
        MOV CL, 0x00
        OUTK3D:
        MOV CL, 0x00
        OUTK2D:
        MOV CL, 0x00
        OUTK1D:
        MOV CL, 0x00

        
