;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _isspace
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isspace
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
;../_isspace.c:29: char isspace (unsigned char c)
;	---------------------------------
; Function isspace
; ---------------------------------
_isspace_start::
_isspace:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_isspace.c:31: if ( c == UC(' ')  ||
	ld	a,4 (ix)
	sub	a,#0x20
	jr	Z,00101$
;../_isspace.c:32: c == UC('\f') ||
	ld	a,4 (ix)
	sub	a,#0x0C
	jr	Z,00101$
;../_isspace.c:33: c == UC('\n') ||
	ld	a,4 (ix)
	sub	a,#0x0A
	jr	Z,00101$
;../_isspace.c:34: c == UC('\r') ||
	ld	a,4 (ix)
	sub	a,#0x0D
	jr	Z,00101$
;../_isspace.c:35: c == UC('\t') ||
	ld	a,4 (ix)
	sub	a,#0x09
	jr	Z,00101$
;../_isspace.c:36: c == UC('\v') )
	ld	a,4 (ix)
	sub	a,#0x0B
	jr	NZ,00102$
00101$:
;../_isspace.c:37: return 1;
	ld	l,#0x01
	jr	00108$
00102$:
;../_isspace.c:38: return 0;
	ld	l,#0x00
00108$:
	pop	ix
	ret
_isspace_end::
	.area _CODE
	.area _CABS
