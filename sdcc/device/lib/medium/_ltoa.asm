;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:50 2013
;--------------------------------------------------------
	.module _ltoa
	.optsdcc -mmcs51 --model-medium
	
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
__ultoa_sloc0_1_0:
	.ds 4
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
__ultoa_PARM_2:
	.ds 3
__ultoa_PARM_3:
	.ds 1
__ultoa_value_1_1:
	.ds 4
__ultoa_buffer_1_1:
	.ds 32
__ltoa_PARM_2:
	.ds 3
__ltoa_PARM_3:
	.ds 1
__ltoa_value_1_1:
	.ds 4
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
;sloc0                     Allocated with name '__ultoa_sloc0_1_0'
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
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	r0,#__ultoa_value_1_1
	mov	a,r2
	movx	@r0,a
	inc	r0
	mov	a,r3
	movx	@r0,a
	inc	r0
	mov	a,r4
	movx	@r0,a
	inc	r0
	mov	a,r5
	movx	@r0,a
;	_ltoa.c:37: do {
	mov	r6,#0x20
00103$:
;	_ltoa.c:38: unsigned char c = '0' + (value % radix);
	mov	r0,#__ultoa_PARM_3
	movx	a,@r0
	mov	__ultoa_sloc0_1_0,a
	mov	(__ultoa_sloc0_1_0 + 1),#0x00
	mov	(__ultoa_sloc0_1_0 + 2),#0x00
	mov	(__ultoa_sloc0_1_0 + 3),#0x00
	mov	r0,#__modulong_PARM_2
	mov	a,__ultoa_sloc0_1_0
	movx	@r0,a
	inc	r0
	mov	a,(__ultoa_sloc0_1_0 + 1)
	movx	@r0,a
	inc	r0
	mov	a,(__ultoa_sloc0_1_0 + 2)
	movx	@r0,a
	inc	r0
	mov	a,(__ultoa_sloc0_1_0 + 3)
	movx	@r0,a
	mov	r0,#__ultoa_value_1_1
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	push	ar6
	lcall	__modulong
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	pop	ar6
	mov	a,#0x30
	add	a,r4
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
	dec	r6
	mov	a,r6
	add	a,#__ultoa_buffer_1_1
	mov	r0,a
	mov	a,r2
	movx	@r0,a
;	_ltoa.c:42: value /= radix;
	mov	r0,#__divulong_PARM_2
	mov	a,__ultoa_sloc0_1_0
	movx	@r0,a
	inc	r0
	mov	a,(__ultoa_sloc0_1_0 + 1)
	movx	@r0,a
	inc	r0
	mov	a,(__ultoa_sloc0_1_0 + 2)
	movx	@r0,a
	inc	r0
	mov	a,(__ultoa_sloc0_1_0 + 3)
	movx	@r0,a
	mov	r0,#__ultoa_value_1_1
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	push	ar6
	lcall	__divulong
	mov	r0,#__ultoa_value_1_1
	push	acc
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
	inc	r0
	mov	a,b
	movx	@r0,a
	pop	acc
	inc	r0
	movx	@r0,a
	pop	ar6
;	_ltoa.c:43: } while (value);
	mov	r0,#__ultoa_value_1_1
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	orl	b,a
	inc	r0
	movx	a,@r0
	orl	b,a
	inc	r0
	movx	a,@r0
	orl	a,b
	jz	00118$
	ljmp	00103$
00118$:
;	_ltoa.c:45: do {
	mov	r0,#__ultoa_PARM_2
	movx	a,@r0
	mov	r2,a
	inc	r0
	movx	a,@r0
	mov	r3,a
	inc	r0
	movx	a,@r0
	mov	r4,a
	mov	ar5,r6
00106$:
;	_ltoa.c:46: *string++ = buffer[index];
	mov	a,r5
	add	a,#__ultoa_buffer_1_1
	mov	r0,a
	movx	a,@r0
	mov	r6,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrput
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
;	_ltoa.c:47: } while ( ++index != NUMBER_OF_DIGITS );
	inc	r5
	cjne	r5,#0x20,00106$
;	_ltoa.c:49: *string = 0;  /* string terminator */
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function '_ltoa'
;------------------------------------------------------------
;------------------------------------------------------------
;	_ltoa.c:52: void _ltoa(long value, char* string, unsigned char radix)
;	-----------------------------------------
;	 function _ltoa
;	-----------------------------------------
__ltoa:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	r0,#__ltoa_value_1_1
	mov	a,r2
	movx	@r0,a
	inc	r0
	mov	a,r3
	movx	@r0,a
	inc	r0
	mov	a,r4
	movx	@r0,a
	inc	r0
	mov	a,r5
	movx	@r0,a
;	_ltoa.c:54: if (value < 0 && radix == 10) {
	mov	r0,#(__ltoa_value_1_1 + 3)
	movx	a,@r0
	jnb	acc.7,00102$
	mov	r0,#__ltoa_PARM_3
	movx	a,@r0
	cjne	a,#0x0A,00102$
;	_ltoa.c:55: *string++ = '-';
	mov	r0,#__ltoa_PARM_2
	movx	a,@r0
	mov	r6,a
	inc	r0
	movx	a,@r0
	mov	r7,a
	inc	r0
	movx	a,@r0
	mov	r2,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,#0x2D
	lcall	__gptrput
	mov	r0,#__ltoa_PARM_2
	mov	a,#0x01
	add	a,r6
	movx	@r0,a
	clr	a
	addc	a,r7
	inc	r0
	movx	@r0,a
	inc	r0
	mov	a,r2
	movx	@r0,a
;	_ltoa.c:56: value = -value;
	mov	r0,#__ltoa_value_1_1
	movx	a,@r0
	setb	c
	cpl	a
	addc	a,#0x00
	movx	@r0,a
	inc	r0
	movx	a,@r0
	cpl	a
	addc	a,#0x00
	movx	@r0,a
	inc	r0
	movx	a,@r0
	cpl	a
	addc	a,#0x00
	movx	@r0,a
	inc	r0
	movx	a,@r0
	cpl	a
	addc	a,#0x00
	movx	@r0,a
00102$:
;	_ltoa.c:58: _ultoa(value, string, radix);
	mov	r0,#__ltoa_PARM_2
	mov	r1,#__ultoa_PARM_2
	movx	a,@r0
	movx	@r1,a
	inc	r0
	movx	a,@r0
	inc	r1
	movx	@r1,a
	inc	r0
	movx	a,@r0
	inc	r1
	movx	@r1,a
	mov	r0,#__ltoa_PARM_3
	mov	r1,#__ultoa_PARM_3
	movx	a,@r0
	movx	@r1,a
	mov	r0,#__ltoa_value_1_1
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	ljmp	__ultoa
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
