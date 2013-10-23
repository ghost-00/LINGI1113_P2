;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:08 2013
;--------------------------------------------------------
	.module _atoi
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _atoi
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
;../_atoi.c:25: int atoi(char * s)
;	---------------------------------
; Function atoi
; ---------------------------------
_atoi_start::
_atoi:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;../_atoi.c:27: register int rv=0; 
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
;../_atoi.c:31: while (*s) {
	ld	e,4 (ix)
	ld	d,5 (ix)
00107$:
	ld	a,(de)
	ld	l,a
	or	a,a
	jr	Z,00133$
;../_atoi.c:32: if (*s <= '9' && *s >= '0')
	ld	a,#0x39
	sub	a,l
	jp	M,00102$
	ld	a,l
	sub	a,#0x30
	jp	P,00133$
;../_atoi.c:33: break;
00102$:
;../_atoi.c:34: if (*s == '-' || *s == '+') 
	ld	a,(de)
	ld	l,a
	sub	a,#0x2D
	jr	Z,00133$
	ld	a,l
	sub	a,#0x2B
	jr	Z,00133$
;../_atoi.c:36: s++;
	inc	de
	jr	00107$
00133$:
	ld	4 (ix),e
	ld	5 (ix),d
;../_atoi.c:39: sign = (*s == '-');
	ld	c,e
	ld	b,d
	ld	a,(de)
	ld	l,a
	sub	a,#0x2D
	jr	NZ,00137$
	ld	a,#0x01
	jr	00138$
00137$:
	xor	a,a
00138$:
	ld	e,a
	ld	d,e
;../_atoi.c:40: if (*s == '-' || *s == '+') s++;
	xor	a,a
	or	a,e
	jr	NZ,00110$
	ld	a,l
	sub	a,#0x2B
	jr	NZ,00131$
00110$:
	ld	hl,#0x0001
	add	hl,bc
	ld	4 (ix),l
	ld	5 (ix),h
;../_atoi.c:42: while (*s && *s >= '0' && *s <= '9') {
00131$:
	ld	a,4 (ix)
	ld	-4 (ix),a
	ld	a,5 (ix)
	ld	-3 (ix),a
00115$:
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	xor	a,a
	or	a,e
	jr	Z,00117$
	ld	a,e
	sub	a,#0x30
	jp	M,00117$
	ld	a,#0x39
	sub	a,e
	jp	M,00117$
;../_atoi.c:43: rv = (rv * 10) + (*s - '0');
	push	de
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,hl
	add	hl,de
	add	hl,hl
	pop	de
	ld	c,l
	ld	b,h
	ld	a,e
	ld	l,a
	rla	
	sbc	a,a
	ld	h,a
	ld	a,l
	add	a,#0xD0
	ld	l,a
	ld	a,h
	adc	a,#0xFF
	ld	h,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	-2 (ix),c
	ld	-1 (ix),b
;../_atoi.c:44: s++;
	inc	-4 (ix)
	jr	NZ,00115$
	inc	-3 (ix)
	jp	00115$
00117$:
;../_atoi.c:47: return (sign ? -rv : rv);
	xor	a,a
	or	a,d
	jr	Z,00120$
	xor	a,a
	sbc	a,-2 (ix)
	ld	c,a
	ld	a,#0x00
	sbc	a,-1 (ix)
	ld	b,a
	jr	00121$
00120$:
	ld	c,-2 (ix)
	ld	b,-1 (ix)
00121$:
	ld	l,c
	ld	h,b
	ld	sp,ix
	pop	ix
	ret
_atoi_end::
	.area _CODE
	.area _CABS
