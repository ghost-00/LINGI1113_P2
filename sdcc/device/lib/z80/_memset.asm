;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _memset
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset
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
;../_memset.c:31: void * memset (
;	---------------------------------
; Function memset
; ---------------------------------
_memset_start::
_memset:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_memset.c:36: register unsigned char * ret = buf;
;../_memset.c:38: while (count--) {
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	c,7 (ix)
	ld	b,8 (ix)
00101$:
	ld	l,c
	ld	h,b
	dec	bc
	ld	a,l
	or	a,h
	jr	Z,00103$
;../_memset.c:39: *(unsigned char *) ret = ch;
	ld	a,6 (ix)
	ld	(de),a
;../_memset.c:40: ret = ((unsigned char *) ret) + 1;
	inc	de
	jr	00101$
00103$:
;../_memset.c:43: return buf ;
	ld	l,4 (ix)
	ld	h,5 (ix)
	pop	ix
	ret
_memset_end::
	.area _CODE
	.area _CABS
