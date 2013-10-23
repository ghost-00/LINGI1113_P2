;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:12 2013
;--------------------------------------------------------
	.module rand
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _srand
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_next:
	.ds 4
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
;../rand.c:27: static unsigned long int next = 1;
	ld	hl,#_next
	ld	(hl),#0x01
	xor	a,a
	ld	hl,#_next + 1
	ld	(hl),a
	ld	hl,#_next + 2
	ld	(hl),a
	ld	hl,#_next + 3
	ld	(hl),a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../rand.c:29: int rand(void)
;	---------------------------------
; Function rand
; ---------------------------------
_rand_start::
_rand:
	
	push	af
	push	af
;../rand.c:31: next = next * 1103515245UL + 12345;
	ld	hl,#_next + 2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#_next
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x41C6
	push	hl
	ld	hl,#0x41C64E6D
	push	hl
	call	__mullong_rrx_s
	lda	sp,8(sp)
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
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	add	a,#0x39
	ld	e,a
	ld	a,d
	adc	a,#0x30
	push	af
	ld	hl,#_next + 1
	ld	(hl),a
	ld	hl,#_next
	ld	(hl),e
	lda	hl,5(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	af
	ld	a,e
	adc	a,#0x00
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	hl,#_next + 3
	ld	(hl),a
	ld	hl,#_next + 2
	ld	(hl),e
;../rand.c:32: return (unsigned int)(next/65536) % (RAND_MAX + 1U);
	ld	a,#0x10
	push	af
	inc	sp
	ld	hl,#_next + 2
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#_next
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rrulong_rrx_s
	lda	sp,5(sp)
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
	lda	hl,0(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	e,c
	ld	a,b
	and	a,#0x7F
	ld	d,a
00101$:
	lda	sp,4(sp)
	ret
_rand_end::
;../rand.c:35: void srand(unsigned int seed)
;	---------------------------------
; Function srand
; ---------------------------------
_srand_start::
_srand:
	
;../rand.c:37: next = seed;
	lda	hl,2(sp)
	ld	a,(hl)
	ld	hl,#_next
	ld	(hl),a
	lda	hl,3(sp)
	ld	a,(hl)
	ld	hl,#_next + 1
	ld	(hl),a
	ld	hl,#_next + 2
	ld	(hl),#0x00
	ld	hl,#_next + 3
	ld	(hl),#0x00
00101$:
	
	ret
_srand_end::
	.area _CODE
	.area _CABS
