;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module printf_large
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __print_format
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
;../printf_large.c:110: static void output_digit( unsigned char n, BOOL lower_case, pfn_outputchar output_char, void* p )
;	---------------------------------
; Function output_digit
; ---------------------------------
_output_digit:
	push	ix
	ld	ix,#0
	add	ix,sp
;../printf_large.c:112: register unsigned char c = n + (unsigned char)'0';
	ld	a,4 (ix)
	add	a,#0x30
	ld	c,a
;../printf_large.c:114: if (c > (unsigned char)'9')
	ld	a,#0x39
	sub	a,c
	jr	NC,00104$
;../printf_large.c:116: c += (unsigned char)('A' - '0' - 10);
	ld	a,c
	add	a,#0x07
	ld	c,a
;../printf_large.c:117: if (lower_case)
	xor	a,a
	or	a,5 (ix)
	jr	Z,00104$
;../printf_large.c:118: c += (unsigned char)('a' - 'A');
	ld	a,c
	add	a,#0x20
	ld	c,a
00104$:
;../printf_large.c:120: output_char( c, p );
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	hl,#00109$
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	jp	(hl)
00109$:
	pop	af
	inc	sp
	pop	ix
	ret
;../printf_large.c:141: static void output_2digits( unsigned char b, BOOL lower_case, pfn_outputchar output_char, void* p )
;	---------------------------------
; Function output_2digits
; ---------------------------------
_output_2digits:
	push	ix
	ld	ix,#0
	add	ix,sp
;../printf_large.c:143: output_digit( b>>4,   lower_case, output_char, p );
	ld	c,4 (ix)
	srl	c
	srl	c
	srl	c
	srl	c
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	b, 5 (ix)
	push	bc
	call	_output_digit
	pop	af
	pop	af
	pop	af
;../printf_large.c:144: output_digit( b&0x0F, lower_case, output_char, p );
	ld	a,4 (ix)
	and	a,#0x0F
	ld	c,a
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	b, 5 (ix)
	push	bc
	call	_output_digit
	pop	af
	pop	af
	pop	af
	pop	ix
	ret
;../printf_large.c:158: static void calculate_digit( value_t _AUTOMEM * value, unsigned char radix )
;	---------------------------------
; Function calculate_digit
; ---------------------------------
_calculate_digit:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-9
	add	hl,sp
	ld	sp,hl
;../printf_large.c:160: unsigned long ul = value->ul;
	ld	a,4 (ix)
	ld	-9 (ix),a
	ld	a,5 (ix)
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	-4 (ix),c
	ld	-3 (ix),b
	ld	-2 (ix),e
	ld	-1 (ix),d
;../printf_large.c:161: unsigned char _AUTOMEM * pb4 = &value->byte[4];
	ld	a,-9 (ix)
	add	a,#0x04
	ld	-6 (ix),a
	ld	a,-8 (ix)
	adc	a,#0x00
	ld	-5 (ix),a
;../printf_large.c:164: do
	ld	-7 (ix),#0x20
00103$:
;../printf_large.c:166: *pb4 = (*pb4 << 1) | ((ul >> 31) & 0x01);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a,(hl)
	add	a,a
	ld	d,a
	ld	a,-1 (ix)
	rlc	a
	and	a,#0x01
	or	a,d
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;../printf_large.c:167: ul <<= 1;
	ld	a,#0x01
	push	af
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__rlulong_rrx_s
	pop	af
	pop	af
	inc	sp
	ld	b,d
	ld	c,e
	ld	e,h
	ld	-4 (ix),l
	ld	-3 (ix),e
	ld	-2 (ix),c
	ld	-1 (ix),b
;../printf_large.c:169: if (radix <= *pb4 )
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	l,(hl)
	ld	a,l
	sub	a,6 (ix)
	jr	C,00104$
;../printf_large.c:171: *pb4 -= radix;
	ld	a,l
	sub	a,6 (ix)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	(hl),a
;../printf_large.c:172: ul |= 1;
	ld	a,-4 (ix)
	or	a,#0x01
	ld	-4 (ix),a
00104$:
;../printf_large.c:174: } while (--i);
	dec	-7 (ix)
	xor	a,a
	or	a,-7 (ix)
	jp	NZ,00103$
;../printf_large.c:175: value->ul = ul;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,-4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-3 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-1 (ix)
	ld	(hl),a
	ld	sp,ix
	pop	ix
	ret
;../printf_large.c:402: int _print_format (pfn_outputchar pfn, void* pvoid, const char *format, va_list ap)
;	---------------------------------
; Function _print_format
; ---------------------------------
__print_format_start::
__print_format:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-47
	add	hl,sp
	ld	sp,hl
;../printf_large.c:434: charsOutputted = 0;
	ld	-32 (ix),#0x00
	ld	-31 (ix),#0x00
