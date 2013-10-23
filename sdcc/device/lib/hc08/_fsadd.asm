;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:25:37 2013
;--------------------------------------------------------
	.module _fsadd
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
	.globl ___fsadd_PARM_2
	.globl ___fsadd_PARM_1
	.globl ___fsadd
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area DSEG
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area	OSEG    (OVR)
___fsadd_sloc0_1_0::
	.ds 4
___fsadd_sloc1_1_0::
	.ds 4
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
___fsadd_PARM_1:
	.ds 4
___fsadd_PARM_2:
	.ds 4
___fsadd_mant1_1_1:
	.ds 4
___fsadd_mant2_1_1:
	.ds 4
___fsadd_exp1_1_1:
	.ds 2
___fsadd_exp2_1_1:
	.ds 2
___fsadd_expd_1_1:
	.ds 2
___fsadd_sign_1_1:
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
;Allocation info for local variables in function '__fsadd'
;------------------------------------------------------------
;a1                        Allocated with name '___fsadd_PARM_1'
;a2                        Allocated with name '___fsadd_PARM_2'
;mant1                     Allocated with name '___fsadd_mant1_1_1'
;mant2                     Allocated with name '___fsadd_mant2_1_1'
;pfl1                      Allocated to registers 
;pfl2                      Allocated to registers 
;exp1                      Allocated with name '___fsadd_exp1_1_1'
;exp2                      Allocated with name '___fsadd_exp2_1_1'
;expd                      Allocated with name '___fsadd_expd_1_1'
;sign                      Allocated with name '___fsadd_sign_1_1'
;sloc0                     Allocated with name '___fsadd_sloc0_1_0'
;sloc1                     Allocated with name '___fsadd_sloc1_1_0'
;------------------------------------------------------------
;../_fsadd.c:161: float __fsadd (float a1, float a2)
;	-----------------------------------------
;	 function __fsadd
;	-----------------------------------------
___fsadd:
;../_fsadd.c:169: pfl2 = (long _AUTOMEM *)&a2;
;../_fsadd.c:170: exp2 = EXP (*pfl2);
	lda	___fsadd_PARM_2
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_2 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_2 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_2 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	lda	*(___fsadd_sloc0_1_0 + 1)
	ldx	*___fsadd_sloc0_1_0
	lsla
	txa
	rola
	clrx
	rolx
	sta	*(___fsadd_sloc0_1_0 + 3)
	stx	*(___fsadd_sloc0_1_0 + 2)
	clr	*(___fsadd_sloc0_1_0 + 1)
	clr	*___fsadd_sloc0_1_0
	clr	*(___fsadd_sloc0_1_0 + 2)
	clr	*(___fsadd_sloc0_1_0 + 1)
	clr	*___fsadd_sloc0_1_0
	lda	*(___fsadd_sloc0_1_0 + 3)
	sta	(___fsadd_exp2_1_1 + 1)
	lda	*(___fsadd_sloc0_1_0 + 2)
	sta	___fsadd_exp2_1_1
;../_fsadd.c:171: mant2 = MANT (*pfl2) << 4;
	lda	___fsadd_PARM_2
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_2 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_2 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_2 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	lda	*(___fsadd_sloc0_1_0 + 1)
	and	#0x7F
	sta	*(___fsadd_sloc0_1_0 + 1)
	clr	*___fsadd_sloc0_1_0
	bset	#7,*(___fsadd_sloc0_1_0 + 1)
	lda	*(___fsadd_sloc0_1_0 + 1)
	ldx	*___fsadd_sloc0_1_0
	lsla
	rolx
	lsla
	rolx
	lsla
	rolx
	lsla
	rolx
	sta	(___fsadd_mant2_1_1 + 1)
	stx	___fsadd_mant2_1_1
	lda	*(___fsadd_sloc0_1_0 + 2)
	nsa	
	and	#0x0f
	ora	(___fsadd_mant2_1_1 + 1)
	sta	(___fsadd_mant2_1_1 + 1)
	lda	*(___fsadd_sloc0_1_0 + 3)
	ldx	*(___fsadd_sloc0_1_0 + 2)
	lsla
	rolx
	lsla
	rolx
	lsla
	rolx
	lsla
	rolx
	sta	(___fsadd_mant2_1_1 + 3)
	stx	(___fsadd_mant2_1_1 + 2)
;../_fsadd.c:172: if (SIGN (*pfl2))
	lda	___fsadd_PARM_2
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_2 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_2 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_2 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	lda	*___fsadd_sloc0_1_0
	rola
	clra
	rola
	tsta
	beq	00102$
