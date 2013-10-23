;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:10 2013
;--------------------------------------------------------
	.module _fs2schar
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2schar
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
;../_fs2schar.c:77: signed char __fs2schar (float f)
;	---------------------------------
; Function __fs2schar
; ---------------------------------
___fs2schar_start::
___fs2schar:
	
	push	af
	push	af
;../_fs2schar.c:79: signed long sl=__fs2slong(f);
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	___fs2slong
	lda	sp,4(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../_fs2schar.c:80: if (sl>=SCHAR_MAX)
	lda	hl,0(sp)
	ld	a,(hl)
	sub	a,#0x7F
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	inc	hl
	ld	a,(hl)
	sbc	a,#0x00
	rlca
	jp	C,00102$
;../_fs2schar.c:81: return SCHAR_MAX;
	ld	e,#0x7F
	jp	00105$
00102$:
;../_fs2schar.c:82: if (sl<=SCHAR_MIN)
	ld	a,#0x80
	lda	hl,0(sp)
	sub	a,(hl)
	ld	a,#0xFF
	inc	hl
	sbc	a,(hl)
	ld	a,#0xFF
	inc	hl
	sbc	a,(hl)
	ld	a,#0xFF
	inc	hl
	sbc	a,(hl)
	rlca
	jp	C,00104$
;../_fs2schar.c:83: return -SCHAR_MIN;
	ld	e,#0x80
	jp	00105$
00104$:
;../_fs2schar.c:84: return sl;
	lda	hl,0(sp)
	ld	e,(hl)
00105$:
	lda	sp,4(sp)
	ret
___fs2schar_end::
	.area _CODE
	.area _CABS
