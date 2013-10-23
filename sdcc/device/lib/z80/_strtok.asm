;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:09 2013
;--------------------------------------------------------
	.module _strtok
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strtok
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_strtok_s_1_1:
	.ds 2
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
;../_strtok.c:31: char * strtok (
;	---------------------------------
; Function strtok
; ---------------------------------
_strtok_start::
_strtok:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_strtok.c:38: if ( str )
	ld	a,4 (ix)
	or	a,5 (ix)
	jr	Z,00102$
;../_strtok.c:39: s = str ;
	ld	a,4 (ix)
	ld	iy,#_strtok_s_1_1
	ld	0 (iy),a
	ld	a,5 (ix)
	ld	1 (iy),a
00102$:
;../_strtok.c:40: if ( !s )
	ld	iy,#_strtok_s_1_1
	ld	a,0 (iy)
	or	a,1 (iy)
	jr	NZ,00108$
;../_strtok.c:41: return NULL;
	ld	hl,#0x0000
	jp	00119$
;../_strtok.c:43: while (*s) {
00108$:
	ld	hl,(_strtok_s_1_1)
	ld	a,(hl)
	or	a,a
	jr	Z,00110$
;../_strtok.c:44: if (strchr(control,*s))
	ld	hl,(_strtok_s_1_1)
	ld	a,(hl)
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_strchr
	pop	af
	inc	sp
	ld	a,l
	or	a,h
	jr	Z,00110$
;../_strtok.c:45: s++;
	ld	iy,#_strtok_s_1_1
	inc	0 (iy)
	jr	NZ,00108$
	inc	1 (iy)
	jr	00108$
;../_strtok.c:47: break;
00110$:
;../_strtok.c:50: s1 = s ;
	ld	bc,(_strtok_s_1_1)
;../_strtok.c:52: while (*s) {
00113$:
	ld	hl,(_strtok_s_1_1)
	ld	a,(hl)
	or	a,a
	jr	Z,00115$
;../_strtok.c:53: if (strchr(control,*s)) {
	ld	hl,(_strtok_s_1_1)
	ld	l,(hl)
	push	bc
	ld	a,l
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_strchr
	pop	af
	inc	sp
	pop	bc
	ld	a,l
	or	a,h
	jr	Z,00112$
;../_strtok.c:54: *s++ = '\0';
	ld	hl,(_strtok_s_1_1)
	ld	(hl),#0x00
	ld	iy,#_strtok_s_1_1
	inc	0 (iy)
	jr	NZ,00131$
	inc	1 (iy)
00131$:
;../_strtok.c:55: return s1 ;
	ld	l,c
	ld	h,b
	jr	00119$
00112$:
;../_strtok.c:57: s++ ;
	ld	iy,#_strtok_s_1_1
	inc	0 (iy)
	jr	NZ,00113$
	inc	1 (iy)
	jr	00113$
00115$:
;../_strtok.c:60: s = NULL;
	ld	iy,#_strtok_s_1_1
	ld	0 (iy),#0x00
	ld	1 (iy),#0x00
;../_strtok.c:62: if (*s1)
	ld	a,(bc)
	or	a,a
	jr	Z,00117$
;../_strtok.c:63: return s1;
	ld	l,c
	ld	h,b
	jr	00119$
00117$:
;../_strtok.c:65: return NULL;
	ld	hl,#0x0000
00119$:
	pop	ix
	ret
_strtok_end::
	.area _CODE
	.area _CABS