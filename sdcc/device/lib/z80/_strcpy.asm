;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _strcpy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strcpy
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
;../_strcpy.c:29: char * strcpy (
;	---------------------------------
; Function strcpy
; ---------------------------------
_strcpy_start::
_strcpy:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_strcpy.c:34: register char * to = d;
	ld	l,4 (ix)
	ld	h,5 (ix)
;../_strcpy.c:35: register const char * from = s;
	ld	c,6 (ix)
	ld	b,7 (ix)
;../_strcpy.c:37: while (*to++ = *from++) ;
	ex	de,hl
00101$:
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
	or	a,a
	jr	NZ,00101$
;../_strcpy.c:39: return d;
	ld	l,4 (ix)
	ld	h,5 (ix)
	pop	ix
	ret
_strcpy_end::
	.area _CODE
	.area _CABS
