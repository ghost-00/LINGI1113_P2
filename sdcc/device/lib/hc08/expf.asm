;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module expf
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
	.globl _expf_PARM_1
	.globl _expf
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
_expf_sloc0_1_0:
	.ds 1
_expf_sloc1_1_0:
	.ds 4
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
_expf_PARM_1:
	.ds 4
_expf_n_1_1:
	.ds 2
_expf_xn_1_1:
	.ds 4
_expf_g_1_1:
	.ds 4
_expf_r_1_1:
	.ds 4
_expf_z_1_1:
	.ds 4
_expf_y_1_1:
	.ds 4
_expf_sign_1_1:
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
;Allocation info for local variables in function 'expf'
;------------------------------------------------------------
;sloc0                     Allocated with name '_expf_sloc0_1_0'
;sloc1                     Allocated with name '_expf_sloc1_1_0'
;x                         Allocated with name '_expf_PARM_1'
;n                         Allocated with name '_expf_n_1_1'
;xn                        Allocated with name '_expf_xn_1_1'
;g                         Allocated with name '_expf_g_1_1'
;r                         Allocated with name '_expf_r_1_1'
;z                         Allocated with name '_expf_z_1_1'
;y                         Allocated with name '_expf_y_1_1'
;sign                      Allocated with name '_expf_sign_1_1'
;------------------------------------------------------------
;../expf.c:320: float expf(const float x)
;	-----------------------------------------
;	 function expf
;	-----------------------------------------
_expf:
;../expf.c:326: if(x>=0.0)
	lda	_expf_PARM_1
	sta	___fslt_PARM_1
	lda	(_expf_PARM_1 + 1)
	sta	(___fslt_PARM_1 + 1)
	lda	(_expf_PARM_1 + 2)
	sta	(___fslt_PARM_1 + 2)
	lda	(_expf_PARM_1 + 3)
	sta	(___fslt_PARM_1 + 3)
	clra
	sta	___fslt_PARM_2
	sta	(___fslt_PARM_2 + 1)
	sta	(___fslt_PARM_2 + 2)
	sta	(___fslt_PARM_2 + 3)
	jsr	___fslt
	sta	*_expf_sloc0_1_0
	tst	*_expf_sloc0_1_0
	bne	00102$
00127$:
;../expf.c:327: { y=x;  sign=0; }
	lda	_expf_PARM_1
	sta	_expf_y_1_1
	lda	(_expf_PARM_1 + 1)
	sta	(_expf_y_1_1 + 1)
	lda	(_expf_PARM_1 + 2)
	sta	(_expf_y_1_1 + 2)
	lda	(_expf_PARM_1 + 3)
	sta	(_expf_y_1_1 + 3)
	clra
	sta	_expf_sign_1_1
	bra	00103$
00102$:
;../expf.c:329: { y=-x; sign=1; }
	lda	(_expf_PARM_1 + 3)
	sta	(_expf_y_1_1 + 3)
	lda	(_expf_PARM_1 + 2)
	sta	(_expf_y_1_1 + 2)
	lda	(_expf_PARM_1 + 1)
	sta	(_expf_y_1_1 + 1)
	lda	_expf_PARM_1
	eor	#0x80
	sta	_expf_y_1_1
	lda	#0x01
	sta	_expf_sign_1_1
00103$:
;../expf.c:331: if(y<EXPEPS) return 1.0;
	lda	_expf_y_1_1
	sta	___fslt_PARM_1
	lda	(_expf_y_1_1 + 1)
	sta	(___fslt_PARM_1 + 1)
	lda	(_expf_y_1_1 + 2)
	sta	(___fslt_PARM_1 + 2)
	lda	(_expf_y_1_1 + 3)
	sta	(___fslt_PARM_1 + 3)
	lda	#0x33
	sta	___fslt_PARM_2
	lda	#0xD6
	sta	(___fslt_PARM_2 + 1)
	lda	#0xBF
	sta	(___fslt_PARM_2 + 2)
	lda	#0x95
	sta	(___fslt_PARM_2 + 3)
	jsr	___fslt
	sta	*_expf_sloc0_1_0
	tst	*_expf_sloc0_1_0
	beq	00105$
00128$:
	clr	*__ret3
	clr	*__ret2
	clrx
	clra
	rts
