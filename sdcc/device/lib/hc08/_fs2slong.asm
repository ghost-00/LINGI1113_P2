;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module _fs2slong
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
	.globl ___fs2slong_PARM_1
	.globl ___fs2slong
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
___fs2slong_sloc0_1_0:
	.ds 1
___fs2slong_sloc1_1_0:
	.ds 4
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
___fs2slong_PARM_1:
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
;Allocation info for local variables in function '__fs2slong'
;------------------------------------------------------------
;sloc0                     Allocated with name '___fs2slong_sloc0_1_0'
;sloc1                     Allocated with name '___fs2slong_sloc1_1_0'
;f                         Allocated with name '___fs2slong_PARM_1'
;------------------------------------------------------------
;../_fs2slong.c:98: signed long __fs2slong (float f)
;	-----------------------------------------
;	 function __fs2slong
;	-----------------------------------------
___fs2slong:
;../_fs2slong.c:101: if (!f)
	lda	(___fs2slong_PARM_1 + 3)
	ora	(___fs2slong_PARM_1 + 2)
	ora	(___fs2slong_PARM_1 + 1)
	ora	___fs2slong_PARM_1
	bne	00102$
00110$:
;../_fs2slong.c:102: return 0;
	clr	*__ret3
	clr	*__ret2
	clrx
	clra
	rts
00102$:
;../_fs2slong.c:104: if (f<0) {
	lda	___fs2slong_PARM_1
	sta	___fslt_PARM_1
	lda	(___fs2slong_PARM_1 + 1)
	sta	(___fslt_PARM_1 + 1)
	lda	(___fs2slong_PARM_1 + 2)
	sta	(___fslt_PARM_1 + 2)
	lda	(___fs2slong_PARM_1 + 3)
	sta	(___fslt_PARM_1 + 3)
	clra
	sta	___fslt_PARM_2
	sta	(___fslt_PARM_2 + 1)
	sta	(___fslt_PARM_2 + 2)
	sta	(___fslt_PARM_2 + 3)
	jsr	___fslt
	sta	*___fs2slong_sloc0_1_0
	tst	*___fs2slong_sloc0_1_0
	beq	00104$
00111$:
;../_fs2slong.c:105: return -__fs2ulong(-f);
	lda	(___fs2slong_PARM_1 + 3)
	sta	(___fs2ulong_PARM_1 + 3)
	lda	(___fs2slong_PARM_1 + 2)
	sta	(___fs2ulong_PARM_1 + 2)
	lda	(___fs2slong_PARM_1 + 1)
	sta	(___fs2ulong_PARM_1 + 1)
	lda	___fs2slong_PARM_1
	eor	#0x80
	sta	___fs2ulong_PARM_1
	jsr	___fs2ulong
	sta	*(___fs2slong_sloc1_1_0 + 3)
	stx	*(___fs2slong_sloc1_1_0 + 2)
	mov	*__ret2,*(___fs2slong_sloc1_1_0 + 1)
	mov	*__ret3,*___fs2slong_sloc1_1_0
	clra
	sub	*(___fs2slong_sloc1_1_0 + 3)
	sta	*(___fs2slong_sloc1_1_0 + 3)
	clra
	sbc	*(___fs2slong_sloc1_1_0 + 2)
	sta	*(___fs2slong_sloc1_1_0 + 2)
	clra
	sbc	*(___fs2slong_sloc1_1_0 + 1)
	sta	*(___fs2slong_sloc1_1_0 + 1)
	clra
	sbc	*___fs2slong_sloc1_1_0
	sta	*___fs2slong_sloc1_1_0
	mov	*___fs2slong_sloc1_1_0,*__ret3
	mov	*(___fs2slong_sloc1_1_0 + 1),*__ret2
	ldx	*(___fs2slong_sloc1_1_0 + 2)
	lda	*(___fs2slong_sloc1_1_0 + 3)
	rts
00104$:
;../_fs2slong.c:107: return __fs2ulong(f);
	lda	___fs2slong_PARM_1
	sta	___fs2ulong_PARM_1
	lda	(___fs2slong_PARM_1 + 1)
	sta	(___fs2ulong_PARM_1 + 1)
	lda	(___fs2slong_PARM_1 + 2)
	sta	(___fs2ulong_PARM_1 + 2)
	lda	(___fs2slong_PARM_1 + 3)
	sta	(___fs2ulong_PARM_1 + 3)
	jsr	___fs2ulong
	sta	*(___fs2slong_sloc1_1_0 + 3)
	stx	*(___fs2slong_sloc1_1_0 + 2)
	mov	*__ret2,*(___fs2slong_sloc1_1_0 + 1)
	mov	*__ret3,*___fs2slong_sloc1_1_0
	mov	*___fs2slong_sloc1_1_0,*__ret3
	mov	*(___fs2slong_sloc1_1_0 + 1),*__ret2
	ldx	*(___fs2slong_sloc1_1_0 + 2)
	lda	*(___fs2slong_sloc1_1_0 + 3)
00106$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
