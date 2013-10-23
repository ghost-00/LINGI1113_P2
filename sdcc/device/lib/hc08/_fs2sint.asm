;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module _fs2sint
	.optsdcc -mhc08
	
	.area HOME (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT (CODE)
	.area GSFINAL (CODE)
	.area CSEG (CODE)
	.area XINIT
	.area CONST   (CODE)
	.area DSEG
	.area OSEG    (OVR)
	.area BSEG
	.area XSEG
	.area XISEG
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2sint_PARM_1
	.globl ___fs2sint
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
___fs2sint_sloc0_1_0:
	.ds 2
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area OSEG    (OVR)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG
;--------------------------------------------------------
; extended address mode data
;--------------------------------------------------------
	.area XSEG
___fs2sint_PARM_1:
	.ds 4
___fs2sint_sl_1_1:
	.ds 4
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME (CODE)
	.area GSINIT (CODE)
	.area GSFINAL (CODE)
	.area GSINIT (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME (CODE)
	.area HOME (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function '__fs2sint'
;------------------------------------------------------------
;sloc0                     Allocated with name '___fs2sint_sloc0_1_0'
;f                         Allocated with name '___fs2sint_PARM_1'
;sl                        Allocated with name '___fs2sint_sl_1_1'
;------------------------------------------------------------
;../_fs2sint.c:71: signed int __fs2sint (float f)
;	-----------------------------------------
;	 function __fs2sint
;	-----------------------------------------
___fs2sint:
;../_fs2sint.c:73: signed long sl=__fs2slong(f);
	lda	___fs2sint_PARM_1
	sta	___fs2slong_PARM_1
	lda	(___fs2sint_PARM_1 + 1)
	sta	(___fs2slong_PARM_1 + 1)
	lda	(___fs2sint_PARM_1 + 2)
	sta	(___fs2slong_PARM_1 + 2)
	lda	(___fs2sint_PARM_1 + 3)
	sta	(___fs2slong_PARM_1 + 3)
	jsr	___fs2slong
	sta	(___fs2sint_sl_1_1 + 3)
	stx	(___fs2sint_sl_1_1 + 2)
	lda	*__ret2
	sta	(___fs2sint_sl_1_1 + 1)
	lda	*__ret3
	sta	___fs2sint_sl_1_1
;../_fs2sint.c:74: if (sl>=INT_MAX)
	lda	(___fs2sint_sl_1_1 + 3)
	sub	#0xFF
	lda	(___fs2sint_sl_1_1 + 2)
	sbc	#0x7F
	lda	(___fs2sint_sl_1_1 + 1)
	sbc	#0x00
	lda	___fs2sint_sl_1_1
	sbc	#0x00
	blt	00102$
00109$:
;../_fs2sint.c:75: return INT_MAX;
	ldx	#0x7F
	lda	#0xFF
	rts
00102$:
;../_fs2sint.c:76: if (sl<=INT_MIN)
	clra
	sub	(___fs2sint_sl_1_1 + 3)
	lda	#0x80
	sbc	(___fs2sint_sl_1_1 + 2)
	lda	#0xFF
	sbc	(___fs2sint_sl_1_1 + 1)
	lda	#0xFF
	sbc	___fs2sint_sl_1_1
	blt	00104$
00110$:
;../_fs2sint.c:77: return -INT_MIN;
	ldx	#0x80
	clra
	rts
00104$:
;../_fs2sint.c:78: return sl;
	lda	(___fs2sint_sl_1_1 + 3)
	sta	*(___fs2sint_sloc0_1_0 + 1)
	lda	(___fs2sint_sl_1_1 + 2)
	sta	*___fs2sint_sloc0_1_0
	ldx	*___fs2sint_sloc0_1_0
	lda	*(___fs2sint_sloc0_1_0 + 1)
00105$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
