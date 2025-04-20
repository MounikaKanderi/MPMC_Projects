#include "p18f452.inc"

PGM CODE 

    ORG 00H
    GOTO START
    
    ORG 0008H
    BTFSS INTCON, TMR0IF
    RETFIE
    GOTO DELAY
    
 
    ORG 100H
START
    BCF TRISD, 0 ; Set RD0 as output
    BCF TRISD, 1 ; Set RD1 as output
    BCF TRISD, 2 ; Set RD2 as output

    MOVLW 07H
    MOVWF T0CON
    MOVLW 3FH
    MOVWF TMR0H
    MOVLW 0FEH
    MOVWF TMR0L
    BCF INTCON, TMR0IF
    BSF INTCON, TMR0IE
    BSF INTCON, GIE
    BSF T0CON, TMR0ON
    CALL DELAY

;    CLRF PORTD ; Turn off all LEDs
    CALL DELAY
    CALL DELAY
    BSF PORTD, 0 ; Turn on first LED
    CALL DELAY
   

;    CLRF PORTD ; Turn off all LEDs
    CALL DELAY
    CALL DELAY
    BSF PORTD, 1 ; Turn on second LED
    CALL DELAY

;    CLRF PORTD ; Turn off all LEDs
    CALL DELAY
    CALL DELAY
    BSF PORTD, 2 ; Turn on third LED
    CALL DELAY

    GOTO START
    
    ORG 200H
DELAY
    MOVLW 3FH
    MOVWF TMR0H
    MOVLW 0FEH
    MOVWF TMR0L
    BCF INTCON, TMR0IF
    CLRF PORTD
    RETFIE
    
    END