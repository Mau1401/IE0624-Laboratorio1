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
r0x1016	res	1
r0x1010	res	1
r0x1011	res	1
r0x1015	res	1
r0x1014	res	1
r0x1013	res	1
r0x1012	res	1
r0x100D	res	1
r0x100C	res	1
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
_randomInRange_seed_65536_9
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
;   _delay
;   _delay
;   _randomInRange
;   _randomInRange
;   _delay
;   _delay
;2 compiler assigned registers:
;   STK00
;   r0x1016
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	15; "bingo.c"	TRISIO = 0b00001000; //Poner todos los pines como salidas
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	16; "bingo.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
_00106_DS_:
;	.line	25; "bingo.c"	num1 = randomInRange(0,9);
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_randomInRange
	CALL	_randomInRange
	PAGESEL	$
;	.line	26; "bingo.c"	num2 = randomInRange(0,9); 
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_randomInRange
	CALL	_randomInRange
	PAGESEL	$
;	.line	27; "bingo.c"	GP0 = 0x00;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	28; "bingo.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	30; "bingo.c"	GP0 = ~GP0;
	BANKSEL	r0x1016
	CLRF	r0x1016
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,0
	GOTO	_00001_DS_
	BANKSEL	r0x1016
	INCF	r0x1016,F
_00001_DS_:
	BANKSEL	r0x1016
	COMF	r0x1016,W
	MOVWF	r0x1016
	RRF	r0x1016,W
	BTFSC	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00002_DS_:
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00003_DS_:
;	.line	31; "bingo.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00106_DS_
;	.line	34; "bingo.c"	}
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
;	.line	81; "bingo.c"	void delay(unsigned int tiempo)
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVF	STK00,W
	MOVWF	r0x1005
;	.line	86; "bingo.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1006
	CLRF	r0x1007
_00185_DS_:
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	SUBWF	r0x1007,W
	BTFSS	STATUS,2
	GOTO	_00206_DS_
	MOVF	r0x1005,W
	SUBWF	r0x1006,W
_00206_DS_:
	BTFSC	STATUS,0
	GOTO	_00187_DS_
;;genSkipc:3307: created from rifx:0x7ffdd037b1d0
;	.line	87; "bingo.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVLW	0x04
	MOVWF	r0x1009
_00183_DS_:
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
	GOTO	_00183_DS_
;	.line	86; "bingo.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1006,F
	BTFSC	STATUS,2
	INCF	r0x1007,F
	GOTO	_00185_DS_
_00187_DS_:
;	.line	88; "bingo.c"	}
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
;	.line	51; "bingo.c"	void displayNum(int num, int display)
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	STK00,W
	MOVWF	r0x100D
	MOVF	STK01,W
	MOVWF	r0x100E
	MOVF	STK02,W
;;1	MOVWF	r0x100F
;	.line	53; "bingo.c"	if (display == 0)
	IORWF	r0x100E,W
	BTFSS	STATUS,2
	GOTO	_00172_DS_
;	.line	55; "bingo.c"	if (num == 0) GPIO = 0b00000000;
	MOVF	r0x100C,W
	IORWF	r0x100D,W
	BTFSS	STATUS,2
	GOTO	_00142_DS_
	BANKSEL	_GPIO
	CLRF	_GPIO
	GOTO	_00174_DS_
_00142_DS_:
;	.line	56; "bingo.c"	else if (num == 1)GPIO = 0b00000001;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x01
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00139_DS_:
;	.line	57; "bingo.c"	else if (num == 2)GPIO = 0b00000010;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00136_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00136_DS_
	MOVLW	0x02
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00136_DS_:
;	.line	58; "bingo.c"	else if (num == 3)GPIO = 0b00000011;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00133_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00133_DS_
	MOVLW	0x03
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00133_DS_:
;	.line	59; "bingo.c"	else if (num == 4)GPIO = 0b00000100;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00130_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00130_DS_
	MOVLW	0x04
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00130_DS_:
;	.line	60; "bingo.c"	else if (num == 5)GPIO = 0b00000101;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00127_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00127_DS_
	MOVLW	0x05
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00127_DS_:
;	.line	61; "bingo.c"	else if (num == 6)GPIO = 0b00000110;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00124_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00124_DS_
	MOVLW	0x06
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00124_DS_:
;	.line	62; "bingo.c"	else if (num == 7)GPIO = 0b00000111;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00121_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00121_DS_
	MOVLW	0x07
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00121_DS_:
;	.line	63; "bingo.c"	else if (num == 8)GPIO = 0b00010000;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00118_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00118_DS_
	MOVLW	0x10
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00118_DS_:
;	.line	64; "bingo.c"	else GPIO = 0b00010001;
	MOVLW	0x11
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00172_DS_:
;	.line	68; "bingo.c"	if (num == 0) GPIO = 0b00000000;
	BANKSEL	r0x100C
	MOVF	r0x100C,W
	IORWF	r0x100D,W
	BTFSS	STATUS,2
	GOTO	_00169_DS_
	BANKSEL	_GPIO
	CLRF	_GPIO
	GOTO	_00174_DS_
