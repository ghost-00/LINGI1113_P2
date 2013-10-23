;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:11 2013
;--------------------------------------------------------
	.module _divulong
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __divulong
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
;../_divulong.c:327: _divulong (unsigned long x, unsigned long y)
;	---------------------------------
; Function _divulong
; ---------------------------------
__divulong_start::
__divulong:
	lda	sp,-8(sp)
;../_divulong.c:329: unsigned long reste = 0L;
	xor	a,a
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl),a
;../_divulong.c:333: do
	ld	b,#0x20
00105$:
;../_divulong.c:336: c = MSB_SET(x);
	lda	hl,13(sp)
	ld	a,(hl)
	rlc	a
	and	a,#0x01
	ld	c,a
;../_divulong.c:337: x <<= 1;
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,15(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rlulong_rrx_s
	lda	sp,5(sp)
	push	hl
	lda	hl,4(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,0(sp)
	ld	d,h
	ld	e,l
	lda	hl,10(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_divulong.c:338: reste <<= 1;
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rlulong_rrx_s
	lda	sp,5(sp)
	push	hl
	lda	hl,4(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,0(sp)
	ld	d,h
	ld	e,l
	lda	hl,4(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../_divulong.c:339: if (c)
	xor	a,a
	or	a,c
	jp	Z,00102$
;../_divulong.c:340: reste |= 1L;
	lda	hl,4(sp)
	ld	a,(hl)
	or	a,#0x01
	ld	(hl),a
00102$:
;../_divulong.c:342: if (reste >= y)
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,14(sp)
	ld	a,(de)
	sub	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	jp	C,00106$
;../_divulong.c:344: reste -= y;
	lda	hl,5(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,14(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	lda	hl,7(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,18(sp)
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	lda	hl,7(sp)
	ld	(hl-),a
	ld	(hl),e
;../_divulong.c:346: x |= 1L;
	lda	hl,10(sp)
	ld	a,(hl)
	or	a,#0x01
	ld	(hl),a
00106$:
;../_divulong.c:349: while (--count);
	dec	b
	xor	a,a
	or	a,b
	jp	NZ,00105$
;../_divulong.c:350: return x;
	lda	hl,11(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00108$:
	lda	sp,8(sp)
	ret
__divulong_end::
	.area _CODE
	.area _CABS
