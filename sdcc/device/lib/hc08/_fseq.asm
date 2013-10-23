;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module _fseq
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
	.globl ___fseq_PARM_2
	.globl ___fseq_PARM_1
	.globl ___fseq
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
___fseq_sloc0_1_0::
	.ds 4
___fseq_sloc1_1_0::
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
___fseq_PARM_1:
	.ds 4
___fseq_PARM_2:
	.ds 4
___fseq_fl1_1_1:
	.ds 4
___fseq_fl2_1_1:
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
;Allocation info for local variables in function '__fseq'
;------------------------------------------------------------
;a1                        Allocated with name '___fseq_PARM_1'
;a2                        Allocated with name '___fseq_PARM_2'
;fl1                       Allocated with name '___fseq_fl1_1_1'
;fl2                       Allocated with name '___fseq_fl2_1_1'
;sloc0                     Allocated with name '___fseq_sloc0_1_0'
;sloc1                     Allocated with name '___fseq_sloc1_1_0'
;------------------------------------------------------------
;../_fseq.c:73: __fseq (float a1, float a2)
;	-----------------------------------------
;	 function __fseq
;	-----------------------------------------
___fseq:
;../_fseq.c:77: fl1.f = a1;
	lda	___fseq_PARM_1
	sta	___fseq_fl1_1_1
	lda	(___fseq_PARM_1 + 1)
	sta	(___fseq_fl1_1_1 + 1)
	lda	(___fseq_PARM_1 + 2)
	sta	(___fseq_fl1_1_1 + 2)
	lda	(___fseq_PARM_1 + 3)
	sta	(___fseq_fl1_1_1 + 3)
;../_fseq.c:78: fl2.f = a2;
	lda	___fseq_PARM_2
	sta	___fseq_fl2_1_1
	lda	(___fseq_PARM_2 + 1)
	sta	(___fseq_fl2_1_1 + 1)
	lda	(___fseq_PARM_2 + 2)
	sta	(___fseq_fl2_1_1 + 2)
	lda	(___fseq_PARM_2 + 3)
	sta	(___fseq_fl2_1_1 + 3)
;../_fseq.c:80: if (fl1.l == fl2.l)
	lda	___fseq_fl1_1_1
	sta	*___fseq_sloc0_1_0
	lda	(___fseq_fl1_1_1 + 1)
	sta	*(___fseq_sloc0_1_0 + 1)
	lda	(___fseq_fl1_1_1 + 2)
	sta	*(___fseq_sloc0_1_0 + 2)
	lda	(___fseq_fl1_1_1 + 3)
	sta	*(___fseq_sloc0_1_0 + 3)
	lda	___fseq_fl2_1_1
	sta	*___fseq_sloc1_1_0
	lda	(___fseq_fl2_1_1 + 1)
	sta	*(___fseq_sloc1_1_0 + 1)
	lda	(___fseq_fl2_1_1 + 2)
	sta	*(___fseq_sloc1_1_0 + 2)
	lda	(___fseq_fl2_1_1 + 3)
	sta	*(___fseq_sloc1_1_0 + 3)
	lda	*(___fseq_sloc0_1_0 + 3)
	cmp	*(___fseq_sloc1_1_0 + 3)
	bne	00109$
	lda	*(___fseq_sloc0_1_0 + 2)
	cmp	*(___fseq_sloc1_1_0 + 2)
	bne	00109$
	lda	*(___fseq_sloc0_1_0 + 1)
	cmp	*(___fseq_sloc1_1_0 + 1)
	bne	00109$
	lda	*___fseq_sloc0_1_0
	cmp	*___fseq_sloc1_1_0
	beq	00110$
00109$:
	bra	00102$
00110$:
;../_fseq.c:81: return (1);
	lda	#0x01
	rts
00102$:
;../_fseq.c:82: if (((fl1.l | fl2.l) & 0x7FFFFFFF) == 0)
	lda	___fseq_fl1_1_1
	sta	*___fseq_sloc1_1_0
	lda	(___fseq_fl1_1_1 + 1)
	sta	*(___fseq_sloc1_1_0 + 1)
	lda	(___fseq_fl1_1_1 + 2)
	sta	*(___fseq_sloc1_1_0 + 2)
	lda	(___fseq_fl1_1_1 + 3)
	sta	*(___fseq_sloc1_1_0 + 3)
	lda	___fseq_fl2_1_1
	sta	*___fseq_sloc0_1_0
	lda	(___fseq_fl2_1_1 + 1)
	sta	*(___fseq_sloc0_1_0 + 1)
	lda	(___fseq_fl2_1_1 + 2)
	sta	*(___fseq_sloc0_1_0 + 2)
	lda	(___fseq_fl2_1_1 + 3)
	sta	*(___fseq_sloc0_1_0 + 3)
	lda	*(___fseq_sloc1_1_0 + 3)
	ora	*(___fseq_sloc0_1_0 + 3)
	sta	*(___fseq_sloc1_1_0 + 3)
	lda	*(___fseq_sloc1_1_0 + 2)
	ora	*(___fseq_sloc0_1_0 + 2)
	sta	*(___fseq_sloc1_1_0 + 2)
	lda	*(___fseq_sloc1_1_0 + 1)
	ora	*(___fseq_sloc0_1_0 + 1)
	sta	*(___fseq_sloc1_1_0 + 1)
	lda	*___fseq_sloc1_1_0
	ora	*___fseq_sloc0_1_0
	sta	*___fseq_sloc1_1_0
	tst	*(___fseq_sloc1_1_0 + 3)
	bne	00111$
	tst	*(___fseq_sloc1_1_0 + 2)
	bne	00111$
	tst	*(___fseq_sloc1_1_0 + 1)
	bne	00111$
	lda	*___fseq_sloc1_1_0
	and	#0x7F
00111$:
	bne	00104$
00112$:
;../_fseq.c:83: return (1);
	lda	#0x01
	rts
00104$:
;../_fseq.c:84: return (0);
	clra
00105$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
