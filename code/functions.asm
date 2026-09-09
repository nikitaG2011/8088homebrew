USART_DATA    equ 00H           ; Data Port (A0 = 0)
USART_CTRL    equ 01H           ; Control/Status Port (A0 = 1)



        DELAY_500ms:
        PUSH CX
        MOV CX, 25000       ; [4 T-states] Initialize 16-bit loop counter

        DELAY_LOOP:
        NOP                 ; [3 T-states] No operation padding
        LOOP DELAY_LOOP     ; [17 T-states if jump / 5 T-states if fall-through]
        POP CX 
        RET      

init_usart:
    ; STEP 1: FORCE INTERNAL RESET SEQUENCE
    mov al, 00H
    out USART_CTRL, al
    out USART_CTRL, al
    out USART_CTRL, al
    
    mov al, 40H                 ; Bit 6 = 1 triggers an internal reset
    out USART_CTRL, al

    ; STEP 2: WRITE MODE INSTRUCTION 
    ; Configures: 8 Data Bits, No Parity, 1 Stop Bit, 64X Baud factor
    ; 1,843,200 Hz clock / 64 = 28,800 Baud (Safely complies with 1MHz CLK limit)
    mov al, 4FH         
    out USART_CTRL, al

    ; STEP 3: WRITE COMMAND INSTRUCTION 
    ; Enables: Receiver, Transmitter, and clears all error flags
    mov al, 17H         
    out USART_CTRL, al
    ret

; ---------------------------------------------------------------------------
; PRINT CHARACTER SUBROUTINE (Polled)
; ---------------------------------------------------------------------------
send_char:
    ; Expects the ASCII character to be transmitted in the AL register
    push ax                     ; Save the character from being overwritten
    
.tx_loop:
    in al, USART_CTRL           ; Read the 82C51 Status Register
    test al, 01H                ; Check Bit 0 (TxRDY - Transmitter Ready)
    jz .tx_loop                 ; If 0, the chip is busy; keep waiting
    
    pop ax                      ; Restore the character to AL
    out USART_DATA, al          ; Push the character to the serial line
    ret