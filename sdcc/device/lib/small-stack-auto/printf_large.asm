;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:01 2013
;--------------------------------------------------------
	.module printf_large
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __print_format
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'output_digit'
;------------------------------------------------------------
;output_char               Allocated to stack - offset -4
;p                         Allocated to stack - offset -7
;lower_case                Allocated to registers b0 
;n                         Allocated to registers r2 
;c                         Allocated to registers r2 
;------------------------------------------------------------
;	printf_large.c:110: static void output_digit( unsigned char n, BOOL lower_case, pfn_outputchar output_char, void* p )
;	-----------------------------------------
;	 function output_digit
;	-----------------------------------------
_output_digit:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	push	_bp
	mov	_bp,sp
	mov	r2,dpl
;	printf_large.c:112: register unsigned char c = n + (unsigned char)'0';
	mov	a,#0x30
	add	a,r2
;	printf_large.c:114: if (c > (unsigned char)'9')
	mov  r2,a
	add	a,#0xff - 0x39
	jnc	00104$
;	printf_large.c:116: c += (unsigned char)('A' - '0' - 10);
	mov	a,#0x07
	add	a,r2
	mov	r2,a
;	printf_large.c:117: if (lower_case)
	jnb	b0,00104$
;	printf_large.c:118: c += (unsigned char)('a' - 'A');
	mov	a,#0x20
	add	a,r2
	mov	r2,a
00104$:
;	printf_large.c:120: output_char( c, p );
	mov	a,_bp
	add	a,#0xf9
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00111$
	push	acc
	mov	a,#(00111$ >> 8)
	push	acc
	mov	a,_bp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r2
	ret
00111$:
	dec	sp
	dec	sp
	dec	sp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'output_2digits'
;------------------------------------------------------------
;output_char               Allocated to stack - offset -4
;p                         Allocated to stack - offset -7
;lower_case                Allocated to registers b0 
;b                         Allocated to registers r2 
;------------------------------------------------------------
;	printf_large.c:141: static void output_2digits( unsigned char b, BOOL lower_case, pfn_outputchar output_char, void* p )
;	-----------------------------------------
;	 function output_2digits
;	-----------------------------------------
_output_2digits:
	push	_bp
	mov	_bp,sp
;	printf_large.c:143: output_digit( b>>4,   lower_case, output_char, p );
	mov	a,dpl
	mov	r2,a
	swap	a
	anl	a,#0x0f
	mov	r3,a
	push	ar2
	push	bits
	mov	a,_bp
	add	a,#0xf9
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,_bp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	c,b0
	mov	b[0],c
	mov	bits,b
	mov	dpl,r3
	lcall	_output_digit
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	bits
	pop	ar2
;	printf_large.c:144: output_digit( b&0x0F, lower_case, output_char, p );
	anl	ar2,#0x0F
	mov	a,_bp
	add	a,#0xf9
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,_bp
	add	a,#0xfc
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	c,b0
	mov	b[0],c
	mov	bits,b
	mov	dpl,r2
	lcall	_output_digit
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'calculate_digit'
;------------------------------------------------------------
;radix                     Allocated to stack - offset -3
;value                     Allocated to registers r0 
;ul                        Allocated to registers r2 r3 r4 r5 
;pb4                       Allocated to registers r1 
;i                         Allocated to stack - offset 1
;sloc0                     Allocated to stack - offset 8
;------------------------------------------------------------
;	printf_large.c:158: static void calculate_digit( value_t _AUTOMEM * value, unsigned char radix )
;	-----------------------------------------
;	 function calculate_digit
;	-----------------------------------------
_calculate_digit:
	push	_bp
	mov	_bp,sp
	inc	sp
	mov	r0,dpl
;	printf_large.c:160: unsigned long ul = value->ul;
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	dec	r0
	dec	r0
	dec	r0
;	printf_large.c:161: unsigned char _AUTOMEM * pb4 = &value->byte[4];
	mov	a,#0x04
	add	a,r0
	mov	r1,a
;	printf_large.c:164: do
	push	ar0
	mov	r0,_bp
	inc	r0
	mov	@r0,#0x20
	pop	ar0
00103$:
;	printf_large.c:166: *pb4 = (*pb4 << 1) | ((ul >> 31) & 0x01);
	push	ar0
	mov	a,@r1
	add	a,@r1
	mov	r7,a
	mov	a,r5
	rl	a
	anl	a,#0x01
	orl	ar7,a
	mov	@r1,ar7
;	printf_large.c:167: ul <<= 1;
	mov	a,r2
	add	a,r2
	mov	r2,a
	mov	a,r3
	rlc	a
	mov	r3,a
	mov	a,r4
	rlc	a
	mov	r4,a
	mov	a,r5
	rlc	a
	mov	r5,a
;	printf_large.c:169: if (radix <= *pb4 )
	mov	ar6,@r1
	push	ar0
	mov	a,_bp
	add	a,#0xfd
	mov	r0,a
	clr	c
	mov	a,r6
	subb	a,@r0
	pop	ar0
	pop	ar0
	jc	00104$
;	printf_large.c:171: *pb4 -= radix;
	push	ar0
	mov	a,_bp
	add	a,#0xfd
	mov	r0,a
	mov	a,r6
	clr	c
	subb	a,@r0
	mov	r6,a
	pop	ar0
	mov	@r1,ar6
;	printf_large.c:172: ul |= 1;
	orl	ar2,#0x01
