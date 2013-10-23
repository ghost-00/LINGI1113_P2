;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:44 2013
;--------------------------------------------------------
	.module vprintf
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _vprintf_PARM_2
	.globl _vprintf
	.globl _printf
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
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_vprintf_PARM_2:
	.ds 1
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
;Allocation info for local variables in function 'put_char_to_stdout'
;------------------------------------------------------------
;p                         Allocated to stack - offset -5
;c                         Allocated to registers r2 
;------------------------------------------------------------
;	vprintf.c:29: static void put_char_to_stdout( char c, void* p ) _REENTRANT
;	-----------------------------------------
;	 function put_char_to_stdout
;	-----------------------------------------
_put_char_to_stdout:
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
;	vprintf.c:32: putchar( c );
	lcall	_putchar
	pop	_bp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'vprintf'
;------------------------------------------------------------
;ap                        Allocated with name '_vprintf_PARM_2'
;format                    Allocated to registers 
;------------------------------------------------------------
;	vprintf.c:35: int vprintf (const char *format, va_list ap)
;	-----------------------------------------
;	 function vprintf
;	-----------------------------------------
_vprintf:
	mov	__print_format_PARM_3,dpl
	mov	(__print_format_PARM_3 + 1),dph
	mov	(__print_format_PARM_3 + 2),b
;	vprintf.c:37: return _print_format( put_char_to_stdout, NULL, format, ap );
	clr	a
	mov	__print_format_PARM_2,a
	mov	(__print_format_PARM_2 + 1),a
	mov	(__print_format_PARM_2 + 2),a
	mov	__print_format_PARM_4,_vprintf_PARM_2
	mov	dptr,#_put_char_to_stdout
	ljmp	__print_format
;------------------------------------------------------------
;Allocation info for local variables in function 'printf'
;------------------------------------------------------------
;format                    Allocated to stack - offset -5
;arg                       Allocated to registers 
;i                         Allocated to registers 
;------------------------------------------------------------
;	vprintf.c:40: int printf (const char *format, ...)
;	-----------------------------------------
;	 function printf
;	-----------------------------------------
_printf:
	push	_bp
	mov	_bp,sp
;	vprintf.c:45: va_start (arg, format);
	mov	a,_bp
	add	a,#0xfb
	mov	__print_format_PARM_4,a
;	vprintf.c:46: i = _print_format( put_char_to_stdout, NULL, format, arg );
	clr	a
	mov	__print_format_PARM_2,a
	mov	(__print_format_PARM_2 + 1),a
	mov	(__print_format_PARM_2 + 2),a
	mov	a,_bp
	add	a,#0xfb
	mov	r0,a
	mov	__print_format_PARM_3,@r0
	inc	r0
	mov	(__print_format_PARM_3 + 1),@r0
	inc	r0
	mov	(__print_format_PARM_3 + 2),@r0
	mov	dptr,#_put_char_to_stdout
	lcall	__print_format
;	vprintf.c:49: return i;
	pop	_bp
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
