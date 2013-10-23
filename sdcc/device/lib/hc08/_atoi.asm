;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module _atoi
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
	.globl _atoi
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
_atoi_rv_1_1:
	.ds 2
_atoi_sign_1_1:
	.ds 1
_atoi_sloc0_1_0:
	.ds 2
_atoi_sloc1_1_0:
	.ds 2
_atoi_sloc2_1_0:
	.ds 2
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area OSEG    (OVR)
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
_atoi_s_1_1:
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
;Allocation info for local variables in function 'atoi'
;------------------------------------------------------------
;rv                        Allocated with name '_atoi_rv_1_1'
;sign                      Allocated with name '_atoi_sign_1_1'
;sloc0                     Allocated with name '_atoi_sloc0_1_0'
;sloc1                     Allocated with name '_atoi_sloc1_1_0'
;sloc2                     Allocated with name '_atoi_sloc2_1_0'
;s                         Allocated with name '_atoi_s_1_1'
;------------------------------------------------------------
;../_atoi.c:25: int atoi(char * s)
;	-----------------------------------------
;	 function atoi
;	-----------------------------------------
_atoi:
	sta	(_atoi_s_1_1 + 1)
	stx	_atoi_s_1_1
;../_atoi.c:27: register int rv=0; 
	clr	*_atoi_rv_1_1
	clr	*(_atoi_rv_1_1 + 1)
;../_atoi.c:31: while (*s) {
	lda	_atoi_s_1_1
	sta	*_atoi_sloc0_1_0
	lda	(_atoi_s_1_1 + 1)
	sta	*(_atoi_sloc0_1_0 + 1)
00107$:
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	beq	00133$
00135$:
;../_atoi.c:32: if (*s <= '9' && *s >= '0')
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x39
	bgt	00102$
00136$:
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x30
	bge	00133$
00137$:
;../_atoi.c:33: break;
00102$:
;../_atoi.c:34: if (*s == '-' || *s == '+') 
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x2D
	beq	00133$
00138$:
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x2B
	beq	00133$
00139$:
;../_atoi.c:36: s++;
	ldhx	*_atoi_sloc0_1_0
	aix	#1
	sthx	*_atoi_sloc0_1_0
	bra	00107$
00133$:
	lda	*_atoi_sloc0_1_0
	sta	_atoi_s_1_1
	lda	*(_atoi_sloc0_1_0 + 1)
	sta	(_atoi_s_1_1 + 1)
;../_atoi.c:39: sign = (*s == '-');
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x2D
	beq	00141$
	clra
	bra	00140$
00141$:
	lda	#0x01
00140$:
	sta	*_atoi_sign_1_1
;../_atoi.c:40: if (*s == '-' || *s == '+') s++;
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x2D
	beq	00110$
00142$:
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x2B
	bne	00131$
00143$:
00110$:
	lda	(_atoi_s_1_1 + 1)
	inca
	sta	(_atoi_s_1_1 + 1)
	bne	00144$
	lda	_atoi_s_1_1
	inca
	sta	_atoi_s_1_1
00144$:
;../_atoi.c:42: while (*s && *s >= '0' && *s <= '9') {
00131$:
	lda	_atoi_s_1_1
	sta	*_atoi_sloc0_1_0
	lda	(_atoi_s_1_1 + 1)
	sta	*(_atoi_sloc0_1_0 + 1)
00115$:
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	bne	00145$
	bra	00117$
00145$:
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x30
	blt	00117$
00146$:
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	cmp	#0x39
	bgt	00117$
00147$:
;../_atoi.c:43: rv = (rv * 10) + (*s - '0');
	lda	*_atoi_rv_1_1
	sta	__mulint_PARM_2
	lda	*(_atoi_rv_1_1 + 1)
	sta	(__mulint_PARM_2 + 1)
	clrx
	lda	#0x0A
	jsr	__mulint
	sta	*(_atoi_sloc1_1_0 + 1)
	stx	*_atoi_sloc1_1_0
	ldhx	*_atoi_sloc0_1_0
	lda	,x
	aix	#1
	sthx	*_atoi_sloc0_1_0
	sta	*(_atoi_sloc2_1_0 + 1)
	rola	
	clra	
	sbc	#0x00
	sta	*_atoi_sloc2_1_0
	lda	*(_atoi_sloc2_1_0 + 1)
	sub	#0x30
	sta	*(_atoi_sloc2_1_0 + 1)
	lda	*_atoi_sloc2_1_0
	sbc	#0x00
	sta	*_atoi_sloc2_1_0
	lda	*(_atoi_sloc1_1_0 + 1)
	add	*(_atoi_sloc2_1_0 + 1)
	sta	*(_atoi_rv_1_1 + 1)
	lda	*_atoi_sloc1_1_0
	adc	*_atoi_sloc2_1_0
	sta	*_atoi_rv_1_1
;../_atoi.c:44: s++;
	jmp	00115$
00117$:
;../_atoi.c:47: return (sign ? -rv : rv);
	tst	*_atoi_sign_1_1
	beq	00120$
00148$:
	clra
	sub	*(_atoi_rv_1_1 + 1)
	sta	*(_atoi_sloc2_1_0 + 1)
	clra
	sbc	*_atoi_rv_1_1
	sta	*_atoi_sloc2_1_0
	bra	00121$
00120$:
	mov	*_atoi_rv_1_1,*_atoi_sloc2_1_0
	mov	*(_atoi_rv_1_1 + 1),*(_atoi_sloc2_1_0 + 1)
00121$:
	ldx	*_atoi_sloc2_1_0
	lda	*(_atoi_sloc2_1_0 + 1)
00118$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