00164$:
;../_fsadd.c:173: mant2 = -mant2;
	clra
	sub	(___fsadd_mant2_1_1 + 3)
	sta	(___fsadd_mant2_1_1 + 3)
	clra
	sbc	(___fsadd_mant2_1_1 + 2)
	sta	(___fsadd_mant2_1_1 + 2)
	clra
	sbc	(___fsadd_mant2_1_1 + 1)
	sta	(___fsadd_mant2_1_1 + 1)
	clra
	sbc	___fsadd_mant2_1_1
	sta	___fsadd_mant2_1_1
00102$:
;../_fsadd.c:175: if (!*pfl2)
	lda	___fsadd_PARM_2
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_2 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_2 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_2 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	ora	*(___fsadd_sloc0_1_0 + 2)
	ora	*(___fsadd_sloc0_1_0 + 1)
	ora	*___fsadd_sloc0_1_0
	bne	00104$
00165$:
;../_fsadd.c:176: return (a1);
	lda	___fsadd_PARM_1
	sta	*__ret3
	lda	(___fsadd_PARM_1 + 1)
	sta	*__ret2
	ldx	(___fsadd_PARM_1 + 2)
	lda	(___fsadd_PARM_1 + 3)
	rts
00104$:
;../_fsadd.c:178: pfl1 = (long _AUTOMEM *)&a1;
;../_fsadd.c:179: exp1 = EXP (*pfl1);
	lda	___fsadd_PARM_1
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_1 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_1 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_1 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	lda	*(___fsadd_sloc0_1_0 + 1)
	ldx	*___fsadd_sloc0_1_0
	lsla
	txa
	rola
	clrx
	rolx
	sta	*(___fsadd_sloc0_1_0 + 3)
	stx	*(___fsadd_sloc0_1_0 + 2)
	clr	*(___fsadd_sloc0_1_0 + 1)
	clr	*___fsadd_sloc0_1_0
	clr	*(___fsadd_sloc0_1_0 + 2)
	clr	*(___fsadd_sloc0_1_0 + 1)
	clr	*___fsadd_sloc0_1_0
	lda	*(___fsadd_sloc0_1_0 + 3)
	sta	(___fsadd_exp1_1_1 + 1)
	lda	*(___fsadd_sloc0_1_0 + 2)
	sta	___fsadd_exp1_1_1
;../_fsadd.c:180: mant1 = MANT (*pfl1) << 4;
	lda	___fsadd_PARM_1
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_1 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_1 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_1 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	lda	*(___fsadd_sloc0_1_0 + 1)
	and	#0x7F
	sta	*(___fsadd_sloc0_1_0 + 1)
	clr	*___fsadd_sloc0_1_0
	bset	#7,*(___fsadd_sloc0_1_0 + 1)
	lda	*(___fsadd_sloc0_1_0 + 1)
	ldx	*___fsadd_sloc0_1_0
	lsla
	rolx
	lsla
	rolx
	lsla
	rolx
	lsla
	rolx
	sta	(___fsadd_mant1_1_1 + 1)
	stx	___fsadd_mant1_1_1
	lda	*(___fsadd_sloc0_1_0 + 2)
	nsa	
	and	#0x0f
	ora	(___fsadd_mant1_1_1 + 1)
	sta	(___fsadd_mant1_1_1 + 1)
	lda	*(___fsadd_sloc0_1_0 + 3)
	ldx	*(___fsadd_sloc0_1_0 + 2)
	lsla
	rolx
	lsla
	rolx
	lsla
	rolx
	lsla
	rolx
	sta	(___fsadd_mant1_1_1 + 3)
	stx	(___fsadd_mant1_1_1 + 2)
;../_fsadd.c:181: if (SIGN(*pfl1))
	lda	___fsadd_PARM_1
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_1 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_1 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_1 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	lda	*___fsadd_sloc0_1_0
	rola
	clra
	rola
	tsta
	beq	00108$
00166$:
;../_fsadd.c:182: if (*pfl1 & 0x80000000)
	lda	___fsadd_PARM_1
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_1 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_1 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_1 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	lda	*___fsadd_sloc0_1_0
	and	#0x80
	beq	00108$
