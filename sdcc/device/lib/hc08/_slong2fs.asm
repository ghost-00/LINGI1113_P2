;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module _slong2fs
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
	.globl ___slong2fs_PARM_1
	.globl ___slong2fs
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
___slong2fs_sloc0_1_0:
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
___slong2fs_PARM_1:
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
;Allocation info for local variables in function '__slong2fs'
;------------------------------------------------------------
;sloc0                     Allocated with name '___slong2fs_sloc0_1_0'
;sl                        Allocated with name '___slong2fs_PARM_1'
;------------------------------------------------------------
;../_slong2fs.c:69: float __slong2fs (signed long sl) {
;	-----------------------------------------
;	 function __slong2fs
;	-----------------------------------------
___slong2fs:
;../_slong2fs.c:70: if (sl<0) 
	lda	___slong2fs_PARM_1
	sub	#0x00
	bge	00102$
00107$:
;../_slong2fs.c:71: return -__ulong2fs(-sl);
	clra
	sub	(___slong2fs_PARM_1 + 3)
	sta	(___ulong2fs_PARM_1 + 3)
	clra
	sbc	(___slong2fs_PARM_1 + 2)
	sta	(___ulong2fs_PARM_1 + 2)
	clra
	sbc	(___slong2fs_PARM_1 + 1)
	sta	(___ulong2fs_PARM_1 + 1)
	clra
	sbc	___slong2fs_PARM_1
	sta	___ulong2fs_PARM_1
	jsr	___ulong2fs
	sta	*(___slong2fs_sloc0_1_0 + 3)
	stx	*(___slong2fs_sloc0_1_0 + 2)
	mov	*__ret2,*(___slong2fs_sloc0_1_0 + 1)
	mov	*__ret3,*___slong2fs_sloc0_1_0
	lda	*___slong2fs_sloc0_1_0
	eor	#0x80
	sta	*___slong2fs_sloc0_1_0
	mov	*___slong2fs_sloc0_1_0,*__ret3
	mov	*(___slong2fs_sloc0_1_0 + 1),*__ret2
	ldx	*(___slong2fs_sloc0_1_0 + 2)
	lda	*(___slong2fs_sloc0_1_0 + 3)
	rts
00102$:
;../_slong2fs.c:73: return __ulong2fs(sl);
	lda	___slong2fs_PARM_1
	sta	___ulong2fs_PARM_1
	lda	(___slong2fs_PARM_1 + 1)
	sta	(___ulong2fs_PARM_1 + 1)
	lda	(___slong2fs_PARM_1 + 2)
	sta	(___ulong2fs_PARM_1 + 2)
	lda	(___slong2fs_PARM_1 + 3)
	sta	(___ulong2fs_PARM_1 + 3)
	jsr	___ulong2fs
	sta	*(___slong2fs_sloc0_1_0 + 3)
	stx	*(___slong2fs_sloc0_1_0 + 2)
	mov	*__ret2,*(___slong2fs_sloc0_1_0 + 1)
	mov	*__ret3,*___slong2fs_sloc0_1_0
	mov	*___slong2fs_sloc0_1_0,*__ret3
	mov	*(___slong2fs_sloc0_1_0 + 1),*__ret2
	ldx	*(___slong2fs_sloc0_1_0 + 2)
	lda	*(___slong2fs_sloc0_1_0 + 3)
00104$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
