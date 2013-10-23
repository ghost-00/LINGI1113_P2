;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:41 2013
;--------------------------------------------------------
	.module asincosf
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _asincosf
	.globl _asincosf_PARM_2
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
_asincosf_a_1_1:
	.ds 8
_asincosf_b_1_1:
	.ds 8
_asincosf_x_1_1:
	.ds 4
_asincosf_y_1_1:
	.ds 4
_asincosf_g_1_1:
	.ds 4
_asincosf_r_1_1:
	.ds 4
_asincosf_sloc0_1_0:
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
_asincosf_PARM_2:
	.ds 1
_asincosf_quartPI_1_1:
	.ds 1
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
;------------------------------------------------------------
;Allocation info for local variables in function 'asincosf'
;------------------------------------------------------------
;a                         Allocated with name '_asincosf_a_1_1'
;b                         Allocated with name '_asincosf_b_1_1'
;x                         Allocated with name '_asincosf_x_1_1'
;y                         Allocated with name '_asincosf_y_1_1'
;g                         Allocated with name '_asincosf_g_1_1'
;r                         Allocated with name '_asincosf_r_1_1'
;i                         Allocated to registers 
;sloc0                     Allocated with name '_asincosf_sloc0_1_0'
;------------------------------------------------------------
;	asincosf.c:43: static const float a[2] = { 0.0, QUART_PI };
	mov	_asincosf_a_1_1,#0x00
	mov	(_asincosf_a_1_1 + 1),#0x00
	mov	(_asincosf_a_1_1 + 2),#0x00
	mov	(_asincosf_a_1_1 + 3),#0x00
	mov	(_asincosf_a_1_1 + 0x0004),#0xDB
	mov	((_asincosf_a_1_1 + 0x0004) + 1),#0x0F
	mov	((_asincosf_a_1_1 + 0x0004) + 2),#0x49
	mov	((_asincosf_a_1_1 + 0x0004) + 3),#0x3F
;	asincosf.c:44: static const float b[2] = { HALF_PI, QUART_PI };
	mov	_asincosf_b_1_1,#0xDB
	mov	(_asincosf_b_1_1 + 1),#0x0F
	mov	(_asincosf_b_1_1 + 2),#0xC9
	mov	(_asincosf_b_1_1 + 3),#0x3F
	mov	(_asincosf_b_1_1 + 0x0004),#0xDB
	mov	((_asincosf_b_1_1 + 0x0004) + 1),#0x0F
	mov	((_asincosf_b_1_1 + 0x0004) + 2),#0x49
	mov	((_asincosf_b_1_1 + 0x0004) + 3),#0x3F
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
;Allocation info for local variables in function 'asincosf'
;------------------------------------------------------------
;a                         Allocated with name '_asincosf_a_1_1'
;b                         Allocated with name '_asincosf_b_1_1'
;x                         Allocated with name '_asincosf_x_1_1'
;y                         Allocated with name '_asincosf_y_1_1'
;g                         Allocated with name '_asincosf_g_1_1'
;r                         Allocated with name '_asincosf_r_1_1'
;i                         Allocated to registers 
;sloc0                     Allocated with name '_asincosf_sloc0_1_0'
;------------------------------------------------------------
;	asincosf.c:37: float asincosf(const float x, const BOOL isacos)
;	-----------------------------------------
;	 function asincosf
;	-----------------------------------------
_asincosf:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	_asincosf_x_1_1,dpl
	mov	(_asincosf_x_1_1 + 1),dph
	mov	(_asincosf_x_1_1 + 2),b
	mov	(_asincosf_x_1_1 + 3),a
;	asincosf.c:41: BOOL quartPI = isacos;
	mov	c,_asincosf_PARM_2
	mov	_asincosf_quartPI_1_1,c
;	asincosf.c:46: y = fabsf(x);
	mov	dpl,_asincosf_x_1_1
	mov	dph,(_asincosf_x_1_1 + 1)
	mov	b,(_asincosf_x_1_1 + 2)
	mov	a,(_asincosf_x_1_1 + 3)
	lcall	_fabsf
	mov	_asincosf_y_1_1,dpl
	mov	(_asincosf_y_1_1 + 1),dph
	mov	(_asincosf_y_1_1 + 2),b
	mov	(_asincosf_y_1_1 + 3),a
