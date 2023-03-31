;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"bingo.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__modulong
	extern	_TRISIO
	extern	_GPIO
	extern	_STATUS
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_randomInRange
	global	_displayNum
	global	_delay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_bingo_0	udata
r0x1018	res	1
r0x1019	res	1
r0x101B	res	1
r0x101A	res	1
r0x101D	res	1
r0x101C	res	1
r0x1011	res	1
r0x1010	res	1
r0x1013	res	1
r0x1012	res	1
r0x1017	res	1
r0x1016	res	1
r0x1015	res	1
r0x1014	res	1
r0x100D	res	1
r0x100C	res	1
r0x100F	res	1
r0x100E	res	1
r0x1005	res	1
r0x1004	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_bingo_0	idata
_randomInRange_seed_65536_12
	db	0x00, 0x00, 0x00, 0x00	; 0

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_bingo	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _randomInRange
;   _randomInRange
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _randomInRange
;   _randomInRange
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;   _displayNum
;   _delay
;9 compiler assigned registers:
;   r0x1018
;   r0x1019
;   STK02
;   STK01
;   STK00
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	16; "bingo.c"	TRISIO = 0b00001000; //Poner todos los pines como salidas
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	17; "bingo.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	20; "bingo.c"	unsigned int count = 0;
	BANKSEL	r0x1018
	CLRF	r0x1018
	CLRF	r0x1019
_00113_DS_:
;	.line	26; "bingo.c"	num1 = randomInRange(0,9);
	MOVLW	0x09
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_randomInRange
	CALL	_randomInRange
	PAGESEL	$
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVF	STK00,W
	MOVWF	r0x101B
;	.line	27; "bingo.c"	num2 = randomInRange(0,9);
	MOVLW	0x09
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_randomInRange
	CALL	_randomInRange
	PAGESEL	$
	BANKSEL	r0x101C
	MOVWF	r0x101C
	MOVF	STK00,W
	MOVWF	r0x101D
