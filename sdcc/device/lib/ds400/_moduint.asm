;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:34 2013
;--------------------------------------------------------
	.module _moduint
	.optsdcc -mds400 --model-flat24
	
;--------------------------------------------------------
; CPU specific extensions
;--------------------------------------------------------
.flat24 on		; 24 bit flat addressing
dpl1	=	0x84
dph1	=	0x85
dps	=	0x86
dpx	=	0x93
dpx1	=	0x95
esp	=	0x9B
ap	=	0x9C
_ap	=	0x9C
mcnt0	=	0xD1
mcnt1	=	0xD2
ma	=	0xD3
mb	=	0xD4
mc	=	0xD5
F1	=	0xD1	; user flag
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __moduint_PARM_2
	.globl __moduint
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
	.area REG_BANK_3	(REL,OVR,DATA)
	.ds 8
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
__moduint_PARM_2:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
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
;Allocation info for local variables in function '_moduint'
;------------------------------------------------------------
;b                         Allocated with name '__moduint_PARM_2'
;a                         Allocated to registers r2 r3 
;count                     Allocated to registers r4 
;------------------------------------------------------------
;	_moduint.c:170: _moduint (unsigned int a, unsigned int b)
;	-----------------------------------------
;	 function _moduint
;	-----------------------------------------
__moduint:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	dpl1,dpl
	mov	dph1,dph
;	_moduint.c:172: unsigned char count = 0;
;	genAssign: resultIsFar = TRUE
	mov	r4,#0x00
;	_moduint.c:175: while (!MSB_SET(b))
;	genAssign: resultIsFar = FALSE
	mov	r5,#0x00
00103$:
	mov	dptr,#__moduint_PARM_2
	inc	dptr
	movx	a,@dptr
	rl	a
	anl	a,#0x01
	mov  r6,a
	jnz  00117$
00120$:
;	_moduint.c:177: b <<= 1;
	mov	dptr,#__moduint_PARM_2
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	xch	a,r6
	add	a,acc
	xch	a,r6
	rlc	a
	mov	r7,a
;	genAssign: resultIsFar = TRUE
	mov	dptr,#__moduint_PARM_2
	mov	a,r6
	movx	@dptr,a
	inc	dptr
	mov	a,r7
	movx	@dptr,a
;	_moduint.c:178: if (b > a)
	mov	dptr,#__moduint_PARM_2
	clr	c
	mov	a,dpl1
	xch	a, b
	movx	a,@dptr
	xch	a, b
	subb	a,b
	mov	a,dph1
	xch	a, b
	inc	dptr
	movx	a,@dptr
	xch	a, b
	subb	a,b
	jnc  00102$
00121$:
;	_moduint.c:180: b >>=1;
	mov	dptr,#__moduint_PARM_2
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	clr	c
	rrc	a
	xch	a,r6
	rrc	a
	xch	a,r6
	mov	r7,a
;	genAssign: resultIsFar = TRUE
	mov	dptr,#__moduint_PARM_2
	mov	a,r6
	movx	@dptr,a
	inc	dptr
	mov	a,r7
	movx	@dptr,a
;	_moduint.c:181: break;
	sjmp 00117$
00102$:
;	_moduint.c:183: count++;
	inc	r5
;	genAssign: resultIsFar = TRUE
	mov	ar4,r5
;	_moduint.c:185: do
	sjmp 00103$
00117$:
;	genAssign: resultIsFar = FALSE
00108$:
;	_moduint.c:187: if (a >= b)
	mov	dptr,#__moduint_PARM_2
	clr	c
	mov	a,dpl1
	xch	a, b
	movx	a,@dptr
	xch	a, b
	subb	a,b
	mov	a,dph1
	xch	a, b
	inc	dptr
	movx	a,@dptr
	xch	a, b
	subb	a,b
	jc   00107$
00122$:
;	_moduint.c:188: a -= b;
	mov	dptr,#__moduint_PARM_2
	clr	c
	movx	a,@dptr
	mov	b,a
	mov	a,dpl1
	subb	a,b
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	b,a
	mov	a,dph1
	subb	a,b
	mov	r6,a
;	genAssign: resultIsFar = TRUE
	mov	dpl1,r5
	mov	dph1,r6
00107$:
;	_moduint.c:189: b >>= 1;
	mov	dptr,#__moduint_PARM_2
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	clr	c
	rrc	a
	xch	a,r5
	rrc	a
	xch	a,r5
	mov	r6,a
;	genAssign: resultIsFar = TRUE
	mov	dptr,#__moduint_PARM_2
	mov	a,r5
	movx	@dptr,a
	inc	dptr
	mov	a,r6
	movx	@dptr,a
;	_moduint.c:191: while (count--);
;	genAssign: resultIsFar = FALSE
	mov	ar5,r4
	dec	r4
	mov	a,r5
	jnz  00108$
00123$:
;	_moduint.c:192: return a;
	mov	dpl,dpl1
	mov	dph,dph1
00111$:
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