00167$:
;../_fsadd.c:183: mant1 = -mant1;
	clra
	sub	(___fsadd_mant1_1_1 + 3)
	sta	(___fsadd_mant1_1_1 + 3)
	clra
	sbc	(___fsadd_mant1_1_1 + 2)
	sta	(___fsadd_mant1_1_1 + 2)
	clra
	sbc	(___fsadd_mant1_1_1 + 1)
	sta	(___fsadd_mant1_1_1 + 1)
	clra
	sbc	___fsadd_mant1_1_1
	sta	___fsadd_mant1_1_1
00108$:
;../_fsadd.c:185: if (!*pfl1)
	lda	___fsadd_PARM_1
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_PARM_1 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	(___fsadd_PARM_1 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_PARM_1 + 3)
	sta	*(___fsadd_sloc0_1_0 + 3)
	ora	*(___fsadd_sloc0_1_0 + 2)
	ora	*(___fsadd_sloc0_1_0 + 1)
	ora	*___fsadd_sloc0_1_0
	bne	00110$
00168$:
;../_fsadd.c:186: return (a2);
	lda	___fsadd_PARM_2
	sta	*__ret3
	lda	(___fsadd_PARM_2 + 1)
	sta	*__ret2
	ldx	(___fsadd_PARM_2 + 2)
	lda	(___fsadd_PARM_2 + 3)
	rts
00110$:
;../_fsadd.c:188: expd = exp1 - exp2;
	lda	(___fsadd_exp1_1_1 + 1)
	sub	(___fsadd_exp2_1_1 + 1)
	sta	(___fsadd_expd_1_1 + 1)
	lda	___fsadd_exp1_1_1
	sbc	___fsadd_exp2_1_1
	sta	___fsadd_expd_1_1
;../_fsadd.c:189: if (expd > 25)
	lda	#0x19
	sub	(___fsadd_expd_1_1 + 1)
	clra
	sbc	___fsadd_expd_1_1
	bge	00112$
00169$:
;../_fsadd.c:190: return (a1);
	lda	___fsadd_PARM_1
	sta	*__ret3
	lda	(___fsadd_PARM_1 + 1)
	sta	*__ret2
	ldx	(___fsadd_PARM_1 + 2)
	lda	(___fsadd_PARM_1 + 3)
	rts
00112$:
;../_fsadd.c:191: if (expd < -25)
	lda	(___fsadd_expd_1_1 + 1)
	sub	#0xE7
	lda	___fsadd_expd_1_1
	sbc	#0xFF
	bge	00114$
00170$:
;../_fsadd.c:192: return (a2);
	lda	___fsadd_PARM_2
	sta	*__ret3
	lda	(___fsadd_PARM_2 + 1)
	sta	*__ret2
	ldx	(___fsadd_PARM_2 + 2)
	lda	(___fsadd_PARM_2 + 3)
	rts
00114$:
;../_fsadd.c:194: if (expd < 0)
	lda	___fsadd_expd_1_1
	sub	#0x00
	bge	00116$
00171$:
;../_fsadd.c:196: expd = -expd;
	clra
	sub	(___fsadd_expd_1_1 + 1)
	sta	(___fsadd_expd_1_1 + 1)
	clra
	sbc	___fsadd_expd_1_1
	sta	___fsadd_expd_1_1
;../_fsadd.c:197: exp1 += expd;
	lda	(___fsadd_exp1_1_1 + 1)
	add	(___fsadd_expd_1_1 + 1)
	sta	(___fsadd_exp1_1_1 + 1)
	lda	___fsadd_exp1_1_1
	adc	___fsadd_expd_1_1
	sta	___fsadd_exp1_1_1
;../_fsadd.c:198: mant1 >>= expd;
	ldx	(___fsadd_expd_1_1 + 1)
	beq	00173$
00172$:
	lda	___fsadd_mant1_1_1
	asra
	sta	___fsadd_mant1_1_1
	lda	(___fsadd_mant1_1_1 + 1)
	rora
	sta	(___fsadd_mant1_1_1 + 1)
	lda	(___fsadd_mant1_1_1 + 2)
	rora
	sta	(___fsadd_mant1_1_1 + 2)
	lda	(___fsadd_mant1_1_1 + 3)
	rora
	sta	(___fsadd_mant1_1_1 + 3)
	decx
	bne	00172$
00173$:
	bra	00117$
00116$:
;../_fsadd.c:202: mant2 >>= expd;
	ldx	(___fsadd_expd_1_1 + 1)
	beq	00175$
