;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:13 2013
;--------------------------------------------------------
	.module printf_large
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __print_format
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
;../printf_large.c:110: static void output_digit( unsigned char n, BOOL lower_case, pfn_outputchar output_char, void* p )
;	---------------------------------
; Function output_digit
; ---------------------------------
_output_digit:
	
;../printf_large.c:112: register unsigned char c = n + (unsigned char)'0';
	lda	hl,2(sp)
	ld	a,(hl)
	add	a,#0x30
	ld	c,a
;../printf_large.c:114: if (c > (unsigned char)'9')
	ld	a,#0x39
	sub	a,c
	jp	NC,00104$
;../printf_large.c:116: c += (unsigned char)('A' - '0' - 10);
	ld	a,c
	add	a,#0x07
	ld	c,a
;../printf_large.c:117: if (lower_case)
	xor	a,a
	inc	hl
	or	a,(hl)
	jp	Z,00104$
;../printf_large.c:118: c += (unsigned char)('a' - 'A');
	ld	a,c
	add	a,#0x20
	ld	c,a
00104$:
;../printf_large.c:120: output_char( c, p );
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00109$
	push	hl
	lda	hl,9(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00109$:
	lda	sp,3(sp)
00105$:
	
	ret
;../printf_large.c:141: static void output_2digits( unsigned char b, BOOL lower_case, pfn_outputchar output_char, void* p )
;	---------------------------------
; Function output_2digits
; ---------------------------------
_output_2digits:
	
;../printf_large.c:143: output_digit( b>>4,   lower_case, output_char, p );
	lda	hl,2(sp)
	ld	c,(hl)
	srl	c
	srl	c
	srl	c
	srl	c
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,7(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_output_digit
	lda	sp,6(sp)
;../printf_large.c:144: output_digit( b&0x0F, lower_case, output_char, p );
	lda	hl,2(sp)
	ld	a,(hl)
	and	a,#0x0F
	ld	c,a
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,7(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_output_digit
	lda	sp,6(sp)
00101$:
	
	ret
;../printf_large.c:158: static void calculate_digit( value_t _AUTOMEM * value, unsigned char radix )
;	---------------------------------
; Function calculate_digit
; ---------------------------------
_calculate_digit:
	lda	sp,-12(sp)
;../printf_large.c:160: unsigned long ul = value->ul;
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	lda	hl,8(sp)
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
;../printf_large.c:161: unsigned char _AUTOMEM * pb4 = &value->byte[4];
	lda	hl,5(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,6(sp)
	ld	(hl+),a
	ld	(hl),d
;../printf_large.c:164: do
	ld	b,#0x20
00103$:
;../printf_large.c:166: *pb4 = (*pb4 << 1) | ((ul >> 31) & 0x01);
	lda	hl,7(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	add	a,a
	ld	c,a
	lda	hl,11(sp)
	ld	a,(hl)
	rlc	a
	and	a,#0x01
	or	a,c
	lda	hl,7(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;../printf_large.c:167: ul <<= 1;
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	lda	hl,13(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,13(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__rlulong_rrx_s
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
	lda	hl,8(sp)
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
;../printf_large.c:169: if (radix <= *pb4 )
	lda	hl,7(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,16(sp)
	sub	a,(hl)
	jp	C,00104$
;../printf_large.c:171: *pb4 -= radix;
	ld	a,c
	sub	a,(hl)
	lda	hl,7(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;../printf_large.c:172: ul |= 1;
	inc	hl
	ld	a,(hl)
	or	a,#0x01
	ld	(hl),a
00104$:
;../printf_large.c:174: } while (--i);
	dec	b
	xor	a,a
	or	a,b
	jp	NZ,00103$
;../printf_large.c:175: value->ul = ul;
	lda	hl,5(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,8(sp)
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
00106$:
	lda	sp,12(sp)
	ret
;../printf_large.c:402: int _print_format (pfn_outputchar pfn, void* pvoid, const char *format, va_list ap)
;	---------------------------------
; Function _print_format
; ---------------------------------
__print_format_start::
__print_format:
	lda	sp,-52(sp)
;../printf_large.c:434: charsOutputted = 0;
	lda	hl,18(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;../printf_large.c:442: while( c=*format++ )
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,20(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,24(sp)
	ld	c,l
	ld	b,h
	ld	hl,#0x0005
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,14(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,16(sp)
	ld	(hl+),a
	ld	(hl),d
00227$:
	lda	hl,58(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,58(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,30(sp)
	ld	(hl),c
	xor	a,a
	or	a,c
	jp	Z,00229$
;../printf_large.c:444: if ( c=='%' )
	ld	a,(hl)
	sub	a,#0x25
	jp	NZ,00225$
	jr	00312$
00311$:
	jp	00225$
00312$:
;../printf_large.c:446: left_justify    = 0;
	lda	hl,51(sp)
	ld	(hl),#0x00
;../printf_large.c:447: zero_padding    = 0;
	dec	hl
	ld	(hl),#0x00
;../printf_large.c:448: prefix_sign     = 0;
	dec	hl
	ld	(hl),#0x00
;../printf_large.c:449: prefix_space    = 0;
	dec	hl
	ld	(hl),#0x00
;../printf_large.c:450: signed_argument = 0;
	dec	hl
	ld	(hl),#0x00
;../printf_large.c:451: char_argument   = 0;
	dec	hl
	ld	(hl),#0x00
;../printf_large.c:452: long_argument   = 0;
	dec	hl
	ld	(hl),#0x00
;../printf_large.c:453: float_argument  = 0;
	dec	hl
	ld	(hl),#0x00
;../printf_large.c:454: radix           = 0;
	lda	hl,34(sp)
	ld	(hl),#0x00
;../printf_large.c:455: width           = 0;
	dec	hl
	ld	(hl),#0x00
;../printf_large.c:456: decimals        = -1;
	dec	hl
	ld	(hl),#0xFF
;../printf_large.c:458: get_conversion_spec:
	lda	hl,58(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),e
00101$:
;../printf_large.c:460: c = *format++;
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	dec	hl
	inc	(hl)
	jr	NZ,00313$
	inc	hl
	inc	(hl)
00313$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,58(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,30(sp)
	ld	(hl),c
;../printf_large.c:462: if (c=='%') {
	ld	a,(hl)
	sub	a,#0x25
	jp	NZ,00103$
	jr	00315$
00314$:
	jp	00103$
00315$:
;../printf_large.c:463: OUTPUT_CHAR(c, p);
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,32(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00316$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00316$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00317$
	inc	hl
	inc	(hl)
00317$:
;../printf_large.c:464: continue;
	jp	00227$
00103$:
;../printf_large.c:467: if (isdigit(c)) {
	lda	hl,30(sp)
	ld	c,(hl)
	ld	a,c
	sub	a,#0x30
	jp	C,00110$
	ld	c,(hl)
	ld	a,#0x39
	sub	a,c
	jp	C,00110$
;../printf_large.c:468: if (decimals==-1) {
	inc	hl
	inc	hl
	ld	a,(hl)
	inc	a
	jp	NZ,00107$
	jr	00319$
00318$:
	jp	00107$
00319$:
;../printf_large.c:469: width = 10*width + (c - '0');
	inc	hl
	ld	a,(hl)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	ld	c,a
	lda	hl,30(sp)
	ld	a,(hl)
	add	a,#0xD0
	ld	b, a
	add	a,c
	lda	hl,33(sp)
;../printf_large.c:470: if (width == 0) {
	ld	(hl),a
	or	a,a
	jp	NZ,00101$
;../printf_large.c:472: zero_padding = 1;
	lda	hl,50(sp)
	ld	(hl),#0x01
	jp	00101$
00107$:
;../printf_large.c:475: decimals = 10*decimals + (c-'0');
	lda	hl,32(sp)
	ld	a,(hl)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	ld	c,a
	lda	hl,30(sp)
	ld	a,(hl)
	add	a,#0xD0
	ld	b, a
	add	a,c
	inc	hl
	inc	hl
	ld	(hl),a
;../printf_large.c:477: goto get_conversion_spec;
	jp	00101$
00110$:
;../printf_large.c:480: if (c=='.') {
	lda	hl,30(sp)
	ld	a,(hl)
	sub	a,#0x2E
	jp	NZ,00115$
	jr	00321$
00320$:
	jp	00115$
00321$:
;../printf_large.c:481: if (decimals==-1) decimals=0;
	inc	hl
	inc	hl
	ld	a,(hl)
	inc	a
	jp	NZ,00101$
	jr	00323$
00322$:
	jp	00101$
00323$:
	ld	(hl),#0x00
;../printf_large.c:484: goto get_conversion_spec;
	jp	00101$
00115$:
;../printf_large.c:487: if (islower(c))
	lda	hl,30(sp)
	ld	c,(hl)
	ld	a,c
	sub	a,#0x61
	jp	C,00117$
	ld	c,(hl)
	ld	a,#0x7A
	sub	a,c
	jp	C,00117$
;../printf_large.c:489: c = toupper(c);
	ld	a,(hl)
	and	a,#0xDF
	ld	(hl),a
;../printf_large.c:490: lower_case = 1;
	lda	hl,43(sp)
	ld	(hl),#0x01
	jp	00118$
00117$:
;../printf_large.c:493: lower_case = 0;
	lda	hl,43(sp)
	ld	(hl),#0x00
00118$:
;../printf_large.c:495: switch( c )
	lda	hl,30(sp)
	ld	a,(hl)
	sub	a,#0x20
	jp	Z,00122$
00324$:
	ld	a,(hl)
	sub	a,#0x2B
	jp	Z,00121$
00325$:
	ld	a,(hl)
	sub	a,#0x2D
	jp	Z,00120$
00326$:
	ld	a,(hl)
	sub	a,#0x42
	jp	Z,00123$
00327$:
	ld	a,(hl)
	sub	a,#0x43
	jp	Z,00125$
00328$:
	ld	a,(hl)
	sub	a,#0x44
	jp	Z,00150$
00329$:
	ld	a,(hl)
	sub	a,#0x46
	jp	Z,00154$
00330$:
	ld	a,(hl)
	sub	a,#0x49
	jp	Z,00150$
00331$:
	ld	a,(hl)
	sub	a,#0x4C
	jp	Z,00124$
00332$:
	ld	a,(hl)
	sub	a,#0x4F
	jp	Z,00151$
00333$:
	ld	a,(hl)
	sub	a,#0x50
	jp	Z,00148$
00334$:
	ld	a,(hl)
	sub	a,#0x53
	jp	Z,00129$
00335$:
	ld	a,(hl)
	sub	a,#0x55
	jp	Z,00152$
00336$:
	ld	a,(hl)
	sub	a,#0x58
	jp	Z,00153$
00337$:
	jp	00155$
;../printf_large.c:497: case '-':
00120$:
;../printf_large.c:498: left_justify = 1;
	lda	hl,51(sp)
	ld	(hl),#0x01
;../printf_large.c:499: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:500: case '+':
00121$:
;../printf_large.c:501: prefix_sign = 1;
	lda	hl,49(sp)
	ld	(hl),#0x01
;../printf_large.c:502: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:503: case ' ':
00122$:
;../printf_large.c:504: prefix_space = 1;
	lda	hl,48(sp)
	ld	(hl),#0x01
;../printf_large.c:505: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:506: case 'B':
00123$:
;../printf_large.c:507: char_argument = 1;
	lda	hl,46(sp)
	ld	(hl),#0x01
;../printf_large.c:508: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:509: case 'L':
00124$:
;../printf_large.c:510: long_argument = 1;
	lda	hl,45(sp)
	ld	(hl),#0x01
;../printf_large.c:511: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:513: case 'C':
00125$:
;../printf_large.c:514: if( char_argument )
	xor	a,a
	lda	hl,46(sp)
	or	a,(hl)
	jp	Z,00127$
;../printf_large.c:515: c = va_arg(ap,char);
	lda	hl,60(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	ld	a,(bc)
	lda	hl,30(sp)
	ld	(hl),a
	jp	00128$
00127$:
;../printf_large.c:517: c = va_arg(ap,int);
	lda	hl,60(sp)
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
	lda	hl,30(sp)
	ld	(hl),c
00128$:
;../printf_large.c:518: OUTPUT_CHAR( c, p );
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,32(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00338$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00338$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00339$
	inc	hl
	inc	(hl)
00339$:
;../printf_large.c:519: break;
	jp	00156$
;../printf_large.c:521: case 'S':
00129$:
;../printf_large.c:522: PTR = va_arg(ap,ptr_t);
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,60(sp)
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
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;../printf_large.c:532: length = strlen(PTR);
	push	bc
	call	_strlen
	lda	sp,2(sp)
	ld	b,d
	ld	c,e
	lda	hl,11(sp)
	ld	(hl),c
;../printf_large.c:534: if ( decimals == -1 )
	lda	hl,32(sp)
	ld	a,(hl)
	inc	a
	jp	NZ,00131$
	jr	00341$
00340$:
	jp	00131$
00341$:
;../printf_large.c:536: decimals = length;
	lda	hl,11(sp)
	ld	a,(hl)
	lda	hl,32(sp)
	ld	(hl),a
00131$:
;../printf_large.c:538: if ( ( !left_justify ) && (length < width) )
	xor	a,a
	lda	hl,51(sp)
	or	a,(hl)
	jp	NZ,00269$
	lda	hl,11(sp)
	ld	a,(hl)
	lda	hl,33(sp)
	sub	a,(hl)
	jp	NC,00269$
;../printf_large.c:540: width -= length;
	ld	a,(hl)
	lda	hl,11(sp)
	sub	a,(hl)
	lda	hl,33(sp)
	ld	(hl),a
;../printf_large.c:541: while( width-- != 0 )
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	b,(hl)
00132$:
	ld	c,b
	dec	b
	lda	hl,33(sp)
	ld	(hl),b
	xor	a,a
	or	a,c
	jp	Z,00304$
;../printf_large.c:543: OUTPUT_CHAR( ' ', p );
	push	bc
	lda	hl,58(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00342$
	push	hl
	lda	hl,61(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00342$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,12(sp)
	inc	(hl)
	jr	NZ,00343$
	inc	hl
	inc	(hl)
00343$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00132$
;../printf_large.c:547: while ( (c = *PTR)  && (decimals-- > 0))
00304$:
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	(hl),b
00269$:
	lda	hl,32(sp)
	ld	a,(hl)
	lda	hl,10(sp)
	ld	(hl),a
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),e
00139$:
	lda	hl,21(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,(bc)
	ld	c,a
	lda	hl,30(sp)
	ld	(hl),c
	xor	a,a
	or	a,c
	jp	Z,00305$
	lda	hl,10(sp)
	ld	c,(hl)
	dec	(hl)
	ld	a,#0x00
	sub	a,c
	rlca
	jp	NC,00305$
;../printf_large.c:549: OUTPUT_CHAR( c, p );
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,32(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00344$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00344$:
	lda	sp,3(sp)
	lda	hl,12(sp)
	inc	(hl)
	jr	NZ,00345$
	inc	hl
	inc	(hl)
00345$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
;../printf_large.c:550: PTR++;
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	bc
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
	jp	00139$
00305$:
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
;../printf_large.c:553: if ( left_justify && (length < width))
	xor	a,a
	lda	hl,51(sp)
	or	a,(hl)
	jp	Z,00156$
	lda	hl,11(sp)
	ld	a,(hl)
	lda	hl,33(sp)
	sub	a,(hl)
	jp	NC,00156$
;../printf_large.c:555: width -= length;
	ld	a,(hl)
	lda	hl,11(sp)
	sub	a,(hl)
	lda	hl,33(sp)
	ld	(hl),a
;../printf_large.c:556: while( width-- != 0 )
	lda	hl,12(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,36(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	c,(hl)
00142$:
	ld	b,c
	dec	c
	lda	hl,33(sp)
	ld	(hl),c
	xor	a,a
	or	a,b
	jp	Z,00306$
;../printf_large.c:558: OUTPUT_CHAR( ' ', p );
	push	bc
	lda	hl,58(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00346$
	push	hl
	lda	hl,61(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00346$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,36(sp)
	inc	(hl)
	jr	NZ,00347$
	inc	hl
	inc	(hl)
00347$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00142$
;../printf_large.c:563: case 'P':
00148$:
;../printf_large.c:564: PTR = va_arg(ap,ptr_t);
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	lda	hl,61(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,60(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	e,c
	ld	d,b
	dec	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
;../printf_large.c:608: OUTPUT_CHAR('0', p);
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x30
	push	af
	inc	sp
	ld	hl,#00348$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00348$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00349$
	inc	hl
	inc	(hl)
00349$:
;../printf_large.c:609: OUTPUT_CHAR('x', p);
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x78
	push	af
	inc	sp
	ld	hl,#00350$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00350$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00351$
	inc	hl
	inc	(hl)
00351$:
;../printf_large.c:610: OUTPUT_2DIGITS( value.byte[1] );
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	inc	bc
	ld	a,(bc)
	ld	b,a
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,47(sp)
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_output_2digits
	lda	sp,6(sp)
	lda	hl,19(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),d
;../printf_large.c:611: OUTPUT_2DIGITS( value.byte[0] );
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	b,a
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,47(sp)
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_output_2digits
	lda	sp,6(sp)
	lda	hl,19(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),d
;../printf_large.c:613: break;
	jp	00156$
;../printf_large.c:616: case 'I':
00150$:
;../printf_large.c:617: signed_argument = 1;
	lda	hl,47(sp)
	ld	(hl),#0x01
;../printf_large.c:618: radix = 10;
	lda	hl,34(sp)
	ld	(hl),#0x0A
;../printf_large.c:619: break;
	jp	00156$
;../printf_large.c:621: case 'O':
00151$:
;../printf_large.c:622: radix = 8;
	lda	hl,34(sp)
	ld	(hl),#0x08
;../printf_large.c:623: break;
	jp	00156$
;../printf_large.c:625: case 'U':
00152$:
;../printf_large.c:626: radix = 10;
	lda	hl,34(sp)
	ld	(hl),#0x0A
;../printf_large.c:627: break;
	jp	00156$
;../printf_large.c:629: case 'X':
00153$:
;../printf_large.c:630: radix = 16;
	lda	hl,34(sp)
	ld	(hl),#0x10
;../printf_large.c:631: break;
	jp	00156$
;../printf_large.c:633: case 'F':
00154$:
;../printf_large.c:634: float_argument=1;
	lda	hl,44(sp)
	ld	(hl),#0x01
;../printf_large.c:635: break;
	jp	00156$
;../printf_large.c:637: default:
00155$:
;../printf_large.c:639: OUTPUT_CHAR( c, p );
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,32(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00352$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00352$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00353$
	inc	hl
	inc	(hl)
00353$:
;../printf_large.c:816: return charsOutputted;
	jp	00156$
;../printf_large.c:641: }
00306$:
	lda	hl,36(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	(hl),c
00156$:
;../printf_large.c:643: if (float_argument) {
	xor	a,a
	lda	hl,44(sp)
	or	a,(hl)
	jp	Z,00222$
;../printf_large.c:644: value.f=va_arg(ap,float);
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,61(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,60(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,c
	add	a,#0xFC
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
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
	ld	(hl+),a
	inc	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
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
;../printf_large.c:646: PTR="<NO FLOAT>";
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,#<(__str_0)
	ld	(de),a
	inc	de
	ld	a,#>(__str_0)
	ld	(de),a
;../printf_large.c:647: while (c=*PTR++)
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
00157$:
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	lda	hl,12(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,30(sp)
	ld	(hl),c
	xor	a,a
	or	a,c
	jp	Z,00227$
;../printf_large.c:649: OUTPUT_CHAR (c, p);
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,32(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00354$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00354$:
	lda	sp,3(sp)
	lda	hl,4(sp)
	inc	(hl)
	jr	NZ,00355$
	inc	hl
	inc	(hl)
00355$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00157$
00222$:
;../printf_large.c:666: } else if (radix != 0)
	xor	a,a
	lda	hl,34(sp)
	or	a,(hl)
	jp	Z,00227$
;../printf_large.c:671: unsigned char MEM_SPACE_BUF_PP *pstore = &store[5];
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,22(sp)
	ld	(hl+),a
	ld	(hl),e
;../printf_large.c:674: if (char_argument)
	xor	a,a
	lda	hl,46(sp)
	or	a,(hl)
	jp	Z,00168$
;../printf_large.c:676: value.l = va_arg(ap,char);
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,60(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	dec	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	dec	bc
	ld	a,(bc)
	ld	c,a
	lda	hl,0(sp)
	ld	(hl),c
	ld	a,c
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl+),a
	inc	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,0(sp)
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
;../printf_large.c:677: if (!signed_argument)
	xor	a,a
	lda	hl,47(sp)
	or	a,(hl)
	jp	NZ,00169$
;../printf_large.c:679: value.l &= 0xFF;
	lda	hl,5(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
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
	ld	(hl-),a
	dec	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	inc	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,0(sp)
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
	jp	00169$
00168$:
;../printf_large.c:682: else if (long_argument)
	xor	a,a
	lda	hl,45(sp)
	or	a,(hl)
	jp	Z,00165$
;../printf_large.c:684: value.l = va_arg(ap,long);
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,61(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	lda	hl,60(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,c
	add	a,#0xFC
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
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
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
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
	jp	00169$
00165$:
;../printf_large.c:688: value.l = va_arg(ap,int);
	lda	hl,38(sp)
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,60(sp)
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
	lda	hl,4(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl),a
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
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
;../printf_large.c:689: if (!signed_argument)
	xor	a,a
	lda	hl,47(sp)
	or	a,(hl)
	jp	NZ,00169$
;../printf_large.c:691: value.l &= 0xFFFF;
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
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
	ld	(hl-),a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
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
00169$:
;../printf_large.c:695: if ( signed_argument )
	xor	a,a
	lda	hl,47(sp)
	or	a,(hl)
	jp	Z,00174$
;../printf_large.c:697: if (value.l < 0)
	lda	hl,38(sp)
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
	bit	7,a
	jp	Z,00171$
;../printf_large.c:698: value.l = -value.l;
	ld	de,#0x0000
	ld	a,e
	lda	hl,0(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	ld	(hl-),a
	ld	(hl),e
	ld	de,#0x0000
	inc	hl
	inc	hl
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	ld	(hl-),a
	ld	(hl),e
	ld	e,c
	ld	d,b
	dec	hl
	dec	hl
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
	jp	00174$
00171$:
;../printf_large.c:700: signed_argument = 0;
	lda	hl,47(sp)
	ld	(hl),#0x00
00174$:
;../printf_large.c:704: lsd = 1;
	lda	hl,35(sp)
	ld	(hl),#0x01
;../printf_large.c:706: do {
	lda	hl,22(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	(hl),#0x00
00178$:
;../printf_large.c:707: value.byte[4] = 0;
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;../printf_large.c:709: calculate_digit(&value, radix);
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	lda	hl,34(sp)
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	call	_calculate_digit
	lda	sp,3(sp)
;../printf_large.c:713: if (!lsd)
	xor	a,a
	lda	hl,35(sp)
	or	a,(hl)
	jp	NZ,00176$
;../printf_large.c:715: *pstore = (value.byte[4] << 4) | (value.byte[4] >> 4) | *pstore;
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	b,a
	srl	c
	srl	c
	srl	c
	srl	c
	ld	a,b
	or	a,c
	ld	b,a
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	or	a,b
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
;../printf_large.c:716: pstore--;
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	de
	dec	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,22(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00177$
00176$:
;../printf_large.c:720: *pstore = value.byte[4];
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	lda	hl,1(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	(de),a
00177$:
;../printf_large.c:722: length++;
	lda	hl,31(sp)
	inc	(hl)
	ld	a,(hl)
	lda	hl,11(sp)
	ld	(hl),a
;../printf_large.c:723: lsd = !lsd;
	xor	a,a
	lda	hl,35(sp)
	or	a,(hl)
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	(hl),a
;../printf_large.c:724: } while( value.ul );
	lda	hl,17(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
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
	lda	hl,4(sp)
	ld	a,(hl+)
	or	a,(hl)
	inc	hl
	or	a,(hl)
	inc	hl
	or	a,(hl)
	jp	NZ,00178$
;../printf_large.c:726: if (width == 0)
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,22(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,31(sp)
	ld	a,(hl)
	lda	hl,11(sp)
	ld	(hl),a
	xor	a,a
	lda	hl,33(sp)
	or	a,(hl)
	jp	NZ,00182$
;../printf_large.c:731: width=1;
	ld	(hl),#0x01
00182$:
;../printf_large.c:735: if (!zero_padding && !left_justify)
	xor	a,a
	lda	hl,50(sp)
	or	a,(hl)
	jp	NZ,00187$
	xor	a,a
	inc	hl
	or	a,(hl)
	jp	NZ,00187$
;../printf_large.c:737: while ( width > (unsigned char) (length+1) )
	lda	hl,11(sp)
	ld	c,(hl)
	inc	c
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	b,(hl)
00183$:
	ld	a,c
	sub	a,b
	jp	NC,00308$
;../printf_large.c:739: OUTPUT_CHAR( ' ', p );
	push	bc
	lda	hl,58(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00356$
	push	hl
	lda	hl,61(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00356$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00357$
	inc	hl
	inc	(hl)
00357$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
;../printf_large.c:740: width--;
	dec	b
	jp	00183$
00308$:
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	(hl),b
00187$:
;../printf_large.c:744: if (signed_argument) // this now means the original value was negative
	xor	a,a
	lda	hl,47(sp)
	or	a,(hl)
	jp	Z,00197$
;../printf_large.c:746: OUTPUT_CHAR( '-', p );
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00358$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00358$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00359$
	inc	hl
	inc	(hl)
00359$:
;../printf_large.c:748: width--;
	lda	hl,33(sp)
	dec	(hl)
	jp	00198$
00197$:
;../printf_large.c:750: else if (length != 0)
	xor	a,a
	lda	hl,11(sp)
	or	a,(hl)
	jp	Z,00198$
;../printf_large.c:753: if (prefix_sign)
	xor	a,a
	lda	hl,49(sp)
	or	a,(hl)
	jp	Z,00192$
;../printf_large.c:755: OUTPUT_CHAR( '+', p );
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x2B
	push	af
	inc	sp
	ld	hl,#00360$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00360$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00361$
	inc	hl
	inc	(hl)
00361$:
;../printf_large.c:757: width--;
	lda	hl,33(sp)
	dec	(hl)
	jp	00198$
00192$:
;../printf_large.c:759: else if (prefix_space)
	xor	a,a
	lda	hl,48(sp)
	or	a,(hl)
	jp	Z,00198$
;../printf_large.c:761: OUTPUT_CHAR( ' ', p );
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00362$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00362$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00363$
	inc	hl
	inc	(hl)
00363$:
;../printf_large.c:763: width--;
	lda	hl,33(sp)
	dec	(hl)
00198$:
;../printf_large.c:768: if (!left_justify)
	xor	a,a
	lda	hl,51(sp)
	or	a,(hl)
	jp	NZ,00206$
;../printf_large.c:769: while ( width-- > length )
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	b,(hl)
00199$:
	ld	c,b
	dec	b
	lda	hl,33(sp)
	ld	(hl),b
	lda	hl,11(sp)
	ld	a,(hl)
	sub	a,c
	jp	NC,00309$
;../printf_large.c:771: OUTPUT_CHAR( zero_padding ? '0' : ' ', p );
	xor	a,a
	lda	hl,50(sp)
	or	a,(hl)
	jp	Z,00232$
	ld	c,#0x30
	jp	00233$
00232$:
	ld	c,#0x20
00233$:
	push	bc
	lda	hl,58(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00364$
	push	hl
	lda	hl,61(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00364$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,4(sp)
	inc	(hl)
	jr	NZ,00365$
	inc	hl
	inc	(hl)
00365$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00199$
00206$:
;../printf_large.c:776: if (width > length)
	lda	hl,11(sp)
	ld	a,(hl)
	lda	hl,33(sp)
	sub	a,(hl)
	jp	NC,00203$
;../printf_large.c:777: width -= length;
	ld	a,(hl)
	lda	hl,11(sp)
	sub	a,(hl)
	lda	hl,33(sp)
	ld	(hl),a
	jp	00301$
00203$:
;../printf_large.c:779: width = 0;
	lda	hl,33(sp)
	ld	(hl),#0x00
;../printf_large.c:816: return charsOutputted;
	jp	00301$
;../printf_large.c:783: while( length-- )
00309$:
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	(hl),b
00301$:
	lda	hl,22(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,18(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,11(sp)
	ld	a,(hl)
	lda	hl,4(sp)
	ld	(hl),a
00211$:
	lda	hl,4(sp)
	ld	c,(hl)
	dec	(hl)
	xor	a,a
	or	a,c
	jp	Z,00310$
;../printf_large.c:785: lsd = !lsd;
	xor	a,a
	lda	hl,35(sp)
	or	a,(hl)
	sub	a,#0x01
	ld	a,#0x00
	rla
;../printf_large.c:786: if (!lsd)
	ld	(hl),a
	or	a,a
	jp	NZ,00209$
;../printf_large.c:788: pstore++;
	lda	hl,8(sp)
	inc	(hl)
	jr	NZ,00366$
	inc	hl
	inc	(hl)
00366$:
;../printf_large.c:789: value.byte[4] = *pstore >> 4;
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	srl	c
	srl	c
	srl	c
	srl	c
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	ld	(de),a
	jp	00210$
00209$:
;../printf_large.c:793: value.byte[4] = *pstore & 0x0F;
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	and	a,#0x0F
	ld	(bc),a
00210$:
;../printf_large.c:796: output_digit( value.byte[4], lower_case, output_char, p );
	lda	hl,38(sp)
	ld	c,l
	ld	b,h
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,47(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,c
	push	af
	inc	sp
	call	_output_digit
	lda	sp,6(sp)
;../printf_large.c:797: charsOutputted++;
	lda	hl,0(sp)
	inc	(hl)
	jr	NZ,00367$
	inc	hl
	inc	(hl)
00367$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00211$
00310$:
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
;../printf_large.c:802: if (left_justify)
	xor	a,a
	lda	hl,51(sp)
	or	a,(hl)
	jp	Z,00227$
;../printf_large.c:803: while (width-- > 0)
	lda	hl,0(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,36(sp)
	ld	(hl+),a
	ld	(hl),e
	lda	hl,33(sp)
	ld	c,(hl)
00214$:
	ld	b,c
	dec	c
	xor	a,a
	or	a,b
	jp	Z,00227$
;../printf_large.c:805: OUTPUT_CHAR(' ', p);
	push	bc
	lda	hl,58(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00368$
	push	hl
	lda	hl,61(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00368$:
	lda	sp,3(sp)
	pop	bc
	lda	hl,36(sp)
	inc	(hl)
	jr	NZ,00369$
	inc	hl
	inc	(hl)
00369$:
	dec	hl
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),e
	jp	00214$
00225$:
;../printf_large.c:812: OUTPUT_CHAR( c, p );
	lda	hl,56(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,32(sp)
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#00370$
	push	hl
	lda	hl,59(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	jp	(hl)
00370$:
	lda	sp,3(sp)
	lda	hl,18(sp)
	inc	(hl)
	jr	NZ,00371$
	inc	hl
	inc	(hl)
00371$:
	jp	00227$
00229$:
;../printf_large.c:816: return charsOutputted;
	lda	hl,19(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
00230$:
	lda	sp,52(sp)
	ret
__print_format_end::
__str_0:
	.ascii "<NO FLOAT>"
	.db 0x00
	.area _CODE
	.area _CABS
