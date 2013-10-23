;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module labs
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
	.globl _labs_PARM_1
	.globl _labs
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
_labs_sloc0_1_0::
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
_labs_PARM_1:
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
;Allocation info for local variables in function 'labs'
;------------------------------------------------------------
;j                         Allocated with name '_labs_PARM_1'
;sloc0                     Allocated with name '_labs_sloc0_1_0'
;------------------------------------------------------------
;../labs.c:23: long int labs(long int j)
;	-----------------------------------------
;	 function labs
;	-----------------------------------------
_labs:
;../labs.c:25: return (j >= 0) ? j : -j;
	lda	_labs_PARM_1
	sub	#0x00
	blt	00106$
	clra
	bra	00107$
00106$:
	lda	#0x01
00107$:
	tsta
	beq	00108$
	lda	#0x01
00108$:
	eor	#0x01
	tsta
	beq	00103$
00109$:
	lda	_labs_PARM_1
	sta	*_labs_sloc0_1_0
	lda	(_labs_PARM_1 + 1)
	sta	*(_labs_sloc0_1_0 + 1)
	lda	(_labs_PARM_1 + 2)
	sta	*(_labs_sloc0_1_0 + 2)
	lda	(_labs_PARM_1 + 3)
	sta	*(_labs_sloc0_1_0 + 3)
	bra	00104$
00103$:
	clra
	sub	(_labs_PARM_1 + 3)
	sta	*(_labs_sloc0_1_0 + 3)
	clra
	sbc	(_labs_PARM_1 + 2)
	sta	*(_labs_sloc0_1_0 + 2)
	clra
	sbc	(_labs_PARM_1 + 1)
	sta	*(_labs_sloc0_1_0 + 1)
	clra
	sbc	_labs_PARM_1
	sta	*_labs_sloc0_1_0
00104$:
	mov	*_labs_sloc0_1_0,*__ret3
	mov	*(_labs_sloc0_1_0 + 1),*__ret2
	ldx	*(_labs_sloc0_1_0 + 2)
	lda	*(_labs_sloc0_1_0 + 3)
00101$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
