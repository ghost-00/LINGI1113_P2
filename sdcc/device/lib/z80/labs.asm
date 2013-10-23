;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:08 2013
;--------------------------------------------------------
	.module labs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _labs
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
;../labs.c:23: long int labs(long int j)
;	---------------------------------
; Function labs
; ---------------------------------
_labs_start::
_labs:
	push	ix
	ld	ix,#0
	add	ix,sp
;../labs.c:25: return (j >= 0) ? j : -j;
	ld	a,7 (ix)
	rlca
	and	a,#0x01
	sub	a,#0x01
	ld	a,#0x00
	rla
	or	a,a
	jr	Z,00103$
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e,6 (ix)
	ld	d,7 (ix)
	jr	00104$
00103$:
	xor	a,a
	sbc	a,4 (ix)
	ld	c,a
	ld	a,#0x00
	sbc	a,5 (ix)
	ld	b,a
	ld	a,#0x00
	sbc	a,6 (ix)
	ld	e,a
	ld	a,#0x00
	sbc	a,7 (ix)
	ld	d,a
00104$:
	ld	l,c
	ld	h,b
	pop	ix
	ret
_labs_end::
	.area _CODE
	.area _CABS
