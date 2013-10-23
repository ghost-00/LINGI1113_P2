;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module _uchar2fs
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
	.globl ___uchar2fs
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
___uchar2fs_sloc0_1_0:
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
;Allocation info for local variables in function '__uchar2fs'
;------------------------------------------------------------
;sloc0                     Allocated with name '___uchar2fs_sloc0_1_0'
;uc                        Allocated to registers 
;------------------------------------------------------------
;../_uchar2fs.c:45: float __uchar2fs (unsigned char uc) {
;	-----------------------------------------
;	 function __uchar2fs
;	-----------------------------------------
___uchar2fs:
;../_uchar2fs.c:46: return __ulong2fs(uc);
	sta	(___ulong2fs_PARM_1 + 3)
	clrx
	stx	(___ulong2fs_PARM_1 + 2)
	clrx
	stx	(___ulong2fs_PARM_1 + 1)
	clrx
	stx	___ulong2fs_PARM_1
	jsr	___ulong2fs
	sta	*(___uchar2fs_sloc0_1_0 + 3)
	stx	*(___uchar2fs_sloc0_1_0 + 2)
	mov	*__ret2,*(___uchar2fs_sloc0_1_0 + 1)
	mov	*__ret3,*___uchar2fs_sloc0_1_0
	mov	*___uchar2fs_sloc0_1_0,*__ret3
	mov	*(___uchar2fs_sloc0_1_0 + 1),*__ret2
	ldx	*(___uchar2fs_sloc0_1_0 + 2)
	lda	*(___uchar2fs_sloc0_1_0 + 3)
00101$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
