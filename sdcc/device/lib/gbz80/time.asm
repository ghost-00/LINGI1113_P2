;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Wed Oct 23 12:26:13 2013
;--------------------------------------------------------
	.module time
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _RtcRead
	.globl ___day
	.globl ___month
	.globl _time
	.globl _asctime
	.globl _ctime
	.globl _localtime
	.globl _gmtime
	.globl _mktime
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
_monthDays:
	.ds 12
___month::
	.ds 24
___day::
	.ds 14
_ascTimeBuffer:
	.ds 32
_lastTime:
	.ds 12
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
;../time.c:59: static _CODE char monthDays[]={31,28,31,30,31,30,31,31,30,31,30,31};
	ld	hl,#_monthDays
	call	__initrleblock
	.db	12
	.db	0x1F, 0x1C, 0x1F, 0x1E, 0x1F, 0x1E, 0x1F, 0x1F
	.db	0x1E, 0x1F, 0x1E, 0x1F
	.db	0
;../time.c:61: _CODE const char * _CODE __month[]={"Jan","Feb","Mar","Apr","May","Jun",
	ld	de,#___month
	ld	a,#<(__str_1)
	ld	(de),a
	inc	de
	ld	a,#>(__str_1)
	ld	(de),a
	ld	de,#0x0002 + ___month
	ld	a,#<(__str_2)
	ld	(de),a
	inc	de
	ld	a,#>(__str_2)
	ld	(de),a
	ld	de,#0x0004 + ___month
	ld	a,#<(__str_3)
	ld	(de),a
	inc	de
	ld	a,#>(__str_3)
	ld	(de),a
	ld	de,#0x0006 + ___month
	ld	a,#<(__str_4)
	ld	(de),a
	inc	de
	ld	a,#>(__str_4)
	ld	(de),a
	ld	de,#0x0008 + ___month
	ld	a,#<(__str_5)
	ld	(de),a
	inc	de
	ld	a,#>(__str_5)
	ld	(de),a
	ld	de,#0x000a + ___month
	ld	a,#<(__str_6)
	ld	(de),a
	inc	de
	ld	a,#>(__str_6)
	ld	(de),a
	ld	de,#0x000c + ___month
	ld	a,#<(__str_7)
	ld	(de),a
	inc	de
	ld	a,#>(__str_7)
	ld	(de),a
	ld	de,#0x000e + ___month
	ld	a,#<(__str_8)
	ld	(de),a
	inc	de
	ld	a,#>(__str_8)
	ld	(de),a
	ld	de,#0x0010 + ___month
	ld	a,#<(__str_9)
	ld	(de),a
	inc	de
	ld	a,#>(__str_9)
	ld	(de),a
	ld	de,#0x0012 + ___month
	ld	a,#<(__str_10)
	ld	(de),a
	inc	de
	ld	a,#>(__str_10)
	ld	(de),a
	ld	de,#0x0014 + ___month
	ld	a,#<(__str_11)
	ld	(de),a
	inc	de
	ld	a,#>(__str_11)
	ld	(de),a
	ld	de,#0x0016 + ___month
	ld	a,#<(__str_12)
	ld	(de),a
	inc	de
	ld	a,#>(__str_12)
	ld	(de),a
;../time.c:64: _CODE const char * _CODE __day[]={"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
	ld	de,#___day
	ld	a,#<(__str_13)
	ld	(de),a
	inc	de
	ld	a,#>(__str_13)
	ld	(de),a
	ld	de,#0x0002 + ___day
	ld	a,#<(__str_14)
	ld	(de),a
	inc	de
	ld	a,#>(__str_14)
	ld	(de),a
	ld	de,#0x0004 + ___day
	ld	a,#<(__str_15)
	ld	(de),a
	inc	de
	ld	a,#>(__str_15)
	ld	(de),a
	ld	de,#0x0006 + ___day
	ld	a,#<(__str_16)
	ld	(de),a
	inc	de
	ld	a,#>(__str_16)
	ld	(de),a
	ld	de,#0x0008 + ___day
	ld	a,#<(__str_17)
	ld	(de),a
	inc	de
	ld	a,#>(__str_17)
	ld	(de),a
	ld	de,#0x000a + ___day
	ld	a,#<(__str_18)
	ld	(de),a
	inc	de
	ld	a,#>(__str_18)
	ld	(de),a
	ld	de,#0x000c + ___day
	ld	a,#<(__str_19)
	ld	(de),a
	inc	de
	ld	a,#>(__str_19)
	ld	(de),a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../time.c:38: unsigned char RtcRead(struct tm *timeptr) {
;	---------------------------------
; Function RtcRead
; ---------------------------------
_RtcRead_start::
_RtcRead:
	
;../time.c:41: return 0;
	ld	e,#0x00
00101$:
	
	ret
_RtcRead_end::
;../time.c:46: time_t time(time_t *timeptr) {
;	---------------------------------
; Function time
; ---------------------------------
_time_start::
_time:
	lda	sp,-20(sp)
;../time.c:48: time_t t=-1;
	lda	hl,4(sp)
	ld	(hl),#0xFF
	inc	hl
	ld	(hl),#0xFF
	inc	hl
	ld	(hl),#0xFF
	inc	hl
	ld	(hl),#0xFF
;../time.c:50: if (RtcRead(&now)) {
	lda	hl,8(sp)
	ld	c,l
	ld	b,h
	push	bc
	call	_RtcRead
	lda	sp,2(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00102$
;../time.c:51: t=mktime(&now);
	lda	hl,8(sp)
	ld	c,l
	ld	b,h
	push	bc
	call	_mktime
	lda	sp,2(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,0(sp)
	ld	d,h
	ld	e,l
	lda	hl,4(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
00102$:
;../time.c:53: if (timeptr) {
	lda	hl,22(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	Z,00104$
;../time.c:54: *timeptr=t;
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	e,c
	ld	d,b
	lda	hl,4(sp)
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
	inc	de
	inc	hl
	ld	a,(hl)
	ld	(de),a
00104$:
;../time.c:56: return t;
	lda	hl,5(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00105$:
	lda	sp,20(sp)
	ret
_time_end::
;../time.c:69: static void CheckTime(struct tm *timeptr) {
;	---------------------------------
; Function CheckTime
; ---------------------------------
_CheckTime:
	
	push	af
	push	af
;../time.c:80: if (timeptr->tm_sec>59) timeptr->tm_sec=59;
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	a,#0x3B
	sub	a,c
	jp	NC,00102$
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x3B
	ld	(de),a
00102$:
;../time.c:81: if (timeptr->tm_min>59) timeptr->tm_min=59;
	lda	hl,3(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	ld	a,#0x3B
	sub	a,c
	jp	NC,00104$
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x3B
	ld	(de),a
00104$:
;../time.c:82: if (timeptr->tm_hour>23) timeptr->tm_hour=23;
	lda	hl,3(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	ld	a,#0x17
	sub	a,c
	jp	NC,00106$
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x17
	ld	(de),a
00106$:
;../time.c:83: if (timeptr->tm_wday>6) timeptr->tm_wday=6;
	lda	hl,3(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	ld	a,#0x06
	sub	a,c
	jp	NC,00108$
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x06
	ld	(de),a
00108$:
;../time.c:84: if (timeptr->tm_mday<1) timeptr->tm_mday=1;
	lda	hl,3(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0003
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	lda	hl,0(sp)
	ld	(hl),a
	sub	a,#0x01
	jp	NC,00112$
	ld	a,#0x01
	ld	(bc),a
	jp	00113$
00112$:
;../time.c:85: else if (timeptr->tm_mday>31) timeptr->tm_mday=31;
	ld	a,#0x1F
	lda	hl,0(sp)
	sub	a,(hl)
	jp	NC,00113$
	ld	a,#0x1F
	ld	(bc),a
00113$:
;../time.c:86: if (timeptr->tm_mon>11) timeptr->tm_mon=11;
	lda	hl,3(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	ld	a,#0x0B
	sub	a,c
	jp	NC,00115$
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x0B
	ld	(de),a
00115$:
;../time.c:87: if (timeptr->tm_year<0) timeptr->tm_year=0;
	lda	hl,3(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0005
	add	hl,de
	ld	a,l
	ld	d,h
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),d
	ld	e,a
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	bit	7,a
	jp	Z,00118$
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,#0x00
	ld	(de),a
	inc	de
	ld	a,#0x00
	ld	(de),a
00118$:
	lda	sp,4(sp)
	ret
;../time.c:91: char *asctime(struct tm *timeptr) {
;	---------------------------------
; Function asctime
; ---------------------------------
_asctime_start::
_asctime:
	lda	sp,-14(sp)
;../time.c:92: CheckTime(timeptr);
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckTime
	lda	sp,2(sp)
;../time.c:96: timeptr->tm_year+1900);
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,12(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0005
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#0x076C
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,10(sp)
	ld	(hl+),a
	ld	(hl),d
;../time.c:95: timeptr->tm_hour, timeptr->tm_min, timeptr->tm_sec, 
	inc	hl
	inc	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	lda	hl,8(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),#0x00
	lda	hl,12(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,(bc)
	ld	c,a
	lda	hl,6(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),#0x00
	lda	hl,12(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	lda	hl,4(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),#0x00
;../time.c:94: __day[timeptr->tm_wday], __month[timeptr->tm_mon], timeptr->tm_mday,
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0003
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	lda	hl,2(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),#0x00
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	add	a,a
	add	a,#<(___month)
	ld	c,a
	ld	a,#>(___month)
	adc	a,#0x00
	ld	b,a
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,0(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	add	a,a
	add	a,#<(___day)
	ld	c,a
	ld	a,#>(___day)
	adc	a,#0x00
	ld	b,a
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;../time.c:93: sprintf (ascTimeBuffer, "%s %s %2d %02d:%02d:%02d %04d\n",
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	hl,#__str_0
	push	hl
	ld	hl,#_ascTimeBuffer
	push	hl
	call	_sprintf
	lda	sp,18(sp)
;../time.c:97: return ascTimeBuffer;
	ld	de,#_ascTimeBuffer
00101$:
	lda	sp,14(sp)
	ret
_asctime_end::
__str_0:
	.ascii "%s %s %2d %02d:%02d:%02d %04d"
	.db 0x0A
	.db 0x00
;../time.c:100: char *ctime(time_t *timep) {
;	---------------------------------
; Function ctime
; ---------------------------------
_ctime_start::
_ctime:
	
;../time.c:101: return asctime(localtime(timep));
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_localtime
	lda	sp,2(sp)
	ld	b,d
	ld	c,e
	push	bc
	call	_asctime
	lda	sp,2(sp)
00101$:
	
	ret
_ctime_end::
;../time.c:117: struct tm *localtime(time_t *timep) {
;	---------------------------------
; Function localtime
; ---------------------------------
_localtime_start::
_localtime:
	
;../time.c:118: return gmtime(timep);
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_gmtime
	lda	sp,2(sp)
00101$:
	
	ret
_localtime_end::
;../time.c:121: struct tm *gmtime(time_t *timep) {
;	---------------------------------
; Function gmtime
; ---------------------------------
_gmtime_start::
_gmtime:
	lda	sp,-19(sp)
;../time.c:122: unsigned long epoch=*timep;
	lda	hl,22(sp)
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	e,c
	ld	d,b
	ld	a,(de)
	lda	hl,15(sp)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../time.c:127: lastTime.tm_sec=epoch%60;
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x003C
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__modulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	a,(hl)
	ld	de,#_lastTime
	ld	(de),a
;../time.c:128: epoch/=60; // now it is minutes
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x003C
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__divulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,15(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../time.c:129: lastTime.tm_min=epoch%60;
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x003C
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__modulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	a,(hl)
	ld	de,#0x0001 + _lastTime
	ld	(de),a
;../time.c:130: epoch/=60; // now it is hours
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x003C
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__divulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,15(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../time.c:131: lastTime.tm_hour=epoch%24;
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0018
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__modulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	a,(hl)
	ld	de,#0x0002 + _lastTime
	ld	(de),a
;../time.c:132: epoch/=24; // now it is days
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0018
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,21(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__divulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,15(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../time.c:133: lastTime.tm_wday=(epoch+4)%7;
	lda	hl,16(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	add	a,#0x04
	ld	e,a
	ld	a,d
	adc	a,#0x00
	push	af
	lda	hl,7(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,20(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	af
	ld	a,e
	adc	a,#0x00
	ld	e,a
	ld	a,d
	adc	a,#0x00
	lda	hl,7(sp)
	ld	(hl-),a
	ld	(hl),e
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0007
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,10(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__modulong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,6(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,4(sp)
	ld	a,(hl)
	ld	de,#0x0007 + _lastTime
	ld	(de),a
;../time.c:136: days=0;
	xor	a,a
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl+),a
;../time.c:137: while((days += (LEAP_YEAR(year) ? 366 : 365)) <= epoch) {
	ld	(hl+),a
	inc	hl
	ld	(hl),#0xB2
	inc	hl
	ld	(hl),#0x07
00101$:
	lda	hl,13(sp)
	ld	a,(hl)
	and	a,#0x03
	ld	c,a
	ld	b,#0x00
	ld	a,c
	or	a,b
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	c,a
	or	a,a
	jp	Z,00119$
	ld	bc,#0x016E
	jp	00120$
00119$:
	ld	bc,#0x016D
00120$:
	lda	hl,4(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl+),a
	inc	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,4(sp)
	add	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	push	af
	ld	(hl-),a
	ld	(hl),e
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,8(sp)
	pop	af
	ld	a,e
	adc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	ld	(hl-),a
	ld	(hl),e
	dec	hl
	dec	hl
	ld	d,h
	ld	e,l
	lda	hl,8(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,15(sp)
	ld	d,h
	ld	e,l
	lda	hl,4(sp)
	ld	a,(de)
	sub	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	jp	C,00103$
;../time.c:138: year++;
	lda	hl,13(sp)
	inc	(hl)
	jr	NZ,00134$
	inc	hl
	inc	(hl)
00134$:
	jp	00101$
00103$:
;../time.c:140: lastTime.tm_year=year-1900;
	lda	hl,14(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x076C
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ld	b,a
	ld	c,e
	ld	de,#0x0005 + _lastTime
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;../time.c:142: days -= LEAP_YEAR(year) ? 366 : 365;
	lda	hl,13(sp)
	ld	a,(hl)
	and	a,#0x03
	lda	hl,4(sp)
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl+)
	or	a,(hl)
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	c,a
	or	a,a
	jp	Z,00121$
	ld	bc,#0x016E
	jp	00122$
00121$:
	ld	bc,#0x016D
00122$:
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl),a
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	lda	hl,11(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,13(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	lda	hl,11(sp)
	ld	(hl-),a
	ld	(hl),e
;../time.c:143: epoch -= days; // now it is days in this year, starting at 0
	lda	hl,16(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,8(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	lda	hl,18(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,20(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,12(sp)
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	lda	hl,18(sp)
	ld	(hl-),a
	ld	(hl),e
;../time.c:144: lastTime.tm_yday=epoch;
	dec	hl
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	de,#0x0008 + _lastTime
	ld	a,c
	ld	(de),a
	inc	de
	ld	a,b
	ld	(de),a
;../time.c:149: for (month=0; month<12; month++) {
	lda	hl,12(sp)
	ld	(hl),#0x00
00113$:
	lda	hl,12(sp)
	ld	a,(hl)
	sub	a,#0x0C
	jp	NC,00116$
;../time.c:150: if (month==1) { // februari
	ld	a,(hl)
	sub	a,#0x01
	jp	NZ,00108$
	jr	00136$
00135$:
	jp	00108$
00136$:
;../time.c:151: if (LEAP_YEAR(year)) {
	lda	hl,4(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	NZ,00105$
;../time.c:152: monthLength=29;
	ld	b,#0x1D
	jp	00109$
00105$:
;../time.c:154: monthLength=28;
	ld	b,#0x1C
	jp	00109$
00108$:
;../time.c:157: monthLength = monthDays[month];
	ld	de,#_monthDays
	lda	hl,12(sp)
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	b,a
00109$:
;../time.c:160: if (epoch>=monthLength) {
	lda	hl,0(sp)
	ld	(hl),b
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	lda	hl,15(sp)
	ld	d,h
	ld	e,l
	lda	hl,0(sp)
	ld	a,(de)
	sub	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	jp	C,00116$
;../time.c:161: epoch-=monthLength;
	lda	hl,16(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	lda	hl,18(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,20(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	lda	hl,18(sp)
	ld	(hl-),a
	ld	(hl),e
;../time.c:149: for (month=0; month<12; month++) {
	lda	hl,12(sp)
	inc	(hl)
	jp	00113$
00116$:
;../time.c:166: lastTime.tm_mon=month;
	ld	de,#0x0004 + _lastTime
	lda	hl,12(sp)
	ld	a,(hl)
	ld	(de),a
;../time.c:167: lastTime.tm_mday=epoch+1;
	lda	hl,15(sp)
	ld	c,(hl)
	ld	a,c
	inc	a
	ld	de,#0x0003 + _lastTime
	ld	(de),a
;../time.c:169: lastTime.tm_isdst=0;
	ld	de,#0x000a + _lastTime
	ld	a,#0x00
	ld	(de),a
;../time.c:171: return &lastTime;
	ld	de,#_lastTime
00117$:
	lda	sp,19(sp)
	ret
_gmtime_end::
;../time.c:175: time_t mktime(struct tm *timeptr) {
;	---------------------------------
; Function mktime
; ---------------------------------
_mktime_start::
_mktime:
	lda	sp,-20(sp)
;../time.c:176: int year=timeptr->tm_year+1900, month=timeptr->tm_mon, i;
	lda	hl,22(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,8(sp)
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0005
	add	hl,de
	ld	c,l
	ld	b,h
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#0x076C
	add	hl,bc
	ld	a,l
	ld	d,h
	lda	hl,18(sp)
	ld	(hl+),a
	ld	(hl),d
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	lda	hl,16(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),#0x00
;../time.c:179: CheckTime(timeptr);
	lda	hl,8(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_CheckTime
	lda	sp,2(sp)
;../time.c:182: seconds= (year-1970)*(60*60*24L*365);
	lda	hl,19(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x07B2
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ld	b,a
	ld	c,e
	lda	hl,4(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl-),a
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,6(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x01E1
	push	hl
	ld	hl,#0x1E13380
	push	hl
	call	__mullong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,12(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;../time.c:185: for (i=1970; i<year; i++) {
	lda	hl,10(sp)
	ld	d,h
	ld	e,l
	lda	hl,4(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	lda	hl,14(sp)
	ld	(hl),#0xB2
	inc	hl
	ld	(hl),#0x07
00107$:
	lda	hl,14(sp)
	ld	d,h
	ld	e,l
	lda	hl,18(sp)
	ld	a,(de)
	sub	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	rlca
	jp	NC,00124$
;../time.c:186: if (LEAP_YEAR(i)) {
	ld	hl,#0x0004
	push	hl
	lda	hl,16(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__modsint_rrx_s
	lda	sp,4(sp)
	ld	b,d
	ld	c,e
	ld	a,c
	or	a,b
	jp	NZ,00109$
;../time.c:187: seconds+= 60*60*24L;
	lda	hl,5(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	add	a,#0x80
	ld	e,a
	ld	a,d
	adc	a,#0x51
	push	af
	ld	(hl-),a
	ld	(hl),e
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	af
	ld	a,e
	adc	a,#0x01
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	(hl-),a
	ld	(hl),e
00109$:
;../time.c:185: for (i=1970; i<year; i++) {
	lda	hl,14(sp)
	inc	(hl)
	jr	NZ,00126$
	inc	hl
	inc	(hl)
00126$:
	jp	00107$
00124$:
	lda	hl,4(sp)
	ld	d,h
	ld	e,l
	lda	hl,10(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
;../time.c:192: for (i=0; i<month; i++) {
	ld	hl,#0x0004
	push	hl
	lda	hl,20(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	__modsint_rrx_s
	lda	sp,4(sp)
	lda	hl,5(sp)
	ld	(hl),d
	dec	hl
	ld	(hl),e
	lda	hl,14(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00111$:
	lda	hl,14(sp)
	ld	d,h
	ld	e,l
	inc	hl
	inc	hl
	ld	a,(de)
	sub	a,(hl)
	inc	hl
	inc	de
	ld	a,(de)
	sbc	a,(hl)
	rlca
	jp	NC,00114$
;../time.c:193: if (i==1 && LEAP_YEAR(year)) { 
	lda	hl,14(sp)
	ld	a,(hl)
	sub	a,#0x01
	jp	NZ,00104$
	inc	hl
	ld	a,(hl)
	or	a,a
	jp	NZ,00104$
	jr	00128$
00127$:
	jp	00104$
00128$:
	lda	hl,4(sp)
	ld	a,(hl+)
	or	a,(hl)
	jp	NZ,00104$
;../time.c:194: seconds+= 60*60*24L*29;
	lda	hl,11(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	add	a,#0x80
	ld	e,a
	ld	a,d
	adc	a,#0x3B
	push	af
	ld	(hl-),a
	ld	(hl),e
	lda	hl,15(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	pop	af
	ld	a,e
	adc	a,#0x26
	ld	e,a
	ld	a,d
	adc	a,#0x00
	ld	(hl-),a
	ld	(hl),e
	jp	00113$
00104$:
;../time.c:196: seconds+= 60*60*24L*monthDays[i];
	ld	de,#_monthDays
	lda	hl,14(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	lda	hl,0(sp)
	ld	(hl),c
	ld	a,c
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl+),a
	ld	(hl-),a
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x0001
	push	hl
	ld	hl,#0x15180
	push	hl
	call	__mullong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,11(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	add	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	push	af
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,15(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	adc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
00113$:
;../time.c:192: for (i=0; i<month; i++) {
	lda	hl,14(sp)
	inc	(hl)
	jr	NZ,00129$
	inc	hl
	inc	(hl)
00129$:
	jp	00111$
00114$:
;../time.c:200: seconds+= (timeptr->tm_mday-1)*60*60*24L;
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0003
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	dec	bc
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl-),a
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x0001
	push	hl
	ld	hl,#0x15180
	push	hl
	call	__mullong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,11(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	add	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	push	af
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,15(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	adc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
;../time.c:201: seconds+= timeptr->tm_hour*60*60L;
	lda	hl,8(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	c,a
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0E10
	push	hl
	call	__mullong_rrx_s
	lda	sp,8(sp)
	push	hl
	lda	hl,2(sp)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	pop	de
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	lda	hl,11(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	add	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	push	af
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,15(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	adc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
;../time.c:202: seconds+= timeptr->tm_min*60;
	lda	hl,8(sp)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,(bc)
	ld	c,a
	ld	e,c
	ld	d,#0x00
	ld	l,e
	ld	h,d
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,de
	add	hl,hl
	add	hl,hl
	ld	c,l
	ld	b,h
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl),a
	lda	hl,11(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	add	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	push	af
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,15(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	adc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
;../time.c:203: seconds+= timeptr->tm_sec;
	lda	hl,9(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	lda	hl,0(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,b
	rla	
	sbc	a,a
	inc	hl
	ld	(hl+),a
	ld	(hl),a
	lda	hl,11(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,e
	lda	hl,0(sp)
	add	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	push	af
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
	lda	hl,15(sp)
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	lda	hl,4(sp)
	pop	af
	ld	a,e
	adc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	adc	a,(hl)
	lda	hl,13(sp)
	ld	(hl-),a
	ld	(hl),e
;../time.c:204: return seconds;
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00115$:
	lda	sp,20(sp)
	ret
_mktime_end::
	.area _CODE
__str_1:
	.ascii "Jan"
	.db 0x00
__str_2:
	.ascii "Feb"
	.db 0x00
__str_3:
	.ascii "Mar"
	.db 0x00
__str_4:
	.ascii "Apr"
	.db 0x00
__str_5:
	.ascii "May"
	.db 0x00
__str_6:
	.ascii "Jun"
	.db 0x00
__str_7:
	.ascii "Jul"
	.db 0x00
__str_8:
	.ascii "Aug"
	.db 0x00
__str_9:
	.ascii "Sep"
	.db 0x00
__str_10:
	.ascii "Oct"
	.db 0x00
__str_11:
	.ascii "Nov"
	.db 0x00
__str_12:
	.ascii "Dec"
	.db 0x00
__str_13:
	.ascii "Sun"
	.db 0x00
__str_14:
	.ascii "Mon"
	.db 0x00
__str_15:
	.ascii "Tue"
	.db 0x00
__str_16:
	.ascii "Wed"
	.db 0x00
__str_17:
	.ascii "Thu"
	.db 0x00
__str_18:
	.ascii "Fri"
	.db 0x00
__str_19:
	.ascii "Sat"
	.db 0x00
	.area _CABS
