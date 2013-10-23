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
	global _isxdigit
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
; ;ic:1:  _entry($9) :
; ;ic:2: 	proc _isxdigit [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
S_isxdigit__isxdigit	code
_isxdigit:
;	.line	28; ctype/isxdigit.c	char isxdigit (unsigned char c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
; ;ic:3: iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _isxdigit_c_1_1}[r0x00 ] = recv _isxdigit [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; ;ic:4: 	iTemp1 [k4 lr4:5 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} = iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _isxdigit_c_1_1}[r0x00 ] < 0x30 {unsigned-char literal}
;	.line	30; ctype/isxdigit.c	if ( ( c >= UC('0') && c <= UC('9')) ||
	MOVLW	0x30
	SUBWF	r0x00, W
	BNC	_00109_DS_
; ;ic:5: 	if iTemp1 [k4 lr4:5 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} != 0 goto _orif_1($5)
; ;ic:6: 	iTemp2 [k5 lr6:7 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} = iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _isxdigit_c_1_1}[r0x00 ] > 0x39 {unsigned-char literal}
	MOVLW	0x3a
	SUBWF	r0x00, W
	BNC	_00105_DS_
; ;ic:7: 	if iTemp2 [k5 lr6:7 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} == 0 goto _iftrue_0($1)
; ;ic:8:  _orif_1($5) :
; ;ic:9: 	iTemp3 [k6 lr9:10 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} = iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _isxdigit_c_1_1}[r0x00 ] < 0x61 {unsigned-char literal}
_00109_DS_:
;	.line	31; ctype/isxdigit.c	( c >= UC('a') && c <= UC('f')) ||
	MOVLW	0x61
	SUBWF	r0x00, W
	BNC	_00111_DS_
; ;ic:10: 	if iTemp3 [k6 lr9:10 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} != 0 goto _orif_0($7)
; ;ic:11: 	iTemp4 [k7 lr11:12 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} = iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _isxdigit_c_1_1}[r0x00 ] > 0x66 {unsigned-char literal}
	MOVLW	0x67
	SUBWF	r0x00, W
	BNC	_00105_DS_
; ;ic:12: 	if iTemp4 [k7 lr11:12 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} == 0 goto _iftrue_0($1)
; ;ic:13:  _orif_0($7) :
; ;ic:14: 	iTemp5 [k8 lr14:15 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} = iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _isxdigit_c_1_1}[r0x00 ] < 0x41 {unsigned-char literal}
_00111_DS_:
;	.line	32; ctype/isxdigit.c	( c >= UC('A') && c <= UC('F')) )
	MOVLW	0x41
	SUBWF	r0x00, W
	BNC	_00106_DS_
; ;ic:15: 	if iTemp5 [k8 lr14:15 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} != 0 goto _iffalse_0($2)
; ;ic:16: 	iTemp6 [k9 lr16:17 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} = iTemp0 [k2 lr3:16 so:0]{ ia0 a2p0 re1 rm0 nos0 ru0 dp0}{unsigned-char fixed}{ sir@ _isxdigit_c_1_1}[r0x00 ] > 0x46 {unsigned-char literal}
	MOVLW	0x47
	SUBWF	r0x00, W
	BC	_00106_DS_
; ;ic:17: 	if iTemp6 [k9 lr16:17 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char fixed} != 0 goto _iffalse_0($2)
; ;ic:18:  _iftrue_0($1) :
; ;ic:19: 	ret 0x1 {char literal}
_00105_DS_:
;	.line	33; ctype/isxdigit.c	return 1;
	MOVLW	0x01
	BRA	_00112_DS_
; ;ic:20:  _iffalse_0($2) :
; ;ic:21: 	ret 0x0 {char literal}
_00106_DS_:
;	.line	34; ctype/isxdigit.c	return 0;
	CLRF	WREG
; ;ic:22:  _return($8) :
; ;ic:23: 	eproc _isxdigit [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{char function    ( unsigned-char fixed)  fixed}
_00112_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	   70 (0x0046) bytes ( 0.05%)
;           	   35 (0x0023) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    1 (0x0001) bytes


	end
