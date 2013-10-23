;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:31 2013
;--------------------------------------------------------
	.module _gptrgetc
	.optsdcc -mds390 --model-flat24
	
;--------------------------------------------------------
; CPU specific extensions
;--------------------------------------------------------
.flat24 on		; 24 bit flat addressing
dpl1	=	0x84
dph1	=	0x85
dps	=	0x86
dpx	=	0x93
dpx1	=	0x95
esp	=	0x9B
ap	=	0x9C
_ap	=	0x9C
mcnt0	=	0xD1
mcnt1	=	0xD2
ma	=	0xD3
mb	=	0xD4
mc	=	0xD5
F1	=	0xD1	; user flag
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __gptrgetc
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function '_gptrgetc'
;------------------------------------------------------------
;gptr                      Allocated to registers 
;------------------------------------------------------------
;	_gptrgetc.c:33: _gptrgetc (char *gptr) __naked
;	-----------------------------------------
;	 function _gptrgetc
;	-----------------------------------------
__gptrgetc:
;	naked function: no prologue.
;	_gptrgetc.c:78: __endasm;
	
    ; save values passed
    ;
    ; depending on the pointer type acc. to SDCCsymt.h
    ;
	     jb _B_7,codeptr$ ; >0x80 code ; 3
	     jnb _B_6,xdataptr$ ; <0x40 far ; 3
	
	        mov dph,r0 ; save r0 independant of regbank ; 2
	        mov r0,dpl ; use only low order address ; 2
	
	     jb _B_5,pdataptr$ ; >0x60 pdata ; 3
    ;
    ; Pointer to data space
    ;
	        mov a,@r0 ; 1
	        mov r0,dph ; restore r0 ; 2
	        mov dph,#0 ; restore dph ; 2
	        ret ; 1
    ;
    ; pointer to external stack or pdata
    ;
	 pdataptr$:
	        movx a,@r0 ; 1
	        mov r0,dph ; restore r0 ; 2
	        mov dph,#0 ; restore dph ; 2
	        ret ; 1
;
; pointer to xternal data
; pointer to code area
;
	 codeptr$:
	 xdataptr$:
	        clr a ; 1
	        movc a,@a+dptr ; 1
	        ret ; 1
                    ;===
                    ;28 bytes
	     
00101$:
;	naked function: no epilogue.
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
