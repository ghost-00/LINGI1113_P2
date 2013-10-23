;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:12 2013
;--------------------------------------------------------
	.module _isspace
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isspace
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
;../_isspace.c:29: char isspace (unsigned char c)
;	---------------------------------
; Function isspace
; ---------------------------------
_isspace_start::
_isspace:
	
;../_isspace.c:31: if ( c == UC(' ')  ||
	lda	hl,2(sp)
	ld	a,(hl)
	sub	a,#0x20
	jp	Z,00101$
00115$:
;../_isspace.c:32: c == UC('\f') ||
	ld	a,(hl)
	sub	a,#0x0C
	jp	Z,00101$
00116$:
;../_isspace.c:33: c == UC('\n') ||
	ld	a,(hl)
	sub	a,#0x0A
	jp	Z,00101$
00117$:
;../_isspace.c:34: c == UC('\r') ||
	ld	a,(hl)
	sub	a,#0x0D
	jp	Z,00101$
00118$:
;../_isspace.c:35: c == UC('\t') ||
	ld	a,(hl)
	sub	a,#0x09
	jp	Z,00101$
00119$:
;../_isspace.c:36: c == UC('\v') )
	ld	a,(hl)
	sub	a,#0x0B
	jp	NZ,00102$
	jr	00121$
00120$:
	jp	00102$
00121$:
00101$:
;../_isspace.c:37: return 1;
	ld	e,#0x01
	jp	00108$
00102$:
;../_isspace.c:38: return 0;
	ld	e,#0x00
00108$:
	
	ret
_isspace_end::
	.area _CODE
	.area _CABS
