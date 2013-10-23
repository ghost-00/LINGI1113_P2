;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:49 2013
;--------------------------------------------------------
	.module _realloc
	.optsdcc -mmcs51 --model-medium
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _realloc_PARM_2
	.globl _realloc
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
_realloc_PARM_2:
	.ds 2
_realloc_p_1_1:
	.ds 3
_realloc_pthis_1_1:
	.ds 2
_realloc_pnew_1_1:
	.ds 2
_realloc_ret_1_1:
	.ds 2
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
;Allocation info for local variables in function 'realloc'
;------------------------------------------------------------
;------------------------------------------------------------
;	_realloc.c:76: void __xdata * realloc (void * p, size_t size)
;	-----------------------------------------
;	 function realloc
;	-----------------------------------------
_realloc:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	r2,b
	mov	r3,dph
	mov	a,dpl
	mov	r0,#_realloc_p_1_1
	movx	@r0,a
	inc	r0
	mov	a,r3
	movx	@r0,a
	inc	r0
	mov	a,r2
	movx	@r0,a
;	_realloc.c:84: pthis = _sdcc_find_memheader(p);
	mov	r0,#_realloc_p_1_1
	movx	a,@r0
	mov	r5,a
	inc	r0
	movx	a,@r0
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	lcall	__sdcc_find_memheader
	mov	r0,#_realloc_pthis_1_1
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
;	_realloc.c:85: if (pthis)
	mov	r0,#_realloc_pthis_1_1
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	orl	a,b
	jnz	00124$
	ljmp	00114$
00124$:
;	_realloc.c:87: if (size > (0xFFFF-HEADER_SIZE))
	mov	r0,#_realloc_PARM_2
	clr	c
	movx	a,@r0
	mov	b,a
	mov	a,#0xFB
	subb	a,b
	inc	r0
	movx	a,@r0
	mov	b,a
	mov	a,#0xFF
	subb	a,b
	jnc	00111$
;	_realloc.c:89: ret = (void __xdata *) NULL; //To prevent overflow in next line
	mov	r0,#_realloc_ret_1_1
	clr	a
	movx	@r0,a
	inc	r0
	movx	@r0,a
	ljmp	00115$
00111$:
;	_realloc.c:93: size += HEADER_SIZE; //We need a memory for header too
	mov	r0,#_realloc_PARM_2
	movx	a,@r0
	add	a,#0x04
	movx	@r0,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	movx	@r0,a
;	_realloc.c:95: if ((((unsigned int)pthis->next) - ((unsigned int)pthis)) >= size)
	mov	r0,#_realloc_pthis_1_1
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	inc	dptr
	movx	a,@dptr
	mov	r2,a
	mov	ar3,r7
	mov	ar4,r2
	mov	r0,#_realloc_pthis_1_1
	movx	a,@r0
	mov	r5,a
	inc	r0
	movx	a,@r0
	mov	r6,a
	mov	a,r3
	clr	c
	subb	a,r5
	mov	r3,a
	mov	a,r4
	subb	a,r6
	mov	r4,a
	mov	r0,#_realloc_PARM_2
	clr	c
	movx	a,@r0
	mov	b,a
	mov	a,r3
	subb	a,b
	inc	r0
	movx	a,@r0
	mov	b,a
	mov	a,r4
	subb	a,b
	jc	00108$
;	_realloc.c:97: pthis->len = size;
	mov	r0,#_realloc_pthis_1_1
	movx	a,@r0
	add	a,#0x02
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	mov	r0,#_realloc_PARM_2
	movx	a,@r0
	movx	@dptr,a
	inc	dptr
	inc	r0
	movx	a,@r0
	movx	@dptr,a
;	_realloc.c:98: ret = p;
	mov	r0,#_realloc_p_1_1
	mov	r1,#_realloc_ret_1_1
	movx	a,@r0
	movx	@r1,a
	inc	r0
	movx	a,@r0
	inc	r1
	movx	@r1,a
	ljmp	00115$
00108$:
;	_realloc.c:102: if ((_sdcc_prev_memheader) &&
	mov	r0,#__sdcc_prev_memheader
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	orl	a,b
	jnz	00127$
	ljmp	00104$
00127$:
;	_realloc.c:103: ((((unsigned int)pthis->next) -
;	_realloc.c:104: ((unsigned int)_sdcc_prev_memheader) -
	mov	r0,#__sdcc_prev_memheader
	movx	a,@r0
	mov	r3,a
	inc	r0
	movx	a,@r0
	mov	r4,a
	mov	a,r7
	clr	c
	subb	a,r3
	mov	r7,a
	mov	a,r2
	subb	a,r4
	mov	r2,a
;	_realloc.c:105: _sdcc_prev_memheader->len) >= size))
	mov	r0,#__sdcc_prev_memheader
	movx	a,@r0
	mov	r3,a
	inc	r0
	movx	a,@r0
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	a,r7
	clr	c
	subb	a,r5
	mov	r7,a
	mov	a,r2
	subb	a,r6
	mov	r2,a
	mov	r0,#_realloc_PARM_2
	clr	c
	movx	a,@r0
	mov	b,a
	mov	a,r7
	subb	a,b
	inc	r0
	movx	a,@r0
	mov	b,a
	mov	a,r2
	subb	a,b
	jc	00104$
