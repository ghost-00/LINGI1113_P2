;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module _strpbrk
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
	.globl _strpbrk_PARM_2
	.globl _strpbrk
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
_strpbrk_ch_1_1:
	.ds 1
_strpbrk_sloc0_1_0:
	.ds 1
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
_strpbrk_PARM_2:
	.ds 2
_strpbrk_string_1_1:
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
;Allocation info for local variables in function 'strpbrk'
;------------------------------------------------------------
;ch                        Allocated with name '_strpbrk_ch_1_1'
;sloc0                     Allocated with name '_strpbrk_sloc0_1_0'
;control                   Allocated with name '_strpbrk_PARM_2'
;string                    Allocated with name '_strpbrk_string_1_1'
;------------------------------------------------------------
;../_strpbrk.c:26: char * strpbrk ( 
;	-----------------------------------------
;	 function strpbrk
;	-----------------------------------------
_strpbrk:
	sta	(_strpbrk_string_1_1 + 1)
	stx	_strpbrk_string_1_1
;../_strpbrk.c:33: while ( ch = *string ) {
00103$:
	lda	_strpbrk_string_1_1
	ldx	(_strpbrk_string_1_1 + 1)
	psha
	pulh
	lda	,x
	sta	*_strpbrk_ch_1_1
	mov	*_strpbrk_ch_1_1,*_strpbrk_sloc0_1_0
	tst	*_strpbrk_ch_1_1
	beq	00105$
00111$:
;../_strpbrk.c:34: if (strchr (control, ch ))
	lda	*_strpbrk_sloc0_1_0
	sta	_strchr_PARM_2
	ldx	_strpbrk_PARM_2
	lda	(_strpbrk_PARM_2 + 1)
	jsr	_strchr
	tsta
	bne	00112$
	tstx
00112$:
	beq	00103$
00113$:
;../_strpbrk.c:35: return string ;
	ldx	_strpbrk_string_1_1
	lda	(_strpbrk_string_1_1 + 1)
	rts
00105$:
;../_strpbrk.c:38: return (NULL);
	clrx
	clra
00106$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
