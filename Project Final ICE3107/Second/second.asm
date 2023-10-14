
_main:

;second.c,1 :: 		void main() {
;second.c,2 :: 		TRISB = 0xFF; // Set PORTB as input for binary input
	MOVLW      255
	MOVWF      TRISB+0
;second.c,3 :: 		TRISC = 0x00; // Set PORTC as output for seven-segment display
	CLRF       TRISC+0
;second.c,5 :: 		while (1) {
L_main0:
;second.c,7 :: 		unsigned char binaryInput = PORTB;
	MOVF       PORTB+0, 0
	MOVWF      R3+0
;second.c,11 :: 		unsigned char decimalOutput = 0;
;second.c,12 :: 		for(i = 0; i < 8; i++)
	CLRF       R4+0
	CLRF       R4+1
L_main2:
	MOVLW      128
	XORWF      R4+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      8
	SUBWF      R4+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;second.c,14 :: 		if (binaryInput & (1 << i))
	MOVF       R4+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main8:
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main8
L__main9:
	MOVF       R3+0, 0
	ANDWF      R0+0, 1
	MOVLW      0
	ANDWF      R0+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;second.c,17 :: 		}
L_main5:
;second.c,12 :: 		for(i = 0; i < 8; i++)
	INCF       R4+0, 1
	BTFSC      STATUS+0, 2
	INCF       R4+1, 1
;second.c,18 :: 		}
	GOTO       L_main2
L_main3:
;second.c,19 :: 		}
	GOTO       L_main0
;second.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
