;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module _fsgt
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
	.globl ___fsgt_PARM_2
	.globl ___fsgt_PARM_1
	.globl ___fsgt
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
___fsgt_sloc0_1_0::
	.ds 4
___fsgt_sloc1_1_0::
	.ds 4
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
___fsgt_PARM_1:
	.ds 4
___fsgt_PARM_2:
	.ds 4
___fsgt_fl1_1_1:
	.ds 4
___fsgt_fl2_1_1:
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
;Allocation info for local variables in function '__fsgt'
;------------------------------------------------------------
;a1                        Allocated with name '___fsgt_PARM_1'
;a2                        Allocated with name '___fsgt_PARM_2'
;fl1                       Allocated with name '___fsgt_fl1_1_1'
;fl2                       Allocated with name '___fsgt_fl2_1_1'
;sloc0                     Allocated with name '___fsgt_sloc0_1_0'
;sloc1                     Allocated with name '___fsgt_sloc1_1_0'
;------------------------------------------------------------
;../_fsgt.c:98: char __fsgt (float a1, float a2)
;	-----------------------------------------
;	 function __fsgt
;	-----------------------------------------
___fsgt:
;../_fsgt.c:102: fl1.f = a1;
	lda	___fsgt_PARM_1
	sta	___fsgt_fl1_1_1
	lda	(___fsgt_PARM_1 + 1)
	sta	(___fsgt_fl1_1_1 + 1)
	lda	(___fsgt_PARM_1 + 2)
	sta	(___fsgt_fl1_1_1 + 2)
	lda	(___fsgt_PARM_1 + 3)
	sta	(___fsgt_fl1_1_1 + 3)
;../_fsgt.c:103: fl2.f = a2;
	lda	___fsgt_PARM_2
	sta	___fsgt_fl2_1_1
	lda	(___fsgt_PARM_2 + 1)
	sta	(___fsgt_fl2_1_1 + 1)
	lda	(___fsgt_PARM_2 + 2)
	sta	(___fsgt_fl2_1_1 + 2)
	lda	(___fsgt_PARM_2 + 3)
	sta	(___fsgt_fl2_1_1 + 3)
;../_fsgt.c:105: if (fl1.l<0 && fl2.l<0) {
	lda	___fsgt_fl1_1_1
	sta	*___fsgt_sloc0_1_0
	lda	(___fsgt_fl1_1_1 + 1)
	sta	*(___fsgt_sloc0_1_0 + 1)
	lda	(___fsgt_fl1_1_1 + 2)
	sta	*(___fsgt_sloc0_1_0 + 2)
	lda	(___fsgt_fl1_1_1 + 3)
	sta	*(___fsgt_sloc0_1_0 + 3)
	lda	*___fsgt_sloc0_1_0
	sub	#0x00
	blt	00114$
	bra	00104$
00114$:
	lda	___fsgt_fl2_1_1
	sta	*___fsgt_sloc0_1_0
	lda	(___fsgt_fl2_1_1 + 1)
	sta	*(___fsgt_sloc0_1_0 + 1)
	lda	(___fsgt_fl2_1_1 + 2)
	sta	*(___fsgt_sloc0_1_0 + 2)
	lda	(___fsgt_fl2_1_1 + 3)
	sta	*(___fsgt_sloc0_1_0 + 3)
	lda	*___fsgt_sloc0_1_0
	sub	#0x00
	bge	00104$
00115$:
;../_fsgt.c:106: if (fl2.l > fl1.l)
	lda	___fsgt_fl2_1_1
	sta	*___fsgt_sloc0_1_0
	lda	(___fsgt_fl2_1_1 + 1)
	sta	*(___fsgt_sloc0_1_0 + 1)
	lda	(___fsgt_fl2_1_1 + 2)
	sta	*(___fsgt_sloc0_1_0 + 2)
	lda	(___fsgt_fl2_1_1 + 3)
	sta	*(___fsgt_sloc0_1_0 + 3)
	lda	___fsgt_fl1_1_1
	sta	*___fsgt_sloc1_1_0
	lda	(___fsgt_fl1_1_1 + 1)
	sta	*(___fsgt_sloc1_1_0 + 1)
	lda	(___fsgt_fl1_1_1 + 2)
	sta	*(___fsgt_sloc1_1_0 + 2)
	lda	(___fsgt_fl1_1_1 + 3)
	sta	*(___fsgt_sloc1_1_0 + 3)
	sub	*(___fsgt_sloc0_1_0 + 3)
	lda	*(___fsgt_sloc1_1_0 + 2)
	sbc	*(___fsgt_sloc0_1_0 + 2)
	lda	*(___fsgt_sloc1_1_0 + 1)
	sbc	*(___fsgt_sloc0_1_0 + 1)
	lda	*___fsgt_sloc1_1_0
	sbc	*___fsgt_sloc0_1_0
	bge	00102$
00116$:
;../_fsgt.c:107: return (1);
	lda	#0x01
	rts
00102$:
;../_fsgt.c:108: return (0);
	clra
	rts
00104$:
;../_fsgt.c:111: if (fl1.l > fl2.l)
	lda	___fsgt_fl1_1_1
	sta	*___fsgt_sloc1_1_0
	lda	(___fsgt_fl1_1_1 + 1)
	sta	*(___fsgt_sloc1_1_0 + 1)
	lda	(___fsgt_fl1_1_1 + 2)
	sta	*(___fsgt_sloc1_1_0 + 2)
	lda	(___fsgt_fl1_1_1 + 3)
	sta	*(___fsgt_sloc1_1_0 + 3)
	lda	___fsgt_fl2_1_1
	sta	*___fsgt_sloc0_1_0
	lda	(___fsgt_fl2_1_1 + 1)
	sta	*(___fsgt_sloc0_1_0 + 1)
	lda	(___fsgt_fl2_1_1 + 2)
	sta	*(___fsgt_sloc0_1_0 + 2)
	lda	(___fsgt_fl2_1_1 + 3)
	sta	*(___fsgt_sloc0_1_0 + 3)
	sub	*(___fsgt_sloc1_1_0 + 3)
	lda	*(___fsgt_sloc0_1_0 + 2)
	sbc	*(___fsgt_sloc1_1_0 + 2)
	lda	*(___fsgt_sloc0_1_0 + 1)
	sbc	*(___fsgt_sloc1_1_0 + 1)
	lda	*___fsgt_sloc0_1_0
	sbc	*___fsgt_sloc1_1_0
	bge	00107$
00117$:
;../_fsgt.c:112: return (1);
	lda	#0x01
	rts
00107$:
;../_fsgt.c:113: return (0);
	clra
00108$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
