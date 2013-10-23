;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _memcpy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
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
;../_memcpy.c:31: void * memcpy (
;	---------------------------------
; Function memcpy
; ---------------------------------
_memcpy_start::
_memcpy:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../_memcpy.c:41: char * d = dst;
	ld	e,4 (ix)
	ld	d,5 (ix)
;../_memcpy.c:42: char * s = src;
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	c,l
	ld	b,h
;../_memcpy.c:44: int count = -(acount >> 2);
	ld	l,8 (ix)
	ld	h,9 (ix)
	srl	h
	rr	l
	srl	h
	rr	l
	xor	a,a
	sbc	a,l
	ld	l,a
	ld	a,#0x00
	sbc	a,h
	ld	h,a
	ld	-2 (ix),l
	ld	-1 (ix),h
;../_memcpy.c:46: while (count) {
00101$:
	ld	a,-2 (ix)
	or	a,-1 (ix)
	jr	Z,00103$
;../_memcpy.c:47: *d++ = *s++;
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
;../_memcpy.c:48: *d++ = *s++;
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
;../_memcpy.c:49: *d++ = *s++;
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
;../_memcpy.c:50: *d++ = *s++;
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
;../_memcpy.c:51: count++;
	inc	-2 (ix)
	jr	NZ,00101$
	inc	-1 (ix)
	jr	00101$
00103$:
;../_memcpy.c:54: if (acount & 2) {
	ld	a,8 (ix)
	and	a,#0x02
	jr	Z,00105$
;../_memcpy.c:55: *d++ = *s++; 
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
;../_memcpy.c:56: *d++ = *s++;
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
00105$:
;../_memcpy.c:58: if (acount & 1) {
	ld	a,8 (ix)
	and	a,#0x01
	jr	Z,00107$
;../_memcpy.c:59: *d++ = *s++;
	ld	a,(bc)
	ld	(de),a
00107$:
;../_memcpy.c:61: return dst;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	sp,ix
	pop	ix
	ret
_memcpy_end::
	.area _CODE
	.area _CABS