00174$:
	lda	___fsadd_mant2_1_1
	asra
	sta	___fsadd_mant2_1_1
	lda	(___fsadd_mant2_1_1 + 1)
	rora
	sta	(___fsadd_mant2_1_1 + 1)
	lda	(___fsadd_mant2_1_1 + 2)
	rora
	sta	(___fsadd_mant2_1_1 + 2)
	lda	(___fsadd_mant2_1_1 + 3)
	rora
	sta	(___fsadd_mant2_1_1 + 3)
	decx
	bne	00174$
00175$:
00117$:
;../_fsadd.c:204: mant1 += mant2;
	lda	(___fsadd_mant1_1_1 + 3)
	add	(___fsadd_mant2_1_1 + 3)
	sta	(___fsadd_mant1_1_1 + 3)
	lda	(___fsadd_mant1_1_1 + 2)
	adc	(___fsadd_mant2_1_1 + 2)
	sta	(___fsadd_mant1_1_1 + 2)
	lda	(___fsadd_mant1_1_1 + 1)
	adc	(___fsadd_mant2_1_1 + 1)
	sta	(___fsadd_mant1_1_1 + 1)
	lda	___fsadd_mant1_1_1
	adc	___fsadd_mant2_1_1
	sta	___fsadd_mant1_1_1
;../_fsadd.c:206: sign = false;
	clra
	sta	___fsadd_sign_1_1
;../_fsadd.c:208: if (mant1 < 0)
	lda	___fsadd_mant1_1_1
	sub	#0x00
	bge	00121$
00176$:
;../_fsadd.c:210: mant1 = -mant1;
	clra
	sub	(___fsadd_mant1_1_1 + 3)
	sta	(___fsadd_mant1_1_1 + 3)
	clra
	sbc	(___fsadd_mant1_1_1 + 2)
	sta	(___fsadd_mant1_1_1 + 2)
	clra
	sbc	(___fsadd_mant1_1_1 + 1)
	sta	(___fsadd_mant1_1_1 + 1)
	clra
	sbc	___fsadd_mant1_1_1
	sta	___fsadd_mant1_1_1
;../_fsadd.c:211: sign = true;
	lda	#0x01
	sta	___fsadd_sign_1_1
	bra	00154$
00121$:
;../_fsadd.c:213: else if (!mant1)
	lda	(___fsadd_mant1_1_1 + 3)
	ora	(___fsadd_mant1_1_1 + 2)
	ora	(___fsadd_mant1_1_1 + 1)
	ora	___fsadd_mant1_1_1
	bne	00154$
00177$:
;../_fsadd.c:214: return (0);
	clr	*__ret3
	clr	*__ret2
	clrx
	clra
	rts
