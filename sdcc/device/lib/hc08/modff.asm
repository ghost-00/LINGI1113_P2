;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module modff
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
	.globl _modff_PARM_2
	.globl _modff_PARM_1
	.globl _modff
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
_modff_sloc0_1_0:
	.ds 2
_modff_sloc1_1_0:
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
_modff_PARM_1:
	.ds 4
_modff_PARM_2:
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
;Allocation info for local variables in function 'modff'
;------------------------------------------------------------
;sloc0                     Allocated with name '_modff_sloc0_1_0'
;sloc1                     Allocated with name '_modff_sloc1_1_0'
;x                         Allocated with name '_modff_PARM_1'
;y                         Allocated with name '_modff_PARM_2'
;------------------------------------------------------------
;../modff.c:23: float modff(float x, float * y)
;	-----------------------------------------
;	 function modff
;	-----------------------------------------
_modff:
;../modff.c:25: *y=(long)x;
	lda	_modff_PARM_2
	sta	*_modff_sloc0_1_0
	lda	(_modff_PARM_2 + 1)
	sta	*(_modff_sloc0_1_0 + 1)
	lda	_modff_PARM_1
	sta	___fs2slong_PARM_1
	lda	(_modff_PARM_1 + 1)
	sta	(___fs2slong_PARM_1 + 1)
	lda	(_modff_PARM_1 + 2)
	sta	(___fs2slong_PARM_1 + 2)
	lda	(_modff_PARM_1 + 3)
	sta	(___fs2slong_PARM_1 + 3)
	jsr	___fs2slong
	sta	(___slong2fs_PARM_1 + 3)
	stx	(___slong2fs_PARM_1 + 2)
	lda	*__ret2
	sta	(___slong2fs_PARM_1 + 1)
	lda	*__ret3
	sta	___slong2fs_PARM_1
	jsr	___slong2fs
	sta	*(_modff_sloc1_1_0 + 3)
	stx	*(_modff_sloc1_1_0 + 2)
	mov	*__ret2,*(_modff_sloc1_1_0 + 1)
	mov	*__ret3,*_modff_sloc1_1_0
	ldhx	*_modff_sloc0_1_0
	lda	*_modff_sloc1_1_0
	sta	,x
	aix	#1
	lda	*(_modff_sloc1_1_0 + 1)
	sta	,x
	aix	#1
	lda	*(_modff_sloc1_1_0 + 2)
	sta	,x
	aix	#1
	lda	*(_modff_sloc1_1_0 + 3)
	sta	,x
;../modff.c:26: return (x-*y);
	lda	_modff_PARM_1
	sta	___fssub_PARM_1
	lda	(_modff_PARM_1 + 1)
	sta	(___fssub_PARM_1 + 1)
	lda	(_modff_PARM_1 + 2)
	sta	(___fssub_PARM_1 + 2)
	lda	(_modff_PARM_1 + 3)
	sta	(___fssub_PARM_1 + 3)
	lda	*_modff_sloc1_1_0
	sta	___fssub_PARM_2
	lda	*(_modff_sloc1_1_0 + 1)
	sta	(___fssub_PARM_2 + 1)
	lda	*(_modff_sloc1_1_0 + 2)
	sta	(___fssub_PARM_2 + 2)
	lda	*(_modff_sloc1_1_0 + 3)
	sta	(___fssub_PARM_2 + 3)
	jsr	___fssub
	sta	*(_modff_sloc1_1_0 + 3)
	stx	*(_modff_sloc1_1_0 + 2)
	mov	*__ret2,*(_modff_sloc1_1_0 + 1)
	mov	*__ret3,*_modff_sloc1_1_0
	mov	*_modff_sloc1_1_0,*__ret3
	mov	*(_modff_sloc1_1_0 + 1),*__ret2
	ldx	*(_modff_sloc1_1_0 + 2)
	lda	*(_modff_sloc1_1_0 + 3)
00101$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