;	asincosf.c:47: if (y < EPS)
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x39
	push	acc
	mov	dpl,_asincosf_y_1_1
	mov	dph,(_asincosf_y_1_1 + 1)
	mov	b,(_asincosf_y_1_1 + 2)
	mov	a,(_asincosf_y_1_1 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	00107$
;	asincosf.c:49: r = y;
	mov	_asincosf_r_1_1,_asincosf_y_1_1
	mov	(_asincosf_r_1_1 + 1),(_asincosf_y_1_1 + 1)
	mov	(_asincosf_r_1_1 + 2),(_asincosf_y_1_1 + 2)
	mov	(_asincosf_r_1_1 + 3),(_asincosf_y_1_1 + 3)
	ljmp	00108$
00107$:
;	asincosf.c:53: if (y > 0.5)
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_asincosf_y_1_1
	mov	dph,(_asincosf_y_1_1 + 1)
	mov	b,(_asincosf_y_1_1 + 2)
	mov	a,(_asincosf_y_1_1 + 3)
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jnz	00126$
	ljmp	00104$
00126$:
;	asincosf.c:55: quartPI = !isacos;
	cpl	_asincosf_quartPI_1_1
;	asincosf.c:56: if (y > 1.0)
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_asincosf_y_1_1
	mov	dph,(_asincosf_y_1_1 + 1)
	mov	b,(_asincosf_y_1_1 + 2)
	mov	a,(_asincosf_y_1_1 + 3)
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	00102$
;	asincosf.c:58: errno = EDOM;
	mov	_errno,#0x21
	clr	a
	mov	(_errno + 1),a
;	asincosf.c:59: return 0.0;
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	ret
00102$:
;	asincosf.c:61: g = (0.5 - y) + 0.5;
	push	_asincosf_y_1_1
	push	(_asincosf_y_1_1 + 1)
	push	(_asincosf_y_1_1 + 2)
	push	(_asincosf_y_1_1 + 3)
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fssub
	mov	_asincosf_g_1_1,dpl
	mov	(_asincosf_g_1_1 + 1),dph
	mov	(_asincosf_g_1_1 + 2),b
	mov	(_asincosf_g_1_1 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	asincosf.c:62: g = ldexpf(g, -1);
	mov	_ldexpf_PARM_2,#0xFF
	mov	(_ldexpf_PARM_2 + 1),#0xFF
	mov	dpl,_asincosf_g_1_1
	mov	dph,(_asincosf_g_1_1 + 1)
	mov	b,(_asincosf_g_1_1 + 2)
	mov	a,(_asincosf_g_1_1 + 3)
	lcall	_ldexpf
;	asincosf.c:63: y = sqrtf(g);
	mov	_asincosf_g_1_1,dpl
	mov	(_asincosf_g_1_1 + 1),dph
	mov	(_asincosf_g_1_1 + 2),b
	mov	(_asincosf_g_1_1 + 3),a
	lcall	_sqrtf
	mov	_asincosf_y_1_1,dpl
	mov	(_asincosf_y_1_1 + 1),dph
	mov	(_asincosf_y_1_1 + 2),b
	mov	(_asincosf_y_1_1 + 3),a
;	asincosf.c:64: y = -(y + y);
	push	_asincosf_y_1_1
	push	(_asincosf_y_1_1 + 1)
	push	(_asincosf_y_1_1 + 2)
	push	(_asincosf_y_1_1 + 3)
	mov	dpl,_asincosf_y_1_1
	mov	dph,(_asincosf_y_1_1 + 1)
	mov	b,(_asincosf_y_1_1 + 2)
	mov	a,(_asincosf_y_1_1 + 3)
	lcall	___fsadd
	mov	_asincosf_sloc0_1_0,dpl
	mov	(_asincosf_sloc0_1_0 + 1),dph
	mov	(_asincosf_sloc0_1_0 + 2),b
	mov	(_asincosf_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	_asincosf_y_1_1,_asincosf_sloc0_1_0
	mov	(_asincosf_y_1_1 + 1),(_asincosf_sloc0_1_0 + 1)
	mov	(_asincosf_y_1_1 + 2),(_asincosf_sloc0_1_0 + 2)
	mov	a,(_asincosf_sloc0_1_0 + 3)
	cpl	acc.7
	mov	(_asincosf_y_1_1 + 3),a
	sjmp	00105$
00104$:
;	asincosf.c:68: g = y * y;
	push	_asincosf_y_1_1
	push	(_asincosf_y_1_1 + 1)
	push	(_asincosf_y_1_1 + 2)
	push	(_asincosf_y_1_1 + 3)
	mov	dpl,_asincosf_y_1_1
	mov	dph,(_asincosf_y_1_1 + 1)
	mov	b,(_asincosf_y_1_1 + 2)
	mov	a,(_asincosf_y_1_1 + 3)
	lcall	___fsmul
	mov	_asincosf_g_1_1,dpl
	mov	(_asincosf_g_1_1 + 1),dph
	mov	(_asincosf_g_1_1 + 2),b
	mov	(_asincosf_g_1_1 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
00105$:
;	asincosf.c:70: r = y + y * ((P(g) * g) / Q(g));
	push	_asincosf_g_1_1
	push	(_asincosf_g_1_1 + 1)
	push	(_asincosf_g_1_1 + 2)
	push	(_asincosf_g_1_1 + 3)
	mov	dptr,#0x2065
	mov	b,#0x01
	mov	a,#0xBF
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x6B
	push	acc
	mov	a,#0x16
	push	acc
	mov	a,#0x6F
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r2
	mov	a,r3
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_asincosf_g_1_1
	push	(_asincosf_g_1_1 + 1)
	push	(_asincosf_g_1_1 + 2)
	push	(_asincosf_g_1_1 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsmul
	mov	_asincosf_sloc0_1_0,dpl
	mov	(_asincosf_sloc0_1_0 + 1),dph
	mov	(_asincosf_sloc0_1_0 + 2),b
	mov	(_asincosf_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x0B
	push	acc
	mov	a,#0x8D
	push	acc
	mov	a,#0xB1
	push	acc
	mov	a,#0xC0
	push	acc
	mov	dpl,_asincosf_g_1_1
	mov	dph,(_asincosf_g_1_1 + 1)
	mov	b,(_asincosf_g_1_1 + 2)
	mov	a,(_asincosf_g_1_1 + 3)
	lcall	___fsadd
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_asincosf_g_1_1
	push	(_asincosf_g_1_1 + 1)
	push	(_asincosf_g_1_1 + 2)
	push	(_asincosf_g_1_1 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xF0
	push	acc
	mov	a,#0x50
	push	acc
	mov	a,#0xB3
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_asincosf_sloc0_1_0
	mov	dph,(_asincosf_sloc0_1_0 + 1)
	mov	b,(_asincosf_sloc0_1_0 + 2)
	mov	a,(_asincosf_sloc0_1_0 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_asincosf_y_1_1
	mov	dph,(_asincosf_y_1_1 + 1)
	mov	b,(_asincosf_y_1_1 + 2)
	mov	a,(_asincosf_y_1_1 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_asincosf_y_1_1
	mov	dph,(_asincosf_y_1_1 + 1)
	mov	b,(_asincosf_y_1_1 + 2)
	mov	a,(_asincosf_y_1_1 + 3)
	lcall	___fsadd
	mov	_asincosf_r_1_1,dpl
	mov	(_asincosf_r_1_1 + 1),dph
	mov	(_asincosf_r_1_1 + 2),b
	mov	(_asincosf_r_1_1 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
00108$:
;	asincosf.c:72: i = quartPI;
	mov	c,_asincosf_quartPI_1_1
	clr	a
	rlc	a
	mov	r2,a
;	asincosf.c:73: if (isacos)
	jb	_asincosf_PARM_2,00128$
	ljmp	00115$
00128$:
;	asincosf.c:75: if (x < 0.0)
	push	ar2
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_asincosf_x_1_1
	mov	dph,(_asincosf_x_1_1 + 1)
	mov	b,(_asincosf_x_1_1 + 2)
	mov	a,(_asincosf_x_1_1 + 3)
	lcall	___fslt
	mov	r3,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar2
	mov	a,r3
	jz	00110$
;	asincosf.c:76: r = (b[i] + r) + b[i];
	mov	a,r2
	add	a,r2
	add	a,acc
	add	a,#_asincosf_b_1_1
	mov	r0,a
	mov	_asincosf_sloc0_1_0,@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 1),@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 2),@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 3),@r0
	push	_asincosf_r_1_1
	push	(_asincosf_r_1_1 + 1)
	push	(_asincosf_r_1_1 + 2)
	push	(_asincosf_r_1_1 + 3)
	mov	dpl,_asincosf_sloc0_1_0
	mov	dph,(_asincosf_sloc0_1_0 + 1)
	mov	b,(_asincosf_sloc0_1_0 + 2)
	mov	a,(_asincosf_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r7,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_asincosf_sloc0_1_0
	push	(_asincosf_sloc0_1_0 + 1)
	push	(_asincosf_sloc0_1_0 + 2)
	push	(_asincosf_sloc0_1_0 + 3)
	mov	dpl,r7
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	_asincosf_r_1_1,dpl
	mov	(_asincosf_r_1_1 + 1),dph
	mov	(_asincosf_r_1_1 + 2),b
	mov	(_asincosf_r_1_1 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	ljmp	00116$
00110$:
;	asincosf.c:78: r = (a[i] - r) + a[i];
	mov	a,r2
	add	a,r2
	add	a,acc
	add	a,#_asincosf_a_1_1
	mov	r0,a
	mov	_asincosf_sloc0_1_0,@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 1),@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 2),@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 3),@r0
	push	_asincosf_r_1_1
	push	(_asincosf_r_1_1 + 1)
	push	(_asincosf_r_1_1 + 2)
	push	(_asincosf_r_1_1 + 3)
	mov	dpl,_asincosf_sloc0_1_0
	mov	dph,(_asincosf_sloc0_1_0 + 1)
	mov	b,(_asincosf_sloc0_1_0 + 2)
	mov	a,(_asincosf_sloc0_1_0 + 3)
	lcall	___fssub
	mov	r7,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_asincosf_sloc0_1_0
	push	(_asincosf_sloc0_1_0 + 1)
	push	(_asincosf_sloc0_1_0 + 2)
	push	(_asincosf_sloc0_1_0 + 3)
	mov	dpl,r7
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	_asincosf_r_1_1,dpl
	mov	(_asincosf_r_1_1 + 1),dph
	mov	(_asincosf_r_1_1 + 2),b
	mov	(_asincosf_r_1_1 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	ljmp	00116$
00115$:
;	asincosf.c:82: r = (a[i] + r) + a[i];
	mov	a,r2
	add	a,r2
	add	a,acc
	add	a,#_asincosf_a_1_1
	mov	r0,a
	mov	_asincosf_sloc0_1_0,@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 1),@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 2),@r0
	inc	r0
	mov	(_asincosf_sloc0_1_0 + 3),@r0
	push	_asincosf_r_1_1
	push	(_asincosf_r_1_1 + 1)
	push	(_asincosf_r_1_1 + 2)
	push	(_asincosf_r_1_1 + 3)
	mov	dpl,_asincosf_sloc0_1_0
	mov	dph,(_asincosf_sloc0_1_0 + 1)
	mov	b,(_asincosf_sloc0_1_0 + 2)
	mov	a,(_asincosf_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_asincosf_sloc0_1_0
	push	(_asincosf_sloc0_1_0 + 1)
	push	(_asincosf_sloc0_1_0 + 2)
	push	(_asincosf_sloc0_1_0 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fsadd
	mov	_asincosf_r_1_1,dpl
	mov	(_asincosf_r_1_1 + 1),dph
	mov	(_asincosf_r_1_1 + 2),b
	mov	(_asincosf_r_1_1 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	asincosf.c:83: if (x < 0.0)
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_asincosf_x_1_1
	mov	dph,(_asincosf_x_1_1 + 1)
	mov	b,(_asincosf_x_1_1 + 2)
	mov	a,(_asincosf_x_1_1 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	00116$
;	asincosf.c:84: r = -r;
	mov	a,(_asincosf_r_1_1 + 3)
	cpl	acc.7
	mov	(_asincosf_r_1_1 + 3),a
00116$:
;	asincosf.c:86: return r;
	mov	dpl,_asincosf_r_1_1
	mov	dph,(_asincosf_r_1_1 + 1)
	mov	b,(_asincosf_r_1_1 + 2)
	mov	a,(_asincosf_r_1_1 + 3)
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