_00169_DS_:
;	.line	69; "bingo.c"	else if (num == 1)GPIO = 0b00000001;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00166_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00166_DS_
	MOVLW	0x01
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00166_DS_:
;	.line	70; "bingo.c"	else if (num == 2)GPIO = 0b00000010;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00163_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00163_DS_
	MOVLW	0x02
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00163_DS_:
;	.line	71; "bingo.c"	else if (num == 3)GPIO = 0b00000011;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00160_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00160_DS_
	MOVLW	0x03
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00160_DS_:
;	.line	72; "bingo.c"	else if (num == 4)GPIO = 0b00000100;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00157_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00157_DS_
	MOVLW	0x04
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00157_DS_:
;	.line	73; "bingo.c"	else if (num == 5)GPIO = 0b00000101;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00154_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00154_DS_
	MOVLW	0x05
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00154_DS_:
;	.line	74; "bingo.c"	else if (num == 6)GPIO = 0b00000110;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00151_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00151_DS_
	MOVLW	0x06
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00151_DS_:
;	.line	75; "bingo.c"	else if (num == 7)GPIO = 0b00000111;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVLW	0x07
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00148_DS_:
;	.line	76; "bingo.c"	else if (num == 8)GPIO = 0b00010000;
	BANKSEL	r0x100D
	MOVF	r0x100D,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00145_DS_
	MOVF	r0x100C,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00145_DS_
	MOVLW	0x10
	BANKSEL	_GPIO
	MOVWF	_GPIO
	GOTO	_00174_DS_
_00145_DS_:
;	.line	77; "bingo.c"	else GPIO = 0b00010001;
	MOVLW	0x11
	BANKSEL	_GPIO
	MOVWF	_GPIO
_00174_DS_:
;	.line	79; "bingo.c"	}
	RETURN	
