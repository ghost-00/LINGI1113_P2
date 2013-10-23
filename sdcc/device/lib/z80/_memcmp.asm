;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _memcmp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcmp
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
;../_memcmp.c:26: int memcmp (
;	---------------------------------
; Function memcmp
; ---------------------------------
_memcmp_start::
_memcmp:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;../_memcmp.c:32: if (!count)
	ld	a,8 (ix)
	or	a,9 (ix)
	jr	NZ,00112$
;../_memcmp.c:33: return(0);
	ld	hl,#0x0000
	jp	00107$
;../_memcmp.c:35: while ( --count && *((char *)buf1) == *((char *)buf2) ) {
00112$:
	ld	c,8 (ix)
	ld	b,9 (ix)
00104$:
	dec	bc
	ld	a,c
	or	a,b
	jr	Z,00106$
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	a,(hl)
	ld	-1 (ix),a
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	a,(de)
	ld	l,a
	push	bc
;	direct compare
	ld	c,-1 (ix)
	ld	a,l
	sub	a,c
	jr	NZ,00114$
	pop	bc
	jr	00115$
00114$:
	pop	bc
	jr	00106$
00115$:
;../_memcmp.c:36: buf1 = (char *)buf1 + 1;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	a,l
	add	a,#0x01
	ld	4 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	5 (ix),a
;../_memcmp.c:37: buf2 = (char *)buf2 + 1;
	ex	de,hl
	ld	a,l
	add	a,#0x01
	ld	6 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	7 (ix),a
	jr	00104$
00106$:
;../_memcmp.c:40: return( *((unsigned char *)buf1) - *((unsigned char *)buf2) );
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	l,(hl)
	ld	c,l
	ld	b,#0x00
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	l,(hl)
	ld	h,#0x00
	ld	a,c
	sub	a,l
	ld	l,a
	ld	a,b
	sbc	a,h
	ld	h,a
00107$:
	ld	sp,ix
	pop	ix
	ret
_memcmp_end::
	.area _CODE
	.area _CABS
