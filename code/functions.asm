DELAY_500ms:
    PUSH	CX
    MOV		CX, 		25000       ; [4 T-states] Initialize 16-bit loop counter

DELAY_LOOP:
    NOP                 ; [3 T-states] No operation padding
    LOOP	DELAY_LOOP     ; [17 T-states if jump / 5 T-states if fall-through]
    POP		CX 
    RET   

 
DELAY_LCD_LONG:
	PUSH	CX
	MOV		CX, 		0x1198
DELAY_LCD_LONG_LOOP:
	NOP
	LOOP	DELAY_LCD_LONG_LOOP
	POP		CX
	RET
		
DELAY_LCD:
	PUSH	CX
	MOV		CX, 		0x53
DELAY_LCD_LOOP:
	NOP 
	LOOP	DELAY_LCD_LOOP
	POP		CX 
	RET
		
LCD_INIT:
		
	PUSH	AX 

	CALL	LCD_WAIT
	MOV		AL, 		0x30
	OUT		lcd_cmd,	AL
	
	CALL	LCD_WAIT
	MOV		AL,	 		0x30
	OUT		lcd_cmd, 	AL

	CALL	LCD_WAIT
	MOV		AL, 		0x38
	OUT		lcd_cmd, 	AL
		
	CALL	LCD_WAIT
	MOV		AL, 		0x08
	OUT		lcd_cmd, 	AL
		
	CALL	LCD_WAIT
	MOV		AL, 		0x01
	OUT		lcd_cmd, 	AL
		
	CALL	LCD_WAIT
	MOV		AL, 		0x02
	OUT		lcd_cmd, 	AL

	CALL	LCD_WAIT
	MOV		AL, 		0x06
	OUT		lcd_cmd, 	AL
		
	CALL	LCD_WAIT
	MOV		AL,			0x0C
	OUT		lcd_cmd,	AL
		
	POP		AX
		
	RET
	
	
LCD_PRINT:					;PRINTS A CHARACTER FROM AL TO THE LCD 
	CALL	LCD_WAIT
	OUT		lcd_data, AL
	RET
		

LCD_PRINT_STRING:			;INPUT THE ADDRES OF THE STRING AT SI AND THE TERMINATOR IS 0x00
	PUSH	AX
LCD_PRINT_LOOP:
	MOV		AL, 	[SI]
	INC		SI
	CMP		AL, 	0x00
	JE		LCD_PRINT_EXIT
		
	CALL	LCD_PRINT
		
	JMP 	LCD_PRINT_LOOP
		
LCD_PRINT_EXIT:
	POP		AX
	RET
		
		
LCD_WAIT:
	PUSH	AX
.POLL:
	INAL,	LCD_STATUS
	TEST	AL, 0x80
	JNZ		.POLL
	POP		AX
	RET
