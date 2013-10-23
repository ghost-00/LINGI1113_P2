;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:10 2013
;--------------------------------------------------------
	.module printf
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __buf_emitter
	.globl __char_emitter
	.globl __printf
	.globl _printf
	.globl _sprintf
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
;printf.c:10: static void _printn(unsigned u, unsigned base, char issigned, void (*emitter)(char, void *), void *pData)
;	---------------------------------
; Function _printn
; ---------------------------------
__printn:
	
;printf.c:12: const char *_hex = "0123456789ABCDEF";
;printf.c:13: if (issigned && ((int)u < 0)) {
	xor	a,a
	lda	hl,6(sp)
	or	a,(hl)
	jp	Z,00102$
	lda	hl,3(sp)
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,b
	bit	7,a
	jp	Z,00102$
;printf.c:14: (*emitter)('-', pData);
	push	bc
	lda	hl,11(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00111$
	push	hl
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00111$:
	lda	sp,3(sp)
	pop	bc
;printf.c:15: u = (unsigned)-((int)u);
	xor	a,a
	sbc	a,c
	ld	c,a
	ld	a,#0x00
	sbc	a,b
	ld	b,a
	lda	hl,2(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00102$:
;printf.c:17: if (u >= base)
	lda	hl,2(sp)
	ld	d,h
	ld	e,l
	inc	hl
	inc	hl
	ld	a,(de)
	sub	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	jp	C,00105$
;printf.c:18: _printn(u/base, base, 0, emitter, pData);
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__divuint_rrx_s
	lda	sp,4(sp)
	ld	b,d
	ld	c,e
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
	ld	a,#0x00
	push	af
	inc	sp
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	call	__printn
	lda	sp,9(sp)
00105$:
;printf.c:19: (*emitter)(_hex[u%base], pData);
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__moduint_rrx_s
	lda	sp,4(sp)
	ld	b,d
	ld	c,e
	ld	hl,#__str_0
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00112$
	push	hl
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00112$:
	lda	sp,3(sp)
00106$:
	
	ret
__str_0:
	.ascii "0123456789ABCDEF"
	.db 0x00
;printf.c:22: STATIC void _printf(const char *format, void (*emitter)(char, void *), void *pData, va_list va)
;	---------------------------------
; Function _printf
; ---------------------------------
__printf_start::
__printf:
	
	push	af
;printf.c:24: while (*format) {
00113$:
	lda	hl,5(sp)
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	lda	hl,1(sp)
	ld	(hl),a
	or	a,a
	jp	Z,00116$
;printf.c:25: if (*format == '%') {
	ld	a,(hl)
	sub	a,#0x25
	jp	NZ,00111$
	jr	00130$
00129$:
	jp	00111$
00130$:
;printf.c:26: switch (*++format) {
	ld	hl,#0x0001
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,(bc)
	ld	c,a
	sub	a,#0x63
	jp	Z,00101$
00131$:
	ld	a,c
	sub	a,#0x64
	jp	Z,00103$
00132$:
	ld	a,c
	sub	a,#0x73
	jp	Z,00105$
00133$:
	ld	a,c
	sub	a,#0x75
	jp	Z,00102$
00134$:
	ld	a,c
	sub	a,#0x78
	jp	Z,00104$
00135$:
	jp	00112$
;printf.c:27: case 'c': {
00101$:
;printf.c:28: char c = (char)va_arg(va, int);
	lda	hl,10(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;printf.c:29: (*emitter)(c, pData);
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00136$
	push	hl
	lda	hl,11(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00136$:
	lda	sp,3(sp)
;printf.c:30: break;
	jp	00112$
;printf.c:32: case 'u':
00102$:
;printf.c:34: unsigned u = va_arg(va, unsigned);
	lda	hl,10(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;printf.c:35: _printn(u, 10, 0, emitter, pData);
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
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#0x000A
	push	hl
	push	bc
	call	__printn
	lda	sp,9(sp)
;printf.c:36: break;
	jp	00112$
;printf.c:38: case 'd':
00103$:
;printf.c:40: unsigned u = va_arg(va, unsigned);
	lda	hl,10(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;printf.c:41: _printn(u, 10, 1, emitter, pData);
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
	ld	a,#0x01
	push	af
	inc	sp
	ld	hl,#0x000A
	push	hl
	push	bc
	call	__printn
	lda	sp,9(sp)
;printf.c:42: break;
	jp	00112$
;printf.c:44: case 'x':
00104$:
;printf.c:46: unsigned u = va_arg(va, unsigned);
	lda	hl,10(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;printf.c:47: _printn(u, 16, 0, emitter, pData);
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
	ld	a,#0x00
	push	af
	inc	sp
	ld	hl,#0x0010
	push	hl
	push	bc
	call	__printn
	lda	sp,9(sp)
;printf.c:48: break;
	jp	00112$
;printf.c:50: case 's':
00105$:
;printf.c:52: char *s = va_arg(va, char *);
	lda	hl,10(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	dec	bc
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;printf.c:53: while (*s) {
00106$:
	ld	a,(bc)
	lda	hl,0(sp)
	ld	(hl),a
	or	a,a
	jp	Z,00112$
;printf.c:54: (*emitter)(*s, pData);
	push	bc
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,4(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00137$
	push	hl
	lda	hl,13(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00137$:
	lda	sp,3(sp)
	pop	bc
;printf.c:55: s++;
	inc	bc
	jp	00106$
;printf.c:58: }
00111$:
;printf.c:61: (*emitter)(*format, pData);
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,3(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00138$
	push	hl
	lda	hl,11(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00138$:
	lda	sp,3(sp)
00112$:
;printf.c:63: format++;
	lda	hl,4(sp)
	inc	(hl)
	jr	NZ,00139$
	inc	hl
	inc	(hl)
00139$:
	jp	00113$
00116$:
	lda	sp,2(sp)
	ret
__printf_end::
;printf.c:69: STATIC void _char_emitter(char c, void *pData)
;	---------------------------------
; Function _char_emitter
; ---------------------------------
__char_emitter_start::
__char_emitter:
	
;printf.c:74: putchar(c);
	lda	hl,2(sp)
	ld	a,(hl)
	push	af
	inc	sp
	call	_putchar
	lda	sp,1(sp)
00101$:
	
	ret
__char_emitter_end::
;printf.c:77: int printf(const char *format, ...)
;	---------------------------------
; Function printf
; ---------------------------------
_printf_start::
_printf:
	
;printf.c:80: va_start(va, format);
	lda	hl,2(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
;printf.c:82: _printf(format, _char_emitter, NULL, va);
	push	bc
	ld	hl,#0x0000
	push	hl
	ld	hl,#__char_emitter
	push	hl
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__printf
	lda	sp,8(sp)
;printf.c:85: return 0;
	ld	de,#0x0000
00101$:
	
	ret
_printf_end::
;printf.c:88: STATIC void _buf_emitter(char c, void *pData)
;	---------------------------------
; Function _buf_emitter
; ---------------------------------
__buf_emitter_start::
__buf_emitter:
	
	push	af
;printf.c:90: *((*((char **)pData)))++ = c;
	lda	hl,6(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	lda	hl,6(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(de),a
00101$:
	lda	sp,2(sp)
	ret
__buf_emitter_end::
;printf.c:93: int sprintf(char *pInto, const char *format, ...)
;	---------------------------------
; Function sprintf
; ---------------------------------
_sprintf_start::
_sprintf:
	
	push	af
;printf.c:96: va_start(va, format);
	lda	hl,6(sp)
	ld	c,l
	ld	b,h
	ld	hl,#0x0002
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
;printf.c:98: _printf(format, _buf_emitter, &pInto, va);
	lda	hl,4(sp)
	ld	c,l
	ld	b,h
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	hl,#__buf_emitter
	push	hl
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__printf
	lda	sp,8(sp)
;printf.c:99: *pInto++ = '\0';
	lda	hl,5(sp)
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	a,#0x00
	ld	(bc),a
;printf.c:102: return 0;
	ld	de,#0x0000
00101$:
	lda	sp,2(sp)
	ret
_sprintf_end::
	.area _CODE
	.area _CABS
