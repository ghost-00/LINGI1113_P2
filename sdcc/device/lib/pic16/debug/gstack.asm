;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:29:37 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f452

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global __gstack_overflow
	global __gstack_succ_str
	global __gstack_fail_str
	global __gstack_init
	global __gstack_test

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern _WREG
	extern _FSR1L
	extern _FSR1H
	extern _FSR0L
	extern _FSR0H
	extern _STATUS
	extern _POSTINC0
	extern _POSTDEC1
	extern _PREINC1
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _stack
	extern _stack_end
;--------------------------------------------------------
;	Access bank symbols
;--------------------------------------------------------
	udata_acs
__wreg_store	res	1
__status_store	res	1
__fsr0_store	res	2
__gstack_begin	res	2
__gstack_end	res	2


	idata
__init_ok	db	0x00
__gstack_fail_str	db	0x53, 0x74, 0x61, 0x63, 0x6b, 0x20, 0x6f, 0x76, 0x65, 0x72, 0x66, 0x6c
	db	0x6f, 0x77, 0x0a, 0x00
__gstack_succ_str	db	0x53, 0x74, 0x61, 0x63, 0x6b, 0x20, 0x6f, 0x6b, 0x0a, 0x00
__gstack_overflow	db	LOW(__gstack_overflow_default), HIGH(__gstack_overflow_default), UPPER(__gstack_overflow_default)

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
; ;ic:1:  _entry($2) :
; ;ic:2: 	proc __gstack_test [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{void function    ( )  fixed}
S_gstack___gstack_test	code
__gstack_test:
; ;ic:3: inline
	movff _WREG, __wreg_store
	movff _STATUS, __status_store
	; if first time, initialize boundary variables
	movf __init_ok, w
	bnz @1
	call __gstack_init
@1:
	movf __gstack_begin, w
	cpfslt _FSR1L
	bra @2
	bra @3
@2:
	movf __gstack_begin+1, w
	cpfslt _FSR1H
	bra @4
	bra @3
@4:
	movf __gstack_end, w
	cpfsgt _FSR1L
	bra @5
	bra @3
@5:
	movf __gstack_end+1, w
	cpfsgt _FSR1H
	bra @6
	; fail
@3:
	push
	movlw LOW(ret_lab)
	movwf _TOSL
	movlw HIGH(ret_lab)
	movwf _TOSH
	movlw UPPER(ret_lab)
	movwf _TOSU
	movff __gstack_overflow+2, _PCLATU
	movff __gstack_overflow+1, _PCLATH
	movf __gstack_overflow, w
	; execute
	movwf _PCL
ret_lab:
	bra @10
	; success
@6:
	movff _FSR0L, __fsr0_store
	movff _FSR0H, __fsr0_store+1
	lfsr 0, __gstack_succ_str
	; print corresponding string
@8:
	movf _POSTINC0, w
	movff _WREG, 0xf7f
	bnz @8
@9:
	movff __fsr0_store+1, _FSR0H
	movff __fsr0_store, _FSR0L
@10:
	movff __status_store, _STATUS
	movff __wreg_store, _WREG
	return
	
; ;ic:4:  _return($1) :
; ;ic:5: 	eproc __gstack_test [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{void function    ( )  fixed}
; ; Starting pCode block
; ;ic:1:  _entry($2) :
; ;ic:2: 	proc __gstack_init [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{void function    ( )  fixed}
S_gstack___gstack_init	code
__gstack_init:
; ;ic:3: inline
	movlw LOW(_stack)
	movwf __gstack_begin
	movlw HIGH(_stack)
	movwf __gstack_begin+1
	movlw LOW(_stack_end)
	movwf __gstack_end
	movlw HIGH(_stack_end)
	movwf __gstack_end+1
	; load default handler
	; movlw LOW(__gstack_overflow_default)
	; movwf __gstack_overflow
	; movlw HIGH(__gstack_overflow_default)
	; movwf __gstack_overflow+1
	; movlw UPPER(__gstack_overflow_default)
	; movwf __gstack_overflow+2
	movlw 1
	movwf __init_ok
	return;
	
; ;ic:4:  _return($1) :
; ;ic:5: 	eproc __gstack_init [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{void function    ( )  fixed}
; ; Starting pCode block
; ;ic:1:  _entry($2) :
; ;ic:2: 	proc __gstack_overflow_default [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{void function    ( )  fixed}
S_gstack___gstack_overflow_default	code
__gstack_overflow_default:
; ;ic:3: inline
	lfsr 0, __gstack_fail_str
	; incf _FSR0L, f
@0:
	movf _POSTINC0, w
	movff _WREG, 0xf7f
	bnz @0
	; sleep
@00:
	goto @00
	
; ;ic:4:  _return($1) :
; ;ic:5: 	eproc __gstack_overflow_default [k1 lr0:0 so:0]{ ia0 a2p0 re0 rm0 nos0 ru0 dp0}{void function    ( )  fixed}


; Statistics:
; code size:	  176 (0x00b0) bytes ( 0.13%)
;           	   88 (0x0058) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	    0 (0x0000) bytes


	end