00105$:
;../expf.c:333: if(y>BIGX)
	lda	_expf_y_1_1
	sta	___fsgt_PARM_1
	lda	(_expf_y_1_1 + 1)
	sta	(___fsgt_PARM_1 + 1)
	lda	(_expf_y_1_1 + 2)
	sta	(___fsgt_PARM_1 + 2)
	lda	(_expf_y_1_1 + 3)
	sta	(___fsgt_PARM_1 + 3)
	lda	#0x42
	sta	___fsgt_PARM_2
	lda	#0xB1
	sta	(___fsgt_PARM_2 + 1)
	lda	#0x72
	sta	(___fsgt_PARM_2 + 2)
	lda	#0x18
	sta	(___fsgt_PARM_2 + 3)
	jsr	___fsgt
	sta	*_expf_sloc0_1_0
	tst	*_expf_sloc0_1_0
	beq	00110$
00129$:
;../expf.c:335: if(sign)
	lda	_expf_sign_1_1
	beq	00107$
00130$:
;../expf.c:337: errno=ERANGE;
	clra
	sta	_errno
	lda	#0x22
	sta	(_errno + 1)
;../expf.c:339: ;
	clr	*__ret3
	clr	*__ret2
	ldx	#0xFF
	lda	#0xFF
	rts
00107$:
;../expf.c:343: return 0.0;
	clr	*__ret3
	clr	*__ret2
	clrx
	clra
	rts
00110$:
;../expf.c:347: z=y*K1;
	lda	#0x3F
	sta	___fsmul_PARM_1
	lda	#0xB8
	sta	(___fsmul_PARM_1 + 1)
	lda	#0xAA
	sta	(___fsmul_PARM_1 + 2)
	lda	#0x3B
	sta	(___fsmul_PARM_1 + 3)
	lda	_expf_y_1_1
	sta	___fsmul_PARM_2
	lda	(_expf_y_1_1 + 1)
	sta	(___fsmul_PARM_2 + 1)
	lda	(_expf_y_1_1 + 2)
	sta	(___fsmul_PARM_2 + 2)
	lda	(_expf_y_1_1 + 3)
	sta	(___fsmul_PARM_2 + 3)
	jsr	___fsmul
	sta	(_expf_z_1_1 + 3)
	stx	(_expf_z_1_1 + 2)
	lda	*__ret2
	sta	(_expf_z_1_1 + 1)
	lda	*__ret3
;../expf.c:348: n=z;
	sta	_expf_z_1_1
	sta	___fs2sint_PARM_1
	lda	(_expf_z_1_1 + 1)
	sta	(___fs2sint_PARM_1 + 1)
	lda	(_expf_z_1_1 + 2)
	sta	(___fs2sint_PARM_1 + 2)
	lda	(_expf_z_1_1 + 3)
	sta	(___fs2sint_PARM_1 + 3)
	jsr	___fs2sint
	sta	(_expf_n_1_1 + 1)
	stx	_expf_n_1_1
;../expf.c:350: if(n<0) --n;
	lda	_expf_n_1_1
	sub	#0x00
	bge	00112$
00131$:
	lda	(_expf_n_1_1 + 1)
	sub	#0x01
	sta	(_expf_n_1_1 + 1)
	lda	_expf_n_1_1
	sbc	#0x00
	sta	_expf_n_1_1
00112$:
;../expf.c:351: if(z-n>=0.5) ++n;
	ldx	_expf_n_1_1
	lda	(_expf_n_1_1 + 1)
	jsr	___sint2fs
	sta	(___fssub_PARM_2 + 3)
	stx	(___fssub_PARM_2 + 2)
	lda	*__ret2
	sta	(___fssub_PARM_2 + 1)
	lda	*__ret3
	sta	___fssub_PARM_2
	lda	_expf_z_1_1
	sta	___fssub_PARM_1
	lda	(_expf_z_1_1 + 1)
	sta	(___fssub_PARM_1 + 1)
	lda	(_expf_z_1_1 + 2)
	sta	(___fssub_PARM_1 + 2)
	lda	(_expf_z_1_1 + 3)
	sta	(___fssub_PARM_1 + 3)
	jsr	___fssub
	sta	(___fslt_PARM_1 + 3)
	stx	(___fslt_PARM_1 + 2)
	lda	*__ret2
	sta	(___fslt_PARM_1 + 1)
	lda	*__ret3
	sta	___fslt_PARM_1
	lda	#0x3F
	sta	___fslt_PARM_2
	clra
	sta	(___fslt_PARM_2 + 1)
	sta	(___fslt_PARM_2 + 2)
	sta	(___fslt_PARM_2 + 3)
	jsr	___fslt
	sta	*_expf_sloc0_1_0
	tst	*_expf_sloc0_1_0
	bne	00114$
