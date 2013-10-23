;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:12 2013
;--------------------------------------------------------
	.module _memcmp
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcmp
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
	
	push	af
;../_memcmp.c:32: if (!count)
	lda	hl,8(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	NZ,00112$
;../_memcmp.c:33: return(0);
	ld	de,#0x0000
	jp	00107$
;../_memcmp.c:35: while ( --count && *((char *)buf1) == *((char *)buf2) ) {
00112$:
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
00104$:
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00106$
	lda	hl,5(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	inc	hl
	inc	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	a,b
	sub	a,c
	jp	NZ,00106$
	jr	00115$
00114$:
	jp	00106$
00115$:
;../_memcmp.c:36: buf1 = (char *)buf1 + 1;
	dec	hl
	dec	hl
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0001
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
;../_memcmp.c:37: buf2 = (char *)buf2 + 1;
	inc	hl
	inc	hl
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0001
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,6(sp)
	ld	(hl+),a
	ld	(hl),d
	jp	00104$
00106$:
;../_memcmp.c:40: return( *((unsigned char *)buf1) - *((unsigned char *)buf2) );
	lda	hl,5(sp)
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ld	c,a
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),#0x00
	lda	hl,7(sp)
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	ld	d,a
00107$:
	lda	sp,2(sp)
	ret
_memcmp_end::
	.area _CODE
	.area _CABS