;	_realloc.c:107: pnew = (MEMHEADER __xdata * )((char __xdata *)_sdcc_prev_memheader + _sdcc_prev_memheader->len);
	mov	r0,#_realloc_pnew_1_1
	mov	a,r5
	add	a,r3
	movx	@r0,a
	mov	a,r6
	addc	a,r4
	inc	r0
	movx	@r0,a
;	_realloc.c:108: _sdcc_prev_memheader->next = pnew;
	mov	dpl,r3
	mov	dph,r4
	mov	r0,#_realloc_pnew_1_1
	movx	a,@r0
	movx	@dptr,a
	inc	dptr
	inc	r0
	movx	a,@r0
	movx	@dptr,a
;	_realloc.c:114: memmove(pnew, pthis, pthis->len);
	mov	r0,#_realloc_pnew_1_1
	movx	a,@r0
	mov	r2,a
	inc	r0
	movx	a,@r0
	mov	r3,a
	mov	r4,#0x00
	mov	r0,#_realloc_pthis_1_1
	mov	r1,#_memmove_PARM_2
	movx	a,@r0
	movx	@r1,a
	inc	r0
	movx	a,@r0
	inc	r1
	movx	@r1,a
	inc	r1
	clr	a
	movx	@r1,a
	mov	r0,#_realloc_pthis_1_1
	movx	a,@r0
	add	a,#0x02
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	r0,#_memmove_PARM_3
	mov	a,r7
	movx	@r0,a
	inc	r0
	mov	a,r5
	movx	@r0,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	_memmove
;	_realloc.c:115: pnew->len = size;
	mov	r0,#_realloc_pnew_1_1
	movx	a,@r0
	add	a,#0x02
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	mov	r0,#_realloc_PARM_2
	movx	a,@r0
	movx	@dptr,a
	inc	dptr
	inc	r0
	movx	a,@r0
	movx	@dptr,a
;	_realloc.c:116: ret = MEM(pnew);
	mov	r0,#_realloc_pnew_1_1
	mov	r1,#_realloc_ret_1_1
	movx	a,@r0
	add	a,#0x04
	movx	@r1,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	inc	r1
	movx	@r1,a
	ljmp	00115$
00104$:
;	_realloc.c:120: ret = malloc(size - HEADER_SIZE);
	mov	r0,#_realloc_PARM_2
	movx	a,@r0
	add	a,#0xfc
	mov	r2,a
	inc	r0
	movx	a,@r0
	addc	a,#0xff
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	_malloc
	mov	r0,#_realloc_ret_1_1
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
;	_realloc.c:121: if (ret)
	mov	r0,#_realloc_ret_1_1
	movx	a,@r0
	mov	b,a
	inc	r0
	movx	a,@r0
	orl	a,b
	jz	00115$
;	_realloc.c:123: memcpy(ret, MEM(pthis), pthis->len - HEADER_SIZE);
	mov	r0,#_realloc_ret_1_1
	movx	a,@r0
	mov	r2,a
	inc	r0
	movx	a,@r0
	mov	r3,a
	mov	r4,#0x00
	mov	r0,#_realloc_pthis_1_1
	movx	a,@r0
	add	a,#0x04
	mov	r5,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	r6,a
	mov	r0,#_memcpy_PARM_2
	mov	a,r5
	movx	@r0,a
	inc	r0
	mov	a,r6
	movx	@r0,a
	inc	r0
	clr	a
	movx	@r0,a
	mov	r0,#_realloc_pthis_1_1
	movx	a,@r0
	add	a,#0x02
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	r0,#_memcpy_PARM_3
	mov	a,r5
	add	a,#0xfc
	movx	@r0,a
	mov	a,r6
	addc	a,#0xff
	inc	r0
	movx	@r0,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	_memcpy
;	_realloc.c:124: free(p);
	mov	r0,#_realloc_p_1_1
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	inc	r0
	movx	a,@r0
	mov	b,a
	lcall	_free
	sjmp	00115$
00114$:
;	_realloc.c:132: ret = malloc(size);
	mov	r0,#_realloc_PARM_2
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	lcall	_malloc
	mov	r0,#_realloc_ret_1_1
	mov	a,dpl
	movx	@r0,a
	inc	r0
	mov	a,dph
	movx	@r0,a
00115$:
;	_realloc.c:135: return ret;
	mov	r0,#_realloc_ret_1_1
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