00132$:
	lda	(_expf_n_1_1 + 1)
	inca
	sta	(_expf_n_1_1 + 1)
	bne	00133$
	lda	_expf_n_1_1
	inca
	sta	_expf_n_1_1
00133$:
00114$:
;../expf.c:352: xn=n;
	ldx	_expf_n_1_1
	lda	(_expf_n_1_1 + 1)
	jsr	___sint2fs
	sta	(_expf_xn_1_1 + 3)
	stx	(_expf_xn_1_1 + 2)
	lda	*__ret2
	sta	(_expf_xn_1_1 + 1)
	lda	*__ret3
	sta	_expf_xn_1_1
;../expf.c:353: g=((y-xn*C1))-xn*C2;
	lda	#0x3F
	sta	___fsmul_PARM_1
	lda	#0x31
	sta	(___fsmul_PARM_1 + 1)
	lda	#0x80
	sta	(___fsmul_PARM_1 + 2)
	clra
	sta	(___fsmul_PARM_1 + 3)
	lda	_expf_xn_1_1
	sta	___fsmul_PARM_2
	lda	(_expf_xn_1_1 + 1)
	sta	(___fsmul_PARM_2 + 1)
	lda	(_expf_xn_1_1 + 2)
	sta	(___fsmul_PARM_2 + 2)
	lda	(_expf_xn_1_1 + 3)
	sta	(___fsmul_PARM_2 + 3)
	jsr	___fsmul
	sta	(___fssub_PARM_2 + 3)
	stx	(___fssub_PARM_2 + 2)
	lda	*__ret2
	sta	(___fssub_PARM_2 + 1)
	lda	*__ret3
	sta	___fssub_PARM_2
	lda	_expf_y_1_1
	sta	___fssub_PARM_1
	lda	(_expf_y_1_1 + 1)
	sta	(___fssub_PARM_1 + 1)
	lda	(_expf_y_1_1 + 2)
	sta	(___fssub_PARM_1 + 2)
	lda	(_expf_y_1_1 + 3)
	sta	(___fssub_PARM_1 + 3)
	jsr	___fssub
	sta	(___fssub_PARM_1 + 3)
	stx	(___fssub_PARM_1 + 2)
	lda	*__ret2
	sta	(___fssub_PARM_1 + 1)
	lda	*__ret3
	sta	___fssub_PARM_1
	lda	#0xB9
	sta	___fsmul_PARM_1
	lda	#0x5E
	sta	(___fsmul_PARM_1 + 1)
	lda	#0x80
	sta	(___fsmul_PARM_1 + 2)
	lda	#0x83
	sta	(___fsmul_PARM_1 + 3)
	lda	_expf_xn_1_1
	sta	___fsmul_PARM_2
	lda	(_expf_xn_1_1 + 1)
	sta	(___fsmul_PARM_2 + 1)
	lda	(_expf_xn_1_1 + 2)
	sta	(___fsmul_PARM_2 + 2)
	lda	(_expf_xn_1_1 + 3)
	sta	(___fsmul_PARM_2 + 3)
	jsr	___fsmul
	sta	(___fssub_PARM_2 + 3)
	stx	(___fssub_PARM_2 + 2)
	lda	*__ret2
	sta	(___fssub_PARM_2 + 1)
	lda	*__ret3
	sta	___fssub_PARM_2
	jsr	___fssub
	sta	(_expf_g_1_1 + 3)
	stx	(_expf_g_1_1 + 2)
	lda	*__ret2
	sta	(_expf_g_1_1 + 1)
	lda	*__ret3
