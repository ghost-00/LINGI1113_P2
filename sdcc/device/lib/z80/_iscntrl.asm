;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:08 2013
;--------------------------------------------------------
	.module _iscntrl
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _iscntrl
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
;../_iscntrl.c:27: char iscntrl (unsigned char c)
;	---------------------------------
; Function iscntrl
; ---------------------------------
_iscntrl_start::
_iscntrl:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_iscntrl.c:29: if  ( c <= 0x1F || c == 0x7f )
	ld	a,#0x1F
	sub	a,4 (ix)
	jr	NC,00101$
	ld	a,4 (ix)
	sub	a,#0x7F
	jr	NZ,00102$
00101$:
;../_iscntrl.c:30: return 1;
	ld	l,#0x01
	jr	00104$
00102$:
;../_iscntrl.c:31: return 0;
	ld	l,#0x00
00104$:
	pop	ix
	ret
_iscntrl_end::
	.area _CODE
	.area _CABS