;../printf_large.c:442: while( c=*format++ )
	ld	hl,#0x0021
	add	hl,sp
	ld	-36 (ix),l
	ld	-35 (ix),h
	ld	hl,#0x0017
	add	hl,sp
	ld	a,l
	add	a,#0x05
	ld	-28 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	-27 (ix),a
	ld	hl,#0x0021
	add	hl,sp
	ld	-30 (ix),l
	ld	-29 (ix),h
00227$:
	ld	l,8 (ix)
	ld	h,9 (ix)
	ld	c,(hl)
	ld	a,l
	add	a,#0x01
	ld	8 (ix),a
	ld	a,h
	adc	a,#0x00
	ld	9 (ix),a
	ld	b,c
	xor	a,a
	or	a,c
	jp	Z,00229$
;../printf_large.c:444: if ( c=='%' )
	ld	a,b
	sub	a,#0x25
	jp	NZ,00225$
;../printf_large.c:446: left_justify    = 0;
	ld	-1 (ix),#0x00
;../printf_large.c:447: zero_padding    = 0;
	ld	-2 (ix),#0x00
;../printf_large.c:448: prefix_sign     = 0;
	ld	-3 (ix),#0x00
;../printf_large.c:449: prefix_space    = 0;
	ld	-4 (ix),#0x00
;../printf_large.c:450: signed_argument = 0;
	ld	-5 (ix),#0x00
;../printf_large.c:451: char_argument   = 0;
	ld	-6 (ix),#0x00
;../printf_large.c:452: long_argument   = 0;
	ld	-7 (ix),#0x00
;../printf_large.c:453: float_argument  = 0;
	ld	-8 (ix),#0x00
;../printf_large.c:454: radix           = 0;
	ld	-15 (ix),#0x00
;../printf_large.c:455: width           = 0;
	ld	-16 (ix),#0x00
;../printf_large.c:456: decimals        = -1;
	ld	-17 (ix),#0xFF
;../printf_large.c:458: get_conversion_spec:
	ld	e,8 (ix)
	ld	d,9 (ix)
00101$:
;../printf_large.c:460: c = *format++;
	ld	a,(de)
	ld	c,a
	inc	de
	ld	8 (ix),e
	ld	9 (ix),d
	ld	b,c