;../expf.c:354: z=g*g;
	sta	_expf_g_1_1
	sta	___fsmul_PARM_1
	lda	(_expf_g_1_1 + 1)
	sta	(___fsmul_PARM_1 + 1)
	lda	(_expf_g_1_1 + 2)
	sta	(___fsmul_PARM_1 + 2)
	lda	(_expf_g_1_1 + 3)
	sta	(___fsmul_PARM_1 + 3)
	lda	_expf_g_1_1
	sta	___fsmul_PARM_2
	lda	(_expf_g_1_1 + 1)
	sta	(___fsmul_PARM_2 + 1)
	lda	(_expf_g_1_1 + 2)
	sta	(___fsmul_PARM_2 + 2)
	lda	(_expf_g_1_1 + 3)
	sta	(___fsmul_PARM_2 + 3)
	jsr	___fsmul
	sta	(_expf_z_1_1 + 3)
	stx	(_expf_z_1_1 + 2)
	lda	*__ret2
	sta	(_expf_z_1_1 + 1)
	lda	*__ret3
	sta	_expf_z_1_1
;../expf.c:355: r=P(z)*g;
	lda	#0x3B
	sta	___fsmul_PARM_1
	lda	#0x88
	sta	(___fsmul_PARM_1 + 1)
	lda	#0x53
	sta	(___fsmul_PARM_1 + 2)
	lda	#0x08
	sta	(___fsmul_PARM_1 + 3)
	lda	_expf_z_1_1
	sta	___fsmul_PARM_2
	lda	(_expf_z_1_1 + 1)
	sta	(___fsmul_PARM_2 + 1)
	lda	(_expf_z_1_1 + 2)
	sta	(___fsmul_PARM_2 + 2)
	lda	(_expf_z_1_1 + 3)
	sta	(___fsmul_PARM_2 + 3)
	jsr	___fsmul
	sta	(___fsadd_PARM_1 + 3)
	stx	(___fsadd_PARM_1 + 2)
	lda	*__ret2
	sta	(___fsadd_PARM_1 + 1)
	lda	*__ret3
	sta	___fsadd_PARM_1
	lda	#0x3E
	sta	___fsadd_PARM_2
	lda	#0x80
	sta	(___fsadd_PARM_2 + 1)
	clra
	sta	(___fsadd_PARM_2 + 2)
	sta	(___fsadd_PARM_2 + 3)
	jsr	___fsadd
	sta	(___fsmul_PARM_1 + 3)
	stx	(___fsmul_PARM_1 + 2)
	lda	*__ret2
	sta	(___fsmul_PARM_1 + 1)
	lda	*__ret3
	sta	___fsmul_PARM_1
	lda	_expf_g_1_1
	sta	___fsmul_PARM_2
	lda	(_expf_g_1_1 + 1)
	sta	(___fsmul_PARM_2 + 1)
	lda	(_expf_g_1_1 + 2)
	sta	(___fsmul_PARM_2 + 2)
	lda	(_expf_g_1_1 + 3)
	sta	(___fsmul_PARM_2 + 3)
	jsr	___fsmul
	sta	(_expf_r_1_1 + 3)
	stx	(_expf_r_1_1 + 2)
	lda	*__ret2
	sta	(_expf_r_1_1 + 1)
	lda	*__ret3
	sta	_expf_r_1_1
