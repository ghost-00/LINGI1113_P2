;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _strrchr
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strrchr
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../_strrchr.c:26: char * strrchr (
;	---------------------------------
; Function strrchr
; ---------------------------------
_strrchr_start::
_strrchr:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_strrchr.c:31: const char * start = string;
	ld	c,4 (ix)
	ld	b,5 (ix)
;../_strrchr.c:33: while (*string++)                       /* find end of string */
	ld	e,c
	ld	d,b
00101$:
	ld	a,(de)
	inc	de
	or	a,a
	jr	NZ,00101$
;../_strrchr.c:36: while (--string != start && *string != ch)
00105$:
	dec	de
	ld	a,e
	sub	a,c
	jr	NZ,00118$
	ld	a,d
	sub	a,b
	jr	Z,00107$
00118$:
	ld	a,(de)
	sub	a,6 (ix)
	jr	NZ,00105$
00107$:
;../_strrchr.c:39: if (*string == ch)                /* char found ? */
	ld	a,(de)
	sub	a,6 (ix)
	jr	NZ,00109$
;../_strrchr.c:40: return( (char *)string );
	ex	de,hl
	jr	00110$
00109$:
;../_strrchr.c:42: return (NULL) ;
	ld	hl,#0x0000
00110$:
	pop	ix
	ret
_strrchr_end::
	.area _CODE
	.area _CABS
