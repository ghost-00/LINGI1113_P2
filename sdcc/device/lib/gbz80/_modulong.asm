;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:11 2013
;--------------------------------------------------------
	.module _modulong
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __modulong
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
;../_modulong.c:337: _modulong (unsigned long a, unsigned long b)
;	---------------------------------
; Function _modulong
; ---------------------------------
__modulong_start::
__modulong:
	lda	sp,-8(sp)
;../_modulong.c:339: unsigned char count = 0;
;../_modulong.c:341: while (!MSB_SET(b))
	ld	bc,#0x0000
00103$:
	lda	hl,17(sp)
	ld	a,(hl)
	rlc	a
	and	a,#0x01
	jp	NZ,00117$
;../_modulong.c:343: b <<= 1;
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rlulong_rrx_s
	lda	sp,5(sp)
	push	hl
	lda	hl,8(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,14(sp)
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
;../_modulong.c:344: if (b > a)
	lda	hl,10(sp)
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
	jp	NC,00102$
;../_modulong.c:346: b >>=1;
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rrulong_rrx_s
	lda	sp,5(sp)
	push	hl
	lda	hl,8(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	bc
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,14(sp)
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
;../_modulong.c:347: break;
	jp	00117$
00102$:
;../_modulong.c:349: count++;
	inc	b
	ld	c,b
	jp	00103$
;../_modulong.c:351: do
00117$:
	ld	b,c
00108$:
;../_modulong.c:353: if (a >= b)
	lda	hl,10(sp)
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
	jp	C,00107$
;../_modulong.c:354: a -= b;
	lda	hl,11(sp)
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
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,15(sp)
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
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
00107$:
;../_modulong.c:355: b >>= 1;
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,19(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rrulong_rrx_s
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
	lda	hl,14(sp)
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
;../_modulong.c:357: while (count--);
	ld	c,b
	dec	b
	xor	a,a
	or	a,c
	jp	NZ,00108$
;../_modulong.c:359: return a;
	lda	hl,11(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00111$:
	lda	sp,8(sp)
	ret
__modulong_end::
	.area _CODE
	.area _CABS
