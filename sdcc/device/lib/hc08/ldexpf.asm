;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module ldexpf
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
	.globl _ldexpf_PARM_2
	.globl _ldexpf_PARM_1
	.globl _ldexpf
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
_ldexpf_sloc0_1_0::
	.ds 4
_ldexpf_sloc1_1_0::
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
_ldexpf_PARM_1:
	.ds 4
_ldexpf_PARM_2:
	.ds 2
_ldexpf_fl_1_1:
	.ds 4
_ldexpf_e_1_1:
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
;Allocation info for local variables in function 'ldexpf'
;------------------------------------------------------------
;x                         Allocated with name '_ldexpf_PARM_1'
;pw2                       Allocated with name '_ldexpf_PARM_2'
;fl                        Allocated with name '_ldexpf_fl_1_1'
;e                         Allocated with name '_ldexpf_e_1_1'
;sloc0                     Allocated with name '_ldexpf_sloc0_1_0'
;sloc1                     Allocated with name '_ldexpf_sloc1_1_0'
;------------------------------------------------------------
;../ldexpf.c:24: float ldexpf(const float x, const int pw2)
;	-----------------------------------------
;	 function ldexpf
;	-----------------------------------------
_ldexpf:
;../ldexpf.c:29: fl.f = x;
	lda	_ldexpf_PARM_1
	sta	_ldexpf_fl_1_1
	lda	(_ldexpf_PARM_1 + 1)
	sta	(_ldexpf_fl_1_1 + 1)
	lda	(_ldexpf_PARM_1 + 2)
	sta	(_ldexpf_fl_1_1 + 2)
	lda	(_ldexpf_PARM_1 + 3)
	sta	(_ldexpf_fl_1_1 + 3)
;../ldexpf.c:31: e=(fl.l >> 23) & 0x000000ff;
	lda	_ldexpf_fl_1_1
	sta	*_ldexpf_sloc0_1_0
	lda	(_ldexpf_fl_1_1 + 1)
	sta	*(_ldexpf_sloc0_1_0 + 1)
	lda	(_ldexpf_fl_1_1 + 2)
	sta	*(_ldexpf_sloc0_1_0 + 2)
	lda	(_ldexpf_fl_1_1 + 3)
	sta	*(_ldexpf_sloc0_1_0 + 3)
	lda	*(_ldexpf_sloc0_1_0 + 1)
	ldx	*_ldexpf_sloc0_1_0
	asrx
	rora
	asrx
	rora
	asrx
	rora
	asrx
	rora
	asrx
	rora
	asrx
	rora
	asrx
	rora
	sta	*(_ldexpf_sloc0_1_0 + 3)
	stx	*(_ldexpf_sloc0_1_0 + 2)
	txa
	rola
	clra
	sbc	#0
	sta	*(_ldexpf_sloc0_1_0 + 1)
	sta	*_ldexpf_sloc0_1_0
	lda	*(_ldexpf_sloc0_1_0 + 3)
	sta	(_ldexpf_e_1_1 + 3)
	clra
	sta	(_ldexpf_e_1_1 + 2)
	sta	(_ldexpf_e_1_1 + 1)
	sta	_ldexpf_e_1_1
;../ldexpf.c:32: e+=pw2;
	lda	(_ldexpf_PARM_2 + 1)
	sta	*(_ldexpf_sloc0_1_0 + 3)
	lda	_ldexpf_PARM_2
	sta	*(_ldexpf_sloc0_1_0 + 2)
	lda	_ldexpf_PARM_2
	rola	
	clra	
	sbc	#0x00
	sta	*(_ldexpf_sloc0_1_0 + 1)
	sta	*_ldexpf_sloc0_1_0
	lda	(_ldexpf_e_1_1 + 3)
	add	*(_ldexpf_sloc0_1_0 + 3)
	sta	(_ldexpf_e_1_1 + 3)
	lda	(_ldexpf_e_1_1 + 2)
	adc	*(_ldexpf_sloc0_1_0 + 2)
	sta	(_ldexpf_e_1_1 + 2)
	lda	(_ldexpf_e_1_1 + 1)
	adc	*(_ldexpf_sloc0_1_0 + 1)
	sta	(_ldexpf_e_1_1 + 1)
	lda	_ldexpf_e_1_1
	adc	*_ldexpf_sloc0_1_0
	sta	_ldexpf_e_1_1
