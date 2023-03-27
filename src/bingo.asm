;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"bingo.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
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

sharebank udata_ovr 0x0020
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
r0x1012	res	1
r0x100C	res	1
r0x100D	res	1
r0x1011	res	1
r0x1010	res	1
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
_randomInRange_seed_65536_8
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
;   r0x1012
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	14; "bingo.c"	TRISIO = 0b00001000; //Poner todos los pines como salidas
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	15; "bingo.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
_00106_DS_:
;	.line	24; "bingo.c"	num1 = randomInRange(0,9);
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_randomInRange
	CALL	_randomInRange
	PAGESEL	$
;	.line	25; "bingo.c"	num2 = randomInRange(0,9); 
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_randomInRange
	CALL	_randomInRange
	PAGESEL	$
;	.line	26; "bingo.c"	GP0 = 0x00;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	27; "bingo.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	29; "bingo.c"	GP0 = ~GP0;
	CLRF	r0x1012
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,0
	INCF	r0x1012,F
	COMF	r0x1012,W
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSS	STATUS,0
	BCF	_GPIObits,0
	BTFSC	STATUS,0
	BSF	_GPIObits,0
;	.line	30; "bingo.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00106_DS_
;	.line	33; "bingo.c"	}
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
;	.line	50; "bingo.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1004
	MOVF	STK00,W
	MOVWF	r0x1005
;	.line	55; "bingo.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1006
	CLRF	r0x1007
_00123_DS_:
	MOVF	r0x1004,W
	SUBWF	r0x1007,W
	BTFSS	STATUS,2
	GOTO	_00144_DS_
	MOVF	r0x1005,W
	SUBWF	r0x1006,W
_00144_DS_:
	BTFSC	STATUS,0
	GOTO	_00125_DS_
;;genSkipc:3307: created from rifx:0x7ffc6f9f9790
;	.line	56; "bingo.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1008
	MOVLW	0x04
	MOVWF	r0x1009
_00121_DS_:
	MOVLW	0xff
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
	GOTO	_00121_DS_
;	.line	55; "bingo.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1006,F
	BTFSC	STATUS,2
	INCF	r0x1007,F
	GOTO	_00123_DS_
