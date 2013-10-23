;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _ispunct
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ispunct
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
;../_ispunct.c:27: char ispunct (unsigned char c)
;	---------------------------------
; Function ispunct
; ---------------------------------
_ispunct_start::
_ispunct:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_ispunct.c:29: if ( isprint (c) &&
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_isprint
	inc	sp
	xor	a,a
	or	a,l
	jr	Z,00102$
;../_ispunct.c:30: !islower(c) &&
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_islower
	inc	sp
	xor	a,a
	or	a,l
	jr	NZ,00102$
;../_ispunct.c:31: !isupper(c) &&
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_isupper
	inc	sp
	xor	a,a
	or	a,l
	jr	NZ,00102$
;../_ispunct.c:32: !isspace(c) &&
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_isspace
	inc	sp
	xor	a,a
	or	a,l
	jr	NZ,00102$
;../_ispunct.c:33: !isdigit(c) )
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_isdigit
	inc	sp
	xor	a,a
	or	a,l
	jr	NZ,00102$
;../_ispunct.c:34: return 1;
	ld	l,#0x01
	jr	00107$
00102$:
;../_ispunct.c:35: return 0;
	ld	l,#0x00
00107$:
	pop	ix
	ret
_ispunct_end::
	.area _CODE
	.area _CABS
