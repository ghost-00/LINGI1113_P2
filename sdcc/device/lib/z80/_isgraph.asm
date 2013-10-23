;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:08 2013
;--------------------------------------------------------
	.module _isgraph
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isgraph
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
;../_isgraph.c:27: char isgraph (unsigned char c)
;	---------------------------------
; Function isgraph
; ---------------------------------
_isgraph_start::
_isgraph:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_isgraph.c:29: if ( c >= 0x21 && c <= 0x7e )
	ld	a,4 (ix)
	sub	a,#0x21
	jr	C,00102$
	ld	a,#0x7E
	sub	a,4 (ix)
	jr	C,00102$
;../_isgraph.c:30: return 1;
	ld	l,#0x01
	jr	00104$
00102$:
;../_isgraph.c:31: return 0;
	ld	l,#0x00
00104$:
	pop	ix
	ret
_isgraph_end::
	.area _CODE
	.area _CABS
