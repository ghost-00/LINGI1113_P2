;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _strncmp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncmp
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
;../_strncmp.c:26: int strncmp (
;	---------------------------------
; Function strncmp
; ---------------------------------
_strncmp_start::
_strncmp:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;../_strncmp.c:32: if (!count)
	ld	a,8 (ix)
	or	a,9 (ix)
	jr	NZ,00114$
;../_strncmp.c:33: return(0);
	ld	hl,#0x0000
	jp	00108$
;../_strncmp.c:35: while (--count && *first && *first == *last) {
00114$:
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	a,8 (ix)
	ld	-2 (ix),a
	ld	a,9 (ix)
	ld	-1 (ix),a
00105$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	dec	hl
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	or	a,-1 (ix)
	jr	Z,00107$
	ld	a,(bc)
	ld	-3 (ix),a
	xor	a,a
	or	a,-3 (ix)
	jr	Z,00107$
	ld	a,(de)
	ld	l,a
	push	bc
;	direct compare
	ld	c,-3 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00116$
	pop	bc
	jr	00117$
00116$:
	pop	bc
	jr	00107$
00117$:
;../_strncmp.c:36: first++;
	inc	bc
;../_strncmp.c:37: last++;
	inc	de
	jr	00105$
00107$:
;../_strncmp.c:40: return( *first - *last );
	ld	a,(bc)
	ld	c,a
	rla	
	sbc	a,a
	ld	b,a
	ld	a,(de)
	ld	l,a
	rla	
	sbc	a,a
	ld	h,a
	ld	a,c
	sub	a,l
	ld	l,a
	ld	a,b
	sbc	a,h
	ld	h,a
00108$:
	ld	sp,ix
	pop	ix
	ret
_strncmp_end::
	.area _CODE
	.area _CABS
