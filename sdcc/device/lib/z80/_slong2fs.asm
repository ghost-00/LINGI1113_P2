;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:06 2013
;--------------------------------------------------------
	.module _slong2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___slong2fs
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../_slong2fs.c:69: float __slong2fs (signed long sl) {
;	---------------------------------
; Function __slong2fs
; ---------------------------------
___slong2fs_start::
___slong2fs:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_slong2fs.c:70: if (sl<0) 
	bit	7,7 (ix)
	jr	Z,00102$
;../_slong2fs.c:71: return -__ulong2fs(-sl);
	xor	a,a
	sbc	a,4 (ix)
	ld	c,a
	ld	a,#0x00
	sbc	a,5 (ix)
	ld	b,a
	ld	a,#0x00
	sbc	a,6 (ix)
	ld	e,a
	ld	a,#0x00
	sbc	a,7 (ix)
	ld	d,a
	push	de
	push	bc
	call	___ulong2fs
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	a,d
	xor	a,#0x80
	ld	d,a
	ld	l,c
	ld	h,b
	jr	00104$
00102$:
;../_slong2fs.c:73: return __ulong2fs(sl);
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	push	bc
	call	___ulong2fs
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
00104$:
	pop	ix
	ret
___slong2fs_end::
	.area _CODE
	.area _CABS