00104$:
;	printf_large.c:174: } while (--i);
	push	ar0
	mov	r0,_bp
	inc	r0
	dec	@r0
	mov	a,@r0
	pop	ar0
	jz	00114$
	sjmp	00103$
00114$:
;	printf_large.c:175: value->ul = ul;
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	mov	sp,_bp
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_print_format'
;------------------------------------------------------------
;pvoid                     Allocated to stack - offset -5
;format                    Allocated to stack - offset -8
;ap                        Allocated to stack - offset -9
;pfn                       Allocated to stack - offset 1
;left_justify              Allocated to registers b0 
;zero_padding              Allocated to registers b1 
;prefix_sign               Allocated to registers b2 
;prefix_space              Allocated to registers b3 
;signed_argument           Allocated to registers b4 
;char_argument             Allocated to registers b5 
;long_argument             Allocated to registers b6 
;float_argument            Allocated to registers b7 
;lower_case                Allocated to stack - offset 3
;value                     Allocated to stack - offset 4
;charsOutputted            Allocated to stack - offset 27
;lsd                       Allocated to registers b5 
;radix                     Allocated to stack - offset 9
;width                     Allocated to stack - offset 10
;decimals                  Allocated to registers r5 
;length                    Allocated to stack - offset 17
;c                         Allocated to registers r4 
;memtype                   Allocated to registers r2 
;store                     Allocated to stack - offset 11
;pstore                    Allocated to registers r2 
;sloc0                     Allocated to stack - offset 17
;sloc1                     Allocated to stack - offset 20
;sloc2                     Allocated to stack - offset 21
;sloc3                     Allocated to stack - offset 38
;sloc4                     Allocated to stack - offset 22
;sloc5                     Allocated to stack - offset 24
;sloc6                     Allocated to stack - offset 25
;sloc7                     Allocated to stack - offset 44
;sloc8                     Allocated to stack - offset 27
;------------------------------------------------------------
;	printf_large.c:402: int _print_format (pfn_outputchar pfn, void* pvoid, const char *format, va_list ap)
;	-----------------------------------------
;	 function _print_format
;	-----------------------------------------
__print_format:
	push	_bp
	mov	_bp,sp
	push	dpl
	push	dph
	mov	a,sp
	add	a,#0x1c
	mov	sp,a
;	printf_large.c:434: charsOutputted = 0;
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
;	printf_large.c:442: while( c=*format++ )
	mov	a,_bp
	add	a,#0x15
	mov	r0,a
	mov	a,_bp
	add	a,#0x04
	mov	@r0,a
	mov	a,_bp
	add	a,#0x0b
	xch	a,r0
	mov	a,_bp
	add	a,#0x14
	xch	a,r0
	add	a,#0x05
	mov	@r0,a
	mov	a,_bp
	add	a,#0x18
	mov	r0,a
	mov	a,_bp
	add	a,#0x04
	mov	@r0,a
00239$:
	mov	a,_bp
	add	a,#0xf8
	mov	r0,a
	mov	ar7,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar2,@r0
	mov	dpl,r7
	mov	dph,r6
	mov	b,r2
	lcall	__gptrget
	mov	r3,a
	mov	a,_bp
	add	a,#0xf8
	mov	r0,a
	mov	a,#0x01
	add	a,r7
	mov	@r0,a
	clr	a
	addc	a,r6
	inc	r0
	mov	@r0,a
	inc	r0
	mov	@r0,ar2
	mov	a,r3
	mov	r4,a
	jnz	00328$
	ljmp	00241$
00328$:
;	printf_large.c:444: if ( c=='%' )
	cjne	r4,#0x25,00329$
	sjmp	00330$
00329$:
	ljmp	00237$
00330$:
;	printf_large.c:446: left_justify    = 0;
	clr	b0
;	printf_large.c:447: zero_padding    = 0;
	clr	b1
;	printf_large.c:448: prefix_sign     = 0;
	clr	b2
;	printf_large.c:449: prefix_space    = 0;
	clr	b3
;	printf_large.c:450: signed_argument = 0;
	clr	b4
;	printf_large.c:451: char_argument   = 0;
	clr	b5
;	printf_large.c:452: long_argument   = 0;
	clr	b6
;	printf_large.c:453: float_argument  = 0;
	clr	b7
;	printf_large.c:454: radix           = 0;
	mov	a,_bp
	add	a,#0x09
	mov	r0,a
	mov	@r0,#0x00
;	printf_large.c:455: width           = 0;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,#0x00
;	printf_large.c:456: decimals        = -1;
	mov	r5,#0xFF
;	printf_large.c:458: get_conversion_spec:
	mov	a,_bp
	add	a,#0xf8
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar7,@r0
00101$:
;	printf_large.c:460: c = *format++;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
	mov	a,_bp
	add	a,#0xf8
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar7
	mov	ar4,r6
