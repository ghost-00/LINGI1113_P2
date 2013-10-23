;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:43 2013
;--------------------------------------------------------
	.module _strncat
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncat_PARM_3
	.globl _strncat_PARM_2
	.globl _strncat
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
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_strncat_PARM_2::
	.ds 3
_strncat_PARM_3::
	.ds 2
_strncat_front_1_1::
	.ds 3
_strncat_start_1_1::
	.ds 3
_strncat_sloc0_1_0::
	.ds 3
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
;Allocation info for local variables in function 'strncat'
;------------------------------------------------------------
;back                      Allocated with name '_strncat_PARM_2'
;count                     Allocated with name '_strncat_PARM_3'
;front                     Allocated with name '_strncat_front_1_1'
;start                     Allocated with name '_strncat_start_1_1'
;sloc0                     Allocated with name '_strncat_sloc0_1_0'
;------------------------------------------------------------
;	_strncat.c:26: char * strncat (
;	-----------------------------------------
;	 function strncat
;	-----------------------------------------
_strncat:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	_strncat_front_1_1,dpl
	mov	(_strncat_front_1_1 + 1),dph
	mov	(_strncat_front_1_1 + 2),b
;	_strncat.c:32: char *start = front;
	mov	_strncat_start_1_1,_strncat_front_1_1
	mov	(_strncat_start_1_1 + 1),(_strncat_front_1_1 + 1)
	mov	(_strncat_start_1_1 + 2),(_strncat_front_1_1 + 2)
;	_strncat.c:34: while (*front++);
	mov	r0,_strncat_front_1_1
	mov	r1,(_strncat_front_1_1 + 1)
	mov	r5,(_strncat_front_1_1 + 2)
00101$:
	mov	dpl,r0
	mov	dph,r1
	mov	b,r5
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	mov	r0,dpl
	mov	r1,dph
	mov	a,r6
	jnz	00101$
;	_strncat.c:36: front--;
	mov	a,r0
	add	a,#0xff
	mov	_strncat_front_1_1,a
	mov	a,r1
	addc	a,#0xff
	mov	(_strncat_front_1_1 + 1),a
	mov	(_strncat_front_1_1 + 2),r5
;	_strncat.c:38: while (count--)
	mov	r5,_strncat_PARM_2
	mov	r6,(_strncat_PARM_2 + 1)
	mov	r7,(_strncat_PARM_2 + 2)
	mov	_strncat_sloc0_1_0,_strncat_front_1_1
	mov	(_strncat_sloc0_1_0 + 1),(_strncat_front_1_1 + 1)
	mov	(_strncat_sloc0_1_0 + 2),(_strncat_front_1_1 + 2)
	mov	r0,_strncat_PARM_3
	mov	r1,(_strncat_PARM_3 + 1)
00106$:
	mov	ar2,r0
	mov	ar3,r1
	dec	r0
	cjne	r0,#0xff,00118$
	dec	r1
00118$:
	mov	a,r2
	orl	a,r3
	jz	00108$
;	_strncat.c:39: if (!(*front++ = *back++))
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	dpl,_strncat_sloc0_1_0
	mov	dph,(_strncat_sloc0_1_0 + 1)
	mov	b,(_strncat_sloc0_1_0 + 2)
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	_strncat_sloc0_1_0,dpl
	mov	(_strncat_sloc0_1_0 + 1),dph
	mov	_strncat_front_1_1,_strncat_sloc0_1_0
	mov	(_strncat_front_1_1 + 1),(_strncat_sloc0_1_0 + 1)
	mov	(_strncat_front_1_1 + 2),(_strncat_sloc0_1_0 + 2)
	mov	a,r2
	jnz	00106$
;	_strncat.c:40: return(start);
	mov	dpl,_strncat_start_1_1
	mov	dph,(_strncat_start_1_1 + 1)
	mov	b,(_strncat_start_1_1 + 2)
	ret
00108$:
;	_strncat.c:42: *front = '\0';
	mov	dpl,_strncat_front_1_1
	mov	dph,(_strncat_front_1_1 + 1)
	mov	b,(_strncat_front_1_1 + 2)
	clr	a
	lcall	__gptrput
;	_strncat.c:43: return(start);
	mov	dpl,_strncat_start_1_1
	mov	dph,(_strncat_start_1_1 + 1)
	mov	b,(_strncat_start_1_1 + 2)
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
