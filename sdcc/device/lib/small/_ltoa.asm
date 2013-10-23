;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:44 2013
;--------------------------------------------------------
	.module _ltoa
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __ltoa
	.globl __ultoa
	.globl __ltoa_PARM_3
	.globl __ltoa_PARM_2
	.globl __ultoa_PARM_3
	.globl __ultoa_PARM_2
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
__ultoa_PARM_2:
	.ds 3
__ultoa_PARM_3:
	.ds 1
__ultoa_value_1_1:
	.ds 4
__ltoa_PARM_2:
	.ds 3
__ltoa_PARM_3:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
__ultoa_buffer_1_1:
	.ds 32
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
;Allocation info for local variables in function '_ultoa'
;------------------------------------------------------------
;string                    Allocated with name '__ultoa_PARM_2'
;radix                     Allocated with name '__ultoa_PARM_3'
;value                     Allocated with name '__ultoa_value_1_1'
;index                     Allocated to registers r6 
;c                         Allocated to registers r2 
;buffer                    Allocated with name '__ultoa_buffer_1_1'
;------------------------------------------------------------
;	_ltoa.c:32: void _ultoa(unsigned long value, char* string, unsigned char radix)
;	-----------------------------------------
;	 function _ultoa
;	-----------------------------------------
__ultoa:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	__ultoa_value_1_1,dpl
	mov	(__ultoa_value_1_1 + 1),dph
	mov	(__ultoa_value_1_1 + 2),b
	mov	(__ultoa_value_1_1 + 3),a
;	_ltoa.c:35: unsigned char index = NUMBER_OF_DIGITS;
	mov	r6,#0x20
;	_ltoa.c:37: do {
	mov	ar7,r6
00103$:
;	_ltoa.c:38: unsigned char c = '0' + (value % radix);
	mov	__modulong_PARM_2,__ultoa_PARM_3
	mov	(__modulong_PARM_2 + 1),#0x00
	mov	(__modulong_PARM_2 + 2),#0x00
	mov	(__modulong_PARM_2 + 3),#0x00
	mov	dpl,__ultoa_value_1_1
	mov	dph,(__ultoa_value_1_1 + 1)
	mov	b,(__ultoa_value_1_1 + 2)
	mov	a,(__ultoa_value_1_1 + 3)
	push	ar7
	lcall	__modulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	pop	ar7
	mov	a,#0x30
	add	a,r2
;	_ltoa.c:39: if (c > (unsigned char)'9')
	mov  r2,a
	add	a,#0xff - 0x39
	jnc	00102$
;	_ltoa.c:40: c += 'A' - '9' - 1;
	mov	a,#0x07
	add	a,r2
	mov	r2,a
00102$:
;	_ltoa.c:41: buffer[--index] = c;
	dec	r7
	mov	a,r7
	add	a,#__ultoa_buffer_1_1
	mov	r0,a
	mov	@r0,ar2
;	_ltoa.c:42: value /= radix;
	mov	__divulong_PARM_2,__ultoa_PARM_3
	mov	(__divulong_PARM_2 + 1),#0x00
	mov	(__divulong_PARM_2 + 2),#0x00
	mov	(__divulong_PARM_2 + 3),#0x00
	mov	dpl,__ultoa_value_1_1
	mov	dph,(__ultoa_value_1_1 + 1)
	mov	b,(__ultoa_value_1_1 + 2)
	mov	a,(__ultoa_value_1_1 + 3)
	push	ar7
	lcall	__divulong
	mov	__ultoa_value_1_1,dpl
	mov	(__ultoa_value_1_1 + 1),dph
	mov	(__ultoa_value_1_1 + 2),b
	mov	(__ultoa_value_1_1 + 3),a
	pop	ar7
;	_ltoa.c:43: } while (value);
	mov	a,__ultoa_value_1_1
	orl	a,(__ultoa_value_1_1 + 1)
	orl	a,(__ultoa_value_1_1 + 2)
	orl	a,(__ultoa_value_1_1 + 3)
	jnz	00103$
;	_ltoa.c:45: do {
	mov	ar6,r7
	mov	r2,__ultoa_PARM_2
	mov	r3,(__ultoa_PARM_2 + 1)
	mov	r4,(__ultoa_PARM_2 + 2)
	mov	ar5,r6
00106$:
;	_ltoa.c:46: *string++ = buffer[index];
	mov	a,r5
	add	a,#__ultoa_buffer_1_1
	mov	r0,a
	mov	ar6,@r0
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r6
	lcall	__gptrput
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
;	_ltoa.c:47: } while ( ++index != NUMBER_OF_DIGITS );
	inc	r5
	cjne	r5,#0x20,00106$
;	_ltoa.c:49: *string = 0;  /* string terminator */
	mov	__ultoa_PARM_2,r2
	mov	(__ultoa_PARM_2 + 1),r3
	mov	(__ultoa_PARM_2 + 2),r4
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function '_ltoa'
;------------------------------------------------------------
;string                    Allocated with name '__ltoa_PARM_2'
;radix                     Allocated with name '__ltoa_PARM_3'
;value                     Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	_ltoa.c:52: void _ltoa(long value, char* string, unsigned char radix)
;	-----------------------------------------
;	 function _ltoa
;	-----------------------------------------
__ltoa:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	_ltoa.c:54: if (value < 0 && radix == 10) {
	mov	r5,a
	jnb	acc.7,00102$
	mov	a,#0x0A
	cjne	a,__ltoa_PARM_3,00102$
;	_ltoa.c:55: *string++ = '-';
	mov	r6,__ltoa_PARM_2
	mov	r7,(__ltoa_PARM_2 + 1)
	mov	r0,(__ltoa_PARM_2 + 2)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,#0x2D
	lcall	__gptrput
	mov	a,#0x01
	add	a,r6
	mov	__ltoa_PARM_2,a
	clr	a
	addc	a,r7
	mov	(__ltoa_PARM_2 + 1),a
	mov	(__ltoa_PARM_2 + 2),r0
;	_ltoa.c:56: value = -value;
	clr	c
	clr	a
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	clr	a
	subb	a,r4
	mov	r4,a
	clr	a
	subb	a,r5
	mov	r5,a
00102$:
;	_ltoa.c:58: _ultoa(value, string, radix);
	mov	__ultoa_PARM_2,__ltoa_PARM_2
	mov	(__ultoa_PARM_2 + 1),(__ltoa_PARM_2 + 1)
	mov	(__ultoa_PARM_2 + 2),(__ltoa_PARM_2 + 2)
	mov	__ultoa_PARM_3,__ltoa_PARM_3
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ljmp	__ultoa
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