;../printf_large.c:462: if (c=='%') {
	ld	a,b
	sub	a,#0x25
	jr	NZ,00103$
;../printf_large.c:463: OUTPUT_CHAR(c, p);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	bc
	inc	sp
	ld	hl,#00315$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00315$:
	pop	af
	inc	sp
	inc	-32 (ix)
	jp	NZ,00227$
	inc	-31 (ix)
;../printf_large.c:464: continue;
	jp	00227$
00103$:
;../printf_large.c:467: if (isdigit(c)) {
	ld	a,b
	sub	a,#0x30
	jr	C,00110$
	ld	l,b
	ld	a,#0x39
	sub	a,l
	jr	C,00110$
;../printf_large.c:468: if (decimals==-1) {
	ld	a,-17 (ix)
	inc	a
	jr	NZ,00107$
;../printf_large.c:469: width = 10*width + (c - '0');
	push	de
	ld	a,-16 (ix)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	pop	de
	ld	c,a
	ld	a,b
	add	a,#0xD0
	add	a,c
	ld	-16 (ix),a
;../printf_large.c:470: if (width == 0) {
	xor	a,a
	or	a,-16 (ix)
	jp	NZ,00101$
;../printf_large.c:472: zero_padding = 1;
	ld	-2 (ix),#0x01
	jp	00101$
00107$:
;../printf_large.c:475: decimals = 10*decimals + (c-'0');
	push	de
	ld	a,-17 (ix)
	ld	e,a
	add	a,a
	add	a,a
	add	a,e
	add	a,a
	pop	de
	ld	c,a
	ld	a,b
	add	a,#0xD0
	add	a,c
	ld	-17 (ix),a
;../printf_large.c:477: goto get_conversion_spec;
	jp	00101$
00110$:
;../printf_large.c:480: if (c=='.') {
	ld	a,b
	sub	a,#0x2E
	jr	NZ,00115$
;../printf_large.c:481: if (decimals==-1) decimals=0;
	ld	a,-17 (ix)
	inc	a
	jp	NZ,00101$
	ld	-17 (ix),#0x00
;../printf_large.c:484: goto get_conversion_spec;
	jp	00101$
00115$:
;../printf_large.c:487: if (islower(c))
	ld	a,b
	sub	a,#0x61
	jr	C,00117$
	ld	l,b
	ld	a,#0x7A
	sub	a,l
	jr	C,00117$
;../printf_large.c:489: c = toupper(c);
	ld	a,b
	and	a,#0xDF
	ld	b,a
;../printf_large.c:490: lower_case = 1;
	ld	-9 (ix),#0x01
	jr	00118$
00117$:
;../printf_large.c:493: lower_case = 0;
	ld	-9 (ix),#0x00
00118$:
;../printf_large.c:495: switch( c )
	ld	a,b
	cp	a,#0x20
	jr	Z,00122$
	sub	a,#0x2B
	jr	Z,00121$
	ld	a,b
	sub	a,#0x2D
	jr	Z,00120$
	ld	a,b
	sub	a,#0x42
	jr	Z,00123$
	ld	a,b
	sub	a,#0x43
	jr	Z,00125$
	ld	a,b
	cp	a,#0x44
	jp	Z,00150$
	cp	a,##0x46
	jp	Z,00154$
	cp	a,#0x49
	jp	Z,00150$
	sub	a,#0x4C
	jr	Z,00124$
	ld	a,b
	cp	a,#0x4F
	jp	Z,00151$
	cp	a,##0x50
	jp	Z,00148$
	cp	a,#0x53
	jp	Z,00129$
	cp	a,##0x55
	jp	Z,00152$
	sub	a,#0x58
	jp	Z,00153$
	jp	00155$
;../printf_large.c:497: case '-':
00120$:
;../printf_large.c:498: left_justify = 1;
	ld	-1 (ix),#0x01
;../printf_large.c:499: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:500: case '+':
00121$:
;../printf_large.c:501: prefix_sign = 1;
	ld	-3 (ix),#0x01
;../printf_large.c:502: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:503: case ' ':
00122$:
;../printf_large.c:504: prefix_space = 1;
	ld	-4 (ix),#0x01
;../printf_large.c:505: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:506: case 'B':
00123$:
;../printf_large.c:507: char_argument = 1;
	ld	-6 (ix),#0x01
;../printf_large.c:508: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:509: case 'L':
00124$:
;../printf_large.c:510: long_argument = 1;
	ld	-7 (ix),#0x01
;../printf_large.c:511: goto get_conversion_spec;
	jp	00101$
;../printf_large.c:513: case 'C':
00125$:
;../printf_large.c:514: if( char_argument )
	xor	a,a
	or	a,-6 (ix)
	jr	Z,00127$
;../printf_large.c:515: c = va_arg(ap,char);
	ld	a,10 (ix)
	add	a,#0x01
	ld	c,a
	ld	a,11 (ix)
	adc	a,#0x00
	ld	e,a
	ld	10 (ix),c
	ld	11 (ix),e
	ld	l,c
	ld	h,e
	dec	hl
	ld	a,(hl)
	ld	b,a
	jr	00128$
00127$:
;../printf_large.c:517: c = va_arg(ap,int);
	ld	e,10 (ix)
	ld	d,11 (ix)
	inc	de
	inc	de
	ld	10 (ix),e
	ld	11 (ix),d
	ld	l,e
	ld	h,d
	dec	hl
	dec	hl
	ld	a,(hl)
	inc	hl
	ld	l,a
	ld	b,l
00128$:
;../printf_large.c:518: OUTPUT_CHAR( c, p );
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	bc
	inc	sp
	ld	hl,#00337$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00337$:
	pop	af
	inc	sp
	inc	-32 (ix)
	jp	NZ,00156$
	inc	-31 (ix)
;../printf_large.c:519: break;
	jp	00156$
;../printf_large.c:521: case 'S':
00129$:
;../printf_large.c:522: PTR = va_arg(ap,ptr_t);
	ld	hl,#0x0021
	add	hl,sp
	ld	-34 (ix),l
	ld	-33 (ix),h
	ld	a,10 (ix)
	add	a,#0x02
	ld	c,a
	ld	a,11 (ix)
	adc	a,#0x00
	ld	e,a
	ld	10 (ix),c
	ld	11 (ix),e
	ld	l,c
	ld	h,e
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../printf_large.c:532: length = strlen(PTR);
	push	de
	call	_strlen
	pop	af
	ld	-37 (ix),l
;../printf_large.c:534: if ( decimals == -1 )
	ld	a,-17 (ix)
	inc	a
	jr	NZ,00131$
;../printf_large.c:536: decimals = length;
	ld	a,-37 (ix)
	ld	-17 (ix),a
00131$:
;../printf_large.c:538: if ( ( !left_justify ) && (length < width) )
	xor	a,a
	or	a,-1 (ix)
	jr	NZ,00269$
	ld	a,-37 (ix)
	sub	a,-16 (ix)
	jr	NC,00269$
;../printf_large.c:540: width -= length;
	ld	a,-16 (ix)
	sub	a,-37 (ix)
	ld	-16 (ix),a
;../printf_large.c:541: while( width-- != 0 )
	ld	e,-32 (ix)
	ld	d,-31 (ix)
	ld	c,-16 (ix)
00132$:
	ld	l,c
	dec	c
	ld	-16 (ix),c
	xor	a,a
	or	a,l
	jr	Z,00304$
;../printf_large.c:543: OUTPUT_CHAR( ' ', p );
	push	bc
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00341$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00341$:
	pop	af
	inc	sp
	pop	de
	pop	bc
	inc	de
	ld	-32 (ix),e
	ld	-31 (ix),d
	jr	00132$
;../printf_large.c:547: while ( (c = *PTR)  && (decimals-- > 0))
00304$:
	ld	-32 (ix),e
	ld	-31 (ix),d
	ld	-16 (ix),c
00269$:
	ld	d,-17 (ix)
	ld	a,-32 (ix)
	ld	-34 (ix),a
	ld	a,-31 (ix)
	ld	-33 (ix),a
00139$:
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	l,(hl)
	ld	b,l
	xor	a,a
	or	a,l
	jp	Z,00305$
	ld	l,d
	dec	d
	ld	a,#0x00
	sub	a,l
	jp	P,00305$
;../printf_large.c:549: OUTPUT_CHAR( c, p );
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	bc
	inc	sp
	ld	hl,#00342$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00342$:
	pop	af
	inc	sp
	pop	de
	inc	-34 (ix)
	jr	NZ,00343$
	inc	-33 (ix)
00343$:
	ld	a,-34 (ix)
	ld	-32 (ix),a
	ld	a,-33 (ix)
	ld	-31 (ix),a
;../printf_large.c:550: PTR++;
	ld	hl,#0x0021
	add	hl,sp
	ld	-39 (ix),l
	ld	-38 (ix),h
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	add	a,#0x01
	ld	e,a
	ld	a,h
	adc	a,#0x00
	ld	c,a
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),c
	jp	00139$
00305$:
	ld	a,-34 (ix)
	ld	-32 (ix),a
	ld	a,-33 (ix)
	ld	-31 (ix),a
;../printf_large.c:553: if ( left_justify && (length < width))
	xor	a,a
	or	a,-1 (ix)
	jp	Z,00156$
	ld	a,-37 (ix)
	sub	a,-16 (ix)
	jp	NC,00156$
;../printf_large.c:555: width -= length;
	ld	a,-16 (ix)
	sub	a,-37 (ix)
	ld	-16 (ix),a
;../printf_large.c:556: while( width-- != 0 )
	ld	e,-34 (ix)
	ld	d,-33 (ix)
	ld	c,-16 (ix)
00142$:
	ld	l,c
	dec	c
	ld	-16 (ix),c
	xor	a,a
	or	a,l
	jp	Z,00306$
;../printf_large.c:558: OUTPUT_CHAR( ' ', p );
	push	bc
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00344$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00344$:
	pop	af
	inc	sp
	pop	de
	pop	bc
	inc	de
	ld	-32 (ix),e
	ld	-31 (ix),d
	jr	00142$
;../printf_large.c:563: case 'P':
00148$:
;../printf_large.c:564: PTR = va_arg(ap,ptr_t);
	ld	hl,#0x0021
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	e,10 (ix)
	ld	d,11 (ix)
	inc	de
	inc	de
	ld	10 (ix),e
	ld	11 (ix),d
	ex	de,hl
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,b
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../printf_large.c:608: OUTPUT_CHAR('0', p);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x30
	push	af
	inc	sp
	ld	hl,#00345$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00345$:
	pop	af
	inc	sp
	inc	-32 (ix)
	jr	NZ,00346$
	inc	-31 (ix)
00346$:
;../printf_large.c:609: OUTPUT_CHAR('x', p);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x78
	push	af
	inc	sp
	ld	hl,#00347$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00347$:
	pop	af
	inc	sp
	inc	-32 (ix)
	jr	NZ,00348$
	inc	-31 (ix)
00348$:
;../printf_large.c:610: OUTPUT_2DIGITS( value.byte[1] );
	ld	hl,#0x0021
	add	hl,sp
	inc	hl
	ld	a,(hl)
	ld	c,a
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	b, -9 (ix)
	push	bc
	call	_output_2digits
	pop	af
	pop	af
	pop	af
	ld	a,-32 (ix)
	add	a,#0x02
	ld	-32 (ix),a
	ld	a,-31 (ix)
	adc	a,#0x00
	ld	-31 (ix),a
;../printf_large.c:611: OUTPUT_2DIGITS( value.byte[0] );
	ld	hl,#0x0021
	add	hl,sp
	ld	c,(hl)
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	b, -9 (ix)
	push	bc
	call	_output_2digits
	pop	af
	pop	af
	pop	af
	ld	a,-32 (ix)
	add	a,#0x02
	ld	-32 (ix),a
	ld	a,-31 (ix)
	adc	a,#0x00
	ld	-31 (ix),a
;../printf_large.c:613: break;
	jr	00156$
;../printf_large.c:616: case 'I':
00150$:
;../printf_large.c:617: signed_argument = 1;
	ld	-5 (ix),#0x01
;../printf_large.c:618: radix = 10;
	ld	-15 (ix),#0x0A
;../printf_large.c:619: break;
	jr	00156$
;../printf_large.c:621: case 'O':
00151$:
;../printf_large.c:622: radix = 8;
	ld	-15 (ix),#0x08
;../printf_large.c:623: break;
	jr	00156$
;../printf_large.c:625: case 'U':
00152$:
;../printf_large.c:626: radix = 10;
	ld	-15 (ix),#0x0A
;../printf_large.c:627: break;
	jr	00156$
;../printf_large.c:629: case 'X':
00153$:
;../printf_large.c:630: radix = 16;
	ld	-15 (ix),#0x10
;../printf_large.c:631: break;
	jr	00156$
;../printf_large.c:633: case 'F':
00154$:
;../printf_large.c:634: float_argument=1;
	ld	-8 (ix),#0x01
;../printf_large.c:635: break;
	jr	00156$
;../printf_large.c:637: default:
00155$:
;../printf_large.c:639: OUTPUT_CHAR( c, p );
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	bc
	inc	sp
	ld	hl,#00349$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00349$:
	pop	af
	inc	sp
	inc	-32 (ix)
	jr	NZ,00156$
	inc	-31 (ix)
;../printf_large.c:816: return charsOutputted;
	jr	00156$
;../printf_large.c:641: }
00306$:
	ld	-32 (ix),e
	ld	-31 (ix),d
	ld	-16 (ix),c
00156$:
;../printf_large.c:643: if (float_argument) {
	xor	a,a
	or	a,-8 (ix)
	jp	Z,00222$
;../printf_large.c:644: value.f=va_arg(ap,float);
	ld	hl,#0x0021
	add	hl,sp
	ld	b,l
	ld	d,h
	ld	a,10 (ix)
	add	a,#0x04
	ld	c,a
	ld	a,11 (ix)
	adc	a,#0x00
	ld	e,a
	ld	10 (ix),c
	ld	11 (ix),e
	ld	a,c
	add	a,#0xFC
	ld	l,a
	ld	a,e
	adc	a,#0xFF
	ld	h,a
	ld	a,(hl)
	ld	-43 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-42 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-41 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-40 (ix),a
	ld	l,b
	ld	h,d
	ld	a,-43 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-42 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-41 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-40 (ix)
	ld	(hl),a
;../printf_large.c:646: PTR="<NO FLOAT>";
	ld	hl,#0x0021
	add	hl,sp
	ld	(hl),#<(__str_0)
	inc	hl
	ld	(hl),#>(__str_0)
;../printf_large.c:647: while (c=*PTR++)
	ld	a,-32 (ix)
	ld	-43 (ix),a
	ld	a,-31 (ix)
	ld	-42 (ix),a
00157$:
	ld	hl,#0x0021
	add	hl,sp
	ld	b,l
	ld	d,h
	ld	a,(hl)
	ld	-34 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-33 (ix),a
	ld	a,-34 (ix)
	add	a,#0x01
	ld	e,a
	ld	a,-33 (ix)
	adc	a,#0x00
	ld	c,a
	ld	l,b
	ld	h,d
	ld	(hl),e
	inc	hl
	ld	(hl),c
	ld	l,-34 (ix)
	ld	h,-33 (ix)
	ld	l,(hl)
	ld	b,l
	xor	a,a
	or	a,l
	jp	Z,00227$
;../printf_large.c:649: OUTPUT_CHAR (c, p);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	bc
	inc	sp
	ld	hl,#00351$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00351$:
	pop	af
	inc	sp
	inc	-43 (ix)
	jr	NZ,00352$
	inc	-42 (ix)
00352$:
	ld	a,-43 (ix)
	ld	-32 (ix),a
	ld	a,-42 (ix)
	ld	-31 (ix),a
	jp	00157$
00222$:
;../printf_large.c:666: } else if (radix != 0)
	xor	a,a
	or	a,-15 (ix)
	jp	Z,00227$
;../printf_large.c:671: unsigned char MEM_SPACE_BUF_PP *pstore = &store[5];
	ld	a,-28 (ix)
	ld	-26 (ix),a
	ld	a,-27 (ix)
	ld	-25 (ix),a
;../printf_large.c:674: if (char_argument)
	xor	a,a
	or	a,-6 (ix)
	jp	Z,00168$
;../printf_large.c:676: value.l = va_arg(ap,char);
	ld	hl,#0x0021
	add	hl,sp
	ld	b,l
	ld	e,h
	ld	a,10 (ix)
	add	a,#0x01
	ld	d,a
	ld	a,11 (ix)
	adc	a,#0x00
	ld	c,a
	ld	10 (ix),d
	ld	11 (ix),c
	ld	l,d
	ld	h,c
	dec	hl
	ld	l,(hl)
	ld	-47 (ix),l
	ld	a,l
	rla	
	sbc	a,a
	ld	-46 (ix),a
	ld	-45 (ix),a
	ld	-44 (ix),a
	ld	l,b
	ld	h,e
	ld	a,-47 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-46 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-45 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-44 (ix)
	ld	(hl),a
;../printf_large.c:677: if (!signed_argument)
	xor	a,a
	or	a,-5 (ix)
	jp	NZ,00169$
;../printf_large.c:679: value.l &= 0xFF;
	ld	l,b
	ld	h,e
	ld	a,(hl)
	ld	-47 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-46 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-45 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-44 (ix),a
	ld	-46 (ix),#0x00
	ld	-45 (ix),#0x00
	ld	-44 (ix),#0x00
	ld	l,b
	ld	h,e
	ld	a,-47 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-46 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-45 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-44 (ix)
	ld	(hl),a
	jp	00169$
00168$:
;../printf_large.c:682: else if (long_argument)
	xor	a,a
	or	a,-7 (ix)
	jp	Z,00165$
;../printf_large.c:684: value.l = va_arg(ap,long);
	ld	hl,#0x0021
	add	hl,sp
	ld	b,l
	ld	d,h
	ld	a,10 (ix)
	add	a,#0x04
	ld	c,a
	ld	a,11 (ix)
	adc	a,#0x00
	ld	e,a
	ld	10 (ix),c
	ld	11 (ix),e
	ld	a,c
	add	a,#0xFC
	ld	l,a
	ld	a,e
	adc	a,#0xFF
	ld	h,a
	ld	a,(hl)
	ld	-43 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-42 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-41 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-40 (ix),a
	ld	l,b
	ld	h,d
	ld	a,-43 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-42 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-41 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-40 (ix)
	ld	(hl),a
	jp	00169$
00165$:
;../printf_large.c:688: value.l = va_arg(ap,int);
	ld	hl,#0x0021
	add	hl,sp
	ld	b,l
	ld	d,h
	ld	a,10 (ix)
	add	a,#0x02
	ld	c,a
	ld	a,11 (ix)
	adc	a,#0x00
	ld	e,a
	ld	10 (ix),c
	ld	11 (ix),e
	ld	l,c
	ld	h,e
	dec	hl
	dec	hl
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	-43 (ix),a
	ld	-42 (ix),h
	ld	a,h
	rla	
	sbc	a,a
	ld	-41 (ix),a
	ld	-40 (ix),a
	ld	l,b
	ld	h,d
	ld	a,-43 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-42 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-41 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-40 (ix)
	ld	(hl),a
;../printf_large.c:689: if (!signed_argument)
	xor	a,a
	or	a,-5 (ix)
	jr	NZ,00169$
;../printf_large.c:691: value.l &= 0xFFFF;
	ld	l,b
	ld	h,d
	ld	a,(hl)
	ld	-43 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-42 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-41 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-40 (ix),a
	ld	-41 (ix),#0x00
	ld	-40 (ix),#0x00
	ld	l,b
	ld	h,d
	ld	a,-43 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-42 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-41 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-40 (ix)
	ld	(hl),a
00169$:
;../printf_large.c:695: if ( signed_argument )
	xor	a,a
	or	a,-5 (ix)
	jr	Z,00174$
;../printf_large.c:697: if (value.l < 0)
	ld	hl,#0x0021
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	dec	hl
	dec	hl
	dec	hl
	ld	a,d
	bit	7,a
	jr	Z,00171$
;../printf_large.c:698: value.l = -value.l;
	xor	a,a
	sbc	a,c
	ld	c,a
	ld	a,#0x00
	sbc	a,b
	ld	b,a
	ld	a,#0x00
	sbc	a,e
	ld	e,a
	ld	a,#0x00
	sbc	a,d
	ld	d,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	jr	00174$
00171$:
;../printf_large.c:700: signed_argument = 0;
	ld	-5 (ix),#0x00
00174$:
;../printf_large.c:704: lsd = 1;
	ld	b,#0x01
;../printf_large.c:706: do {
	ld	a,-26 (ix)
	ld	-47 (ix),a
	ld	a,-25 (ix)
	ld	-46 (ix),a
	ld	-18 (ix),#0x00
00178$:
;../printf_large.c:707: value.byte[4] = 0;
	ld	hl,#0x0021
	add	hl,sp
	ld	c,l
	ld	e,h
	ld	a,c
	add	a,#0x04
	ld	c,a
	ld	a,e
	adc	a,#0x00
	ld	e,a
	ld	l,c
	ld	h,a
	ld	(hl),#0x00
;../printf_large.c:709: calculate_digit(&value, radix);
	ld	hl,#0x0021
	add	hl,sp
	ex	de,hl
	push	bc
	ld	a,-15 (ix)
	push	af
	inc	sp
	push	de
	call	_calculate_digit
	pop	af
	inc	sp
	pop	bc
;../printf_large.c:713: if (!lsd)
	xor	a,a
	or	a,b
	jr	NZ,00176$
;../printf_large.c:715: *pstore = (value.byte[4] << 4) | (value.byte[4] >> 4) | *pstore;
	ld	hl, #0x0021+1+1+1+1
	add	hl, sp
	ex	de, hl
	ld	a,(de)
	ld	l,a
	rlca
	rlca
	rlca
	rlca
	and	a,#0xF0
	ld	c,a
	ld	a,l
	srl	a
	srl	a
	srl	a
	srl	a
	or	a,c
	ld	c,a
	ld	l,-47 (ix)
	ld	h,-46 (ix)
	ld	a,(hl)
	or	a,c
	ld	l,-47 (ix)
	ld	h,-46 (ix)
	ld	(hl),a
;../printf_large.c:716: pstore--;
	ld	l,-47 (ix)
	ld	h,-46 (ix)
	dec	hl
	ld	-47 (ix),l
	ld	-46 (ix),h
	ld	a,-47 (ix)
	ld	-26 (ix),a
	ld	a,-46 (ix)
	ld	-25 (ix),a
	jr	00177$
00176$:
;../printf_large.c:720: *pstore = value.byte[4];
	ld	hl, #0x0021+1+1+1+1
	add	hl, sp
	ex	de, hl
	ld	a,(de)
	ld	l,-47 (ix)
	ld	h,-46 (ix)
	ld	(hl),a
00177$:
;../printf_large.c:722: length++;
	inc	-18 (ix)
	ld	a,-18 (ix)
	ld	-37 (ix),a
;../printf_large.c:723: lsd = !lsd;
	xor	a,a
	or	a,b
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	b,a
;../printf_large.c:724: } while( value.ul );
	ld	l,-30 (ix)
	ld	h,-29 (ix)
	ld	a,(hl)
	ld	-43 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-42 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-41 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-40 (ix),a
	ld	a,-43 (ix)
	or	a,-42 (ix)
	or	a,-41 (ix)
	or	a,-40 (ix)
	jp	NZ,00178$
;../printf_large.c:726: if (width == 0)
	ld	a,-47 (ix)
	ld	-26 (ix),a
	ld	a,-46 (ix)
	ld	-25 (ix),a
	ld	a,-18 (ix)
	ld	-37 (ix),a
	xor	a,a
	or	a,-16 (ix)
	jr	NZ,00182$
;../printf_large.c:731: width=1;
	ld	-16 (ix),#0x01
00182$:
;../printf_large.c:735: if (!zero_padding && !left_justify)
	xor	a,a
	or	a,-2 (ix)
	jr	NZ,00187$
	xor	a,a
	or	a,-1 (ix)
	jr	NZ,00187$
;../printf_large.c:737: while ( width > (unsigned char) (length+1) )
	ld	c,-37 (ix)
	inc	c
	ld	e,-32 (ix)
	ld	d,-31 (ix)
	ld	a,-16 (ix)
	ld	-47 (ix),a
00183$:
	ld	a,c
	sub	a,-47 (ix)
	jr	NC,00308$
;../printf_large.c:739: OUTPUT_CHAR( ' ', p );
	push	bc
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00353$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00353$:
	pop	af
	inc	sp
	pop	de
	pop	bc
	inc	de
	ld	-32 (ix),e
	ld	-31 (ix),d
;../printf_large.c:740: width--;
	dec	-47 (ix)
	jr	00183$
00308$:
	ld	-32 (ix),e
	ld	-31 (ix),d
	ld	a,-47 (ix)
	ld	-16 (ix),a
00187$:
;../printf_large.c:744: if (signed_argument) // this now means the original value was negative
	xor	a,a
	or	a,-5 (ix)
	jr	Z,00197$
;../printf_large.c:746: OUTPUT_CHAR( '-', p );
	push	bc
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x2D
	push	af
	inc	sp
	ld	hl,#00354$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00354$:
	pop	af
	inc	sp
	pop	bc
	inc	-32 (ix)
	jr	NZ,00355$
	inc	-31 (ix)
00355$:
;../printf_large.c:748: width--;
	dec	-16 (ix)
	jp	00198$
00197$:
;../printf_large.c:750: else if (length != 0)
	xor	a,a
	or	a,-37 (ix)
	jp	Z,00198$
;../printf_large.c:753: if (prefix_sign)
	xor	a,a
	or	a,-3 (ix)
	jr	Z,00192$
;../printf_large.c:755: OUTPUT_CHAR( '+', p );
	push	bc
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x2B
	push	af
	inc	sp
	ld	hl,#00356$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00356$:
	pop	af
	inc	sp
	pop	bc
	inc	-32 (ix)
	jr	NZ,00357$
	inc	-31 (ix)
00357$:
;../printf_large.c:757: width--;
	dec	-16 (ix)
	jr	00198$
00192$:
;../printf_large.c:759: else if (prefix_space)
	xor	a,a
	or	a,-4 (ix)
	jr	Z,00198$
;../printf_large.c:761: OUTPUT_CHAR( ' ', p );
	push	bc
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00358$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00358$:
	pop	af
	inc	sp
	pop	bc
	inc	-32 (ix)
	jr	NZ,00359$
	inc	-31 (ix)
00359$:
;../printf_large.c:763: width--;
	dec	-16 (ix)
00198$:
;../printf_large.c:768: if (!left_justify)
	xor	a,a
	or	a,-1 (ix)
	jr	NZ,00206$
;../printf_large.c:769: while ( width-- > length )
	ld	e,-32 (ix)
	ld	d,-31 (ix)
	ld	c,-16 (ix)
00199$:
	ld	l,c
	dec	c
	ld	-16 (ix),c
	ld	a,-37 (ix)
	sub	a,l
	jr	NC,00309$
;../printf_large.c:771: OUTPUT_CHAR( zero_padding ? '0' : ' ', p );
	xor	a,a
	or	a,-2 (ix)
	jr	Z,00232$
	ld	-47 (ix),#0x30
	jr	00233$
00232$:
	ld	-47 (ix),#0x20
00233$:
	push	bc
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,-47 (ix)
	push	af
	inc	sp
	ld	hl,#00360$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00360$:
	pop	af
	inc	sp
	pop	de
	pop	bc
	inc	de
	ld	-32 (ix),e
	ld	-31 (ix),d
	jr	00199$
00206$:
;../printf_large.c:776: if (width > length)
	ld	a,-37 (ix)
	sub	a,-16 (ix)
	jr	NC,00203$
;../printf_large.c:777: width -= length;
	ld	a,-16 (ix)
	sub	a,-37 (ix)
	ld	-16 (ix),a
	jr	00301$
00203$:
;../printf_large.c:779: width = 0;
	ld	-16 (ix),#0x00
;../printf_large.c:816: return charsOutputted;
	jr	00301$
;../printf_large.c:783: while( length-- )
00309$:
	ld	-32 (ix),e
	ld	-31 (ix),d
	ld	-16 (ix),c
00301$:
	ld	a,-26 (ix)
	ld	-39 (ix),a
	ld	a,-25 (ix)
	ld	-38 (ix),a
	ld	a,-32 (ix)
	ld	-47 (ix),a
	ld	a,-31 (ix)
	ld	-46 (ix),a
	ld	a,-37 (ix)
	ld	-43 (ix),a
00211$:
	ld	l,-43 (ix)
	dec	-43 (ix)
	xor	a,a
	or	a,l
	jp	Z,00310$
;../printf_large.c:785: lsd = !lsd;
	xor	a,a
	or	a,b
	sub	a,#0x01
	ld	a,#0x00
	rla
;../printf_large.c:786: if (!lsd)
	ld	b,a
	or	a,a
	jr	NZ,00209$
;../printf_large.c:788: pstore++;
	inc	-39 (ix)
	jr	NZ,00361$
	inc	-38 (ix)
00361$:
;../printf_large.c:789: value.byte[4] = *pstore >> 4;
	ld	hl,#0x0021
	add	hl,sp
	ld	c,l
	ld	e,h
	ld	a,c
	add	a,#0x04
	ld	c,a
	ld	a,e
	adc	a,#0x00
	ld	e,a
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
	ld	d,a
	srl	d
	srl	d
	srl	d
	srl	d
	ld	l,c
	ld	h,e
	ld	(hl),d
	jr	00210$
00209$:
;../printf_large.c:793: value.byte[4] = *pstore & 0x0F;
	ld	hl, #0x0021+1+1+1+1
	add	hl, sp
	ex	de, hl
	ld	l,-39 (ix)
	ld	h,-38 (ix)
	ld	a,(hl)
	and	a,#0x0F
	ld	(de),a
00210$:
;../printf_large.c:796: output_digit( value.byte[4], lower_case, output_char, p );
	ld	hl, #0x0021+1+1+1+1
	add	hl, sp
	ex	de, hl
	ld	a,(de)
	ld	c,a
	push	bc
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	ld	b, -9 (ix)
	push	bc
	call	_output_digit
	pop	af
	pop	af
	pop	af
	pop	bc
;../printf_large.c:797: charsOutputted++;
	inc	-47 (ix)
	jr	NZ,00362$
	inc	-46 (ix)
00362$:
	ld	a,-47 (ix)
	ld	-32 (ix),a
	ld	a,-46 (ix)
	ld	-31 (ix),a
	jp	00211$
00310$:
	ld	a,-47 (ix)
	ld	-32 (ix),a
	ld	a,-46 (ix)
	ld	-31 (ix),a
;../printf_large.c:802: if (left_justify)
	xor	a,a
	or	a,-1 (ix)
	jp	Z,00227$
;../printf_large.c:803: while (width-- > 0)
	ld	e,-47 (ix)
	ld	d,-46 (ix)
	ld	c,-16 (ix)
00214$:
	ld	l,c
	dec	c
	xor	a,a
	or	a,l
	jp	Z,00227$
;../printf_large.c:805: OUTPUT_CHAR(' ', p);
	push	bc
	push	de
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a,#0x20
	push	af
	inc	sp
	ld	hl,#00363$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00363$:
	pop	af
	inc	sp
	pop	de
	pop	bc
	inc	de
	ld	-32 (ix),e
	ld	-31 (ix),d
	jr	00214$
00225$:
;../printf_large.c:812: OUTPUT_CHAR( c, p );
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	push	bc
	inc	sp
	ld	hl,#00364$
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	jp	(hl)
00364$:
	pop	af
	inc	sp
	inc	-32 (ix)
	jp	NZ,00227$
	inc	-31 (ix)
	jp	00227$
00229$:
;../printf_large.c:816: return charsOutputted;
	ld	l,-32 (ix)
	ld	h,-31 (ix)
	ld	sp,ix
	pop	ix
	ret
__print_format_end::
__str_0:
	.ascii "<NO FLOAT>"
	.db 0x00
	.area _CODE
	.area _CABS
