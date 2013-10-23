;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _strcat
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strcat
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
;../_strcat.c:26: char * strcat (
;	---------------------------------
; Function strcat
; ---------------------------------
_strcat_start::
_strcat:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_strcat.c:31: char * cp = dst;
	ld	l,4 (ix)
	ld	h,5 (ix)
;../_strcat.c:33: while( *cp )
	ld	c,l
	ld	b,h
00101$:
	ld	a,(bc)
	or	a,a
	jr	Z,00111$
;../_strcat.c:34: cp++;                   /* find end of dst */
	inc	bc
	jr	00101$
;../_strcat.c:36: while( *cp++ = *src++ ) ;       /* Copy src to end of dst */
00111$:
	ld	e,6 (ix)
	ld	d,7 (ix)
00104$:
	ld	a,(de)
	inc	de
	ld	(bc),a
	inc	bc
	or	a,a
	jr	NZ,00104$
;../_strcat.c:38: return( dst );                  /* return dst */
	ld	l,4 (ix)
	ld	h,5 (ix)
	pop	ix
	ret
_strcat_end::
	.area _CODE
	.area _CABS