; exit point of _displayNum

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __modulong
;   __modulong
;13 compiler assigned registers:
;   r0x1010
;   STK00
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;; Starting pCode block
S_bingo__randomInRange	code
_randomInRange:
; 2 exit points
;	.line	37; "bingo.c"	uint8_t randomInRange(uint8_t min, uint8_t max) {
	BANKSEL	r0x1010
	MOVWF	r0x1010
	MOVF	STK00,W
	MOVWF	r0x1011
;	.line	39; "bingo.c"	if (seed == 0) {
	BANKSEL	_randomInRange_seed_65536_9
	MOVF	(_randomInRange_seed_65536_9 + 3),W
	IORWF	(_randomInRange_seed_65536_9 + 2),W
	IORWF	(_randomInRange_seed_65536_9 + 1),W
	IORWF	_randomInRange_seed_65536_9,W
	BTFSS	STATUS,2
	GOTO	_00112_DS_
;	.line	41; "bingo.c"	seed = (uint32_t) &STATUS;
	MOVLW	high (_STATUS + 0)
	MOVWF	(_randomInRange_seed_65536_9 + 1)
	MOVLW	(_STATUS + 0)
	MOVWF	_randomInRange_seed_65536_9
	CLRF	(_randomInRange_seed_65536_9 + 2)
	CLRF	(_randomInRange_seed_65536_9 + 3)
_00112_DS_:
;	.line	44; "bingo.c"	seed ^= (seed << 13);
	BANKSEL	_randomInRange_seed_65536_9
	SWAPF	(_randomInRange_seed_65536_9 + 2),W
	ANDLW	0xf0
	BANKSEL	r0x1012
	MOVWF	r0x1012
	BANKSEL	_randomInRange_seed_65536_9
	SWAPF	(_randomInRange_seed_65536_9 + 1),W
	BANKSEL	r0x1013
	MOVWF	r0x1013
	ANDLW	0x0f
	IORWF	r0x1012,F
	XORWF	r0x1013,F
	BANKSEL	_randomInRange_seed_65536_9
	SWAPF	_randomInRange_seed_65536_9,W
	BANKSEL	r0x1014
	MOVWF	r0x1014
	ANDLW	0x0f
	IORWF	r0x1013,F
	XORWF	r0x1014,F
	CLRF	r0x1015
	BCF	STATUS,0
	RLF	r0x1015,F
	RLF	r0x1014,F
	RLF	r0x1013,F
	RLF	r0x1012,F
	MOVF	r0x1015,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	_randomInRange_seed_65536_9,F
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	(_randomInRange_seed_65536_9 + 1),F
	BANKSEL	r0x1013
	MOVF	r0x1013,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	(_randomInRange_seed_65536_9 + 2),F
	BANKSEL	r0x1012
	MOVF	r0x1012,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	(_randomInRange_seed_65536_9 + 3),F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=2
;	.line	45; "bingo.c"	seed ^= (seed >> 17);
	BCF	STATUS,0
	RRF	(_randomInRange_seed_65536_9 + 3),W
	BANKSEL	r0x1014
	MOVWF	r0x1014
	BANKSEL	_randomInRange_seed_65536_9
	RRF	(_randomInRange_seed_65536_9 + 2),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	CLRF	r0x1013
	CLRF	r0x1012
	MOVF	r0x1015,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	_randomInRange_seed_65536_9,F
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	(_randomInRange_seed_65536_9 + 1),F
	MOVLW	0x00
	XORWF	(_randomInRange_seed_65536_9 + 2),F
	MOVLW	0x00
	XORWF	(_randomInRange_seed_65536_9 + 3),F
;	.line	46; "bingo.c"	seed ^= (seed << 5);
	SWAPF	(_randomInRange_seed_65536_9 + 3),W
	ANDLW	0xf0
	BANKSEL	r0x1012
	MOVWF	r0x1012
	BANKSEL	_randomInRange_seed_65536_9
	SWAPF	(_randomInRange_seed_65536_9 + 2),W
	BANKSEL	r0x1013
	MOVWF	r0x1013
	ANDLW	0x0f
	IORWF	r0x1012,F
	XORWF	r0x1013,F
	BANKSEL	_randomInRange_seed_65536_9
	SWAPF	(_randomInRange_seed_65536_9 + 1),W
	BANKSEL	r0x1014
	MOVWF	r0x1014
	ANDLW	0x0f
	IORWF	r0x1013,F
	XORWF	r0x1014,F
	BANKSEL	_randomInRange_seed_65536_9
	SWAPF	_randomInRange_seed_65536_9,W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	ANDLW	0x0f
	IORWF	r0x1014,F
	XORWF	r0x1015,F
	BCF	STATUS,0
	RLF	r0x1015,F
	RLF	r0x1014,F
	RLF	r0x1013,F
	RLF	r0x1012,F
	MOVF	r0x1015,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	_randomInRange_seed_65536_9,F
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	(_randomInRange_seed_65536_9 + 1),F
	BANKSEL	r0x1013
	MOVF	r0x1013,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	(_randomInRange_seed_65536_9 + 2),F
	BANKSEL	r0x1012
	MOVF	r0x1012,W
	BANKSEL	_randomInRange_seed_65536_9
	XORWF	(_randomInRange_seed_65536_9 + 3),F
;	.line	47; "bingo.c"	uint8_t randomNum = (uint8_t) ((seed % (max - min + 1)) + min);
	BANKSEL	r0x1011
	MOVF	r0x1011,W
	MOVWF	r0x1015
	CLRF	r0x1014
;;100	MOVF	r0x1010,W
	CLRF	r0x1013
;;99	MOVF	r0x1011,W
	MOVF	r0x1010,W
	MOVWF	r0x1011
	SUBWF	r0x1015,F
	MOVLW	0x00
	BTFSS	STATUS,0
	INCFSZ	r0x1013,W
	SUBWF	r0x1014,F
	MOVLW	0x01
	ADDWF	r0x1015,F
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x1014,W
	ADDWF	r0x1011,F
	CLRF	r0x1014
	CLRF	r0x1013
	MOVF	r0x1015,W
	MOVWF	STK06
	MOVF	r0x1011,W
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	BANKSEL	_randomInRange_seed_65536_9
	MOVF	_randomInRange_seed_65536_9,W
	MOVWF	STK02
	MOVF	(_randomInRange_seed_65536_9 + 1),W
	MOVWF	STK01
	MOVF	(_randomInRange_seed_65536_9 + 2),W
	MOVWF	STK00
	MOVF	(_randomInRange_seed_65536_9 + 3),W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1013
	MOVWF	r0x1013
	MOVF	STK00,W
	MOVWF	r0x1014
	MOVF	STK01,W
	MOVWF	r0x1015
	MOVF	STK02,W
	MOVWF	r0x1011
	MOVWF	r0x1012
	MOVF	r0x1010,W
	ADDWF	r0x1012,W
;	.line	48; "bingo.c"	return randomNum;
	MOVWF	r0x1010
;	.line	49; "bingo.c"	} 
	RETURN	
; exit point of _randomInRange


;	code size estimation:
;	  412+   99 =   511 instructions ( 1220 byte)

	end
