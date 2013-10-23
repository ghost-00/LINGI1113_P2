;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:39 2013
;--------------------------------------------------------
	.module _memmove
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
	.globl _memmove_PARM_3
	.globl _memmove_PARM_2
	.globl _memmove
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
_memmove_sloc0_1_0::
	.ds 2
_memmove_sloc1_1_0::
	.ds 2
_memmove_sloc2_1_0::
	.ds 2
_memmove_sloc3_1_0::
	.ds 2
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
_memmove_PARM_2:
	.ds 2
_memmove_PARM_3:
	.ds 2
_memmove_dst_1_1:
	.ds 2
_memmove_ret_1_1:
	.ds 2
_memmove_d_1_1:
	.ds 2
_memmove_s_1_1:
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
;Allocation info for local variables in function 'memmove'
;------------------------------------------------------------
;src                       Allocated with name '_memmove_PARM_2'
;acount                    Allocated with name '_memmove_PARM_3'
;dst                       Allocated with name '_memmove_dst_1_1'
;ret                       Allocated with name '_memmove_ret_1_1'
;d                         Allocated with name '_memmove_d_1_1'
;s                         Allocated with name '_memmove_s_1_1'
;sloc0                     Allocated with name '_memmove_sloc0_1_0'
;sloc1                     Allocated with name '_memmove_sloc1_1_0'
;sloc2                     Allocated with name '_memmove_sloc2_1_0'
;sloc3                     Allocated with name '_memmove_sloc3_1_0'
;------------------------------------------------------------
;../_memmove.c:35: void * memmove (
;	-----------------------------------------
;	 function memmove
;	-----------------------------------------
_memmove:
	sta	(_memmove_dst_1_1 + 1)
	stx	_memmove_dst_1_1
;../_memmove.c:96: void * ret = dst;
	lda	_memmove_dst_1_1
	sta	_memmove_ret_1_1
	lda	(_memmove_dst_1_1 + 1)
	sta	(_memmove_ret_1_1 + 1)
;../_memmove.c:100: if (((int)src < (int)dst) && ((((int)src)+acount) > (int)dst)) {
	lda	(_memmove_PARM_2 + 1)
	sta	*(_memmove_sloc0_1_0 + 1)
	lda	_memmove_PARM_2
	sta	*_memmove_sloc0_1_0
	lda	(_memmove_dst_1_1 + 1)
	sta	*(_memmove_sloc1_1_0 + 1)
	lda	_memmove_dst_1_1
	sta	*_memmove_sloc1_1_0
	ldhx	*_memmove_sloc0_1_0
	cphx	*_memmove_sloc1_1_0
	blt	00121$
	jmp	00108$
00121$:
	lda	(_memmove_PARM_2 + 1)
	sta	*(_memmove_sloc1_1_0 + 1)
	lda	_memmove_PARM_2
	sta	*_memmove_sloc1_1_0
	lda	*(_memmove_sloc1_1_0 + 1)
	add	(_memmove_PARM_3 + 1)
	sta	*(_memmove_sloc1_1_0 + 1)
	lda	*_memmove_sloc1_1_0
	adc	_memmove_PARM_3
	sta	*_memmove_sloc1_1_0
	lda	(_memmove_dst_1_1 + 1)
	sta	*(_memmove_sloc0_1_0 + 1)
	lda	_memmove_dst_1_1
	sta	*_memmove_sloc0_1_0
	ldhx	*_memmove_sloc1_1_0
	cphx	*_memmove_sloc0_1_0
	bhi	00122$
	jmp	00108$
00122$:
;../_memmove.c:104: d = ((char *)dst)+acount-1;
	lda	(_memmove_dst_1_1 + 1)
	add	(_memmove_PARM_3 + 1)
	sta	*(_memmove_sloc1_1_0 + 1)
	lda	_memmove_dst_1_1
	adc	_memmove_PARM_3
	sta	*_memmove_sloc1_1_0
	lda	*(_memmove_sloc1_1_0 + 1)
	sub	#0x01
	sta	(_memmove_d_1_1 + 1)
	lda	*_memmove_sloc1_1_0
	sbc	#0x00
	sta	_memmove_d_1_1
;../_memmove.c:105: s = ((char *)src)+acount-1;
	lda	(_memmove_PARM_2 + 1)
	add	(_memmove_PARM_3 + 1)
	sta	*(_memmove_sloc1_1_0 + 1)
	lda	_memmove_PARM_2
	adc	_memmove_PARM_3
	sta	*_memmove_sloc1_1_0
	lda	*(_memmove_sloc1_1_0 + 1)
	sub	#0x01
	sta	(_memmove_s_1_1 + 1)
	lda	*_memmove_sloc1_1_0
	sbc	#0x00
;../_memmove.c:106: while (acount--) {
	sta	_memmove_s_1_1
	sta	*_memmove_sloc1_1_0
	lda	(_memmove_s_1_1 + 1)
	sta	*(_memmove_sloc1_1_0 + 1)
	lda	_memmove_d_1_1
	sta	*_memmove_sloc0_1_0
	lda	(_memmove_d_1_1 + 1)
	sta	*(_memmove_sloc0_1_0 + 1)
	lda	_memmove_PARM_3
	sta	*_memmove_sloc2_1_0
	lda	(_memmove_PARM_3 + 1)
	sta	*(_memmove_sloc2_1_0 + 1)
00101$:
	mov	*_memmove_sloc2_1_0,*_memmove_sloc3_1_0
	mov	*(_memmove_sloc2_1_0 + 1),*(_memmove_sloc3_1_0 + 1)
	lda	*(_memmove_sloc2_1_0 + 1)
	sub	#0x01
	sta	*(_memmove_sloc2_1_0 + 1)
	lda	*_memmove_sloc2_1_0
	sbc	#0x00
	sta	*_memmove_sloc2_1_0
	lda	*(_memmove_sloc3_1_0 + 1)
	ora	*_memmove_sloc3_1_0
	bne	00123$
	jmp	00109$
00123$:
;../_memmove.c:107: *d-- = *s--;
	ldhx	*_memmove_sloc1_1_0
	lda	,x
	sta	*_memmove_sloc3_1_0
	lda	*(_memmove_sloc1_1_0 + 1)
	sub	#0x01
	sta	*(_memmove_sloc1_1_0 + 1)
	lda	*_memmove_sloc1_1_0
	sbc	#0x00
	sta	*_memmove_sloc1_1_0
	ldhx	*_memmove_sloc0_1_0
	lda	*_memmove_sloc3_1_0
	sta	,x
	lda	*(_memmove_sloc0_1_0 + 1)
	sub	#0x01
	sta	*(_memmove_sloc0_1_0 + 1)
	lda	*_memmove_sloc0_1_0
	sbc	#0x00
	sta	*_memmove_sloc0_1_0
	bra	00101$
00108$:
;../_memmove.c:115: s = src;
;../_memmove.c:116: while (acount--) {
	lda	_memmove_PARM_2
	sta	*_memmove_sloc3_1_0
	lda	(_memmove_PARM_2 + 1)
	sta	*(_memmove_sloc3_1_0 + 1)
	lda	_memmove_dst_1_1
	sta	*_memmove_sloc2_1_0
	lda	(_memmove_dst_1_1 + 1)
	sta	*(_memmove_sloc2_1_0 + 1)
	lda	_memmove_PARM_3
	sta	*_memmove_sloc1_1_0
	lda	(_memmove_PARM_3 + 1)
	sta	*(_memmove_sloc1_1_0 + 1)
00104$:
	mov	*_memmove_sloc1_1_0,*_memmove_sloc0_1_0
	mov	*(_memmove_sloc1_1_0 + 1),*(_memmove_sloc0_1_0 + 1)
	lda	*(_memmove_sloc1_1_0 + 1)
	sub	#0x01
	sta	*(_memmove_sloc1_1_0 + 1)
	lda	*_memmove_sloc1_1_0
	sbc	#0x00
	sta	*_memmove_sloc1_1_0
	lda	*(_memmove_sloc0_1_0 + 1)
	ora	*_memmove_sloc0_1_0
	beq	00109$
00124$:
;../_memmove.c:117: *d++ = *s++;
	ldhx	*_memmove_sloc3_1_0
	lda	,x
	aix	#1
	sta	*_memmove_sloc0_1_0
	sthx	*_memmove_sloc3_1_0
	ldhx	*_memmove_sloc2_1_0
	lda	*_memmove_sloc0_1_0
	sta	,x
	aix	#1
	sthx	*_memmove_sloc2_1_0
	bra	00104$
00109$:
;../_memmove.c:121: return(ret);
	ldx	_memmove_ret_1_1
	lda	(_memmove_ret_1_1 + 1)
00111$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
