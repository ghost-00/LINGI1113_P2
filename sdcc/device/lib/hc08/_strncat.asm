;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module _strncat
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
	.globl _strncat_PARM_3
	.globl _strncat_PARM_2
	.globl _strncat
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
_strncat_sloc0_1_0::
	.ds 2
_strncat_sloc1_1_0::
	.ds 1
_strncat_sloc2_1_0::
	.ds 2
_strncat_sloc3_1_0::
	.ds 2
_strncat_sloc4_1_0::
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
_strncat_PARM_2:
	.ds 2
_strncat_PARM_3:
	.ds 2
_strncat_front_1_1:
	.ds 2
_strncat_start_1_1:
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
;Allocation info for local variables in function 'strncat'
;------------------------------------------------------------
;back                      Allocated with name '_strncat_PARM_2'
;count                     Allocated with name '_strncat_PARM_3'
;front                     Allocated with name '_strncat_front_1_1'
;start                     Allocated with name '_strncat_start_1_1'
;sloc0                     Allocated with name '_strncat_sloc0_1_0'
;sloc1                     Allocated with name '_strncat_sloc1_1_0'
;sloc2                     Allocated with name '_strncat_sloc2_1_0'
;sloc3                     Allocated with name '_strncat_sloc3_1_0'
;sloc4                     Allocated with name '_strncat_sloc4_1_0'
;------------------------------------------------------------
;../_strncat.c:26: char * strncat (
;	-----------------------------------------
;	 function strncat
;	-----------------------------------------
_strncat:
	sta	(_strncat_front_1_1 + 1)
	stx	_strncat_front_1_1
;../_strncat.c:32: char *start = front;
	lda	_strncat_front_1_1
	sta	_strncat_start_1_1
	lda	(_strncat_front_1_1 + 1)
	sta	(_strncat_start_1_1 + 1)
;../_strncat.c:34: while (*front++);
	lda	_strncat_front_1_1
	sta	*_strncat_sloc0_1_0
	lda	(_strncat_front_1_1 + 1)
	sta	*(_strncat_sloc0_1_0 + 1)
00101$:
	ldhx	*_strncat_sloc0_1_0
	lda	,x
	aix	#1
	sta	*_strncat_sloc1_1_0
	sthx	*_strncat_sloc0_1_0
	tst	*_strncat_sloc1_1_0
	bne	00101$
00117$:
;../_strncat.c:36: front--;
	lda	*(_strncat_sloc0_1_0 + 1)
	sub	#0x01
	sta	(_strncat_front_1_1 + 1)
	lda	*_strncat_sloc0_1_0
	sbc	#0x00
	sta	_strncat_front_1_1
;../_strncat.c:38: while (count--)
	lda	_strncat_PARM_2
	sta	*_strncat_sloc0_1_0
	lda	(_strncat_PARM_2 + 1)
	sta	*(_strncat_sloc0_1_0 + 1)
	lda	_strncat_front_1_1
	sta	*_strncat_sloc2_1_0
	lda	(_strncat_front_1_1 + 1)
	sta	*(_strncat_sloc2_1_0 + 1)
	lda	_strncat_PARM_3
	sta	*_strncat_sloc3_1_0
	lda	(_strncat_PARM_3 + 1)
	sta	*(_strncat_sloc3_1_0 + 1)
00106$:
	mov	*_strncat_sloc3_1_0,*_strncat_sloc4_1_0
	mov	*(_strncat_sloc3_1_0 + 1),*(_strncat_sloc4_1_0 + 1)
	lda	*(_strncat_sloc3_1_0 + 1)
	sub	#0x01
	sta	*(_strncat_sloc3_1_0 + 1)
	lda	*_strncat_sloc3_1_0
	sbc	#0x00
	sta	*_strncat_sloc3_1_0
	lda	*(_strncat_sloc4_1_0 + 1)
	ora	*_strncat_sloc4_1_0
	beq	00108$
00118$:
;../_strncat.c:39: if (!(*front++ = *back++))
	ldhx	*_strncat_sloc0_1_0
	lda	,x
	aix	#1
	sta	*_strncat_sloc4_1_0
	sthx	*_strncat_sloc0_1_0
	ldhx	*_strncat_sloc2_1_0
	lda	*_strncat_sloc4_1_0
	sta	,x
	aix	#1
	sthx	*_strncat_sloc2_1_0
	lda	*_strncat_sloc2_1_0
	sta	_strncat_front_1_1
	lda	*(_strncat_sloc2_1_0 + 1)
	sta	(_strncat_front_1_1 + 1)
	tst	*_strncat_sloc4_1_0
	bne	00106$
00119$:
;../_strncat.c:40: return(start);
	ldx	_strncat_start_1_1
	lda	(_strncat_start_1_1 + 1)
	rts
00108$:
;../_strncat.c:42: *front = '\0';
	lda	_strncat_front_1_1
	ldx	(_strncat_front_1_1 + 1)
	psha
	pulh
	clra
	sta	,x
;../_strncat.c:43: return(start);
	ldx	_strncat_start_1_1
	lda	(_strncat_start_1_1 + 1)
00109$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