;../expf.c:356: r=0.5+(r/(Q(z)-r));
	lda	#0x3D
	sta	___fsmul_PARM_1
	lda	#0x4C
	sta	(___fsmul_PARM_1 + 1)
	lda	#0xBF
	sta	(___fsmul_PARM_1 + 2)
	lda	#0x5B
	sta	(___fsmul_PARM_1 + 3)
	lda	_expf_z_1_1
	sta	___fsmul_PARM_2
	lda	(_expf_z_1_1 + 1)
	sta	(___fsmul_PARM_2 + 1)
	lda	(_expf_z_1_1 + 2)
	sta	(___fsmul_PARM_2 + 2)
	lda	(_expf_z_1_1 + 3)
	sta	(___fsmul_PARM_2 + 3)
	jsr	___fsmul
	sta	(___fsadd_PARM_1 + 3)
	stx	(___fsadd_PARM_1 + 2)
	lda	*__ret2
	sta	(___fsadd_PARM_1 + 1)
	lda	*__ret3
	sta	___fsadd_PARM_1
	lda	#0x3F
	sta	___fsadd_PARM_2
	clra
	sta	(___fsadd_PARM_2 + 1)
	sta	(___fsadd_PARM_2 + 2)
	sta	(___fsadd_PARM_2 + 3)
	jsr	___fsadd
	sta	(___fssub_PARM_1 + 3)
	stx	(___fssub_PARM_1 + 2)
	lda	*__ret2
	sta	(___fssub_PARM_1 + 1)
	lda	*__ret3
	sta	___fssub_PARM_1
	lda	_expf_r_1_1
	sta	___fssub_PARM_2
	lda	(_expf_r_1_1 + 1)
	sta	(___fssub_PARM_2 + 1)
	lda	(_expf_r_1_1 + 2)
	sta	(___fssub_PARM_2 + 2)
	lda	(_expf_r_1_1 + 3)
	sta	(___fssub_PARM_2 + 3)
	jsr	___fssub
	sta	(___fsdiv_PARM_2 + 3)
	stx	(___fsdiv_PARM_2 + 2)
	lda	*__ret2
	sta	(___fsdiv_PARM_2 + 1)
	lda	*__ret3
	sta	___fsdiv_PARM_2
	lda	_expf_r_1_1
	sta	___fsdiv_PARM_1
	lda	(_expf_r_1_1 + 1)
	sta	(___fsdiv_PARM_1 + 1)
	lda	(_expf_r_1_1 + 2)
	sta	(___fsdiv_PARM_1 + 2)
	lda	(_expf_r_1_1 + 3)
	sta	(___fsdiv_PARM_1 + 3)
	jsr	___fsdiv
	sta	(___fsadd_PARM_1 + 3)
	stx	(___fsadd_PARM_1 + 2)
	lda	*__ret2
	sta	(___fsadd_PARM_1 + 1)
	lda	*__ret3
	sta	___fsadd_PARM_1
	lda	#0x3F
	sta	___fsadd_PARM_2
	clra
	sta	(___fsadd_PARM_2 + 1)
	sta	(___fsadd_PARM_2 + 2)
	sta	(___fsadd_PARM_2 + 3)
	jsr	___fsadd
	sta	(_ldexpf_PARM_1 + 3)
	stx	(_ldexpf_PARM_1 + 2)
	lda	*__ret2
	sta	(_ldexpf_PARM_1 + 1)
	lda	*__ret3
	sta	_ldexpf_PARM_1
;../expf.c:358: n++;
	lda	(_expf_n_1_1 + 1)
	add	#0x01
	sta	(_ldexpf_PARM_2 + 1)
	lda	_expf_n_1_1
	adc	#0x00
	sta	_ldexpf_PARM_2
;../expf.c:359: z=ldexpf(r, n);
	jsr	_ldexpf
	sta	(_expf_z_1_1 + 3)
	stx	(_expf_z_1_1 + 2)
	lda	*__ret2
	sta	(_expf_z_1_1 + 1)
	lda	*__ret3
	sta	_expf_z_1_1
;../expf.c:360: if(sign)
	lda	_expf_sign_1_1
	beq	00116$
00134$:
;../expf.c:361: return 1.0/z;
	lda	#0x3F
	sta	___fsdiv_PARM_1
	lda	#0x80
	sta	(___fsdiv_PARM_1 + 1)
	clra
	sta	(___fsdiv_PARM_1 + 2)
	sta	(___fsdiv_PARM_1 + 3)
	lda	_expf_z_1_1
	sta	___fsdiv_PARM_2
	lda	(_expf_z_1_1 + 1)
	sta	(___fsdiv_PARM_2 + 1)
	lda	(_expf_z_1_1 + 2)
	sta	(___fsdiv_PARM_2 + 2)
	lda	(_expf_z_1_1 + 3)
	sta	(___fsdiv_PARM_2 + 3)
	jsr	___fsdiv
	sta	*(_expf_sloc1_1_0 + 3)
	stx	*(_expf_sloc1_1_0 + 2)
	mov	*__ret2,*(_expf_sloc1_1_0 + 1)
	mov	*__ret3,*_expf_sloc1_1_0
	mov	*_expf_sloc1_1_0,*__ret3
	mov	*(_expf_sloc1_1_0 + 1),*__ret2
	ldx	*(_expf_sloc1_1_0 + 2)
	lda	*(_expf_sloc1_1_0 + 3)
	rts
00116$:
;../expf.c:363: return z;
	lda	_expf_z_1_1
	sta	*__ret3
	lda	(_expf_z_1_1 + 1)
	sta	*__ret2
	ldx	(_expf_z_1_1 + 2)
	lda	(_expf_z_1_1 + 3)
00118$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
