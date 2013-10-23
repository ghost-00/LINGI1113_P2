;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:12 2013
;--------------------------------------------------------
	.module _isxdigit
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isxdigit
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
;../_isxdigit.c:28: char isxdigit (unsigned char c)
;	---------------------------------
; Function isxdigit
; ---------------------------------
_isxdigit_start::
_isxdigit:
	
;../_isxdigit.c:30: if ( ( c >= UC('0') && c <= UC('9')) ||
	lda	hl,2(sp)
	ld	a,(hl)
	sub	a,#0x30
	jp	C,00105$
	ld	a,#0x39
	sub	a,(hl)
	jp	NC,00101$
00105$:
;../_isxdigit.c:31: ( c >= UC('a') && c <= UC('f')) ||
	lda	hl,2(sp)
	ld	a,(hl)
	sub	a,#0x61
	jp	C,00107$
	ld	a,#0x66
	sub	a,(hl)
	jp	NC,00101$
00107$:
;../_isxdigit.c:32: ( c >= UC('A') && c <= UC('F')) )
	lda	hl,2(sp)
	ld	a,(hl)
	sub	a,#0x41
	jp	C,00102$
	ld	a,#0x46
	sub	a,(hl)
	jp	C,00102$
00101$:
;../_isxdigit.c:33: return 1;
	ld	e,#0x01
	jp	00108$
00102$:
;../_isxdigit.c:34: return 0;
	ld	e,#0x00
00108$:
	
	ret
_isxdigit_end::
	.area _CODE
	.area _CABS
