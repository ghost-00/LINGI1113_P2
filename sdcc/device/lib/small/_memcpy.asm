;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:43 2013
;--------------------------------------------------------
	.module _memcpy
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy_PARM_3
	.globl _memcpy_PARM_2
	.globl _memcpy
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
_memcpy_PARM_2::
	.ds 3
_memcpy_PARM_3::
	.ds 2
_memcpy_ret_1_1::
	.ds 3
_memcpy_s_1_1::
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
;Allocation info for local variables in function 'memcpy'
;------------------------------------------------------------
;src                       Allocated with name '_memcpy_PARM_2'
;acount                    Allocated with name '_memcpy_PARM_3'
;dst                       Allocated to registers r2 r3 r4 
;ret                       Allocated with name '_memcpy_ret_1_1'
;d                         Allocated to registers r2 r3 r4 
;s                         Allocated with name '_memcpy_s_1_1'
;------------------------------------------------------------
;	_memcpy.c:31: void * memcpy (
;	-----------------------------------------
;	 function memcpy
;	-----------------------------------------
_memcpy:
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
;	_memcpy.c:63: void * ret = dst;
	mov	_memcpy_ret_1_1,r2
	mov	(_memcpy_ret_1_1 + 1),r3
	mov	(_memcpy_ret_1_1 + 2),r4
;	_memcpy.c:65: char * s = src;
	mov	r0,_memcpy_PARM_2
	mov	r1,(_memcpy_PARM_2 + 1)
	mov	r5,(_memcpy_PARM_2 + 2)
;	_memcpy.c:70: while (acount--) {
	mov	_memcpy_s_1_1,r0
	mov	(_memcpy_s_1_1 + 1),r1
	mov	(_memcpy_s_1_1 + 2),r5
	mov	r0,_memcpy_PARM_3
	mov	r1,(_memcpy_PARM_3 + 1)
00101$:
	mov	ar5,r0
	mov	ar6,r1
	dec	r0
	cjne	r0,#0xff,00109$
	dec	r1
00109$:
	mov	a,r5
	orl	a,r6
	jz	00103$
;	_memcpy.c:71: *d++ = *s++;
	mov	dpl,_memcpy_s_1_1
	mov	dph,(_memcpy_s_1_1 + 1)
	mov	b,(_memcpy_s_1_1 + 2)
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	mov	_memcpy_s_1_1,dpl
	mov	(_memcpy_s_1_1 + 1),dph
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
	sjmp	00101$
00103$:
;	_memcpy.c:74: return(ret);
	mov	dpl,_memcpy_ret_1_1
	mov	dph,(_memcpy_ret_1_1 + 1)
	mov	b,(_memcpy_ret_1_1 + 2)
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
