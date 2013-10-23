;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _strpbrk
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strpbrk
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
;../_strpbrk.c:26: char * strpbrk ( 
;	---------------------------------
; Function strpbrk
; ---------------------------------
_strpbrk_start::
_strpbrk:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_strpbrk.c:33: while ( ch = *string ) {
	ld	c,4 (ix)
	ld	b,5 (ix)
00103$:
	ld	a,(bc)
	ld	l,a
	ld	e,l
	xor	a,a
	or	a,l
	jr	Z,00105$
;../_strpbrk.c:34: if (strchr (control, ch ))
	push	bc
	ld	a,e
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_strchr
	pop	af
	inc	sp
	pop	bc
	ld	a,l
	or	a,h
	jr	Z,00103$
;../_strpbrk.c:35: return string ;
	ld	l,c
	ld	h,b
	jr	00106$
00105$:
;../_strpbrk.c:38: return (NULL);
	ld	hl,#0x0000
00106$:
	pop	ix
	ret
_strpbrk_end::
	.area _CODE
	.area _CABS
