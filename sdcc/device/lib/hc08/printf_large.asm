;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:39 2013
;--------------------------------------------------------
	.module printf_large
	.optsdcc -mhc08
	
	.area HOME (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT (CODE)
	.area GSFINAL (CODE)
	.area CSEG (CODE)
	.area XINIT
	.area CONST   (CODE)
	.area DSEG
	.area OSEG    (OVR)
	.area BSEG
	.area XSEG
	.area XISEG
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __print_format_PARM_4
	.globl __print_format_PARM_3
	.globl __print_format_PARM_2
	.globl __print_format
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
_output_digit_c_1_1:
	.ds 1
__print_format_sloc0_1_0:
	.ds 2
__print_format_sloc1_1_0:
	.ds 1
__print_format_sloc2_1_0:
	.ds 4
__print_format_sloc3_1_0:
	.ds 4
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
_calculate_digit_ul_1_1::
	.ds 4
_calculate_digit_b4_1_1::
	.ds 1
_calculate_digit_i_1_1::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG
;--------------------------------------------------------
; extended address mode data
;--------------------------------------------------------
	.area XSEG
_lower_case:
	.ds 1
_output_char:
	.ds 2
_p:
	.ds 2
_value:
	.ds 5
_charsOutputted:
	.ds 2
__output_char_c_1_1:
	.ds 1
_output_2digits_b_1_1:
	.ds 1
_calculate_digit_radix_1_1:
	.ds 1
__print_format_PARM_2:
	.ds 2
__print_format_PARM_3:
	.ds 2
__print_format_PARM_4:
	.ds 2
__print_format_left_justify_1_1:
	.ds 1
__print_format_zero_padding_1_1:
	.ds 1
__print_format_prefix_sign_1_1:
	.ds 1
__print_format_prefix_space_1_1:
	.ds 1
__print_format_signed_argument_1_1:
	.ds 1
__print_format_char_argument_1_1:
	.ds 1
__print_format_long_argument_1_1:
	.ds 1
__print_format_float_argument_1_1:
	.ds 1
__print_format_lsd_1_1:
	.ds 1
__print_format_radix_1_1:
	.ds 1
__print_format_width_1_1:
	.ds 1
__print_format_decimals_1_1:
	.ds 1
__print_format_length_1_1:
	.ds 1
__print_format_c_1_1:
	.ds 1
__print_format_store_4_20:
	.ds 6
__print_format_pstore_4_20:
	.ds 2
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME (CODE)
	.area GSINIT (CODE)
	.area GSFINAL (CODE)
	.area GSINIT (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME (CODE)
	.area HOME (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function '_output_char'
;------------------------------------------------------------
;c                         Allocated with name '__output_char_c_1_1'
;------------------------------------------------------------
;../printf_large.c:100: static void _output_char( unsigned char c )
;	-----------------------------------------
;	 function _output_char
;	-----------------------------------------
__output_char:
	sta	__output_char_c_1_1
;../printf_large.c:102: output_char( c, p );
	lda	(_p + 1)
	psha
	lda	_p
	psha
	bsr	00104$
	bra	00103$
00104$:
	lda	(_output_char + 1)
	psha
	lda	_output_char
	psha
	lda	__output_char_c_1_1
	rts
00103$:
	ais	#2
;../printf_large.c:103: charsOutputted++;
	lda	(_charsOutputted + 1)
	inca
	sta	(_charsOutputted + 1)
	bne	00105$
	lda	_charsOutputted
	inca
	sta	_charsOutputted
00105$:
00101$:
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'output_digit'
;------------------------------------------------------------
;c                         Allocated with name '_output_digit_c_1_1'
;n                         Allocated to registers 
;------------------------------------------------------------
;../printf_large.c:123: static void output_digit( unsigned char n )
;	-----------------------------------------
;	 function output_digit
;	-----------------------------------------
_output_digit:
;../printf_large.c:125: register unsigned char c = n + (unsigned char)'0';
	add	#0x30
;../printf_large.c:127: if (c > (unsigned char)'9')
	sta	*_output_digit_c_1_1
	cmp	#0x39
	bls	00104$
00109$:
;../printf_large.c:129: c += (unsigned char)('A' - '0' - 10);
	lda	*_output_digit_c_1_1
	add	#0x07
	sta	*_output_digit_c_1_1
;../printf_large.c:130: if (lower_case)
	lda	_lower_case
	beq	00104$
00110$:
;../printf_large.c:131: c = tolower(c);
	bset	#5,*_output_digit_c_1_1
00104$:
;../printf_large.c:133: _output_char( c );
	lda	*_output_digit_c_1_1
	jsr	__output_char
00105$:
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'output_2digits'
;------------------------------------------------------------
;b                         Allocated with name '_output_2digits_b_1_1'
;------------------------------------------------------------
;../printf_large.c:148: static void output_2digits( unsigned char b )
;	-----------------------------------------
;	 function output_2digits
;	-----------------------------------------
_output_2digits:
;../printf_large.c:150: output_digit( b>>4   );
	sta	_output_2digits_b_1_1
	nsa	
	and	#0x0f
	jsr	_output_digit
;../printf_large.c:151: output_digit( b&0x0F );
	lda	_output_2digits_b_1_1
	and	#0x0F
	jsr	_output_digit
00101$:
	rts
;------------------------------------------------------------
;Allocation info for local variables in function 'calculate_digit'
;------------------------------------------------------------
;radix                     Allocated with name '_calculate_digit_radix_1_1'
;ul                        Allocated with name '_calculate_digit_ul_1_1'
;b4                        Allocated with name '_calculate_digit_b4_1_1'
;i                         Allocated with name '_calculate_digit_i_1_1'
;------------------------------------------------------------
;../printf_large.c:178: static void calculate_digit( unsigned char radix )
;	-----------------------------------------
;	 function calculate_digit
;	-----------------------------------------
_calculate_digit:
	sta	_calculate_digit_radix_1_1
;../printf_large.c:180: register unsigned long ul = value.ul;
	lda	_value
	sta	*_calculate_digit_ul_1_1
	lda	(_value + 1)
	sta	*(_calculate_digit_ul_1_1 + 1)
	lda	(_value + 2)
	sta	*(_calculate_digit_ul_1_1 + 2)
	lda	(_value + 3)
	sta	*(_calculate_digit_ul_1_1 + 3)
;../printf_large.c:181: register unsigned char b4 = value.byte[4];
	lda	(_value + 0x0004)
	sta	*_calculate_digit_b4_1_1
;../printf_large.c:184: do
	mov	#0x20,*_calculate_digit_i_1_1
00103$:
;../printf_large.c:186: b4 = (b4 << 1);
	lda	*_calculate_digit_b4_1_1
	lsla	
	sta	*_calculate_digit_b4_1_1
;../printf_large.c:187: b4 |= (ul >> 31) & 0x01;
	lda	*_calculate_digit_ul_1_1
	rola
	clra
	rola
	ora	*_calculate_digit_b4_1_1
	sta	*_calculate_digit_b4_1_1
;../printf_large.c:188: ul <<= 1;
	lda	*(_calculate_digit_ul_1_1 + 3)
	ldx	*(_calculate_digit_ul_1_1 + 2)
	lsla
	rolx
	sta	*(_calculate_digit_ul_1_1 + 3)
	stx	*(_calculate_digit_ul_1_1 + 2)
	lda	*(_calculate_digit_ul_1_1 + 1)
	ldx	*_calculate_digit_ul_1_1
	rola
	rolx
	sta	*(_calculate_digit_ul_1_1 + 1)
	stx	*_calculate_digit_ul_1_1
;../printf_large.c:190: if (radix <= b4 )
	lda	_calculate_digit_radix_1_1
	cmp	*_calculate_digit_b4_1_1
	bhi	00104$
00112$:
;../printf_large.c:192: b4 -= radix;
	lda	*_calculate_digit_b4_1_1
	sub	_calculate_digit_radix_1_1
	sta	*_calculate_digit_b4_1_1
;../printf_large.c:193: ul |= 1;
	bset	#0,*(_calculate_digit_ul_1_1 + 3)
00104$:
;../printf_large.c:195: } while (--i);
	dbnz	*_calculate_digit_i_1_1,00113$
	bra	00114$
00113$:
	bra	00103$
00114$:
;../printf_large.c:196: value.ul = ul;
	lda	*_calculate_digit_ul_1_1
	sta	_value
	lda	*(_calculate_digit_ul_1_1 + 1)
	sta	(_value + 1)
	lda	*(_calculate_digit_ul_1_1 + 2)
	sta	(_value + 2)
	lda	*(_calculate_digit_ul_1_1 + 3)
	sta	(_value + 3)
;../printf_large.c:197: value.byte[4] = b4;
	lda	*_calculate_digit_b4_1_1
	sta	(_value + 0x0004)
00106$:
	rts
;------------------------------------------------------------
;Allocation info for local variables in function '_print_format'
;------------------------------------------------------------
;sloc0                     Allocated with name '__print_format_sloc0_1_0'
;sloc1                     Allocated with name '__print_format_sloc1_1_0'
;sloc2                     Allocated with name '__print_format_sloc2_1_0'
;sloc3                     Allocated with name '__print_format_sloc3_1_0'
;pvoid                     Allocated with name '__print_format_PARM_2'
;format                    Allocated with name '__print_format_PARM_3'
;ap                        Allocated with name '__print_format_PARM_4'
;pfn                       Allocated to registers 
;left_justify              Allocated with name '__print_format_left_justify_1_1'
;zero_padding              Allocated with name '__print_format_zero_padding_1_1'
;prefix_sign               Allocated with name '__print_format_prefix_sign_1_1'
;prefix_space              Allocated with name '__print_format_prefix_space_1_1'
;signed_argument           Allocated with name '__print_format_signed_argument_1_1'
;char_argument             Allocated with name '__print_format_char_argument_1_1'
;long_argument             Allocated with name '__print_format_long_argument_1_1'
;float_argument            Allocated with name '__print_format_float_argument_1_1'
;lsd                       Allocated with name '__print_format_lsd_1_1'
;radix                     Allocated with name '__print_format_radix_1_1'
;width                     Allocated with name '__print_format_width_1_1'
;decimals                  Allocated with name '__print_format_decimals_1_1'
;length                    Allocated with name '__print_format_length_1_1'
;c                         Allocated with name '__print_format_c_1_1'
;store                     Allocated with name '__print_format_store_4_20'
;pstore                    Allocated with name '__print_format_pstore_4_20'
;------------------------------------------------------------
;../printf_large.c:402: int _print_format (pfn_outputchar pfn, void* pvoid, const char *format, va_list ap)
;	-----------------------------------------
;	 function _print_format
;	-----------------------------------------
__print_format:
	sta	(_output_char + 1)
	stx	_output_char
;../printf_large.c:430: p = pvoid;
	lda	__print_format_PARM_2
	sta	_p
	lda	(__print_format_PARM_2 + 1)
	sta	(_p + 1)
;../printf_large.c:434: charsOutputted = 0;
	clra
	sta	_charsOutputted
	sta	(_charsOutputted + 1)
;../printf_large.c:442: while( c=*format++ )
00227$:
	lda	__print_format_PARM_3
	sta	*__print_format_sloc0_1_0
	lda	(__print_format_PARM_3 + 1)
	sta	*(__print_format_sloc0_1_0 + 1)
	ldhx	*__print_format_sloc0_1_0
	lda	,x
	sta	*__print_format_sloc1_1_0
	lda	*(__print_format_sloc0_1_0 + 1)
	add	#0x01
	sta	(__print_format_PARM_3 + 1)
	lda	*__print_format_sloc0_1_0
	adc	#0x00
	sta	__print_format_PARM_3
	lda	*__print_format_sloc1_1_0
	sta	__print_format_c_1_1
	tst	*__print_format_sloc1_1_0
	bne	00311$
	jmp	00229$
00311$:
;../printf_large.c:444: if ( c=='%' )
	lda	__print_format_c_1_1
	cmp	#0x25
	beq	00312$
	jmp	00225$
00312$:
;../printf_large.c:446: left_justify    = 0;
;../printf_large.c:447: zero_padding    = 0;
;../printf_large.c:448: prefix_sign     = 0;
;../printf_large.c:449: prefix_space    = 0;
	clra
	sta	__print_format_left_justify_1_1
	sta	__print_format_zero_padding_1_1
	sta	__print_format_prefix_sign_1_1
	sta	__print_format_prefix_space_1_1
;../printf_large.c:450: signed_argument = 0;
;../printf_large.c:451: char_argument   = 0;
;../printf_large.c:452: long_argument   = 0;
;../printf_large.c:453: float_argument  = 0;
	clra
	sta	__print_format_signed_argument_1_1
	sta	__print_format_char_argument_1_1
	sta	__print_format_long_argument_1_1
	sta	__print_format_float_argument_1_1
;../printf_large.c:454: radix           = 0;
;../printf_large.c:455: width           = 0;
	clra
	sta	__print_format_radix_1_1
	sta	__print_format_width_1_1
;../printf_large.c:456: decimals        = -1;
	lda	#0xFF
	sta	__print_format_decimals_1_1
;../printf_large.c:458: get_conversion_spec:
	lda	__print_format_PARM_3
	sta	*__print_format_sloc0_1_0
	lda	(__print_format_PARM_3 + 1)
	sta	*(__print_format_sloc0_1_0 + 1)
00101$:
;../printf_large.c:460: c = *format++;
	ldhx	*__print_format_sloc0_1_0
	lda	,x
	aix	#1
	sta	__print_format_c_1_1
	sthx	*__print_format_sloc0_1_0
	lda	*__print_format_sloc0_1_0
	sta	__print_format_PARM_3
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(__print_format_PARM_3 + 1)
;../printf_large.c:462: if (c=='%') {
	lda	__print_format_c_1_1
	cmp	#0x25
	bne	00103$
00313$:
;../printf_large.c:463: OUTPUT_CHAR(c, p);
	lda	__print_format_c_1_1
	jsr	__output_char
;../printf_large.c:464: continue;
	jmp	00227$
00103$:
;../printf_large.c:467: if (isdigit(c)) {
	lda	__print_format_c_1_1
	cmp	#0x30
	bcs	00110$
00314$:
	lda	__print_format_c_1_1
	cmp	#0x39
	bhi	00110$
00315$:
;../printf_large.c:468: if (decimals==-1) {
	lda	__print_format_decimals_1_1
	cmp	#0xFF
	bne	00107$
00316$:
;../printf_large.c:469: width = 10*width + (c - '0');
	lda	__print_format_width_1_1
	ldx	#0x0A
	mul
	sta	*__print_format_sloc1_1_0
	lda	__print_format_c_1_1
	sub	#0x30
	add	*__print_format_sloc1_1_0
;../printf_large.c:470: if (width == 0) {
	sta	__print_format_width_1_1
	bne	00101$
00317$:
;../printf_large.c:472: zero_padding = 1;
	lda	#0x01
	sta	__print_format_zero_padding_1_1
	bra	00101$
00107$:
;../printf_large.c:475: decimals = 10*decimals + (c-'0');
	lda	__print_format_decimals_1_1
	ldx	#0x0A
	mul
	sta	*__print_format_sloc1_1_0
	lda	__print_format_c_1_1
	sub	#0x30
	add	*__print_format_sloc1_1_0
	sta	__print_format_decimals_1_1
;../printf_large.c:477: goto get_conversion_spec;
	jmp	00101$
00110$:
;../printf_large.c:480: if (c=='.') {
	lda	__print_format_c_1_1
	cmp	#0x2E
	bne	00115$
00318$:
;../printf_large.c:481: if (decimals==-1) decimals=0;
	lda	__print_format_decimals_1_1
	cmp	#0xFF
	beq	00319$
	jmp	00101$
00319$:
	clra
	sta	__print_format_decimals_1_1
;../printf_large.c:484: goto get_conversion_spec;
	jmp	00101$
00115$:
;../printf_large.c:487: if (islower(c))
	lda	__print_format_c_1_1
	cmp	#0x61
	bcs	00117$
00320$:
	lda	__print_format_c_1_1
	cmp	#0x7A
	bhi	00117$
00321$:
;../printf_large.c:489: c = toupper(c);
	lda	__print_format_c_1_1
	and	#0xDF
	sta	__print_format_c_1_1
;../printf_large.c:490: lower_case = 1;
	lda	#0x01
	sta	_lower_case
	bra	00118$
00117$:
;../printf_large.c:493: lower_case = 0;
	clra
	sta	_lower_case
00118$:
;../printf_large.c:495: switch( c )
	lda	__print_format_c_1_1
	cmp	#0x20
	bne	00322$
	jmp	00122$
00322$:
	lda	__print_format_c_1_1
	cmp	#0x2B
	bne	00323$
	jmp	00121$
00323$:
	lda	__print_format_c_1_1
	cmp	#0x2D
	bne	00324$
	jmp	00120$
00324$:
	lda	__print_format_c_1_1
	cmp	#0x42
	bne	00325$
	jmp	00123$
00325$:
	lda	__print_format_c_1_1
	cmp	#0x43
	bne	00326$
	jmp	00125$
00326$:
	lda	__print_format_c_1_1
	cmp	#0x44
	bne	00327$
	jmp	00150$
00327$:
	lda	__print_format_c_1_1
	cmp	#0x46
	bne	00328$
	jmp	00154$
00328$:
	lda	__print_format_c_1_1
	cmp	#0x49
	bne	00329$
	jmp	00150$
00329$:
	lda	__print_format_c_1_1
	cmp	#0x4C
	beq	00124$
00330$:
	lda	__print_format_c_1_1
	cmp	#0x4F
	bne	00331$
	jmp	00151$
00331$:
	lda	__print_format_c_1_1
	cmp	#0x50
	bne	00332$
	jmp	00148$
00332$:
	lda	__print_format_c_1_1
	cmp	#0x53
	bne	00333$
	jmp	00129$
00333$:
	lda	__print_format_c_1_1
	cmp	#0x55
	bne	00334$
	jmp	00152$
00334$:
	lda	__print_format_c_1_1
	cmp	#0x58
	bne	00335$
	jmp	00153$
00335$:
	jmp	00155$
;../printf_large.c:497: case '-':
00120$:
;../printf_large.c:498: left_justify = 1;
	lda	#0x01
	sta	__print_format_left_justify_1_1
;../printf_large.c:499: goto get_conversion_spec;
	jmp	00101$
;../printf_large.c:500: case '+':
00121$:
;../printf_large.c:501: prefix_sign = 1;
	lda	#0x01
	sta	__print_format_prefix_sign_1_1
;../printf_large.c:502: goto get_conversion_spec;
	jmp	00101$
;../printf_large.c:503: case ' ':
00122$:
;../printf_large.c:504: prefix_space = 1;
	lda	#0x01
	sta	__print_format_prefix_space_1_1
;../printf_large.c:505: goto get_conversion_spec;
	jmp	00101$
;../printf_large.c:506: case 'B':
00123$:
;../printf_large.c:507: char_argument = 1;
	lda	#0x01
	sta	__print_format_char_argument_1_1
;../printf_large.c:508: goto get_conversion_spec;
	jmp	00101$
;../printf_large.c:509: case 'L':
00124$:
;../printf_large.c:510: long_argument = 1;
	lda	#0x01
	sta	__print_format_long_argument_1_1
;../printf_large.c:511: goto get_conversion_spec;
	jmp	00101$
;../printf_large.c:513: case 'C':
00125$:
;../printf_large.c:514: if( char_argument )
	lda	__print_format_char_argument_1_1
	beq	00127$
00336$:
;../printf_large.c:515: c = va_arg(ap,char);
	lda	(__print_format_PARM_4 + 1)
	add	#0x01
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	__print_format_PARM_4
	adc	#0x00
	sta	*__print_format_sloc0_1_0
	sta	__print_format_PARM_4
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(__print_format_PARM_4 + 1)
	lda	*(__print_format_sloc0_1_0 + 1)
	sub	#0x01
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	*__print_format_sloc0_1_0
	sbc	#0x00
	sta	*__print_format_sloc0_1_0
	ldhx	*__print_format_sloc0_1_0
	lda	,x
	sta	__print_format_c_1_1
	bra	00128$
00127$:
;../printf_large.c:517: c = va_arg(ap,int);
	lda	(__print_format_PARM_4 + 1)
	add	#0x02
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	__print_format_PARM_4
	adc	#0x00
	sta	*__print_format_sloc0_1_0
	sta	__print_format_PARM_4
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(__print_format_PARM_4 + 1)
	lda	*(__print_format_sloc0_1_0 + 1)
	sub	#0x02
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	*__print_format_sloc0_1_0
	sbc	#0x00
	sta	*__print_format_sloc0_1_0
	ldhx	*__print_format_sloc0_1_0
	lda	,x
	aix	#1
	sta	*__print_format_sloc0_1_0
	lda	,x
	sta	*(__print_format_sloc0_1_0 + 1)
	sta	__print_format_c_1_1
00128$:
;../printf_large.c:518: OUTPUT_CHAR( c, p );
	lda	__print_format_c_1_1
	jsr	__output_char
;../printf_large.c:519: break;
	jmp	00156$
;../printf_large.c:521: case 'S':
00129$:
;../printf_large.c:522: PTR = va_arg(ap,ptr_t);
	lda	(__print_format_PARM_4 + 1)
	add	#0x02
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	__print_format_PARM_4
	adc	#0x00
	sta	*__print_format_sloc0_1_0
	sta	__print_format_PARM_4
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(__print_format_PARM_4 + 1)
	lda	*(__print_format_sloc0_1_0 + 1)
	sub	#0x02
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	*__print_format_sloc0_1_0
	sbc	#0x00
	sta	*__print_format_sloc0_1_0
	ldhx	*__print_format_sloc0_1_0
	lda	,x
	aix	#1
	sta	*__print_format_sloc0_1_0
	lda	,x
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	*__print_format_sloc0_1_0
	sta	_value
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(_value + 1)
;../printf_large.c:532: length = strlen(PTR);
	lda	_value
	sta	*__print_format_sloc0_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc0_1_0 + 1)
	ldx	*__print_format_sloc0_1_0
	lda	*(__print_format_sloc0_1_0 + 1)
	jsr	_strlen
	sta	*(__print_format_sloc0_1_0 + 1)
	stx	*__print_format_sloc0_1_0
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	__print_format_length_1_1
;../printf_large.c:534: if ( decimals == -1 )
	lda	__print_format_decimals_1_1
	cmp	#0xFF
	bne	00131$
00337$:
;../printf_large.c:536: decimals = length;
	lda	__print_format_length_1_1
	sta	__print_format_decimals_1_1
00131$:
;../printf_large.c:538: if ( ( !left_justify ) && (length < width) )
	lda	__print_format_left_justify_1_1
	bne	00269$
00338$:
	lda	__print_format_length_1_1
	cmp	__print_format_width_1_1
	bcc	00269$
00339$:
;../printf_large.c:540: width -= length;
	lda	__print_format_width_1_1
	sub	__print_format_length_1_1
;../printf_large.c:541: while( width-- != 0 )
	sta	__print_format_width_1_1
	sta	*__print_format_sloc1_1_0
00132$:
	mov	*__print_format_sloc1_1_0,*__print_format_sloc0_1_0
	dec	*__print_format_sloc1_1_0
	lda	*__print_format_sloc1_1_0
	sta	__print_format_width_1_1
	tst	*__print_format_sloc0_1_0
	beq	00304$
00340$:
;../printf_large.c:543: OUTPUT_CHAR( ' ', p );
	lda	#0x20
	jsr	__output_char
	bra	00132$
;../printf_large.c:547: while ( (c = *PTR)  && (decimals-- > 0))
00304$:
	lda	*__print_format_sloc1_1_0
	sta	__print_format_width_1_1
00269$:
	lda	__print_format_decimals_1_1
	sta	*__print_format_sloc1_1_0
00139$:
	lda	_value
	sta	*__print_format_sloc0_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc0_1_0 + 1)
	ldhx	*__print_format_sloc0_1_0
	lda	,x
	sta	*__print_format_sloc0_1_0
	sta	__print_format_c_1_1
	tst	*__print_format_sloc0_1_0
	beq	00141$
00341$:
	mov	*__print_format_sloc1_1_0,*__print_format_sloc0_1_0
	dec	*__print_format_sloc1_1_0
	lda	*__print_format_sloc0_1_0
	cmp	#0x00
	ble	00141$
00342$:
;../printf_large.c:549: OUTPUT_CHAR( c, p );
	lda	__print_format_c_1_1
	jsr	__output_char
;../printf_large.c:550: PTR++;
	lda	_value
	sta	*__print_format_sloc0_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc0_1_0 + 1)
	ldhx	*__print_format_sloc0_1_0
	aix	#1
	sthx	*__print_format_sloc0_1_0
	lda	*__print_format_sloc0_1_0
	sta	_value
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(_value + 1)
	bra	00139$
00141$:
;../printf_large.c:553: if ( left_justify && (length < width))
	lda	__print_format_left_justify_1_1
	bne	00343$
	jmp	00156$
00343$:
	lda	__print_format_length_1_1
	cmp	__print_format_width_1_1
	bcs	00344$
	jmp	00156$
00344$:
;../printf_large.c:555: width -= length;
	lda	__print_format_width_1_1
	sub	__print_format_length_1_1
;../printf_large.c:556: while( width-- != 0 )
	sta	__print_format_width_1_1
	sta	*__print_format_sloc1_1_0
00142$:
	mov	*__print_format_sloc1_1_0,*__print_format_sloc0_1_0
	dec	*__print_format_sloc1_1_0
	lda	*__print_format_sloc1_1_0
	sta	__print_format_width_1_1
	tst	*__print_format_sloc0_1_0
	bne	00345$
	jmp	00306$
00345$:
;../printf_large.c:558: OUTPUT_CHAR( ' ', p );
	lda	#0x20
	jsr	__output_char
	bra	00142$
;../printf_large.c:563: case 'P':
00148$:
;../printf_large.c:564: PTR = va_arg(ap,ptr_t);
	lda	(__print_format_PARM_4 + 1)
	add	#0x02
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	__print_format_PARM_4
	adc	#0x00
	sta	*__print_format_sloc0_1_0
	sta	__print_format_PARM_4
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(__print_format_PARM_4 + 1)
	lda	*(__print_format_sloc0_1_0 + 1)
	sub	#0x02
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	*__print_format_sloc0_1_0
	sbc	#0x00
	sta	*__print_format_sloc0_1_0
	ldhx	*__print_format_sloc0_1_0
	lda	,x
	aix	#1
	sta	*__print_format_sloc0_1_0
	lda	,x
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	*__print_format_sloc0_1_0
	sta	_value
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(_value + 1)
;../printf_large.c:608: OUTPUT_CHAR('0', p);
	lda	#0x30
	jsr	__output_char
;../printf_large.c:609: OUTPUT_CHAR('x', p);
	lda	#0x78
	jsr	__output_char
;../printf_large.c:610: OUTPUT_2DIGITS( value.byte[1] );
	lda	(_value + 0x0001)
	jsr	_output_2digits
;../printf_large.c:611: OUTPUT_2DIGITS( value.byte[0] );
	lda	_value
	jsr	_output_2digits
;../printf_large.c:613: break;
	bra	00156$
;../printf_large.c:616: case 'I':
00150$:
;../printf_large.c:617: signed_argument = 1;
	lda	#0x01
	sta	__print_format_signed_argument_1_1
;../printf_large.c:618: radix = 10;
	lda	#0x0A
	sta	__print_format_radix_1_1
;../printf_large.c:619: break;
	bra	00156$
;../printf_large.c:621: case 'O':
00151$:
;../printf_large.c:622: radix = 8;
	lda	#0x08
	sta	__print_format_radix_1_1
;../printf_large.c:623: break;
	bra	00156$
;../printf_large.c:625: case 'U':
00152$:
;../printf_large.c:626: radix = 10;
	lda	#0x0A
	sta	__print_format_radix_1_1
;../printf_large.c:627: break;
	bra	00156$
;../printf_large.c:629: case 'X':
00153$:
;../printf_large.c:630: radix = 16;
	lda	#0x10
	sta	__print_format_radix_1_1
;../printf_large.c:631: break;
	bra	00156$
;../printf_large.c:633: case 'F':
00154$:
;../printf_large.c:634: float_argument=1;
	lda	#0x01
	sta	__print_format_float_argument_1_1
;../printf_large.c:635: break;
	bra	00156$
;../printf_large.c:637: default:
00155$:
;../printf_large.c:639: OUTPUT_CHAR( c, p );
	lda	__print_format_c_1_1
	jsr	__output_char
;../printf_large.c:816: return charsOutputted;
	bra	00156$
;../printf_large.c:641: }
00306$:
	lda	*__print_format_sloc1_1_0
	sta	__print_format_width_1_1
00156$:
;../printf_large.c:643: if (float_argument) {
	lda	__print_format_float_argument_1_1
	bne	00346$
	jmp	00222$
00346$:
;../printf_large.c:644: value.f=va_arg(ap,float);
	lda	(__print_format_PARM_4 + 1)
	add	#0x04
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	__print_format_PARM_4
	adc	#0x00
	sta	*__print_format_sloc0_1_0
	sta	__print_format_PARM_4
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(__print_format_PARM_4 + 1)
	lda	*(__print_format_sloc0_1_0 + 1)
	sub	#0x04
	sta	*(__print_format_sloc0_1_0 + 1)
	lda	*__print_format_sloc0_1_0
	sbc	#0x00
	sta	*__print_format_sloc0_1_0
	ldhx	*__print_format_sloc0_1_0
	lda	,x
	aix	#1
	sta	*__print_format_sloc2_1_0
	lda	,x
	aix	#1
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	,x
	aix	#1
	sta	*(__print_format_sloc2_1_0 + 2)
	lda	,x
	sta	*(__print_format_sloc2_1_0 + 3)
	lda	*__print_format_sloc2_1_0
	sta	_value
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(_value + 1)
	lda	*(__print_format_sloc2_1_0 + 2)
	sta	(_value + 2)
	lda	*(__print_format_sloc2_1_0 + 3)
	sta	(_value + 3)
;../printf_large.c:646: PTR="<NO FLOAT>";
	lda	#>__str_0
	sta	_value
	lda	#__str_0
	sta	(_value + 1)
;../printf_large.c:647: while (c=*PTR++)
00157$:
	lda	_value
	sta	*__print_format_sloc2_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc2_1_0 + 1)
	ldhx	*__print_format_sloc2_1_0
	aix	#1
	sthx	*__print_format_sloc0_1_0
	lda	*__print_format_sloc0_1_0
	sta	_value
	lda	*(__print_format_sloc0_1_0 + 1)
	sta	(_value + 1)
	ldhx	*__print_format_sloc2_1_0
	lda	,x
	sta	*__print_format_sloc2_1_0
	sta	__print_format_c_1_1
	tst	*__print_format_sloc2_1_0
	bne	00347$
	jmp	00227$
00347$:
;../printf_large.c:649: OUTPUT_CHAR (c, p);
	lda	__print_format_c_1_1
	jsr	__output_char
	bra	00157$
00222$:
;../printf_large.c:666: } else if (radix != 0)
	lda	__print_format_radix_1_1
	bne	00348$
	jmp	00227$
00348$:
;../printf_large.c:671: unsigned char MEM_SPACE_BUF_PP *pstore = &store[5];
	lda	#>(__print_format_store_4_20 + 0x0005)
	sta	__print_format_pstore_4_20
	lda	#(__print_format_store_4_20 + 0x0005)
	sta	(__print_format_pstore_4_20 + 1)
;../printf_large.c:674: if (char_argument)
	lda	__print_format_char_argument_1_1
	bne	00349$
	jmp	00168$
00349$:
;../printf_large.c:676: value.l = va_arg(ap,char);
	lda	(__print_format_PARM_4 + 1)
	add	#0x01
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	__print_format_PARM_4
	adc	#0x00
	sta	*__print_format_sloc2_1_0
	sta	__print_format_PARM_4
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(__print_format_PARM_4 + 1)
	lda	*(__print_format_sloc2_1_0 + 1)
	sub	#0x01
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	*__print_format_sloc2_1_0
	sbc	#0x00
	sta	*__print_format_sloc2_1_0
	ldhx	*__print_format_sloc2_1_0
	lda	,x
	sta	*(__print_format_sloc2_1_0 + 3)
	rola	
	clra	
	sbc	#0x00
	sta	*(__print_format_sloc2_1_0 + 2)
	sta	*(__print_format_sloc2_1_0 + 1)
	sta	*__print_format_sloc2_1_0
	sta	_value
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(_value + 1)
	lda	*(__print_format_sloc2_1_0 + 2)
	sta	(_value + 2)
	lda	*(__print_format_sloc2_1_0 + 3)
	sta	(_value + 3)
;../printf_large.c:677: if (!signed_argument)
	lda	__print_format_signed_argument_1_1
	beq	00350$
	jmp	00169$
00350$:
;../printf_large.c:679: value.l &= 0xFF;
	lda	_value
	sta	*__print_format_sloc2_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	(_value + 2)
	sta	*(__print_format_sloc2_1_0 + 2)
	lda	(_value + 3)
	sta	*(__print_format_sloc2_1_0 + 3)
	clr	*(__print_format_sloc2_1_0 + 2)
	clr	*(__print_format_sloc2_1_0 + 1)
	clr	*__print_format_sloc2_1_0
	lda	*__print_format_sloc2_1_0
	sta	_value
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(_value + 1)
	lda	*(__print_format_sloc2_1_0 + 2)
	sta	(_value + 2)
	lda	*(__print_format_sloc2_1_0 + 3)
	sta	(_value + 3)
	jmp	00169$
00168$:
;../printf_large.c:682: else if (long_argument)
	lda	__print_format_long_argument_1_1
	beq	00165$
00351$:
;../printf_large.c:684: value.l = va_arg(ap,long);
	lda	(__print_format_PARM_4 + 1)
	add	#0x04
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	__print_format_PARM_4
	adc	#0x00
	sta	*__print_format_sloc2_1_0
	sta	__print_format_PARM_4
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(__print_format_PARM_4 + 1)
	lda	*(__print_format_sloc2_1_0 + 1)
	sub	#0x04
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	*__print_format_sloc2_1_0
	sbc	#0x00
	sta	*__print_format_sloc2_1_0
	ldhx	*__print_format_sloc2_1_0
	lda	,x
	aix	#1
	sta	*__print_format_sloc2_1_0
	lda	,x
	aix	#1
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	,x
	aix	#1
	sta	*(__print_format_sloc2_1_0 + 2)
	lda	,x
	sta	*(__print_format_sloc2_1_0 + 3)
	lda	*__print_format_sloc2_1_0
	sta	_value
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(_value + 1)
	lda	*(__print_format_sloc2_1_0 + 2)
	sta	(_value + 2)
	lda	*(__print_format_sloc2_1_0 + 3)
	sta	(_value + 3)
	jmp	00169$
00165$:
;../printf_large.c:688: value.l = va_arg(ap,int);
	lda	(__print_format_PARM_4 + 1)
	add	#0x02
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	__print_format_PARM_4
	adc	#0x00
	sta	*__print_format_sloc2_1_0
	sta	__print_format_PARM_4
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(__print_format_PARM_4 + 1)
	lda	*(__print_format_sloc2_1_0 + 1)
	sub	#0x02
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	*__print_format_sloc2_1_0
	sbc	#0x00
	sta	*__print_format_sloc2_1_0
	ldhx	*__print_format_sloc2_1_0
	lda	,x
	aix	#1
	sta	*__print_format_sloc2_1_0
	lda	,x
	sta	*(__print_format_sloc2_1_0 + 1)
	mov	*(__print_format_sloc2_1_0 + 1),*(__print_format_sloc2_1_0 + 3)
	mov	*__print_format_sloc2_1_0,*(__print_format_sloc2_1_0 + 2)
	lda	*__print_format_sloc2_1_0
	rola	
	clra	
	sbc	#0x00
	sta	*(__print_format_sloc2_1_0 + 1)
	sta	*__print_format_sloc2_1_0
	sta	_value
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(_value + 1)
	lda	*(__print_format_sloc2_1_0 + 2)
	sta	(_value + 2)
	lda	*(__print_format_sloc2_1_0 + 3)
	sta	(_value + 3)
;../printf_large.c:689: if (!signed_argument)
	lda	__print_format_signed_argument_1_1
	bne	00169$
00352$:
;../printf_large.c:691: value.l &= 0xFFFF;
	lda	_value
	sta	*__print_format_sloc2_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	(_value + 2)
	sta	*(__print_format_sloc2_1_0 + 2)
	lda	(_value + 3)
	sta	*(__print_format_sloc2_1_0 + 3)
	clr	*(__print_format_sloc2_1_0 + 1)
	clr	*__print_format_sloc2_1_0
	lda	*__print_format_sloc2_1_0
	sta	_value
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(_value + 1)
	lda	*(__print_format_sloc2_1_0 + 2)
	sta	(_value + 2)
	lda	*(__print_format_sloc2_1_0 + 3)
	sta	(_value + 3)
00169$:
;../printf_large.c:695: if ( signed_argument )
	lda	__print_format_signed_argument_1_1
	bne	00353$
	bra	00174$
00353$:
;../printf_large.c:697: if (value.l < 0)
	lda	_value
	sta	*__print_format_sloc2_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	(_value + 2)
	sta	*(__print_format_sloc2_1_0 + 2)
	lda	(_value + 3)
	sta	*(__print_format_sloc2_1_0 + 3)
	lda	*__print_format_sloc2_1_0
	sub	#0x00
	bge	00171$
00354$:
;../printf_large.c:698: value.l = -value.l;
	lda	_value
	sta	*__print_format_sloc2_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	(_value + 2)
	sta	*(__print_format_sloc2_1_0 + 2)
	lda	(_value + 3)
	sta	*(__print_format_sloc2_1_0 + 3)
	clra
	sub	*(__print_format_sloc2_1_0 + 3)
	sta	*(__print_format_sloc2_1_0 + 3)
	clra
	sbc	*(__print_format_sloc2_1_0 + 2)
	sta	*(__print_format_sloc2_1_0 + 2)
	clra
	sbc	*(__print_format_sloc2_1_0 + 1)
	sta	*(__print_format_sloc2_1_0 + 1)
	clra
	sbc	*__print_format_sloc2_1_0
	sta	*__print_format_sloc2_1_0
	sta	_value
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(_value + 1)
	lda	*(__print_format_sloc2_1_0 + 2)
	sta	(_value + 2)
	lda	*(__print_format_sloc2_1_0 + 3)
	sta	(_value + 3)
	bra	00174$
00171$:
;../printf_large.c:700: signed_argument = 0;
	clra
	sta	__print_format_signed_argument_1_1
00174$:
;../printf_large.c:704: lsd = 1;
	lda	#0x01
	sta	__print_format_lsd_1_1
;../printf_large.c:706: do {
	lda	__print_format_pstore_4_20
	sta	*__print_format_sloc2_1_0
	lda	(__print_format_pstore_4_20 + 1)
	sta	*(__print_format_sloc2_1_0 + 1)
	clr	*__print_format_sloc1_1_0
00178$:
;../printf_large.c:707: value.byte[4] = 0;
	clra
	sta	(_value + 0x0004)
;../printf_large.c:711: calculate_digit(radix);
	lda	__print_format_radix_1_1
	jsr	_calculate_digit
;../printf_large.c:713: if (!lsd)
	lda	__print_format_lsd_1_1
	bne	00176$
00355$:
;../printf_large.c:715: *pstore = (value.byte[4] << 4) | (value.byte[4] >> 4) | *pstore;
	lda	(_value + 0x0004)
	nsa
	sta	*__print_format_sloc0_1_0
	ldhx	*__print_format_sloc2_1_0
	lda	,x
	ora	*__print_format_sloc0_1_0
	ldhx	*__print_format_sloc2_1_0
	sta	,x
;../printf_large.c:716: pstore--;
	lda	*(__print_format_sloc2_1_0 + 1)
	sub	#0x01
	sta	*(__print_format_sloc2_1_0 + 1)
	lda	*__print_format_sloc2_1_0
	sbc	#0x00
	sta	*__print_format_sloc2_1_0
	sta	__print_format_pstore_4_20
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(__print_format_pstore_4_20 + 1)
	bra	00177$
00176$:
;../printf_large.c:720: *pstore = value.byte[4];
	lda	(_value + 0x0004)
	ldhx	*__print_format_sloc2_1_0
	sta	,x
00177$:
;../printf_large.c:722: length++;
	inc	*__print_format_sloc1_1_0
	lda	*__print_format_sloc1_1_0
	sta	__print_format_length_1_1
;../printf_large.c:723: lsd = !lsd;
	lda	__print_format_lsd_1_1
	beq	00356$
	lda	#0x01
00356$:
	eor	#0x01
	sta	__print_format_lsd_1_1
;../printf_large.c:724: } while( value.ul );
	lda	_value
	sta	*__print_format_sloc3_1_0
	lda	(_value + 1)
	sta	*(__print_format_sloc3_1_0 + 1)
	lda	(_value + 2)
	sta	*(__print_format_sloc3_1_0 + 2)
	lda	(_value + 3)
	sta	*(__print_format_sloc3_1_0 + 3)
	ora	*(__print_format_sloc3_1_0 + 2)
	ora	*(__print_format_sloc3_1_0 + 1)
	ora	*__print_format_sloc3_1_0
	beq	00357$
	jmp	00178$
00357$:
;../printf_large.c:726: if (width == 0)
	lda	*__print_format_sloc2_1_0
	sta	__print_format_pstore_4_20
	lda	*(__print_format_sloc2_1_0 + 1)
	sta	(__print_format_pstore_4_20 + 1)
	lda	*__print_format_sloc1_1_0
	sta	__print_format_length_1_1
	lda	__print_format_width_1_1
	bne	00182$
00358$:
;../printf_large.c:731: width=1;
	lda	#0x01
	sta	__print_format_width_1_1
00182$:
;../printf_large.c:735: if (!zero_padding && !left_justify)
	lda	__print_format_zero_padding_1_1
	bne	00187$
00359$:
	lda	__print_format_left_justify_1_1
	bne	00187$
00360$:
;../printf_large.c:737: while ( width > (unsigned char) (length+1) )
	lda	__print_format_length_1_1
	add	#0x01
	sta	*__print_format_sloc3_1_0
	lda	__print_format_width_1_1
	sta	*__print_format_sloc2_1_0
00183$:
	lda	*__print_format_sloc2_1_0
	cmp	*__print_format_sloc3_1_0
	bls	00308$
00361$:
;../printf_large.c:739: OUTPUT_CHAR( ' ', p );
	lda	#0x20
	jsr	__output_char
;../printf_large.c:740: width--;
	dec	*__print_format_sloc2_1_0
	bra	00183$
00308$:
	lda	*__print_format_sloc2_1_0
	sta	__print_format_width_1_1
00187$:
;../printf_large.c:744: if (signed_argument) // this now means the original value was negative
	lda	__print_format_signed_argument_1_1
	beq	00197$
00362$:
;../printf_large.c:746: OUTPUT_CHAR( '-', p );
	lda	#0x2D
	jsr	__output_char
;../printf_large.c:748: width--;
	lda	__print_format_width_1_1
	deca
	sta	__print_format_width_1_1
	bra	00198$
00197$:
;../printf_large.c:750: else if (length != 0)
	lda	__print_format_length_1_1
	beq	00198$
00363$:
;../printf_large.c:753: if (prefix_sign)
	lda	__print_format_prefix_sign_1_1
	beq	00192$
00364$:
;../printf_large.c:755: OUTPUT_CHAR( '+', p );
	lda	#0x2B
	jsr	__output_char
;../printf_large.c:757: width--;
	lda	__print_format_width_1_1
	deca
	sta	__print_format_width_1_1
	bra	00198$
00192$:
;../printf_large.c:759: else if (prefix_space)
	lda	__print_format_prefix_space_1_1
	beq	00198$
00365$:
;../printf_large.c:761: OUTPUT_CHAR( ' ', p );
	lda	#0x20
	jsr	__output_char
;../printf_large.c:763: width--;
	lda	__print_format_width_1_1
	deca
	sta	__print_format_width_1_1
00198$:
;../printf_large.c:768: if (!left_justify)
	lda	__print_format_left_justify_1_1
	bne	00206$
00366$:
;../printf_large.c:769: while ( width-- > length )
	lda	__print_format_width_1_1
	sta	*__print_format_sloc3_1_0
00199$:
	mov	*__print_format_sloc3_1_0,*__print_format_sloc2_1_0
	dec	*__print_format_sloc3_1_0
	lda	*__print_format_sloc3_1_0
	sta	__print_format_width_1_1
	lda	*__print_format_sloc2_1_0
	cmp	__print_format_length_1_1
	bls	00309$
00367$:
;../printf_large.c:771: OUTPUT_CHAR( zero_padding ? '0' : ' ', p );
	lda	__print_format_zero_padding_1_1
	beq	00232$
00368$:
	mov	#0x30,*__print_format_sloc2_1_0
	bra	00233$
00232$:
	mov	#0x20,*__print_format_sloc2_1_0
00233$:
	lda	*__print_format_sloc2_1_0
	jsr	__output_char
	bra	00199$
00206$:
;../printf_large.c:776: if (width > length)
	lda	__print_format_width_1_1
	cmp	__print_format_length_1_1
	bls	00203$
00369$:
;../printf_large.c:777: width -= length;
	lda	__print_format_width_1_1
	sub	__print_format_length_1_1
	sta	__print_format_width_1_1
	bra	00301$
00203$:
;../printf_large.c:779: width = 0;
	clra
	sta	__print_format_width_1_1
;../printf_large.c:816: return charsOutputted;
	bra	00301$
;../printf_large.c:783: while( length-- )
00309$:
	lda	*__print_format_sloc3_1_0
	sta	__print_format_width_1_1
00301$:
	lda	__print_format_pstore_4_20
	sta	*__print_format_sloc3_1_0
	lda	(__print_format_pstore_4_20 + 1)
	sta	*(__print_format_sloc3_1_0 + 1)
	lda	__print_format_length_1_1
	sta	*__print_format_sloc2_1_0
00211$:
	mov	*__print_format_sloc2_1_0,*__print_format_sloc1_1_0
	dec	*__print_format_sloc2_1_0
	tst	*__print_format_sloc1_1_0
	beq	00213$
00370$:
;../printf_large.c:785: lsd = !lsd;
	lda	__print_format_lsd_1_1
	beq	00371$
	lda	#0x01
00371$:
	eor	#0x01
;../printf_large.c:786: if (!lsd)
	sta	__print_format_lsd_1_1
	bne	00209$
00372$:
;../printf_large.c:788: pstore++;
	ldhx	*__print_format_sloc3_1_0
	aix	#1
	sthx	*__print_format_sloc3_1_0
;../printf_large.c:789: value.byte[4] = *pstore >> 4;
	ldhx	*__print_format_sloc3_1_0
	lda	,x
	nsa	
	and	#0x0f
	sta	(_value + 0x0004)
	bra	00210$
00209$:
;../printf_large.c:793: value.byte[4] = *pstore & 0x0F;
	ldhx	*__print_format_sloc3_1_0
	lda	,x
	and	#0x0F
	sta	(_value + 0x0004)
00210$:
;../printf_large.c:799: output_digit( value.byte[4] );
	lda	(_value + 0x0004)
	jsr	_output_digit
	bra	00211$
00213$:
;../printf_large.c:802: if (left_justify)
	lda	__print_format_left_justify_1_1
	bne	00373$
	jmp	00227$
00373$:
;../printf_large.c:803: while (width-- > 0)
	lda	__print_format_width_1_1
	sta	*__print_format_sloc3_1_0
00214$:
	mov	*__print_format_sloc3_1_0,*__print_format_sloc2_1_0
	dec	*__print_format_sloc3_1_0
	tst	*__print_format_sloc2_1_0
	bne	00374$
	jmp	00227$
00374$:
;../printf_large.c:805: OUTPUT_CHAR(' ', p);
	lda	#0x20
	jsr	__output_char
	bra	00214$
00225$:
;../printf_large.c:812: OUTPUT_CHAR( c, p );
	lda	__print_format_c_1_1
	jsr	__output_char
	jmp	00227$
00229$:
;../printf_large.c:816: return charsOutputted;
	ldx	_charsOutputted
	lda	(_charsOutputted + 1)
00230$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
__str_0:
	.ascii "<NO FLOAT>"
	.db 0x00
	.area XINIT
	.area CABS    (ABS,CODE)