_00125_DS_:
;	.line	57; "bingo.c"	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __modulong
;   __modulong
;13 compiler assigned registers:
;   r0x100C
;   STK00
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
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
;	.line	36; "bingo.c"	uint8_t randomInRange(uint8_t min, uint8_t max) {
	MOVWF	r0x100C
	MOVF	STK00,W
	MOVWF	r0x100D
;	.line	38; "bingo.c"	if (seed == 0) {
	MOVF	(_randomInRange_seed_65536_8 + 3),W
	IORWF	(_randomInRange_seed_65536_8 + 2),W
	IORWF	(_randomInRange_seed_65536_8 + 1),W
	IORWF	_randomInRange_seed_65536_8,W
	BTFSS	STATUS,2
	GOTO	_00112_DS_
;	.line	40; "bingo.c"	seed = (uint32_t) &STATUS;
	MOVLW	high (_STATUS + 0)
	MOVWF	(_randomInRange_seed_65536_8 + 1)
	MOVLW	(_STATUS + 0)
	MOVWF	_randomInRange_seed_65536_8
	CLRF	(_randomInRange_seed_65536_8 + 2)
	CLRF	(_randomInRange_seed_65536_8 + 3)
_00112_DS_:
;	.line	43; "bingo.c"	seed ^= (seed << 13);
	SWAPF	(_randomInRange_seed_65536_8 + 2),W
	ANDLW	0xf0
	MOVWF	r0x100E
	SWAPF	(_randomInRange_seed_65536_8 + 1),W
	MOVWF	r0x100F
	ANDLW	0x0f
	IORWF	r0x100E,F
	XORWF	r0x100F,F
	SWAPF	_randomInRange_seed_65536_8,W
	MOVWF	r0x1010
	ANDLW	0x0f
	IORWF	r0x100F,F
	XORWF	r0x1010,F
	CLRF	r0x1011
	BCF	STATUS,0
	RLF	r0x1011,F
	RLF	r0x1010,F
	RLF	r0x100F,F
	RLF	r0x100E,F
	MOVF	r0x1011,W
	XORWF	_randomInRange_seed_65536_8,F
	MOVF	r0x1010,W
	XORWF	(_randomInRange_seed_65536_8 + 1),F
	MOVF	r0x100F,W
	XORWF	(_randomInRange_seed_65536_8 + 2),F
	MOVF	r0x100E,W
	XORWF	(_randomInRange_seed_65536_8 + 3),F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=2
;	.line	44; "bingo.c"	seed ^= (seed >> 17);
	BCF	STATUS,0
	RRF	(_randomInRange_seed_65536_8 + 3),W
	MOVWF	r0x1010
	RRF	(_randomInRange_seed_65536_8 + 2),W
	MOVWF	r0x1011
	CLRF	r0x100F
	CLRF	r0x100E
	MOVF	r0x1011,W
	XORWF	_randomInRange_seed_65536_8,F
	MOVF	r0x1010,W
	XORWF	(_randomInRange_seed_65536_8 + 1),F
	MOVLW	0x00
	XORWF	(_randomInRange_seed_65536_8 + 2),F
	MOVLW	0x00
	XORWF	(_randomInRange_seed_65536_8 + 3),F
;	.line	45; "bingo.c"	seed ^= (seed << 5);
	SWAPF	(_randomInRange_seed_65536_8 + 3),W
	ANDLW	0xf0
	MOVWF	r0x100E
	SWAPF	(_randomInRange_seed_65536_8 + 2),W
	MOVWF	r0x100F
	ANDLW	0x0f
	IORWF	r0x100E,F
	XORWF	r0x100F,F
	SWAPF	(_randomInRange_seed_65536_8 + 1),W
	MOVWF	r0x1010
	ANDLW	0x0f
	IORWF	r0x100F,F
	XORWF	r0x1010,F
	SWAPF	_randomInRange_seed_65536_8,W
	MOVWF	r0x1011
	ANDLW	0x0f
	IORWF	r0x1010,F
	XORWF	r0x1011,F
	BCF	STATUS,0
	RLF	r0x1011,F
	RLF	r0x1010,F
	RLF	r0x100F,F
	RLF	r0x100E,F
	MOVF	r0x1011,W
	XORWF	_randomInRange_seed_65536_8,F
	MOVF	r0x1010,W
	XORWF	(_randomInRange_seed_65536_8 + 1),F
	MOVF	r0x100F,W
	XORWF	(_randomInRange_seed_65536_8 + 2),F
	MOVF	r0x100E,W
	XORWF	(_randomInRange_seed_65536_8 + 3),F
;	.line	46; "bingo.c"	uint8_t randomNum = (uint8_t) ((seed % (max - min + 1)) + min);
	MOVF	r0x100D,W
	MOVWF	r0x1011
	CLRF	r0x1010
;;100	MOVF	r0x100C,W
	CLRF	r0x100F
;;99	MOVF	r0x100D,W
	MOVF	r0x100C,W
	MOVWF	r0x100D
	SUBWF	r0x1011,F
	MOVLW	0x00
	BTFSS	STATUS,0
	INCFSZ	r0x100F,W
	SUBWF	r0x1010,F
	MOVLW	0x01
	ADDWF	r0x1011,F
	CLRF	r0x100D
	RLF	r0x100D,F
	MOVF	r0x1010,W
	ADDWF	r0x100D,F
	CLRF	r0x1010
	CLRF	r0x100F
	MOVF	r0x1011,W
	MOVWF	STK06
	MOVF	r0x100D,W
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	_randomInRange_seed_65536_8,W
	MOVWF	STK02
	MOVF	(_randomInRange_seed_65536_8 + 1),W
	MOVWF	STK01
	MOVF	(_randomInRange_seed_65536_8 + 2),W
	MOVWF	STK00
	MOVF	(_randomInRange_seed_65536_8 + 3),W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	MOVWF	r0x100F
	MOVF	STK00,W
	MOVWF	r0x1010
	MOVF	STK01,W
	MOVWF	r0x1011
	MOVF	STK02,W
	MOVWF	r0x100D
	MOVWF	r0x100E
	MOVF	r0x100C,W
	ADDWF	r0x100E,W
;	.line	47; "bingo.c"	return randomNum;
	MOVWF	r0x100C
;	.line	48; "bingo.c"	} 
	RETURN	
; exit point of _randomInRange


;	code size estimation:
;	  206+   14 =   220 instructions (  468 byte)

	end
