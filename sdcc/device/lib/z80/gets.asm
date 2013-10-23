;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module gets
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gets
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
;../gets.c:3: char * gets(char *s) {
;	---------------------------------
; Function gets
; ---------------------------------
_gets_start::
_gets:
	push	ix
	ld	ix,#0
	add	ix,sp
;../gets.c:5: unsigned int count=0;
	ld	bc,#0x0000
;../gets.c:7: while (1) {
00109$:
;../gets.c:8: c=getchar();
	push	bc
	call	_getchar
	pop	bc
	ld	e,l
;../gets.c:9: switch(c) {
	ld	a,e
	sub	a,#0x08
	jr	Z,00101$
	ld	a,e
	sub	a,#0x0A
	jr	Z,00105$
	ld	a,e
	sub	a,#0x0D
	jr	Z,00105$
	jr	00106$
;../gets.c:10: case '\b': // backspace
00101$:
;../gets.c:11: if (count) {
	ld	a,c
	or	a,b
	jr	Z,00109$
;../gets.c:12: putchar ('\b');
	push	bc
	ld	a,#0x08
	push	af
	inc	sp
	call	_putchar
	inc	sp
	ld	a,#0x20
	push	af
	inc	sp
	call	_putchar
	inc	sp
	ld	a,#0x08
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	bc
;../gets.c:15: s--;
	ld	l,4 (ix)
	ld	h,5 (ix)
	dec	hl
	ld	4 (ix),l
	ld	5 (ix),h
;../gets.c:16: count--;
	dec	bc
;../gets.c:18: break;
	jr	00109$
;../gets.c:20: case '\r': // CR or LF
00105$:
;../gets.c:21: putchar('\r');
	ld	a,#0x0D
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../gets.c:22: putchar('\n');
	ld	a,#0x0A
	push	af
	inc	sp
	call	_putchar
	inc	sp
;../gets.c:23: *s=0;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),#0x00
;../gets.c:24: return s;
	jr	00111$
;../gets.c:25: default:
00106$:
;../gets.c:26: *s++=c;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),e
	ld	a,l
	add	a,#0x01
	ld	4 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	5 (ix),a
;../gets.c:27: count++;
	inc	bc
;../gets.c:28: putchar(c);
	push	bc
	ld	a,e
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	bc
;../gets.c:30: }
	jp	00109$
00111$:
	pop	ix
	ret
_gets_end::
	.area _CODE
	.area _CABS
