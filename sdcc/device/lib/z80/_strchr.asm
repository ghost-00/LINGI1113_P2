;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _strchr
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strchr
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
;../_strchr.c:26: char * strchr (
;	---------------------------------
; Function strchr
; ---------------------------------
_strchr_start::
_strchr:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_strchr.c:31: while (*string && *string != ch)
	ld	c,4 (ix)
	ld	b,5 (ix)
00102$:
	ld	a,(bc)
	ld	l,a
	or	a,a
	jr	Z,00104$
	ld	a,l
	sub	a,6 (ix)
	jr	Z,00104$
;../_strchr.c:32: string++;
	inc	bc
	jr	00102$
00104$:
;../_strchr.c:34: if (*string == ch)
	ld	a,(bc)
	sub	a,6 (ix)
	jr	NZ,00106$
;../_strchr.c:35: return(string);
	ld	l,c
	ld	h,b
	jr	00107$
00106$:
;../_strchr.c:36: return ( NULL );
	ld	hl,#0x0000
00107$:
	pop	ix
	ret
_strchr_end::
	.area _CODE
	.area _CABS
