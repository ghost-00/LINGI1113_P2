;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module _memset
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
	.globl _memset_PARM_3
	.globl _memset_PARM_2
	.globl _memset
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
_memset_sloc0_1_0::
	.ds 2
_memset_sloc1_1_0::
	.ds 2
_memset_sloc2_1_0::
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
_memset_PARM_2:
	.ds 1
_memset_PARM_3:
	.ds 2
_memset_buf_1_1:
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
;Allocation info for local variables in function 'memset'
;------------------------------------------------------------
;ch                        Allocated with name '_memset_PARM_2'
;count                     Allocated with name '_memset_PARM_3'
;buf                       Allocated with name '_memset_buf_1_1'
;ret                       Allocated to registers 
;sloc0                     Allocated with name '_memset_sloc0_1_0'
;sloc1                     Allocated with name '_memset_sloc1_1_0'
;sloc2                     Allocated with name '_memset_sloc2_1_0'
;------------------------------------------------------------
;../_memset.c:31: void * memset (
;	-----------------------------------------
;	 function memset
;	-----------------------------------------
_memset:
	sta	(_memset_buf_1_1 + 1)
	stx	_memset_buf_1_1
;../_memset.c:38: while (count--) {
	lda	_memset_buf_1_1
	sta	*_memset_sloc0_1_0
	lda	(_memset_buf_1_1 + 1)
	sta	*(_memset_sloc0_1_0 + 1)
	lda	_memset_PARM_3
	sta	*_memset_sloc1_1_0
	lda	(_memset_PARM_3 + 1)
	sta	*(_memset_sloc1_1_0 + 1)
00101$:
	mov	*_memset_sloc1_1_0,*_memset_sloc2_1_0
	mov	*(_memset_sloc1_1_0 + 1),*(_memset_sloc2_1_0 + 1)
	lda	*(_memset_sloc1_1_0 + 1)
	sub	#0x01
	sta	*(_memset_sloc1_1_0 + 1)
	lda	*_memset_sloc1_1_0
	sbc	#0x00
	sta	*_memset_sloc1_1_0
	lda	*(_memset_sloc2_1_0 + 1)
	ora	*_memset_sloc2_1_0
	beq	00103$
00109$:
;../_memset.c:39: *(unsigned char *) ret = ch;
	ldhx	*_memset_sloc0_1_0
	lda	_memset_PARM_2
	sta	,x
	aix	#1
	sthx	*_memset_sloc0_1_0
;../_memset.c:40: ret = ((unsigned char *) ret) + 1;
	bra	00101$
00103$:
;../_memset.c:43: return buf ;
	ldx	_memset_buf_1_1
	lda	(_memset_buf_1_1 + 1)
00104$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
