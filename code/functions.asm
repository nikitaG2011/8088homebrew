DELAY_500ms:
        PUSH CX
        MOV CX, 25000       ; [4 T-states] Initialize 16-bit loop counter

DELAY_LOOP:
        NOP                 ; [3 T-states] No operation padding
        LOOP DELAY_LOOP     ; [17 T-states if jump / 5 T-states if fall-through]
        POP CX 
        RET   


DELAY_LCD_LONG:
		PUSH CX
		MOV CX, 0x1198
DELAY_LCD_LONG_LOOP:
		NOP
		LOOP DELAY_LCD_LONG_LOOP
		POP CX
		RET
		
DELAY_LCD:
		PUSH CX
		MOV CX, 0x53
DELAY_LCD_LOOP:
		NOP 
		LOOP DELAY_LCD_LOOP
		POP CX 
		RET
		
LCD_INIT:
		
		PUSH AL 
		
		CALL DELAY_LCD_LONG
		MOV AL, 0x30
		OUT lcd_cmd, AL
		
		CALL DELAY_LCD_LONG
		MOV AL, 0x30
		OUT lcd_cmd, AL
		
		CALL DELAY_LCD_LONG
		MOV AL, 0x38
		OUT lcd_cmd, AL
		
		CALL DELAY_LCD
		MOV AL, 0x08
		OUT lcd_cmd, AL
		
		
		CALL DELAY_LCD
		MOV AL, 0x01
		OUT lcd_cmd, AL
		
		CALL DELAY_LCD_LONG
		MOV AL, 0x02
		OUT lcd_cmd, AL
		
		CALL DELAY_LCD_LONG
		MOV AL, 0x06
		OUT lcd_cmd, AL
		
		CALL DELAY_LCD
		MOV AL, 0x0C
		OUT lcd_cmd, AL
		
		POP AL 
		
		RET
	
	
LCD_PRINT:					;PRINTS A CHARACTER FROM AL TO THE LCD 
		CALL	DELAY_LCD
		OUT		lcd_data
		RET
		

LCD_PRINT_STRING:			;INPUT THE ADDRES OF THE STRING AT SI AND THE TERMINATOR IS 0x00
		PUSH AL
LCD_PRINT_LOOP:
		MOV AL, [SI]
		INC SI
		CMP AL, 0x00
		JE LCD_PRINT_EXIT
		
		CALL LCD_PRINT
		
		JMP LCD_PRINT_LOOP
		
LCD_PRINT_EXIT:
		POP AL 
		RET
		
		