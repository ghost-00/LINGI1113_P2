;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:39 2013
;--------------------------------------------------------
	.module puts
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
	.globl _puts
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
_puts_sloc0_1_0:
	.ds 2
_puts_sloc1_1_0:
	.ds 2
_puts_sloc2_1_0:
	.ds 1
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
_puts_s_1_1:
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
;Allocation info for local variables in function 'puts'
;------------------------------------------------------------
;sloc0                     Allocated with name '_puts_sloc0_1_0'
;sloc1                     Allocated with name '_puts_sloc1_1_0'
;sloc2                     Allocated with name '_puts_sloc2_1_0'
;s                         Allocated with name '_puts_s_1_1'
;i                         Allocated to registers 
;------------------------------------------------------------
;../puts.c:27: int puts (char *s)
;	-----------------------------------------
;	 function puts
;	-----------------------------------------
_puts:
	sta	(_puts_s_1_1 + 1)
	stx	_puts_s_1_1
;../puts.c:30: while (*s){
	lda	_puts_s_1_1
	sta	*_puts_sloc0_1_0
	lda	(_puts_s_1_1 + 1)
	sta	*(_puts_sloc0_1_0 + 1)
	clr	*_puts_sloc1_1_0
	clr	*(_puts_sloc1_1_0 + 1)
00101$:
	ldhx	*_puts_sloc0_1_0
	lda	,x
	beq	00103$
00109$:
;../puts.c:31: putchar(*s++);
	ldhx	*_puts_sloc0_1_0
	lda	,x
	aix	#1
	sta	*_puts_sloc2_1_0
	sthx	*_puts_sloc0_1_0
	lda	*_puts_sloc2_1_0
	jsr	_putchar
;../puts.c:32: i++;
	ldhx	*_puts_sloc1_1_0
	aix	#1
	sthx	*_puts_sloc1_1_0
	bra	00101$
00103$:
;../puts.c:34: putchar('\n');
	lda	#0x0A
	jsr	_putchar
;../puts.c:35: return i+1;
	ldhx	*_puts_sloc1_1_0
	aix	#1
	sthx	*_puts_sloc1_1_0
	ldx	*_puts_sloc1_1_0
	lda	*(_puts_sloc1_1_0 + 1)
00104$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
