;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:13 2013
;--------------------------------------------------------
	.module gets
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gets
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
	lda	sp,-5(sp)
;../gets.c:5: unsigned int count=0;
	lda	hl,2(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;../gets.c:7: while (1) {
00109$:
;../gets.c:8: c=getchar();
	call	_getchar
	ld	c,e
	lda	hl,4(sp)
	ld	(hl),c
;../gets.c:9: switch(c) {
	ld	a,(hl)
	sub	a,#0x08
	jp	Z,00101$
00118$:
	ld	a,(hl)
	sub	a,#0x0A
	jp	Z,00105$
00119$:
	ld	a,(hl)
	sub	a,#0x0D
	jp	Z,00105$
00120$:
	jp	00106$
;../gets.c:10: case '\b': // backspace
00101$:
;../gets.c:11: if (count) {
	lda	hl,2(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00109$
;../gets.c:12: putchar ('\b');
	ld	a,#0x08
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
;../gets.c:13: putchar (' ');
	ld	a,#0x20
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
;../gets.c:14: putchar ('\b');
	ld	a,#0x08
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
;../gets.c:15: s--;
	lda	hl,8(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../gets.c:16: count--;
	lda	hl,3(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../gets.c:18: break;
	jp	00109$
;../gets.c:20: case '\r': // CR or LF
00105$:
;../gets.c:21: putchar('\r');
	ld	a,#0x0D
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
;../gets.c:22: putchar('\n');
	ld	a,#0x0A
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
;../gets.c:23: *s=0;
	lda	hl,7(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x00
	ld	(de),a
;../gets.c:24: return s;
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00111$
;../gets.c:25: default:
00106$:
;../gets.c:26: *s++=c;
	lda	hl,8(sp)
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(bc),a
	ld	hl,#0x0001
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,7(sp)
	ld	(hl+),a
	ld	(hl),d
;../gets.c:27: count++;
	lda	hl,2(sp)
	inc	(hl)
	jr	NZ,00121$
	inc	hl
	inc	(hl)
00121$:
;../gets.c:28: putchar(c);
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
;../gets.c:30: }
	jp	00109$
00111$:
	lda	sp,5(sp)
	ret
_gets_end::
	.area _CODE
	.area _CABS
