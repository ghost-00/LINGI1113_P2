;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:11 2013
;--------------------------------------------------------
	.module _fsneq
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsneq
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
;../_fsneq.c:70: char __fsneq (float a1, float a2)
;	---------------------------------
; Function __fsneq
; ---------------------------------
___fsneq_start::
___fsneq:
	lda	sp,-16(sp)
;../_fsneq.c:74: fl1.f = a1;
	lda	hl,12(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	lda	hl,18(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_fsneq.c:75: fl2.f = a2;
	lda	hl,8(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	lda	hl,22(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../_fsneq.c:77: if (fl1.l == fl2.l)
	lda	hl,12(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,4(sp)
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
	lda	hl,8(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	ld	a,(hl)
	lda	hl,0(sp)
	sub	a,(hl)
	jp	NZ,00102$
	lda	hl,5(sp)
	ld	a,(hl)
	lda	hl,1(sp)
	sub	a,(hl)
	jp	NZ,00102$
	lda	hl,6(sp)
	ld	a,(hl)
	lda	hl,2(sp)
	sub	a,(hl)
	jp	NZ,00102$
	lda	hl,7(sp)
	ld	a,(hl)
	lda	hl,3(sp)
	sub	a,(hl)
	jp	NZ,00102$
	jr	00110$
00109$:
	jp	00102$
00110$:
;../_fsneq.c:78: return (0);
	ld	e,#0x00
	jp	00105$
00102$:
;../_fsneq.c:79: if (((fl1.l | fl2.l) & 0x7FFFFFFF) == 0)
	lda	hl,12(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
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
	lda	hl,8(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,4(sp)
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
	lda	hl,0(sp)
	ld	a,(hl)
	lda	hl,4(sp)
	or	a,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	a,(hl)
	lda	hl,5(sp)
	or	a,(hl)
	lda	hl,1(sp)
	ld	(hl+),a
	ld	a,(hl)
	lda	hl,6(sp)
	or	a,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	a,(hl)
	lda	hl,7(sp)
	or	a,(hl)
	lda	hl,3(sp)
	ld	(hl),a
	lda	hl,0(sp)
	ld	a,(hl)
	or	a,a
	jr	NZ,00111$
	inc	hl
	ld	a,(hl)
	or	a,a
	jr	NZ,00111$
	inc	hl
	ld	a,(hl)
	or	a,a
	jr	NZ,00111$
	inc	hl
	ld	a,(hl)
	and	a,#0x7F
	jr	NZ,00111$
	jp	00112$
00111$:
	jp	00104$
00112$:
;../_fsneq.c:80: return (0);
	ld	e,#0x00
	jp	00105$
00104$:
;../_fsneq.c:81: return (1);
	ld	e,#0x01
00105$:
	lda	sp,16(sp)
	ret
___fsneq_end::
	.area _CODE
	.area _CABS