;../_fsadd.c:217: while (mant1 < (HIDDEN<<4)) {
00154$:
	lda	___fsadd_exp1_1_1
	sta	*___fsadd_sloc0_1_0
	lda	(___fsadd_exp1_1_1 + 1)
	sta	*(___fsadd_sloc0_1_0 + 1)
00123$:
	lda	___fsadd_mant1_1_1
	sta	*___fsadd_sloc1_1_0
	lda	(___fsadd_mant1_1_1 + 1)
	sta	*(___fsadd_sloc1_1_0 + 1)
	lda	(___fsadd_mant1_1_1 + 2)
	sta	*(___fsadd_sloc1_1_0 + 2)
	lda	(___fsadd_mant1_1_1 + 3)
	sta	*(___fsadd_sloc1_1_0 + 3)
	lda	*___fsadd_sloc1_1_0
	sub	#0x08
	bcc	00157$
00178$:
;../_fsadd.c:218: mant1 <<= 1;
	lda	(___fsadd_mant1_1_1 + 3)
	ldx	(___fsadd_mant1_1_1 + 2)
	lsla
	rolx
	sta	(___fsadd_mant1_1_1 + 3)
	stx	(___fsadd_mant1_1_1 + 2)
	lda	(___fsadd_mant1_1_1 + 1)
	ldx	___fsadd_mant1_1_1
	rola
	rolx
	sta	(___fsadd_mant1_1_1 + 1)
	stx	___fsadd_mant1_1_1
;../_fsadd.c:219: exp1--;
	lda	*(___fsadd_sloc0_1_0 + 1)
	sub	#0x01
	sta	*(___fsadd_sloc0_1_0 + 1)
	lda	*___fsadd_sloc0_1_0
	sbc	#0x00
	sta	*___fsadd_sloc0_1_0
	bra	00123$
;../_fsadd.c:223: while (mant1 & 0xf0000000) {
00157$:
	mov	*___fsadd_sloc0_1_0,*___fsadd_sloc1_1_0
	mov	*(___fsadd_sloc0_1_0 + 1),*(___fsadd_sloc1_1_0 + 1)
00128$:
	lda	___fsadd_mant1_1_1
	and	#0xF0
	beq	00163$
00179$:
;../_fsadd.c:224: if (mant1&1)
	lda	(___fsadd_mant1_1_1 + 3)
	and	#0x01
	bne	00180$
00180$:
	beq	00127$
00181$:
;../_fsadd.c:225: mant1 += 2;
	lda	(___fsadd_mant1_1_1 + 3)
	add	#0x02
	sta	(___fsadd_mant1_1_1 + 3)
	bcc	00182$
	lda	(___fsadd_mant1_1_1 + 2)
	inca
	sta	(___fsadd_mant1_1_1 + 2)
	bne	00182$
	lda	(___fsadd_mant1_1_1 + 1)
	inca
	sta	(___fsadd_mant1_1_1 + 1)
	bne	00182$
	lda	___fsadd_mant1_1_1
	inca
	sta	___fsadd_mant1_1_1
00182$:
00127$:
;../_fsadd.c:226: mant1 >>= 1;
	lda	(___fsadd_mant1_1_1 + 1)
	ldx	___fsadd_mant1_1_1
	asrx
	rora
	sta	(___fsadd_mant1_1_1 + 1)
	stx	___fsadd_mant1_1_1
	lda	(___fsadd_mant1_1_1 + 3)
	ldx	(___fsadd_mant1_1_1 + 2)
	rorx
	rora
	sta	(___fsadd_mant1_1_1 + 3)
	stx	(___fsadd_mant1_1_1 + 2)
;../_fsadd.c:227: exp1++;
	ldhx	*___fsadd_sloc1_1_0
	aix	#1
	sthx	*___fsadd_sloc1_1_0
	bra	00128$
00163$:
	lda	*___fsadd_sloc1_1_0
	sta	___fsadd_exp1_1_1
	lda	*(___fsadd_sloc1_1_0 + 1)
	sta	(___fsadd_exp1_1_1 + 1)
;../_fsadd.c:231: mant1 &= ~(HIDDEN<<4);
	lda	___fsadd_mant1_1_1
	and	#0xF7
	sta	___fsadd_mant1_1_1
;../_fsadd.c:234: if (exp1 >= 0x100)
	ldhx	*___fsadd_sloc1_1_0
	cphx	#0x0100
	blt	00135$
00183$:
;../_fsadd.c:235: *pfl1 = (sign ? (SIGNBIT | __INFINITY) : __INFINITY);
	lda	___fsadd_sign_1_1
	beq	00139$
00184$:
	mov	#0xFF,*___fsadd_sloc0_1_0
	mov	#0x80,*(___fsadd_sloc0_1_0 + 1)
	clr	*(___fsadd_sloc0_1_0 + 2)
	clr	*(___fsadd_sloc0_1_0 + 3)
	bra	00140$
00139$:
	mov	#0x7F,*___fsadd_sloc0_1_0
	mov	#0x80,*(___fsadd_sloc0_1_0 + 1)
	clr	*(___fsadd_sloc0_1_0 + 2)
	clr	*(___fsadd_sloc0_1_0 + 3)
00140$:
	lda	*___fsadd_sloc0_1_0
	sta	___fsadd_PARM_1
	lda	*(___fsadd_sloc0_1_0 + 1)
	sta	(___fsadd_PARM_1 + 1)
	lda	*(___fsadd_sloc0_1_0 + 2)
	sta	(___fsadd_PARM_1 + 2)
	lda	*(___fsadd_sloc0_1_0 + 3)
	sta	(___fsadd_PARM_1 + 3)
	jmp	00136$
00135$:
;../_fsadd.c:236: else if (exp1 < 0)
	ldhx	*___fsadd_sloc1_1_0
	cphx	#0x0000
	bge	00132$
00185$:
;../_fsadd.c:237: *pfl1 = 0;
	clra
	sta	___fsadd_PARM_1
	sta	(___fsadd_PARM_1 + 1)
	sta	(___fsadd_PARM_1 + 2)
	sta	(___fsadd_PARM_1 + 3)
	jmp	00136$
00132$:
;../_fsadd.c:239: *pfl1 = PACK (sign ? SIGNBIT : 0 , exp1, mant1>>4);
	lda	___fsadd_sign_1_1
	beq	00141$
00186$:
	mov	#0x80,*___fsadd_sloc1_1_0
	clr	*(___fsadd_sloc1_1_0 + 1)
	clr	*(___fsadd_sloc1_1_0 + 2)
	clr	*(___fsadd_sloc1_1_0 + 3)
	bra	00142$
00141$:
	clr	*___fsadd_sloc1_1_0
	clr	*(___fsadd_sloc1_1_0 + 1)
	clr	*(___fsadd_sloc1_1_0 + 2)
	clr	*(___fsadd_sloc1_1_0 + 3)
00142$:
	lda	(___fsadd_exp1_1_1 + 1)
	sta	*(___fsadd_sloc0_1_0 + 3)
	lda	___fsadd_exp1_1_1
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	___fsadd_exp1_1_1
	rola	
	clra	
	sbc	#0x00
	sta	*(___fsadd_sloc0_1_0 + 1)
	sta	*___fsadd_sloc0_1_0
	lda	*(___fsadd_sloc0_1_0 + 3)
	ldx	*(___fsadd_sloc0_1_0 + 2)
	lsrx
	rora
	tax
	clra
	rora
	sta	*(___fsadd_sloc0_1_0 + 1)
	stx	*___fsadd_sloc0_1_0
	clr	*(___fsadd_sloc0_1_0 + 3)
	clr	*(___fsadd_sloc0_1_0 + 2)
	lda	*(___fsadd_sloc1_1_0 + 3)
	ora	*(___fsadd_sloc0_1_0 + 3)
	sta	*(___fsadd_sloc1_1_0 + 3)
	lda	*(___fsadd_sloc1_1_0 + 2)
	ora	*(___fsadd_sloc0_1_0 + 2)
	sta	*(___fsadd_sloc1_1_0 + 2)
	lda	*(___fsadd_sloc1_1_0 + 1)
	ora	*(___fsadd_sloc0_1_0 + 1)
	sta	*(___fsadd_sloc1_1_0 + 1)
	lda	*___fsadd_sloc1_1_0
	ora	*___fsadd_sloc0_1_0
	sta	*___fsadd_sloc1_1_0
	lda	(___fsadd_mant1_1_1 + 3)
	ldx	(___fsadd_mant1_1_1 + 2)
	lsrx
	rora
	lsrx
	rora
	lsrx
	rora
	lsrx
	rora
	sta	*(___fsadd_sloc0_1_0 + 3)
	stx	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_mant1_1_1 + 1)
	nsa	
	and	#0xf0
	ora	*(___fsadd_sloc0_1_0 + 2)
	sta	*(___fsadd_sloc0_1_0 + 2)
	lda	(___fsadd_mant1_1_1 + 1)
	ldx	___fsadd_mant1_1_1
	asrx
	rora
	asrx
	rora
	asrx
	rora
	asrx
	rora
	sta	*(___fsadd_sloc0_1_0 + 1)
	stx	*___fsadd_sloc0_1_0
	lda	*(___fsadd_sloc1_1_0 + 3)
	ora	*(___fsadd_sloc0_1_0 + 3)
	sta	*(___fsadd_sloc1_1_0 + 3)
	lda	*(___fsadd_sloc1_1_0 + 2)
	ora	*(___fsadd_sloc0_1_0 + 2)
	sta	*(___fsadd_sloc1_1_0 + 2)
	lda	*(___fsadd_sloc1_1_0 + 1)
	ora	*(___fsadd_sloc0_1_0 + 1)
	sta	*(___fsadd_sloc1_1_0 + 1)
	lda	*___fsadd_sloc1_1_0
	ora	*___fsadd_sloc0_1_0
	sta	*___fsadd_sloc1_1_0
	sta	___fsadd_PARM_1
	lda	*(___fsadd_sloc1_1_0 + 1)
	sta	(___fsadd_PARM_1 + 1)
	lda	*(___fsadd_sloc1_1_0 + 2)
	sta	(___fsadd_PARM_1 + 2)
	lda	*(___fsadd_sloc1_1_0 + 3)
	sta	(___fsadd_PARM_1 + 3)
00136$:
;../_fsadd.c:240: return (a1);
	lda	___fsadd_PARM_1
	sta	*__ret3
	lda	(___fsadd_PARM_1 + 1)
	sta	*__ret2
	ldx	(___fsadd_PARM_1 + 2)
	lda	(___fsadd_PARM_1 + 3)
00137$:
	rts
	.area CSEG (CODE)
	.area CONST   (CODE)
	.area XINIT
	.area CABS    (ABS,CODE)
