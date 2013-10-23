;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:29:38 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f452

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _ispunct

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern _isdigit
	extern _islower
	extern _isupper
	extern _isprint
	extern _isspace
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
; ;ic:1:  _entry($8) :
; ;ic:2: 	proc _ispunct [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
S_ispunct__ispunct	code
_ispunct:
;	.line	27; ctype/ispunct.c	char ispunct (unsigned char c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
; ;ic:3: iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _ispunct_c_1_1}[r0x00 ] = recv _ispunct [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; ;ic:4: 	send iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _ispunct_c_1_1}[r0x00 ]{argreg = 1}
; ;ic:5: 	iTemp1 [k6 lr5:6 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x01 ] = call _isprint [k4 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
;	.line	29; ctype/ispunct.c	if ( isprint (c) &&
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_isprint
	MOVWF	r0x01
	INCF	FSR1L, F
; ;ic:6: 	if iTemp1 [k6 lr5:6 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x01 ] == 0 goto _iffalse_0($2)
	MOVF	r0x01, W
	BZ	_00106_DS_
; ;ic:7: 	send iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _ispunct_c_1_1}[r0x00 ]{argreg = 1}
; ;ic:8: 	iTemp2 [k9 lr8:9 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x01 ] = call _islower [k7 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
;	.line	30; ctype/ispunct.c	!islower(c) &&
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_islower
	MOVWF	r0x01
	INCF	FSR1L, F
; ;ic:9: 	if iTemp2 [k9 lr8:9 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x01 ] != 0 goto _iffalse_0($2)
	MOVF	r0x01, W
	BNZ	_00106_DS_
; ;ic:10: 	send iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _ispunct_c_1_1}[r0x00 ]{argreg = 1}
; ;ic:11: 	iTemp3 [k12 lr11:12 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x01 ] = call _isupper [k10 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
;	.line	31; ctype/ispunct.c	!isupper(c) &&
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_isupper
	MOVWF	r0x01
	INCF	FSR1L, F
; ;ic:12: 	if iTemp3 [k12 lr11:12 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x01 ] != 0 goto _iffalse_0($2)
	MOVF	r0x01, W
	BNZ	_00106_DS_
; ;ic:13: 	send iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _ispunct_c_1_1}[r0x00 ]{argreg = 1}
; ;ic:14: 	iTemp4 [k15 lr14:15 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x01 ] = call _isspace [k13 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
;	.line	32; ctype/ispunct.c	!isspace(c) &&
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_isspace
	MOVWF	r0x01
	INCF	FSR1L, F
; ;ic:15: 	if iTemp4 [k15 lr14:15 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x01 ] != 0 goto _iffalse_0($2)
	MOVF	r0x01, W
	BNZ	_00106_DS_
; ;ic:16: 	send iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _ispunct_c_1_1}[r0x00 ]{argreg = 1}
; ;ic:17: 	iTemp5 [k18 lr17:18 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x00 ] = call _isdigit [k16 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
;	.line	33; ctype/ispunct.c	!isdigit(c) )
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_isdigit
	MOVWF	r0x00
	INCF	FSR1L, F
; ;ic:18: 	if iTemp5 [k18 lr17:18 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed}[r0x00 ] != 0 goto _iffalse_0($2)
	MOVF	r0x00, W
	BNZ	_00106_DS_
; ;ic:19: 	ret 0x1 {char literal}
;	.line	34; ctype/ispunct.c	return 1;
	MOVLW	0x01
	BRA	_00111_DS_
; ;ic:20:  _iffalse_0($2) :
; ;ic:21: 	ret 0x0 {char literal}
_00106_DS_:
;	.line	35; ctype/ispunct.c	return 0;
	CLRF	WREG
; ;ic:22:  _return($7) :
; ;ic:23: 	eproc _ispunct [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
_00111_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	  122 (0x007a) bytes ( 0.09%)
;           	   61 (0x003d) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    2 (0x0002) bytes


	end
