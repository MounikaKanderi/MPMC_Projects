#include <p18f452.inc>
    
    ORG 00H
    BSF TRISB , 7
    BCF TRISD , 2
    
    
CHECK:
    BTFSS PORTB , 7
    GOTO LONG
    
    
SHORT:
    MOVLW 08H
    MOVWF T0CON
    MOVLW 76CH
    MOVWF TMR0H
    MOVLW 3BH
    MOVWF TMR0L
    BSF T0CON , TMR0ON
    
    
DO:
    BTFSC INTCON , TMR0IF
    BRA DO
    BCF T0CON ,TMR0ON
    BTG PORTD , 2
    BCF INTCON , TMR0IF
    GOTO CHECK
    
    
LONG:
    MOVLW 08H
    MOVWF T0CON
    MOVLW 7BH
    MOVWF TMR0H
    MOVLW 1DH
    MOVWF TMR0L
    BSF T0CON , TMR0ON
    GOTO DO
    
    END


