;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module _fs2uchar
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
	.globl ___fs2uchar_PARM_1
	.globl ___fs2uchar
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
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
___fs2uchar_PARM_1:
	.ds 4
___fs2uchar_ul_1_1:
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
;Allocation info for local variables in function '__fs2uchar'
;------------------------------------------------------------
;f                         Allocated with name '___fs2uchar_PARM_1'
;ul                        Allocated with name '___fs2uchar_ul_1_1'
;------------------------------------------------------------
;../_fs2uchar.c:41: unsigned char __fs2uchar (float f)
;	-----------------------------------------
;	 function __fs2uchar
;	-----------------------------------------
___fs2uchar:
;../_fs2uchar.c:43: unsigned long ul=__fs2ulong(f);
	lda	___fs2uchar_PARM_1
	sta	___fs2ulong_PARM_1
	lda	(___fs2uchar_PARM_1 + 1)
	sta	(___fs2ulong_PARM_1 + 1)
	lda	(___fs2uchar_PARM_1 + 2)
	sta	(___fs2ulong_PARM_1 + 2)
	lda	(___fs2uchar_PARM_1 + 3)
	sta	(___fs2ulong_PARM_1 + 3)
	jsr	___fs2ulong
	sta	(___fs2uchar_ul_1_1 + 3)
	stx	(___fs2uchar_ul_1_1 + 2)
	lda	*__ret2
	sta	(___fs2uchar_ul_1_1 + 1)
	lda	*__ret3
	sta	___fs2uchar_ul_1_1
;../_fs2uchar.c:44: if (ul>=UCHAR_MAX) return UCHAR_MAX;
	lda	(___fs2uchar_ul_1_1 + 3)
	sub	#0xFF
	lda	(___fs2uchar_ul_1_1 + 2)
	sbc	#0x00
	lda	(___fs2uchar_ul_1_1 + 1)
	sbc	#0x00
	lda	___fs2uchar_ul_1_1
	sbc	#0x00
	bcs	00102$
00106$:
	lda	#0xFF
	rts
00102$:
;../_fs2uchar.c:45: return ul;
	lda	(___fs2uchar_ul_1_1 + 3)
00103$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
