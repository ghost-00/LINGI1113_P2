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
	global _iscntrl
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

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
; ;ic:1:  _entry($5) :
; ;ic:2: 	proc _iscntrl [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
S_iscntrl__iscntrl	code
_iscntrl:
;	.line	27; ctype/iscntrl.c	char iscntrl (unsigned char c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
; ;ic:3: iTemp0 [k2 lr3:6 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _iscntrl_c_1_1}[r0x00 ] = recv _iscntrl [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; ;ic:4: 	iTemp1 [k4 lr4:5 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} = iTemp0 [k2 lr3:6 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _iscntrl_c_1_1}[r0x00 ] > 0x1f {const-unsigned-char literal}
;	.line	29; ctype/iscntrl.c	if  ( c <= 0x1F || c == 0x7f )
	MOVLW	0x20
	SUBWF	r0x00, W
	BNC	_00105_DS_
; ;ic:5: 	if iTemp1 [k4 lr4:5 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} == 0 goto _iftrue_0($1)
; ;ic:6: 	iTemp2 [k5 lr6:7 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} = iTemp0 [k2 lr3:6 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _iscntrl_c_1_1}[r0x00 ] == 0x7f {const-unsigned-char literal}
	MOVF	r0x00, W
	XORLW	0x7f
	BNZ	_00106_DS_
; ;ic:7: 	if iTemp2 [k5 lr6:7 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} == 0 goto _iffalse_0($2)
; ;ic:8:  _iftrue_0($1) :
; ;ic:9: 	ret 0x1 {char literal}
_00105_DS_:
;	.line	30; ctype/iscntrl.c	return 1;
	MOVLW	0x01
	BRA	_00108_DS_
; ;ic:10:  _iffalse_0($2) :
; ;ic:11: 	ret 0x0 {char literal}
_00106_DS_:
;	.line	31; ctype/iscntrl.c	return 0;
	CLRF	WREG
; ;ic:12:  _return($4) :
; ;ic:13: 	eproc _iscntrl [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
_00108_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	   46 (0x002e) bytes ( 0.04%)
;           	   23 (0x0017) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    1 (0x0001) bytes


	end
