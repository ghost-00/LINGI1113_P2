;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _strncpy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncpy
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
;../_strncpy.c:26: char *strncpy (
;	---------------------------------
; Function strncpy
; ---------------------------------
_strncpy_start::
_strncpy:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;../_strncpy.c:31: register char * d1 =  d;
	ld	c,4 (ix)
	ld	b,5 (ix)
;../_strncpy.c:33: while ( n && *s )
	ld	e,8 (ix)
	ld	d,9 (ix)
	ld	a,6 (ix)
	ld	-2 (ix),a
	ld	a,7 (ix)
	ld	-1 (ix),a
	ld	-4 (ix),c
	ld	-3 (ix),b
00102$:
	ld	a,e
	or	a,d
	jr	Z,00114$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	l,(hl)
	xor	a,a
	or	a,l
	jr	Z,00114$
;../_strncpy.c:35: n-- ;
	dec	de
;../_strncpy.c:36: *d++ = *s++ ;
	ld	a,l
	inc	-2 (ix)
	jr	NZ,00117$
	inc	-1 (ix)
00117$:
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),a
	inc	-4 (ix)
	jr	NZ,00102$
	inc	-3 (ix)
	jr	00102$
;../_strncpy.c:38: while ( n-- )
00114$:
00105$:
	ld	l,e
	ld	h,d
	dec	de
	ld	a,l
	or	a,h
	jr	Z,00107$
;../_strncpy.c:40: *d++ = '\0' ;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
	inc	-4 (ix)
	jr	NZ,00105$
	inc	-3 (ix)
	jr	00105$
00107$:
;../_strncpy.c:42: return d1;
	ld	l,c
	ld	h,b
	ld	sp,ix
	pop	ix
	ret
_strncpy_end::
	.area _CODE
	.area _CABS
