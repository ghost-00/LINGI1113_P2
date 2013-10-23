;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module _strrchr
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
	.globl _strrchr_PARM_2
	.globl _strrchr
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
_strrchr_sloc0_1_0::
	.ds 2
_strrchr_sloc1_1_0::
	.ds 1
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
_strrchr_PARM_2:
	.ds 1
_strrchr_string_1_1:
	.ds 2
_strrchr_start_1_1:
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
;Allocation info for local variables in function 'strrchr'
;------------------------------------------------------------
;ch                        Allocated with name '_strrchr_PARM_2'
;string                    Allocated with name '_strrchr_string_1_1'
;start                     Allocated with name '_strrchr_start_1_1'
;sloc0                     Allocated with name '_strrchr_sloc0_1_0'
;sloc1                     Allocated with name '_strrchr_sloc1_1_0'
;------------------------------------------------------------
;../_strrchr.c:26: char * strrchr (
;	-----------------------------------------
;	 function strrchr
;	-----------------------------------------
_strrchr:
	sta	(_strrchr_string_1_1 + 1)
	stx	_strrchr_string_1_1
;../_strrchr.c:31: const char * start = string;
	lda	_strrchr_string_1_1
	sta	_strrchr_start_1_1
	lda	(_strrchr_string_1_1 + 1)
	sta	(_strrchr_start_1_1 + 1)
;../_strrchr.c:33: while (*string++)                       /* find end of string */
	lda	_strrchr_string_1_1
	sta	*_strrchr_sloc0_1_0
	lda	(_strrchr_string_1_1 + 1)
	sta	*(_strrchr_sloc0_1_0 + 1)
00101$:
	ldhx	*_strrchr_sloc0_1_0
	lda	,x
	aix	#1
	sta	*_strrchr_sloc1_1_0
	sthx	*_strrchr_sloc0_1_0
	tst	*_strrchr_sloc1_1_0
	bne	00101$
00118$:
;../_strrchr.c:36: while (--string != start && *string != ch)
00105$:
	lda	*(_strrchr_sloc0_1_0 + 1)
	sub	#0x01
	sta	*(_strrchr_sloc0_1_0 + 1)
	lda	*_strrchr_sloc0_1_0
	sbc	#0x00
	sta	*_strrchr_sloc0_1_0
	lda	*(_strrchr_sloc0_1_0 + 1)
	cmp	(_strrchr_start_1_1 + 1)
	bne	00119$
	lda	*_strrchr_sloc0_1_0
	cmp	_strrchr_start_1_1
	beq	00107$
00119$:
	ldhx	*_strrchr_sloc0_1_0
	lda	,x
	cmp	_strrchr_PARM_2
	bne	00105$
00120$:
00107$:
;../_strrchr.c:39: if (*string == ch)                /* char found ? */
	ldhx	*_strrchr_sloc0_1_0
	lda	,x
	cmp	_strrchr_PARM_2
	bne	00109$
00121$:
;../_strrchr.c:40: return( (char *)string );
	ldx	*_strrchr_sloc0_1_0
	lda	*(_strrchr_sloc0_1_0 + 1)
	rts
00109$:
;../_strrchr.c:42: return (NULL) ;
	clrx
	clra
00110$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
