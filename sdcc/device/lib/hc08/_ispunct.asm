;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:38 2013
;--------------------------------------------------------
	.module _ispunct
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
	.globl _ispunct
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
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
_ispunct_c_1_1:
	.ds 1
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
;Allocation info for local variables in function 'ispunct'
;------------------------------------------------------------
;c                         Allocated with name '_ispunct_c_1_1'
;------------------------------------------------------------
;../_ispunct.c:27: char ispunct (unsigned char c)
;	-----------------------------------------
;	 function ispunct
;	-----------------------------------------
_ispunct:
;../_ispunct.c:29: if ( isprint (c) &&
	sta	_ispunct_c_1_1
	jsr	_isprint
	tsta
	beq	00102$
00114$:
;../_ispunct.c:30: !islower(c) &&
	lda	_ispunct_c_1_1
	jsr	_islower
	tsta
	bne	00102$
00115$:
;../_ispunct.c:31: !isupper(c) &&
	lda	_ispunct_c_1_1
	jsr	_isupper
	tsta
	bne	00102$
00116$:
;../_ispunct.c:32: !isspace(c) &&
	lda	_ispunct_c_1_1
	jsr	_isspace
	tsta
	bne	00102$
00117$:
;../_ispunct.c:33: !isdigit(c) )
	lda	_ispunct_c_1_1
	jsr	_isdigit
	tsta
	bne	00102$
00118$:
;../_ispunct.c:34: return 1;
	lda	#0x01
	rts
00102$:
;../_ispunct.c:35: return 0;
	clra
00107$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
