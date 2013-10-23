;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module _strcmp
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
	.globl _strcmp_PARM_2
	.globl _strcmp
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
_strcmp_ret_1_1::
	.ds 2
_strcmp_sloc0_1_0::
	.ds 2
_strcmp_sloc1_1_0::
	.ds 2
_strcmp_sloc2_1_0::
	.ds 2
_strcmp_sloc3_1_0::
	.ds 2
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
_strcmp_PARM_2:
	.ds 2
_strcmp_asrc_1_1:
	.ds 2
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
;Allocation info for local variables in function 'strcmp'
;------------------------------------------------------------
;adst                      Allocated with name '_strcmp_PARM_2'
;asrc                      Allocated with name '_strcmp_asrc_1_1'
;ret                       Allocated with name '_strcmp_ret_1_1'
;sloc0                     Allocated with name '_strcmp_sloc0_1_0'
;sloc1                     Allocated with name '_strcmp_sloc1_1_0'
;sloc2                     Allocated with name '_strcmp_sloc2_1_0'
;sloc3                     Allocated with name '_strcmp_sloc3_1_0'
;------------------------------------------------------------
;../_strcmp.c:29: int strcmp (
;	-----------------------------------------
;	 function strcmp
;	-----------------------------------------
_strcmp:
	sta	(_strcmp_asrc_1_1 + 1)
	stx	_strcmp_asrc_1_1
;../_strcmp.c:48: while( ! (ret = *(unsigned char *)asrc - *(unsigned char *)adst) && *adst)
	lda	_strcmp_asrc_1_1
	sta	*_strcmp_sloc0_1_0
	lda	(_strcmp_asrc_1_1 + 1)
	sta	*(_strcmp_sloc0_1_0 + 1)
	lda	_strcmp_PARM_2
	sta	*_strcmp_sloc1_1_0
	lda	(_strcmp_PARM_2 + 1)
	sta	*(_strcmp_sloc1_1_0 + 1)
00102$:
	ldhx	*_strcmp_sloc0_1_0
	lda	,x
	sta	*(_strcmp_sloc2_1_0 + 1)
	clr	*_strcmp_sloc2_1_0
	ldhx	*_strcmp_sloc1_1_0
	lda	,x
	sta	*(_strcmp_sloc3_1_0 + 1)
	clr	*_strcmp_sloc3_1_0
	lda	*(_strcmp_sloc2_1_0 + 1)
	sub	*(_strcmp_sloc3_1_0 + 1)
	sta	*(_strcmp_ret_1_1 + 1)
	lda	*_strcmp_sloc2_1_0
	sbc	*_strcmp_sloc3_1_0
	sta	*_strcmp_ret_1_1
	mov	*_strcmp_ret_1_1,*_strcmp_sloc3_1_0
	mov	*(_strcmp_ret_1_1 + 1),*(_strcmp_sloc3_1_0 + 1)
	lda	*(_strcmp_ret_1_1 + 1)
	ora	*_strcmp_ret_1_1
	bne	00104$
00111$:
	ldhx	*_strcmp_sloc1_1_0
	lda	,x
	beq	00104$
00112$:
;../_strcmp.c:49: ++asrc, ++adst;
	ldhx	*_strcmp_sloc0_1_0
	aix	#1
	sthx	*_strcmp_sloc0_1_0
	ldhx	*_strcmp_sloc1_1_0
	aix	#1
	sthx	*_strcmp_sloc1_1_0
	bra	00102$
00104$:
;../_strcmp.c:51: return( ret );
	ldx	*_strcmp_sloc3_1_0
	lda	*(_strcmp_sloc3_1_0 + 1)
00105$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