;	printf_large.c:462: if (c=='%') {
	cjne	r4,#0x25,00103$
;	printf_large.c:463: OUTPUT_CHAR(c, p);
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00333$
	push	acc
	mov	a,#(00333$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	ret
00333$:
	dec	sp
	dec	sp
	dec	sp
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00334$
	inc	r0
	inc	@r0
00334$:
;	printf_large.c:464: continue;
	ljmp	00239$
00103$:
;	printf_large.c:467: if (isdigit(c)) {
	mov	ar6,r4
	cjne	r6,#0x30,00335$
00335$:
	jc	00110$
	mov	ar6,r4
	mov	a,r6
	add	a,#0xff - 0x39
	jc	00110$
;	printf_large.c:468: if (decimals==-1) {
	cjne	r5,#0xFF,00107$
;	printf_large.c:469: width = 10*width + (c - '0');
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	a,@r0
	mov	b,#0x0A
	mul	ab
	mov	r6,a
	mov	a,r4
	add	a,#0xd0
	add	a,r6
	mov	r6,a
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,ar6
;	printf_large.c:470: if (width == 0) {
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	a,@r0
	jz	00340$
	ljmp	00101$
00340$:
;	printf_large.c:472: zero_padding = 1;
	setb	b1
	ljmp	00101$
00107$:
;	printf_large.c:475: decimals = 10*decimals + (c-'0');
	mov	a,r5
	mov	b,#0x0A
	mul	ab
	mov	r6,a
	mov	a,r4
	add	a,#0xd0
	add	a,r6
	mov	r6,a
	mov	r5,a
;	printf_large.c:477: goto get_conversion_spec;
	ljmp	00101$
00110$:
;	printf_large.c:480: if (c=='.') {
	cjne	r4,#0x2E,00115$
;	printf_large.c:481: if (decimals==-1) decimals=0;
	cjne	r5,#0xFF,00343$
	sjmp	00344$
00343$:
	ljmp	00101$
00344$:
	mov	r5,#0x00
;	printf_large.c:484: goto get_conversion_spec;
	ljmp	00101$
00115$:
;	printf_large.c:487: if (islower(c))
	mov	ar6,r4
	cjne	r6,#0x61,00345$
00345$:
	jc	00117$
	mov	ar6,r4
	mov	a,r6
	add	a,#0xff - 0x7A
	jc	00117$
;	printf_large.c:489: c = toupper(c);
	anl	ar4,#0xDF
;	printf_large.c:490: lower_case = 1;
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	mov	@r0,#0x01
	sjmp	00118$
00117$:
;	printf_large.c:493: lower_case = 0;
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	mov	@r0,#0x00
00118$:
;	printf_large.c:495: switch( c )
	cjne	r4,#0x20,00348$
	sjmp	00122$
00348$:
	cjne	r4,#0x2B,00349$
	sjmp	00121$
00349$:
	cjne	r4,#0x2D,00350$
	sjmp	00120$
00350$:
	cjne	r4,#0x42,00351$
	sjmp	00123$
00351$:
	cjne	r4,#0x43,00352$
	sjmp	00125$
00352$:
	cjne	r4,#0x44,00353$
	ljmp	00162$
00353$:
	cjne	r4,#0x46,00354$
	ljmp	00166$
00354$:
	cjne	r4,#0x49,00355$
	ljmp	00162$
00355$:
	cjne	r4,#0x4C,00356$
	sjmp	00124$
00356$:
	cjne	r4,#0x4F,00357$
	ljmp	00163$
00357$:
	cjne	r4,#0x50,00358$
	ljmp	00148$
00358$:
	cjne	r4,#0x53,00359$
	ljmp	00129$
00359$:
	cjne	r4,#0x55,00360$
	ljmp	00164$
00360$:
	cjne	r4,#0x58,00361$
	ljmp	00165$
00361$:
	ljmp	00167$
;	printf_large.c:497: case '-':
00120$:
;	printf_large.c:498: left_justify = 1;
	setb	b0
;	printf_large.c:499: goto get_conversion_spec;
	ljmp	00101$
;	printf_large.c:500: case '+':
00121$:
;	printf_large.c:501: prefix_sign = 1;
	setb	b2
;	printf_large.c:502: goto get_conversion_spec;
	ljmp	00101$
;	printf_large.c:503: case ' ':
00122$:
;	printf_large.c:504: prefix_space = 1;
	setb	b3
;	printf_large.c:505: goto get_conversion_spec;
	ljmp	00101$
;	printf_large.c:506: case 'B':
00123$:
;	printf_large.c:507: char_argument = 1;
	setb	b5
;	printf_large.c:508: goto get_conversion_spec;
	ljmp	00101$
;	printf_large.c:509: case 'L':
00124$:
;	printf_large.c:510: long_argument = 1;
	setb	b6
;	printf_large.c:511: goto get_conversion_spec;
	ljmp	00101$
;	printf_large.c:513: case 'C':
00125$:
;	printf_large.c:514: if( char_argument )
	jnb	b5,00127$
;	printf_large.c:515: c = va_arg(ap,char);
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	dec	a
	mov	r6,a
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	@r0,ar6
	mov	r0,ar6
	mov	ar6,@r0
	mov	ar4,r6
	sjmp	00128$
00127$:
;	printf_large.c:517: c = va_arg(ap,int);
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	add	a,#0xfe
	mov	r6,a
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	@r0,ar6
	mov	r0,ar6
	mov	ar6,@r0
	inc	r0
	mov	ar2,@r0
	mov	ar4,r6
;	printf_large.c:816: return charsOutputted;
;	printf_large.c:517: c = va_arg(ap,int);
00128$:
;	printf_large.c:518: OUTPUT_CHAR( c, p );
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00363$
	push	acc
	mov	a,#(00363$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	ret
00363$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00364$
	inc	r0
	inc	@r0
00364$:
;	printf_large.c:519: break;
	ljmp	00168$
;	printf_large.c:521: case 'S':
00129$:
;	printf_large.c:522: PTR = va_arg(ap,ptr_t);
	mov	a,_bp
	add	a,#0x04
	mov	r2,a
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	add	a,#0xfd
	mov	r6,a
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	@r0,ar6
	mov	r0,ar6
	mov	ar6,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar7,@r0
	mov	r0,ar2
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar7
;	printf_large.c:532: length = strlen(PTR);
	mov	dpl,r6
	mov	dph,r3
	mov	b,r7
	push	ar5
	push	bits
	lcall	_strlen
	mov	r2,dpl
	mov	r3,dph
	pop	bits
	pop	ar5
	mov	a,_bp
	add	a,#0x11
	mov	r0,a
	mov	@r0,ar2
;	printf_large.c:534: if ( decimals == -1 )
	cjne	r5,#0xFF,00131$
;	printf_large.c:536: decimals = length;
	mov	a,_bp
	add	a,#0x11
	mov	r0,a
	mov	ar5,@r0
00131$:
;	printf_large.c:538: if ( ( !left_justify ) && (length < width) )
	jnb	b0,00367$
	ljmp	00281$
00367$:
	mov	a,_bp
	add	a,#0x11
	mov	r0,a
	mov	a,_bp
	add	a,#0x0a
	mov	r1,a
	clr	c
	mov	a,@r0
	subb	a,@r1
	jc	00368$
	ljmp	00281$
00368$:
;	printf_large.c:540: width -= length;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	a,_bp
	add	a,#0x11
	mov	r1,a
	mov	a,@r0
	clr	c
	subb	a,@r1
	mov	@r0,a
;	printf_large.c:541: while( width-- != 0 )
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	ar7,@r0
00132$:
	mov	ar6,r7
	dec	r7
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,ar7
	mov	a,r6
	jz	00321$
;	printf_large.c:543: OUTPUT_CHAR( ' ', p );
	push	ar2
	push	ar3
	push	ar5
	push	ar7
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00370$
	push	acc
	mov	a,#(00370$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x20
	ret
00370$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar7
	pop	ar5
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,00371$
	inc	r3
00371$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
;	printf_large.c:547: while ( (c = *PTR)  && (decimals-- > 0))
	sjmp	00132$
00321$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,ar7
00281$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	a,_bp
	add	a,#0x16
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
00139$:
	mov	a,_bp
	add	a,#0x15
	mov	r0,a
	mov	ar0,@r0
	mov	ar7,@r0
	inc	r0
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	dec	r0
	dec	r0
	mov	dpl,r7
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	r7,a
	mov	r4,a
	jnz	00372$
	ljmp	00322$
00372$:
	mov	ar2,r5
	dec	r5
	clr	c
	mov	a,#(0x00 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	00322$
;	printf_large.c:549: OUTPUT_CHAR( c, p );
	push	ar5
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00374$
	push	acc
	mov	a,#(00374$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	ret
00374$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar5
	mov	a,_bp
	add	a,#0x16
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00375$
	inc	r0
	inc	@r0
00375$:
	mov	a,_bp
	add	a,#0x16
	mov	r0,a
	mov	a,_bp
	add	a,#0x1b
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
;	printf_large.c:550: PTR++;
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	inc	r0
	mov	ar6,@r0
	dec	r0
	dec	r0
	inc	r2
	cjne	r2,#0x00,00376$
	inc	r3
00376$:
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	dec	r0
	dec	r0
	ljmp	00139$
00322$:
	mov	a,_bp
	add	a,#0x16
	mov	r0,a
	mov	a,_bp
	add	a,#0x1b
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
;	printf_large.c:553: if ( left_justify && (length < width))
	jb	b0,00377$
	ljmp	00168$
00377$:
	mov	a,_bp
	add	a,#0x11
	mov	r0,a
	mov	a,_bp
	add	a,#0x0a
	mov	r1,a
	clr	c
	mov	a,@r0
	subb	a,@r1
	jc	00378$
	ljmp	00168$
00378$:
;	printf_large.c:555: width -= length;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	a,_bp
	add	a,#0x11
	mov	r1,a
	mov	a,@r0
	clr	c
	subb	a,@r1
	mov	@r0,a
;	printf_large.c:556: while( width-- != 0 )
	mov	a,_bp
	add	a,#0x16
	mov	r0,a
	mov	ar2,@r0
	inc	r0
	mov	ar3,@r0
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	ar6,@r0
00142$:
	mov	ar7,r6
	dec	r6
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,ar6
	mov	a,r7
	jnz	00379$
	ljmp	00323$
00379$:
;	printf_large.c:558: OUTPUT_CHAR( ' ', p );
	push	ar2
	push	ar3
	push	ar6
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00380$
	push	acc
	mov	a,#(00380$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x20
	ret
00380$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar6
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,00381$
	inc	r3
00381$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
;	printf_large.c:563: case 'P':
	sjmp	00142$
00148$:
;	printf_large.c:564: PTR = va_arg(ap,ptr_t);
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	a,_bp
	add	a,#0xf7
	mov	r1,a
	mov	a,@r1
	add	a,#0xfd
	mov	r7,a
	mov	a,_bp
	add	a,#0xf7
	mov	r1,a
	mov	@r1,ar7
	mov	r1,ar7
	mov	ar7,@r1
	inc	r1
	mov	ar4,@r1
	inc	r1
	mov	ar5,@r1
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	dec	r0
	dec	r0
;	printf_large.c:587: unsigned char memtype = value.byte[2];
	mov	a,_bp
	add	a,#0x04
	add	a,#0x02
	mov	r0,a
	mov	ar4,@r0
	mov	ar2,r4
;	printf_large.c:588: if (memtype >= 0x80)
	cjne	r2,#0x80,00382$
00382$:
	jc	00156$
;	printf_large.c:589: c = 'C';
	mov	r4,#0x43
	sjmp	00157$
00156$:
;	printf_large.c:590: else if (memtype >= 0x60)
	cjne	r2,#0x60,00384$
00384$:
	jc	00153$
;	printf_large.c:591: c = 'P';
	mov	r4,#0x50
	sjmp	00157$
00153$:
;	printf_large.c:592: else if (memtype >= 0x40)
	cjne	r2,#0x40,00386$
00386$:
	jc	00150$
;	printf_large.c:593: c = 'I';
	mov	r4,#0x49
	sjmp	00157$
00150$:
;	printf_large.c:595: c = 'X';
	mov	r4,#0x58
00157$:
;	printf_large.c:597: OUTPUT_CHAR(c, p);
	push	ar4
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00388$
	push	acc
	mov	a,#(00388$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	ret
00388$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar4
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00389$
	inc	r0
	inc	@r0
00389$:
;	printf_large.c:598: OUTPUT_CHAR(':', p);
	push	ar4
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00390$
	push	acc
	mov	a,#(00390$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x3A
	ret
00390$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar4
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00391$
	inc	r0
	inc	@r0
00391$:
;	printf_large.c:599: OUTPUT_CHAR('0', p);
	push	ar4
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00392$
	push	acc
	mov	a,#(00392$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x30
	ret
00392$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar4
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00393$
	inc	r0
	inc	@r0
00393$:
;	printf_large.c:600: OUTPUT_CHAR('x', p);
	push	ar4
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00394$
	push	acc
	mov	a,#(00394$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x78
	ret
00394$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar4
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00395$
	inc	r0
	inc	@r0
00395$:
;	printf_large.c:601: if ((c != 'I' /* idata */) &&
	cjne	r4,#0x49,00396$
	sjmp	00159$
00396$:
;	printf_large.c:602: (c != 'P' /* pdata */))
	cjne	r4,#0x50,00397$
	sjmp	00159$
00397$:
;	printf_large.c:604: OUTPUT_2DIGITS( value.byte[1] );
	mov	a,_bp
	add	a,#0x04
	inc	a
	mov	r0,a
	mov	ar7,@r0
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	mov	a,@r0
	add	a,#0xff
	mov	b[0],c
	mov	bits,b
	mov	dpl,r7
	lcall	_output_2digits
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	bits
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	a,#0x02
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
00159$:
;	printf_large.c:606: OUTPUT_2DIGITS( value.byte[0] );
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	ar7,@r0
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,_bp
	add	a,#0x03
	mov	r0,a
	mov	a,@r0
	add	a,#0xff
	mov	b[0],c
	mov	bits,b
	mov	dpl,r7
	lcall	_output_2digits
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	bits
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	a,#0x02
	add	a,@r0
	mov	@r0,a
	clr	a
	inc	r0
	addc	a,@r0
	mov	@r0,a
;	printf_large.c:613: break;
;	printf_large.c:616: case 'I':
	sjmp	00168$
00162$:
;	printf_large.c:617: signed_argument = 1;
	setb	b4
;	printf_large.c:618: radix = 10;
	mov	a,_bp
	add	a,#0x09
	mov	r0,a
	mov	@r0,#0x0A
;	printf_large.c:619: break;
;	printf_large.c:621: case 'O':
	sjmp	00168$
00163$:
;	printf_large.c:622: radix = 8;
	mov	a,_bp
	add	a,#0x09
	mov	r0,a
	mov	@r0,#0x08
;	printf_large.c:623: break;
;	printf_large.c:625: case 'U':
	sjmp	00168$
00164$:
;	printf_large.c:626: radix = 10;
	mov	a,_bp
	add	a,#0x09
	mov	r0,a
	mov	@r0,#0x0A
;	printf_large.c:627: break;
;	printf_large.c:629: case 'X':
	sjmp	00168$
00165$:
;	printf_large.c:630: radix = 16;
	mov	a,_bp
	add	a,#0x09
	mov	r0,a
	mov	@r0,#0x10
;	printf_large.c:631: break;
;	printf_large.c:633: case 'F':
	sjmp	00168$
00166$:
;	printf_large.c:634: float_argument=1;
	setb	b7
;	printf_large.c:635: break;
;	printf_large.c:637: default:
	sjmp	00168$
00167$:
;	printf_large.c:639: OUTPUT_CHAR( c, p );
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00398$
	push	acc
	mov	a,#(00398$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	ret
00398$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00399$
	inc	r0
	inc	@r0
00399$:
;	printf_large.c:816: return charsOutputted;
;	printf_large.c:641: }
	sjmp	00168$
00323$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,ar6
00168$:
;	printf_large.c:643: if (float_argument) {
	jb	b7,00400$
	ljmp	00234$
00400$:
;	printf_large.c:644: value.f=va_arg(ap,float);
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	a,_bp
	add	a,#0xf7
	mov	r1,a
	mov	a,@r1
	add	a,#0xfc
	mov	r2,a
	mov	a,_bp
	add	a,#0xf7
	mov	r1,a
	mov	@r1,ar2
	mov	r1,ar2
	mov	ar2,@r1
	inc	r1
	mov	ar3,@r1
	inc	r1
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	dec	r0
	dec	r0
	dec	r0
;	printf_large.c:646: PTR="<NO FLOAT>";
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	@r0,#__str_0
	inc	r0
	mov	@r0,#(__str_0 >> 8)
	inc	r0
	mov	@r0,#0x80
	dec	r0
	dec	r0
;	printf_large.c:647: while (c=*PTR++)
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	a,_bp
	add	a,#0x19
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
00169$:
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	inc	r0
	mov	ar4,@r0
	dec	r0
	dec	r0
	mov	a,#0x01
	add	a,r6
	mov	r5,a
	clr	a
	addc	a,r7
	mov	r2,a
	mov	ar3,r4
	mov	@r0,ar5
	inc	r0
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	dec	r0
	dec	r0
	mov	dpl,r6
	mov	dph,r7
	mov	b,r4
	lcall	__gptrget
	mov	r6,a
	mov	r4,a
	jnz	00401$
	ljmp	00239$
00401$:
;	printf_large.c:649: OUTPUT_CHAR (c, p);
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00402$
	push	acc
	mov	a,#(00402$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	ret
00402$:
	dec	sp
	dec	sp
	dec	sp
	mov	a,_bp
	add	a,#0x19
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00403$
	inc	r0
	inc	@r0
00403$:
	mov	a,_bp
	add	a,#0x19
	mov	r0,a
	mov	a,_bp
	add	a,#0x1b
	mov	r1,a
	mov	a,@r0
	mov	@r1,a
	inc	r0
	inc	r1
	mov	a,@r0
	mov	@r1,a
	sjmp	00169$
00234$:
;	printf_large.c:666: } else if (radix != 0)
	mov	a,_bp
	add	a,#0x09
	mov	r0,a
	mov	a,@r0
	jnz	00404$
	ljmp	00239$
00404$:
;	printf_large.c:671: unsigned char MEM_SPACE_BUF_PP *pstore = &store[5];
	mov	a,_bp
	add	a,#0x14
	mov	r0,a
	mov	ar2,@r0
;	printf_large.c:674: if (char_argument)
	jnb	b5,00180$
;	printf_large.c:676: value.l = va_arg(ap,char);
	push	ar2
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	push	ar0
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	dec	a
	mov	r1,a
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	@r0,ar1
	pop	ar0
	mov	a,@r1
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	r2,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar2
	dec	r0
	dec	r0
	dec	r0
;	printf_large.c:677: if (!signed_argument)
	pop	ar2
	jnb	b4,00406$
	ljmp	00181$
00406$:
;	printf_large.c:679: value.l &= 0xFF;
	push	ar2
	mov	ar3,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	inc	r0
	mov	ar2,@r0
	dec	r0
	dec	r0
	dec	r0
	mov	r6,#0x00
	mov	r7,#0x00
	mov	r2,#0x00
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar2
	dec	r0
	dec	r0
	dec	r0
	pop	ar2
	ljmp	00181$
00180$:
;	printf_large.c:682: else if (long_argument)
	jnb	b6,00177$
;	printf_large.c:684: value.l = va_arg(ap,long);
	push	ar2
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	push	ar0
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	add	a,#0xfc
	mov	r1,a
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	@r0,ar1
	pop	ar0
	mov	ar3,@r1
	inc	r1
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	inc	r1
	mov	ar2,@r1
	dec	r1
	dec	r1
	dec	r1
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar2
	dec	r0
	dec	r0
	dec	r0
	pop	ar2
	sjmp	00181$
00177$:
;	printf_large.c:688: value.l = va_arg(ap,int);
	push	ar2
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	push	ar0
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	a,@r0
	add	a,#0xfe
	mov	r1,a
	mov	a,_bp
	add	a,#0xf7
	mov	r0,a
	mov	@r0,ar1
	pop	ar0
	mov	ar3,@r1
	inc	r1
	mov	ar6,@r1
	dec	r1
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	r2,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar2
	dec	r0
	dec	r0
	dec	r0
;	printf_large.c:689: if (!signed_argument)
	pop	ar2
	jb	b4,00181$
;	printf_large.c:691: value.l &= 0xFFFF;
	push	ar2
	mov	ar3,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	inc	r0
	mov	ar2,@r0
	dec	r0
	dec	r0
	dec	r0
	mov	r7,#0x00
	mov	r2,#0x00
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar2
	dec	r0
	dec	r0
	dec	r0
;	printf_large.c:816: return charsOutputted;
	pop	ar2
;	printf_large.c:691: value.l &= 0xFFFF;
00181$:
;	printf_large.c:695: if ( signed_argument )
	jnb	b4,00186$
;	printf_large.c:697: if (value.l < 0)
	mov	a,_bp
	add	a,#0x04
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar6,@r0
	inc	r0
	mov	ar5,@r0
	inc	r0
	mov	ar4,@r0
	dec	r0
	dec	r0
	dec	r0
	mov	a,r4
	jnb	acc.7,00183$
;	printf_large.c:698: value.l = -value.l;
	push	ar2
	clr	c
	clr	a
	subb	a,r3
	mov	r3,a
	clr	a
	subb	a,r6
	mov	r6,a
	clr	a
	subb	a,r5
	mov	r7,a
	clr	a
	subb	a,r4
	mov	r2,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar6
	inc	r0
	mov	@r0,ar7
	inc	r0
	mov	@r0,ar2
	dec	r0
	dec	r0
	dec	r0
	pop	ar2
	sjmp	00186$
00183$:
;	printf_large.c:700: signed_argument = 0;
	clr	b4
00186$:
;	printf_large.c:704: lsd = 1;
	setb	b5
;	printf_large.c:706: do {
	mov	ar0,r2
	mov	r5,#0x00
00190$:
;	printf_large.c:707: value.byte[4] = 0;
	mov	a,_bp
	add	a,#0x04
	add	a,#0x04
	mov	r1,a
	mov	@r1,#0x00
;	printf_large.c:709: calculate_digit(&value, radix);
	mov	a,_bp
	add	a,#0x04
	mov	r6,a
	push	ar5
	push	ar0
	push	bits
	mov	a,_bp
	add	a,#0x09
	mov	r1,a
	mov	a,@r1
	push	acc
	mov	dpl,r6
	lcall	_calculate_digit
	dec	sp
	pop	bits
	pop	ar0
	pop	ar5
;	printf_large.c:713: if (!lsd)
	jb	b5,00188$
;	printf_large.c:715: *pstore = (value.byte[4] << 4) | (value.byte[4] >> 4) | *pstore;
	mov	a,_bp
	add	a,#0x04
	add	a,#0x04
	mov	r1,a
	mov	a,@r1
	swap	a
	mov	r6,a
	mov	a,@r0
	mov	r7,a
	orl	ar6,a
	mov	@r0,ar6
;	printf_large.c:716: pstore--;
	dec	r0
	mov	ar2,r0
	sjmp	00189$
00188$:
;	printf_large.c:720: *pstore = value.byte[4];
	mov	a,_bp
	add	a,#0x04
	add	a,#0x04
	mov	r1,a
	mov	ar6,@r1
	mov	@r0,ar6
00189$:
;	printf_large.c:722: length++;
	inc	r5
	mov	a,_bp
	add	a,#0x11
	mov	r1,a
	mov	@r1,ar5
;	printf_large.c:723: lsd = !lsd;
	cpl	b5
;	printf_large.c:724: } while( value.ul );
	mov	a,_bp
	add	a,#0x18
	mov	r1,a
	mov	ar1,@r1
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	inc	r1
	mov	ar3,@r1
	inc	r1
	mov	ar4,@r1
	dec	r1
	dec	r1
	dec	r1
	mov	a,r6
	orl	a,r7
	orl	a,r3
	orl	a,r4
	jnz	00190$
;	printf_large.c:726: if (width == 0)
	mov	ar2,r0
	mov	a,_bp
	add	a,#0x11
	mov	r0,a
	mov	@r0,ar5
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	a,@r0
	jnz	00194$
;	printf_large.c:731: width=1;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,#0x01
00194$:
;	printf_large.c:735: if (!zero_padding && !left_justify)
	jnb	b1,00414$
	ljmp	00199$
00414$:
	jnb	b0,00415$
	ljmp	00199$
00415$:
;	printf_large.c:737: while ( width > (unsigned char) (length+1) )
	mov	a,_bp
	add	a,#0x11
	mov	r0,a
	mov	a,@r0
	inc	a
	mov	r3,a
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	ar4,@r0
	inc	r0
	mov	ar5,@r0
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	ar6,@r0
00195$:
	clr	c
	mov	a,r3
	subb	a,r6
	jnc	00325$
;	printf_large.c:739: OUTPUT_CHAR( ' ', p );
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00417$
	push	acc
	mov	a,#(00417$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x20
	ret
00417$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r4
	cjne	r4,#0x00,00418$
	inc	r5
00418$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
;	printf_large.c:740: width--;
	dec	r6
	sjmp	00195$
00325$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar4
	inc	r0
	mov	@r0,ar5
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,ar6
00199$:
;	printf_large.c:744: if (signed_argument) // this now means the original value was negative
	jnb	b4,00209$
;	printf_large.c:746: OUTPUT_CHAR( '-', p );
	push	ar2
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00420$
	push	acc
	mov	a,#(00420$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x2D
	ret
00420$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar2
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00421$
	inc	r0
	inc	@r0
00421$:
;	printf_large.c:748: width--;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	dec	@r0
	ljmp	00210$
00209$:
;	printf_large.c:750: else if (length != 0)
	mov	a,_bp
	add	a,#0x11
	mov	r0,a
	mov	a,@r0
	jnz	00422$
	ljmp	00210$
00422$:
;	printf_large.c:753: if (prefix_sign)
	jnb	b2,00204$
;	printf_large.c:755: OUTPUT_CHAR( '+', p );
	push	ar2
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00424$
	push	acc
	mov	a,#(00424$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x2B
	ret
00424$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar2
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00425$
	inc	r0
	inc	@r0
00425$:
;	printf_large.c:757: width--;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	dec	@r0
	sjmp	00210$
00204$:
;	printf_large.c:759: else if (prefix_space)
	jnb	b3,00210$
;	printf_large.c:761: OUTPUT_CHAR( ' ', p );
	push	ar2
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00427$
	push	acc
	mov	a,#(00427$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x20
	ret
00427$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar2
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00428$
	inc	r0
	inc	@r0
00428$:
;	printf_large.c:763: width--;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	dec	@r0
00210$:
;	printf_large.c:768: if (!left_justify)
	jnb	b0,00429$
	ljmp	00218$
00429$:
;	printf_large.c:769: while ( width-- > length )
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	ar3,@r0
	inc	r0
	mov	ar4,@r0
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	ar5,@r0
00211$:
	mov	ar6,r5
	dec	r5
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,ar5
	mov	a,_bp
	add	a,#0x11
	mov	r0,a
	clr	c
	mov	a,@r0
	subb	a,r6
	jc	00430$
	ljmp	00326$
00430$:
;	printf_large.c:771: OUTPUT_CHAR( zero_padding ? '0' : ' ', p );
	jnb	b1,00244$
	mov	r6,#0x30
	sjmp	00245$
00244$:
	mov	r6,#0x20
00245$:
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00432$
	push	acc
	mov	a,#(00432$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r6
	ret
00432$:
	dec	sp
	dec	sp
	dec	sp
	pop	bits
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r3
	cjne	r3,#0x00,00433$
	inc	r4
00433$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	sjmp	00211$
00218$:
;	printf_large.c:776: if (width > length)
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	a,_bp
	add	a,#0x11
	mov	r1,a
	clr	c
	mov	a,@r1
	subb	a,@r0
	jnc	00215$
;	printf_large.c:777: width -= length;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	a,_bp
	add	a,#0x11
	mov	r1,a
	mov	a,@r0
	clr	c
	subb	a,@r1
	mov	@r0,a
	sjmp	00318$
00215$:
;	printf_large.c:779: width = 0;
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,#0x00
;	printf_large.c:816: return charsOutputted;
;	printf_large.c:783: while( length-- )
	sjmp	00318$
00326$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar3
	inc	r0
	mov	@r0,ar4
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	@r0,ar5
00318$:
	mov	ar0,r2
	mov	a,_bp
	add	a,#0x1b
	mov	r1,a
	mov	ar2,@r1
	inc	r1
	mov	ar3,@r1
	mov	a,_bp
	add	a,#0x11
	mov	r1,a
	mov	ar4,@r1
00223$:
	mov	ar5,r4
	dec	r4
	mov	a,r5
	jnz	00435$
	ljmp	00327$
00435$:
;	printf_large.c:785: lsd = !lsd;
	cpl	b5
;	printf_large.c:786: if (!lsd)
	jb	b5,00221$
;	printf_large.c:788: pstore++;
	inc	r0
;	printf_large.c:789: value.byte[4] = *pstore >> 4;
	mov	a,_bp
	add	a,#0x04
	add	a,#0x04
	mov	r1,a
	mov	a,@r0
	swap	a
	anl	a,#0x0f
	mov	r5,a
	mov	@r1,a
	sjmp	00222$
00221$:
;	printf_large.c:793: value.byte[4] = *pstore & 0x0F;
	mov	a,_bp
	add	a,#0x04
	add	a,#0x04
	mov	r1,a
	mov	ar5,@r0
	mov	a,#0x0F
	anl	a,r5
	mov	@r1,a
00222$:
;	printf_large.c:796: output_digit( value.byte[4], lower_case, output_char, p );
	mov	a,_bp
	add	a,#0x04
	add	a,#0x04
	mov	r1,a
	mov	ar5,@r1
	push	ar2
	push	ar3
	push	ar4
	push	ar0
	push	bits
	mov	a,_bp
	add	a,#0xfb
	mov	r1,a
	mov	a,@r1
	push	acc
	inc	r1
	mov	a,@r1
	push	acc
	inc	r1
	mov	a,@r1
	push	acc
	mov	r1,_bp
	inc	r1
	mov	a,@r1
	push	acc
	inc	r1
	mov	a,@r1
	push	acc
	mov	a,_bp
	add	a,#0x03
	mov	r1,a
	mov	a,@r1
	add	a,#0xff
	mov	b[0],c
	mov	bits,b
	mov	dpl,r5
	lcall	_output_digit
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	bits
	pop	ar0
	pop	ar4
	pop	ar3
	pop	ar2
;	printf_large.c:797: charsOutputted++;
	inc	r2
	cjne	r2,#0x00,00437$
	inc	r3
00437$:
	mov	a,_bp
	add	a,#0x1b
	mov	r1,a
	mov	@r1,ar2
	inc	r1
	mov	@r1,ar3
	ljmp	00223$
00327$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
;	printf_large.c:802: if (left_justify)
	jb	b0,00438$
	ljmp	00239$
00438$:
;	printf_large.c:803: while (width-- > 0)
	mov	a,_bp
	add	a,#0x0a
	mov	r0,a
	mov	ar4,@r0
00226$:
	mov	ar5,r4
	dec	r4
	mov	a,r5
	jnz	00439$
	ljmp	00239$
00439$:
;	printf_large.c:805: OUTPUT_CHAR(' ', p);
	push	ar2
	push	ar3
	push	ar4
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00440$
	push	acc
	mov	a,#(00440$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,#0x20
	ret
00440$:
	dec	sp
	dec	sp
	dec	sp
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,00441$
	inc	r3
00441$:
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	@r0,ar2
	inc	r0
	mov	@r0,ar3
	sjmp	00226$
00237$:
;	printf_large.c:812: OUTPUT_CHAR( c, p );
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#00442$
	push	acc
	mov	a,#(00442$ >> 8)
	push	acc
	mov	r0,_bp
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dpl,r4
	ret
00442$:
	dec	sp
	dec	sp
	dec	sp
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	inc	@r0
	cjne	@r0,#0x00,00443$
	inc	r0
	inc	@r0
00443$:
	ljmp	00239$
00241$:
;	printf_large.c:816: return charsOutputted;
	mov	a,_bp
	add	a,#0x1b
	mov	r0,a
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	mov	sp,_bp
	pop	_bp
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
__str_0:
	.ascii "<NO FLOAT>"
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