;	.line	28; "bingo.c"	displayNum(num1,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x101B,W
	MOVWF	STK00
	MOVF	r0x101A,W
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	29; "bingo.c"	delay(5);
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	30; "bingo.c"	displayNum(num2,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x101D
	MOVF	r0x101D,W
	MOVWF	STK00
	MOVF	r0x101C,W
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	31; "bingo.c"	delay(5);
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	34; "bingo.c"	if (GP3)
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00109_DS_
;	.line	36; "bingo.c"	count=count+1; //Se aumenta el contador
	BANKSEL	r0x1018
	INCF	r0x1018,F
	BTFSC	STATUS,2
	INCF	r0x1019,F
_00105_DS_:
;	.line	37; "bingo.c"	while (GP3)
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00109_DS_
;	.line	39; "bingo.c"	displayNum(num1,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x101B
	MOVF	r0x101B,W
	MOVWF	STK00
	MOVF	r0x101A,W
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	40; "bingo.c"	delay(5);
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	41; "bingo.c"	displayNum(num2,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x101D
	MOVF	r0x101D,W
	MOVWF	STK00
	MOVF	r0x101C,W
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	42; "bingo.c"	delay(5);
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00105_DS_
_00109_DS_:
;	.line	46; "bingo.c"	if (count == 16)
	BANKSEL	r0x1018
	MOVF	r0x1018,W
	XORLW	0x10
	BTFSS	STATUS,2
	GOTO	_00113_DS_
	MOVF	r0x1019,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	50; "bingo.c"	displayNum(9,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	51; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	52; "bingo.c"	displayNum(9,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	53; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	54; "bingo.c"	displayNum(9,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	55; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	56; "bingo.c"	displayNum(9,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	57; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	58; "bingo.c"	displayNum(9,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	59; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	60; "bingo.c"	displayNum(9,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	61; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	62; "bingo.c"	displayNum(9,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	63; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	64; "bingo.c"	displayNum(9,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	65; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	66; "bingo.c"	displayNum(9,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	67; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	68; "bingo.c"	displayNum(9,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	69; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	70; "bingo.c"	displayNum(9,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	71; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	72; "bingo.c"	displayNum(9,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	73; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	74; "bingo.c"	displayNum(9,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	75; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	76; "bingo.c"	displayNum(9,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_displayNum
	CALL	_displayNum
	PAGESEL	$
;	.line	77; "bingo.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	78; "bingo.c"	count = 0; // Se vuelve a poner la cuenta en 0 
	BANKSEL	r0x1018
	CLRF	r0x1018
	CLRF	r0x1019
	GOTO	_00113_DS_
;	.line	82; "bingo.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1004
;   STK00
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;; Starting pCode block
S_bingo__delay	code
_delay:
; 2 exit points
;	.line	172; "bingo.c"	void delay(unsigned int tiempo)
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVF	STK00,W
	MOVWF	r0x1005
;	.line	177; "bingo.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1006
	CLRF	r0x1007
_00183_DS_:
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	SUBWF	r0x1007,W
	BTFSS	STATUS,2
	GOTO	_00204_DS_
	MOVF	r0x1005,W
	SUBWF	r0x1006,W
_00204_DS_:
	BTFSC	STATUS,0
	GOTO	_00185_DS_
;;genSkipc:3307: created from rifx:0x7ffe5263bda0
;	.line	178; "bingo.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVLW	0x04
	MOVWF	r0x1009
_00181_DS_:
	MOVLW	0xff
	BANKSEL	r0x1008
	ADDWF	r0x1008,W
	MOVWF	r0x100A
	MOVLW	0xff
	MOVWF	r0x100B
	MOVF	r0x1009,W
	BTFSC	STATUS,0
	INCFSZ	r0x1009,W
	ADDWF	r0x100B,F
	MOVF	r0x100A,W
	MOVWF	r0x1008
	MOVF	r0x100B,W
	MOVWF	r0x1009
	MOVF	r0x100B,W
	IORWF	r0x100A,W
	BTFSS	STATUS,2
	GOTO	_00181_DS_
;	.line	177; "bingo.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1006,F
	BTFSC	STATUS,2
	INCF	r0x1007,F
	GOTO	_00183_DS_
_00185_DS_:
;	.line	179; "bingo.c"	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;7 compiler assigned registers:
;   r0x100C
;   STK00
;   r0x100D
;   STK01
;   r0x100E
;   STK02
;   r0x100F
;; Starting pCode block
S_bingo__displayNum	code
_displayNum:
; 2 exit points
;	.line	99; "bingo.c"	void displayNum(unsigned int num, int display)
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	STK00,W
	MOVWF	r0x100D
	MOVF	STK01,W
	MOVWF	r0x100E
	MOVF	STK02,W
;	.line	102; "bingo.c"	if (display == 0) {
	MOVWF	r0x100F
	IORWF	r0x100E,W
	BTFSS	STATUS,2
	GOTO	_00149_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;	.line	103; "bingo.c"	switch (num) {
	MOVLW	0x00
	SUBWF	r0x100C,W
	BTFSS	STATUS,2
	GOTO	_00169_DS_
	MOVLW	0x0a
	SUBWF	r0x100D,W
_00169_DS_:
	BTFSC	STATUS,0
	GOTO	_00151_DS_
;;genSkipc:3307: created from rifx:0x7ffe5263bda0
	MOVLW	HIGH(_00170_DS_)
	MOVWF	PCLATH
	MOVLW	_00170_DS_
	BANKSEL	r0x100D
	ADDWF	r0x100D,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_:
	MOVWF	PCL
_00170_DS_:
	GOTO	_00124_DS_
	GOTO	_00125_DS_
	GOTO	_00126_DS_
	GOTO	_00127_DS_
	GOTO	_00128_DS_
	GOTO	_00129_DS_
	GOTO	_00130_DS_
	GOTO	_00131_DS_
	GOTO	_00132_DS_
	GOTO	_00133_DS_
_00124_DS_:
;	.line	105; "bingo.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	106; "bingo.c"	break;
	GOTO	_00151_DS_
_00125_DS_:
;	.line	108; "bingo.c"	GPIO = 0b00000001;
	MOVLW	0x01
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	109; "bingo.c"	break;
	GOTO	_00151_DS_
_00126_DS_:
;	.line	111; "bingo.c"	GPIO = 0b00000010;
	MOVLW	0x02
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	112; "bingo.c"	break;
	GOTO	_00151_DS_
_00127_DS_:
;	.line	114; "bingo.c"	GPIO = 0b00000011;
	MOVLW	0x03
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	115; "bingo.c"	break;
	GOTO	_00151_DS_
_00128_DS_:
;	.line	117; "bingo.c"	GPIO = 0b00000100;
	MOVLW	0x04
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	118; "bingo.c"	break;
	GOTO	_00151_DS_
_00129_DS_:
;	.line	120; "bingo.c"	GPIO = 0b00000101;
	MOVLW	0x05
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	121; "bingo.c"	break;
	GOTO	_00151_DS_
_00130_DS_:
;	.line	123; "bingo.c"	GPIO = 0b00000110;
	MOVLW	0x06
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	124; "bingo.c"	break;
	GOTO	_00151_DS_
_00131_DS_:
;	.line	126; "bingo.c"	GPIO = 0b00000111;
	MOVLW	0x07
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	127; "bingo.c"	break;
	GOTO	_00151_DS_
_00132_DS_:
;	.line	129; "bingo.c"	GPIO = 0b00010000;
	MOVLW	0x10
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	130; "bingo.c"	break;
	GOTO	_00151_DS_
_00133_DS_:
;	.line	132; "bingo.c"	GPIO = 0b00010001;
	MOVLW	0x11
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	134; "bingo.c"	}
	GOTO	_00151_DS_
_00149_DS_:
;	.line	136; "bingo.c"	else if (display == 1) {
	BANKSEL	r0x100F
	MOVF	r0x100F,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00151_DS_
	MOVF	r0x100E,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00151_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;	.line	137; "bingo.c"	switch (num) {
	MOVLW	0x00
	SUBWF	r0x100C,W
	BTFSS	STATUS,2
	GOTO	_00171_DS_
	MOVLW	0x0a
	SUBWF	r0x100D,W
_00171_DS_:
	BTFSC	STATUS,0
	GOTO	_00151_DS_
;;genSkipc:3307: created from rifx:0x7ffe5263bda0
	MOVLW	HIGH(_00172_DS_)
	MOVWF	PCLATH
	MOVLW	_00172_DS_
	BANKSEL	r0x100D
	ADDWF	r0x100D,W
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00002_DS_:
	MOVWF	PCL
_00172_DS_:
	GOTO	_00135_DS_
	GOTO	_00136_DS_
	GOTO	_00137_DS_
	GOTO	_00138_DS_
	GOTO	_00139_DS_
	GOTO	_00140_DS_
	GOTO	_00141_DS_
	GOTO	_00142_DS_
	GOTO	_00143_DS_
	GOTO	_00144_DS_
_00135_DS_:
;	.line	139; "bingo.c"	GPIO = 0b00100000;
	MOVLW	0x20
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	140; "bingo.c"	break;
	GOTO	_00151_DS_
_00136_DS_:
;	.line	142; "bingo.c"	GPIO = 0b00100001;
	MOVLW	0x21
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	143; "bingo.c"	break;
	GOTO	_00151_DS_
_00137_DS_:
;	.line	145; "bingo.c"	GPIO = 0b00100010;
	MOVLW	0x22
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	146; "bingo.c"	break;
	GOTO	_00151_DS_
_00138_DS_:
;	.line	148; "bingo.c"	GPIO = 0b00100011;
	MOVLW	0x23
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	149; "bingo.c"	break;
	GOTO	_00151_DS_
_00139_DS_:
;	.line	151; "bingo.c"	GPIO = 0b00100100;
	MOVLW	0x24
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	152; "bingo.c"	break;
	GOTO	_00151_DS_
_00140_DS_:
;	.line	154; "bingo.c"	GPIO = 0b00100101;
	MOVLW	0x25
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	155; "bingo.c"	break;
	GOTO	_00151_DS_
_00141_DS_:
;	.line	157; "bingo.c"	GPIO = 0b00100110;
	MOVLW	0x26
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	158; "bingo.c"	break;
	GOTO	_00151_DS_
_00142_DS_:
;	.line	160; "bingo.c"	GPIO = 0b00100111;
	MOVLW	0x27
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	161; "bingo.c"	break;
	GOTO	_00151_DS_
_00143_DS_:
;	.line	163; "bingo.c"	GPIO = 0b00110000;
	MOVLW	0x30
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	164; "bingo.c"	break;
	GOTO	_00151_DS_
_00144_DS_:
;	.line	166; "bingo.c"	GPIO = 0b00110001;
	MOVLW	0x31
	BANKSEL	_GPIO
	MOVWF	_GPIO
_00151_DS_:
;	.line	170; "bingo.c"	}
	RETURN	
; exit point of _displayNum

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __modulong
;   __modulong
;15 compiler assigned registers:
;   r0x1010
;   STK00
;   r0x1011
;   STK01
;   r0x1012
;   STK02
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   STK06
;   STK05
;   STK04
;   STK03
;; Starting pCode block
S_bingo__randomInRange	code
_randomInRange:
; 2 exit points
;	.line	85; "bingo.c"	unsigned int randomInRange(unsigned int min, unsigned int max) {
	BANKSEL	r0x1010
	MOVWF	r0x1010
	MOVF	STK00,W
	MOVWF	r0x1011
	MOVF	STK01,W
	MOVWF	r0x1012
	MOVF	STK02,W
	MOVWF	r0x1013
;	.line	87; "bingo.c"	if (seed == 0) {
	BANKSEL	_randomInRange_seed_65536_12
	MOVF	(_randomInRange_seed_65536_12 + 3),W
	IORWF	(_randomInRange_seed_65536_12 + 2),W
	IORWF	(_randomInRange_seed_65536_12 + 1),W
	IORWF	_randomInRange_seed_65536_12,W
	BTFSS	STATUS,2
	GOTO	_00119_DS_
;	.line	89; "bingo.c"	seed = (uint32_t) &STATUS;
	MOVLW	high (_STATUS + 0)
	MOVWF	(_randomInRange_seed_65536_12 + 1)
	MOVLW	(_STATUS + 0)
	MOVWF	_randomInRange_seed_65536_12
	CLRF	(_randomInRange_seed_65536_12 + 2)
	CLRF	(_randomInRange_seed_65536_12 + 3)
_00119_DS_:
;	.line	92; "bingo.c"	seed ^= (seed << 13);
	BANKSEL	_randomInRange_seed_65536_12
	SWAPF	(_randomInRange_seed_65536_12 + 2),W
	ANDLW	0xf0
	BANKSEL	r0x1014
	MOVWF	r0x1014
	BANKSEL	_randomInRange_seed_65536_12
	SWAPF	(_randomInRange_seed_65536_12 + 1),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	ANDLW	0x0f
	IORWF	r0x1014,F
	XORWF	r0x1015,F
	BANKSEL	_randomInRange_seed_65536_12
	SWAPF	_randomInRange_seed_65536_12,W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	ANDLW	0x0f
	IORWF	r0x1015,F
	XORWF	r0x1016,F
	CLRF	r0x1017
	BCF	STATUS,0
	RLF	r0x1017,F
	RLF	r0x1016,F
	RLF	r0x1015,F
	RLF	r0x1014,F
	MOVF	r0x1017,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	_randomInRange_seed_65536_12,F
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	(_randomInRange_seed_65536_12 + 1),F
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	(_randomInRange_seed_65536_12 + 2),F
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	(_randomInRange_seed_65536_12 + 3),F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=2
;	.line	93; "bingo.c"	seed ^= (seed >> 17);
	BCF	STATUS,0
	RRF	(_randomInRange_seed_65536_12 + 3),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_randomInRange_seed_65536_12
	RRF	(_randomInRange_seed_65536_12 + 2),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	CLRF	r0x1015
	CLRF	r0x1014
	MOVF	r0x1017,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	_randomInRange_seed_65536_12,F
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	(_randomInRange_seed_65536_12 + 1),F
	MOVLW	0x00
	XORWF	(_randomInRange_seed_65536_12 + 2),F
	MOVLW	0x00
	XORWF	(_randomInRange_seed_65536_12 + 3),F
;	.line	94; "bingo.c"	seed ^= (seed << 5);
	SWAPF	(_randomInRange_seed_65536_12 + 3),W
	ANDLW	0xf0
	BANKSEL	r0x1014
	MOVWF	r0x1014
	BANKSEL	_randomInRange_seed_65536_12
	SWAPF	(_randomInRange_seed_65536_12 + 2),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	ANDLW	0x0f
	IORWF	r0x1014,F
	XORWF	r0x1015,F
	BANKSEL	_randomInRange_seed_65536_12
	SWAPF	(_randomInRange_seed_65536_12 + 1),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	ANDLW	0x0f
	IORWF	r0x1015,F
	XORWF	r0x1016,F
	BANKSEL	_randomInRange_seed_65536_12
	SWAPF	_randomInRange_seed_65536_12,W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	ANDLW	0x0f
	IORWF	r0x1016,F
	XORWF	r0x1017,F
	BCF	STATUS,0
	RLF	r0x1017,F
	RLF	r0x1016,F
	RLF	r0x1015,F
	RLF	r0x1014,F
	MOVF	r0x1017,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	_randomInRange_seed_65536_12,F
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	(_randomInRange_seed_65536_12 + 1),F
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	(_randomInRange_seed_65536_12 + 2),F
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	_randomInRange_seed_65536_12
	XORWF	(_randomInRange_seed_65536_12 + 3),F
;	.line	95; "bingo.c"	unsigned int randomNum = (unsigned int) ((seed % (max - min + 1)) + min);
	BANKSEL	r0x1011
	MOVF	r0x1011,W
	SUBWF	r0x1013,F
	MOVF	r0x1010,W
	BTFSS	STATUS,0
	INCFSZ	r0x1010,W
	SUBWF	r0x1012,F
	MOVLW	0x01
	ADDWF	r0x1013,F
	MOVLW	0x01
	BTFSC	STATUS,0
	ADDWF	r0x1012,F
	CLRF	r0x1017
	CLRF	r0x1016
	MOVF	r0x1013,W
	MOVWF	STK06
	MOVF	r0x1012,W
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	BANKSEL	_randomInRange_seed_65536_12
	MOVF	_randomInRange_seed_65536_12,W
	MOVWF	STK02
	MOVF	(_randomInRange_seed_65536_12 + 1),W
	MOVWF	STK01
	MOVF	(_randomInRange_seed_65536_12 + 2),W
	MOVWF	STK00
	MOVF	(_randomInRange_seed_65536_12 + 3),W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1014
	MOVWF	r0x1012
	MOVF	STK02,W
	MOVWF	r0x1013
	MOVWF	r0x1015
;;99	MOVF	r0x1012,W
	MOVF	r0x1011,W
	ADDWF	r0x1015,W
	MOVWF	r0x1011
	MOVF	r0x1014,W
	BTFSC	STATUS,0
	INCFSZ	r0x1014,W
	ADDWF	r0x1010,F
;	.line	96; "bingo.c"	return randomNum;
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVF	r0x1010,W
;	.line	97; "bingo.c"	} 
	RETURN	
; exit point of _randomInRange


;	code size estimation:
;	  572+  159 =   731 instructions ( 1780 byte)

	end
