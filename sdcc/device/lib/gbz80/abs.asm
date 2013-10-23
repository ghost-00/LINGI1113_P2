;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:12 2013
;--------------------------------------------------------
	.module abs
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _abs
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
;../abs.c:23: int abs(int j)
;	---------------------------------
; Function abs
; ---------------------------------
_abs_start::
_abs:
	
;../abs.c:25: return (j >= 0) ? j : -j;
	lda	hl,3(sp)
	ld	a,(hl)
	rlca
	and	a,#0x01
	ld	c,a
	or	a,a
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	c,a
	or	a,a
	jp	Z,00103$
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	jp	00104$
00103$:
	xor	a,a
	lda	hl,2(sp)
	ld	a,#0x00
	sbc	a,(hl)
	ld	c,a
	inc	hl
	ld	a,#0x00
	sbc	a,(hl)
	ld	b,a
00104$:
	ld	e,c
	ld	d,b
00101$:
	
	ret
_abs_end::
	.area _CODE
	.area _CABS
