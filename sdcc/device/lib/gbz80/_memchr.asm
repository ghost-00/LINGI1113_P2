;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:12 2013
;--------------------------------------------------------
	.module _memchr
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memchr
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
;../_memchr.c:32: void *memchr(const void *s, int c, size_t n)
;	---------------------------------
; Function memchr
; ---------------------------------
_memchr_start::
_memchr:
	lda	sp,-6(sp)
;../_memchr.c:34: unsigned char *p = (unsigned char *)s;
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
;../_memchr.c:35: unsigned char *end = p + n;
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,2(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;../_memchr.c:39: return(0);
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
00103$:
;../_memchr.c:36: for(; p != end; p++)
	lda	hl,4(sp)
	ld	a,(hl)
	dec	hl
	dec	hl
	sub	a,(hl)
	jp	NZ,00112$
	lda	hl,5(sp)
	ld	a,(hl)
	dec	hl
	dec	hl
	sub	a,(hl)
	jp	Z,00106$
00112$:
;../_memchr.c:37: if(*p == c)
	inc	hl
	inc	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	lda	hl,10(sp)
	sub	a,(hl)
	jp	NZ,00105$
	ld	a,b
	inc	hl
	sub	a,(hl)
	jp	NZ,00105$
	jr	00114$
00113$:
	jp	00105$
00114$:
;../_memchr.c:38: return((void *)p);
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00107$
00105$:
;../_memchr.c:36: for(; p != end; p++)
	lda	hl,4(sp)
	inc	(hl)
	jr	NZ,00115$
	inc	hl
	inc	(hl)
00115$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00103$
00106$:
;../_memchr.c:39: return(0);
	ld	de,#0x0000
00107$:
	lda	sp,6(sp)
	ret
_memchr_end::
	.area _CODE
	.area _CABS