;../ldexpf.c:33: fl.l= ((e & 0xff) << 23) | (fl.l & 0x807fffff);
	lda	(_ldexpf_e_1_1 + 3)
	sta	*(_ldexpf_sloc0_1_0 + 3)
	clr	*(_ldexpf_sloc0_1_0 + 2)
	clr	*(_ldexpf_sloc0_1_0 + 1)
	clr	*_ldexpf_sloc0_1_0
	lda	*(_ldexpf_sloc0_1_0 + 3)
	ldx	*(_ldexpf_sloc0_1_0 + 2)
	lsrx
	rora
	tax
	clra
	rora
	sta	*(_ldexpf_sloc0_1_0 + 1)
	stx	*_ldexpf_sloc0_1_0
	clr	*(_ldexpf_sloc0_1_0 + 3)
	clr	*(_ldexpf_sloc0_1_0 + 2)
	lda	_ldexpf_fl_1_1
	sta	*_ldexpf_sloc1_1_0
	lda	(_ldexpf_fl_1_1 + 1)
	sta	*(_ldexpf_sloc1_1_0 + 1)
	lda	(_ldexpf_fl_1_1 + 2)
	sta	*(_ldexpf_sloc1_1_0 + 2)
	lda	(_ldexpf_fl_1_1 + 3)
	sta	*(_ldexpf_sloc1_1_0 + 3)
	lda	*(_ldexpf_sloc1_1_0 + 1)
	and	#0x7F
	sta	*(_ldexpf_sloc1_1_0 + 1)
	lda	*_ldexpf_sloc1_1_0
	and	#0x80
	sta	*_ldexpf_sloc1_1_0
	lda	*(_ldexpf_sloc0_1_0 + 3)
	ora	*(_ldexpf_sloc1_1_0 + 3)
	sta	*(_ldexpf_sloc1_1_0 + 3)
	lda	*(_ldexpf_sloc0_1_0 + 2)
	ora	*(_ldexpf_sloc1_1_0 + 2)
	sta	*(_ldexpf_sloc1_1_0 + 2)
	lda	*(_ldexpf_sloc0_1_0 + 1)
	ora	*(_ldexpf_sloc1_1_0 + 1)
	sta	*(_ldexpf_sloc1_1_0 + 1)
	lda	*_ldexpf_sloc0_1_0
	ora	*_ldexpf_sloc1_1_0
	sta	*_ldexpf_sloc1_1_0
	sta	_ldexpf_fl_1_1
	lda	*(_ldexpf_sloc1_1_0 + 1)
	sta	(_ldexpf_fl_1_1 + 1)
	lda	*(_ldexpf_sloc1_1_0 + 2)
	sta	(_ldexpf_fl_1_1 + 2)
	lda	*(_ldexpf_sloc1_1_0 + 3)
	sta	(_ldexpf_fl_1_1 + 3)
;../ldexpf.c:35: return(fl.f);
	lda	_ldexpf_fl_1_1
	sta	*_ldexpf_sloc1_1_0
	lda	(_ldexpf_fl_1_1 + 1)
	sta	*(_ldexpf_sloc1_1_0 + 1)
	lda	(_ldexpf_fl_1_1 + 2)
	sta	*(_ldexpf_sloc1_1_0 + 2)
	lda	(_ldexpf_fl_1_1 + 3)
	sta	*(_ldexpf_sloc1_1_0 + 3)
	mov	*_ldexpf_sloc1_1_0,*__ret3
	mov	*(_ldexpf_sloc1_1_0 + 1),*__ret2
	ldx	*(_ldexpf_sloc1_1_0 + 2)
	lda	*(_ldexpf_sloc1_1_0 + 3)
00101$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
