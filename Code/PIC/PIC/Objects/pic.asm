;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Oct 23 2013) (Mac OS X ppc)
; This file was generated Sat Oct 26 23:35:47 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _increment
	global _checkAlarm
	global _setAlarm
	global _actionButton1
	global _actionButton2
	global _move
	global _changeTime
	global _info_A
	global _blink
	global _init_board
	global _DisplayWORD
	global _DisplayString
	global _strlcpy
	global _firstLine
	global _secondLine
	global _firstTab
	global _secondTab
	global _posC
	global _posA
	global _bin
	global _isAlarm
	global _ringtone
	global _currentMode
	global _count
	global _temp1
	global _temp2
	global _tempA
	global _HighISR
	global _main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern _EBSTCONbits
	extern _MISTATbits
	extern _EFLOCONbits
	extern _MACON1bits
	extern _MACON2bits
	extern _MACON3bits
	extern _MACON4bits
	extern _MACLCON1bits
	extern _MACLCON2bits
	extern _MICONbits
	extern _MICMDbits
	extern _EWOLIEbits
	extern _EWOLIRbits
	extern _ERXFCONbits
	extern _EIEbits
	extern _ESTATbits
	extern _ECON2bits
	extern _EIRbits
	extern _EDATAbits
	extern _SSP2CON2bits
	extern _SSP2CON1bits
	extern _SSP2STATbits
	extern _ECCP2DELbits
	extern _ECCP2ASbits
	extern _ECCP3DELbits
	extern _ECCP3ASbits
	extern _RCSTA2bits
	extern _TXSTA2bits
	extern _CCP5CONbits
	extern _CCP4CONbits
	extern _T4CONbits
	extern _ECCP1DELbits
	extern _BAUDCON2bits
	extern _BAUDCTL2bits
	extern _BAUDCONbits
	extern _BAUDCON1bits
	extern _BAUDCTLbits
	extern _BAUDCTL1bits
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _PORTFbits
	extern _PORTGbits
	extern _PORTHbits
	extern _PORTJbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _LATFbits
	extern _LATGbits
	extern _LATHbits
	extern _LATJbits
	extern _DDRAbits
	extern _TRISAbits
	extern _DDRBbits
	extern _TRISBbits
	extern _DDRCbits
	extern _TRISCbits
	extern _DDRDbits
	extern _TRISDbits
	extern _DDREbits
	extern _TRISEbits
	extern _DDRFbits
	extern _TRISFbits
	extern _DDRGbits
	extern _TRISGbits
	extern _DDRHbits
	extern _TRISHbits
	extern _DDRJbits
	extern _TRISJbits
	extern _OSCTUNEbits
	extern _MEMCONbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _PIE3bits
	extern _PIR3bits
	extern _IPR3bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _RCSTA1bits
	extern _TXSTAbits
	extern _TXSTA1bits
	extern _PSPCONbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _CCP3CONbits
	extern _ECCP3CONbits
	extern _CCP2CONbits
	extern _ECCP2CONbits
	extern _CCP1CONbits
	extern _ECCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSP1CON2bits
	extern _SSPCON2bits
	extern _SSP1CON1bits
	extern _SSPCON1bits
	extern _SSP1STATbits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _ECON1bits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _stdin
	extern _stdout
	extern _LCDText
	extern _MAADR5
	extern _MAADR6
	extern _MAADR3
	extern _MAADR4
	extern _MAADR1
	extern _MAADR2
	extern _EBSTSD
	extern _EBSTCON
	extern _EBSTCS
	extern _EBSTCSL
	extern _EBSTCSH
	extern _MISTAT
	extern _EFLOCON
	extern _EPAUS
	extern _EPAUSL
	extern _EPAUSH
	extern _MACON1
	extern _MACON2
	extern _MACON3
	extern _MACON4
	extern _MABBIPG
	extern _MAIPG
	extern _MAIPGL
	extern _MAIPGH
	extern _MACLCON1
	extern _MACLCON2
	extern _MAMXFL
	extern _MAMXFLL
	extern _MAMXFLH
	extern _MICON
	extern _MICMD
	extern _MIREGADR
	extern _MIWR
	extern _MIWRL
	extern _MIWRH
	extern _MIRD
	extern _MIRDL
	extern _MIRDH
	extern _EHT0
	extern _EHT1
	extern _EHT2
	extern _EHT3
	extern _EHT4
	extern _EHT5
	extern _EHT6
	extern _EHT7
	extern _EPMM0
	extern _EPMM1
	extern _EPMM2
	extern _EPMM3
	extern _EPMM4
	extern _EPMM5
	extern _EPMM6
	extern _EPMM7
	extern _EPMCS
	extern _EPMCSL
	extern _EPMCSH
	extern _EPMO
	extern _EPMOL
	extern _EPMOH
	extern _EWOLIE
	extern _EWOLIR
	extern _ERXFCON
	extern _EPKTCNT
	extern _EWRPT
	extern _EWRPTL
	extern _EWRPTH
	extern _ETXST
	extern _ETXSTL
	extern _ETXSTH
	extern _ETXND
	extern _ETXNDL
	extern _ETXNDH
	extern _ERXST
	extern _ERXSTL
	extern _ERXSTH
	extern _ERXND
	extern _ERXNDL
	extern _ERXNDH
	extern _ERXRDPT
	extern _ERXRDPTL
	extern _ERXRDPTH
	extern _ERXWRPT
	extern _ERXWRPTL
	extern _ERXWRPTH
	extern _EDMAST
	extern _EDMASTL
	extern _EDMASTH
	extern _EDMAND
	extern _EDMANDL
	extern _EDMANDH
	extern _EDMADST
	extern _EDMADSTL
	extern _EDMADSTH
	extern _EDMACS
	extern _EDMACSL
	extern _EDMACSH
	extern _EIE
	extern _ESTAT
	extern _ECON2
	extern _EIR
	extern _EDATA
	extern _SSP2CON2
	extern _SSP2CON1
	extern _SSP2STAT
	extern _SSP2ADD
	extern _SSP2BUF
	extern _ECCP2DEL
	extern _ECCP2AS
	extern _ECCP3DEL
	extern _ECCP3AS
	extern _RCSTA2
	extern _TXSTA2
	extern _TXREG2
	extern _RCREG2
	extern _SPBRG2
	extern _CCP5CON
	extern _CCPR5
	extern _CCPR5L
	extern _CCPR5H
	extern _CCP4CON
	extern _CCPR4
	extern _CCPR4L
	extern _CCPR4H
	extern _T4CON
	extern _PR4
	extern _TMR4
	extern _ECCP1DEL
	extern _ERDPT
	extern _ERDPTL
	extern _ERDPTH
	extern _BAUDCON2
	extern _BAUDCTL2
	extern _SPBRGH2
	extern _BAUDCON
	extern _BAUDCON1
	extern _BAUDCTL
	extern _BAUDCTL1
	extern _SPBRGH
	extern _SPBRGH1
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _PORTF
	extern _PORTG
	extern _PORTH
	extern _PORTJ
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _LATF
	extern _LATG
	extern _LATH
	extern _LATJ
	extern _DDRA
	extern _TRISA
	extern _DDRB
	extern _TRISB
	extern _DDRC
	extern _TRISC
	extern _DDRD
	extern _TRISD
	extern _DDRE
	extern _TRISE
	extern _DDRF
	extern _TRISF
	extern _DDRG
	extern _TRISG
	extern _DDRH
	extern _TRISH
	extern _DDRJ
	extern _TRISJ
	extern _OSCTUNE
	extern _MEMCON
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _PIE3
	extern _PIR3
	extern _IPR3
	extern _EECON1
	extern _EECON2
	extern _RCSTA
	extern _RCSTA1
	extern _TXSTA
	extern _TXSTA1
	extern _TXREG
	extern _TXREG1
	extern _RCREG
	extern _RCREG1
	extern _SPBRG
	extern _SPBRG1
	extern _PSPCON
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _CCP3CON
	extern _ECCP3CON
	extern _CCPR3
	extern _CCPR3L
	extern _CCPR3H
	extern _CCP2CON
	extern _ECCP2CON
	extern _CCPR2
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _ECCP1CON
	extern _CCPR1
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRES
	extern _ADRESL
	extern _ADRESH
	extern _SSP1CON2
	extern _SSPCON2
	extern _SSP1CON1
	extern _SSPCON1
	extern _SSP1STAT
	extern _SSPSTAT
	extern _SSP1ADD
	extern _SSPADD
	extern _SSP1BUF
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _ECON1
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PROD
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTR
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PC
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOS
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _ultoa
	extern _strlen
	extern _LCDInit
	extern _LCDUpdate
	extern __mulint
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_firstLine	db	0x54, 0x69, 0x6d, 0x65, 0x20, 0x20, 0x30, 0x30, 0x3a, 0x30, 0x30, 0x3a
	db	0x30, 0x30, 0x00
_secondLine	db	0x41, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x20, 0x4e, 0x20, 0x30, 0x30, 0x3a
	db	0x30, 0x30, 0x00
_firstTab	db	0x06, 0x00, 0x07, 0x00, 0x09, 0x00, 0x0a, 0x00, 0x0c, 0x00, 0x0d, 0x00
_secondTab	db	0x07, 0x00, 0x09, 0x00, 0x0a, 0x00, 0x0c, 0x00, 0x0d, 0x00
_posC	db	0x00, 0x00
_posA	db	0x00, 0x00
_bin	db	0x00, 0x00
_isAlarm	db	0x00, 0x00
_ringtone	db	0x00, 0x00
_currentMode	db	0x00
_count	db	0x00, 0x00
_temp1	db	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	db	0x20, 0x20, 0x20, 0x00
_temp2	db	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	db	0x20, 0x20, 0x20, 0x00
_tempA	db	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1

udata_pic_0	udata
_DisplayWORD_WDigit_1_1	res	6

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_pic_ivec_0x1_HighISR	code	0X000008
ivec_0x1_HighISR:
	GOTO	_HighISR

; I code from now on!
; ; Starting pCode block
S_pic__main	code
_main:
;	.line	474; pic.c	LED0_TRIS = 0; // Configure 1st led pin as output (yellow)
	BCF	_TRISJbits, 0
;	.line	475; pic.c	LED1_TRIS = 0; // Configure 2nd led pin as output (red)
	BCF	_TRISJbits, 1
;	.line	476; pic.c	LED2_TRIS = 0; // Configure 3rd led pin as output (red)
	BCF	_TRISJbits, 2
;	.line	478; pic.c	BUTTON0_TRIS = 1; // Configure button0 as input
	BSF	_TRISBbits, 3
;	.line	479; pic.c	BUTTON1_TRIS = 1; // Configure button1 as input
	BSF	_TRISBbits, 1
;	.line	481; pic.c	RCONbits.IPEN      = 1;   // Enable interrupts priority levels
	BSF	_RCONbits, 7
;	.line	482; pic.c	INTCON3bits.INT1F  = 0;   // Clear INT1 flag
	BCF	_INTCON3bits, 0
;	.line	483; pic.c	INTCON3bits.INT3F  = 0;   // Clear INT3 flag
	BCF	_INTCON3bits, 2
;	.line	484; pic.c	INTCON3bits.INT1P  = 1;   // Connect INT1 interrupt (button 1) to high priority
	BSF	_INTCON3bits, 6
;	.line	486; pic.c	INTCON2bits.INTEDG1= 0;   // INT1 interrupts on falling edge
	BCF	_INTCON2bits, 5
;	.line	487; pic.c	INTCON2bits.INTEDG3= 0;   // INT3 interrupts on falling edge
	BCF	_INTCON2bits, 3
;	.line	488; pic.c	INTCONbits.GIE     = 1;   // Enable high priority interrupts
	BSF	_INTCONbits, 7
;	.line	489; pic.c	INTCON3bits.INT1E  = 1;   // Enable INT1 interrupt (button 1)
	BSF	_INTCON3bits, 3
;	.line	490; pic.c	INTCON3bits.INT3E  = 1;   // Enable INT3 interupt (button 0)
	BSF	_INTCON3bits, 5
;	.line	492; pic.c	T0CONbits.T0CS   = 0; //use timer0 instruction cycle clock
	BCF	_T0CONbits, 5
;	.line	493; pic.c	LCDInit();
	CALL	_LCDInit
;	.line	494; pic.c	init_board();
	CALL	_init_board
;	.line	496; pic.c	DisplayString(FIRST_LINE,firstLine);
	MOVLW	HIGH(_firstLine)
	MOVWF	r0x01
	MOVLW	LOW(_firstLine)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	497; pic.c	DisplayString(SECOND_LINE,secondLine);
	MOVLW	HIGH(_secondLine)
	MOVWF	r0x01
	MOVLW	LOW(_secondLine)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	499; pic.c	INTCON2bits.TMR0IP	 = 1; // Interruption du au timer = interruption haute
	BSF	_INTCON2bits, 2
;	.line	500; pic.c	INTCONbits.TMR0IF = 0; // reset flag
	BCF	_INTCONbits, 2
;	.line	501; pic.c	T0CONbits.T08BIT = 1; // use timer0 8-bit counter
	BSF	_T0CONbits, 6
;	.line	502; pic.c	T0CONbits.PSA = 1; // disable timer0 prescaler
	BSF	_T0CONbits, 3
;	.line	503; pic.c	INTCONbits.TMR0IE = 1; // On active les interuptions TMR0
	BSF	_INTCONbits, 5
;	.line	504; pic.c	LED1_IO = 0; //turn off the led
	BCF	_LATJbits, 1
;	.line	505; pic.c	LED2_IO = 0;
	BCF	_LATJbits, 2
;	.line	506; pic.c	LED0_IO = 0;
	BCF	_LATJbits, 0
	RETURN	

; ; Starting pCode block
S_pic__strlcpy	code
_strlcpy:
;	.line	442; pic.c	strlcpy(char *dst, const char *src, size_t siz)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	444; pic.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	445; pic.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	446; pic.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	449; pic.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00426_DS_
;	.line	451; pic.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00422_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00441_DS_
;	.line	453; pic.c	if ((*d++ = *s++) == '\0')
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x15
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x15, W
	BNZ	_00422_DS_
_00441_DS_:
;	.line	454; pic.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00426_DS_:
;	.line	459; pic.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00433_DS_
;	.line	461; pic.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00440_DS_
;	.line	462; pic.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00440_DS_:
;	.line	463; pic.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00429_DS_:
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x06, W
	BNZ	_00429_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00433_DS_:
;	.line	469; pic.c	return (s - src - 1);       /* count does not include NUL */
	MOVF	r0x03, W
	SUBWF	r0x0b, W
	MOVWF	r0x03
	MOVF	r0x04, W
	SUBWFB	r0x0c, W
	MOVWF	r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__DisplayString	code
_DisplayString:
;	.line	433; pic.c	DisplayString(BYTE pos, char* text)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	435; pic.c	BYTE l= strlen(text)+1;
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x03
	ADDWF	FSR1L, F
	INCF	r0x04, F
;	.line	436; pic.c	BYTE max= 32-pos;
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	437; pic.c	strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
	CLRF	r0x06
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x07
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00413_DS_
	MOVFF	r0x05, r0x04
_00413_DS_:
	CLRF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_strlcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	438; pic.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__DisplayWORD	code
_DisplayWORD:
;	.line	414; pic.c	DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	422; pic.c	ultoa(w, WDigit, radix);
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_ultoa
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	423; pic.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00394_DS_:
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	r0x01, r0x04
	CLRF	r0x05
	MOVF	r0x05, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x03, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00404_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00404_DS_:
	BC	_00397_DS_
;	.line	425; pic.c	LCDText[LCDPos++] = WDigit[j];
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_LCDText)
	ADDWF	r0x02, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x03, F
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	423; pic.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00394_DS_
_00397_DS_:
;	.line	427; pic.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00405_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00405_DS_:
	BC	_00393_DS_
;	.line	428; pic.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00393_DS_:
;	.line	429; pic.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__init_board	code
_init_board:
;	.line	408; pic.c	init_board(void) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	409; pic.c	TRISJbits.TRISJ0=0; // configure PORTJ0 for output (LED)
	BCF	_TRISJbits, 0
;	.line	410; pic.c	TRISJbits.TRISJ1=0; // configure PORTJ1 for output (LED)
	BCF	_TRISJbits, 1
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__blink	code
_blink:
;	.line	349; pic.c	blink()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	351; pic.c	strlcpy(temp1,firstLine,16);
	MOVLW	HIGH(_temp1)
	MOVWF	r0x01
	MOVLW	LOW(_temp1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_firstLine)
	MOVWF	r0x04
	MOVLW	LOW(_firstLine)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_strlcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	352; pic.c	strlcpy(temp2,secondLine,16);
	MOVLW	HIGH(_temp2)
	MOVWF	r0x01
	MOVLW	LOW(_temp2)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_secondLine)
	MOVWF	r0x04
	MOVLW	LOW(_secondLine)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_strlcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BANKSEL	_bin
;	.line	354; pic.c	if(bin)//Rentre si bin = 1 => Déjà afficher quelque chose sur écran sans "trou"/curseur
	MOVF	_bin, W, B
	BANKSEL	(_bin + 1)
	IORWF	(_bin + 1), W, B
	BTFSC	STATUS, 2
	BRA	_00360_DS_
	BANKSEL	_currentMode
;	.line	356; pic.c	if(currentMode==TIME)
	MOVF	_currentMode, W, B
	XORLW	0x01
	BNZ	_00357_DS_
;	.line	358; pic.c	temp1[0]=' ';
	MOVLW	0x20
	BANKSEL	_temp1
	MOVWF	_temp1, B
;	.line	359; pic.c	temp1[1]=' ';
	MOVLW	0x20
	BANKSEL	(_temp1 + 1)
	MOVWF	(_temp1 + 1), B
;	.line	360; pic.c	temp1[2]=' ';
	MOVLW	0x20
	BANKSEL	(_temp1 + 2)
	MOVWF	(_temp1 + 2), B
;	.line	361; pic.c	temp1[3]=' ';
	MOVLW	0x20
	BANKSEL	(_temp1 + 3)
	MOVWF	(_temp1 + 3), B
;	.line	362; pic.c	temp1[4]=' ';
	MOVLW	0x20
	BANKSEL	(_temp1 + 4)
	MOVWF	(_temp1 + 4), B
;	.line	363; pic.c	DisplayString(FIRST_LINE,temp1);
	MOVLW	HIGH(_temp1)
	MOVWF	r0x01
	MOVLW	LOW(_temp1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	364; pic.c	DisplayString(SECOND_LINE,temp2);
	MOVLW	HIGH(_temp2)
	MOVWF	r0x01
	MOVLW	LOW(_temp2)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00358_DS_
_00357_DS_:
	BANKSEL	_currentMode
;	.line	366; pic.c	else if(currentMode==ALARM)
	MOVF	_currentMode, W, B
	XORLW	0x02
	BNZ	_00354_DS_
;	.line	368; pic.c	temp2[0]=' ';
	MOVLW	0x20
	BANKSEL	_temp2
	MOVWF	_temp2, B
;	.line	369; pic.c	temp2[1]=' ';
	MOVLW	0x20
	BANKSEL	(_temp2 + 1)
	MOVWF	(_temp2 + 1), B
;	.line	370; pic.c	temp2[2]=' ';
	MOVLW	0x20
	BANKSEL	(_temp2 + 2)
	MOVWF	(_temp2 + 2), B
;	.line	371; pic.c	temp2[3]=' ';
	MOVLW	0x20
	BANKSEL	(_temp2 + 3)
	MOVWF	(_temp2 + 3), B
;	.line	372; pic.c	temp2[4]=' ';
	MOVLW	0x20
	BANKSEL	(_temp2 + 4)
	MOVWF	(_temp2 + 4), B
;	.line	373; pic.c	DisplayString(FIRST_LINE,temp1);
	MOVLW	HIGH(_temp1)
	MOVWF	r0x01
	MOVLW	LOW(_temp1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	374; pic.c	DisplayString(SECOND_LINE,temp2);
	MOVLW	HIGH(_temp2)
	MOVWF	r0x01
	MOVLW	LOW(_temp2)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00358_DS_
_00354_DS_:
	BANKSEL	_currentMode
;	.line	376; pic.c	else if(currentMode==EDIT_T)
	MOVF	_currentMode, W, B
	XORLW	0x03
	BZ	_00376_DS_
	BRA	_00351_DS_
_00376_DS_:
	BANKSEL	(_posC + 1)
;	.line	378; pic.c	temp1[firstTab[posC]]=' ';
	MOVF	(_posC + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_posC
	MOVF	_posC, W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_firstTab)
	ADDWF	r0x00, F
	MOVLW	HIGH(_firstTab)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
	MOVLW	LOW(_temp1)
	ADDWF	r0x00, F
	MOVLW	HIGH(_temp1)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x20
	MOVWF	INDF0
;	.line	379; pic.c	DisplayString(FIRST_LINE,temp1);
	MOVLW	HIGH(_temp1)
	MOVWF	r0x01
	MOVLW	LOW(_temp1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	380; pic.c	DisplayString(SECOND_LINE,temp2);
	MOVLW	HIGH(_temp2)
	MOVWF	r0x01
	MOVLW	LOW(_temp2)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00358_DS_
_00351_DS_:
	BANKSEL	_currentMode
;	.line	382; pic.c	else if(currentMode==EDIT_A)
	MOVF	_currentMode, W, B
	XORLW	0x04
	BZ	_00378_DS_
	BRA	_00348_DS_
_00378_DS_:
	BANKSEL	(_posA + 1)
;	.line	384; pic.c	temp2[secondTab[posA]]=' ';
	MOVF	(_posA + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_posA
	MOVF	_posA, W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_secondTab)
	ADDWF	r0x00, F
	MOVLW	HIGH(_secondTab)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
	MOVLW	LOW(_temp2)
	ADDWF	r0x00, F
	MOVLW	HIGH(_temp2)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x20
	MOVWF	INDF0
;	.line	385; pic.c	DisplayString(FIRST_LINE,temp1);
	MOVLW	HIGH(_temp1)
	MOVWF	r0x01
	MOVLW	LOW(_temp1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	386; pic.c	DisplayString(SECOND_LINE,temp2);
	MOVLW	HIGH(_temp2)
	MOVWF	r0x01
	MOVLW	LOW(_temp2)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00358_DS_
_00348_DS_:
	BANKSEL	_currentMode
;	.line	389; pic.c	else if(currentMode==HELLO)
	MOVF	_currentMode, W, B
	XORLW	0x05
	BNZ	_00345_DS_
;	.line	391; pic.c	info_A();
	CALL	_info_A
	BRA	_00358_DS_
_00345_DS_:
	BANKSEL	_currentMode
;	.line	393; pic.c	else if(currentMode==RINGTONE)
	MOVF	_currentMode, W, B
	XORLW	0x06
	BNZ	_00358_DS_
;	.line	396; pic.c	DisplayString(FIRST_LINE,"Good morning Louvain-La-Neuve");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
_00358_DS_:
;	.line	398; pic.c	bin--;
	MOVLW	0xff
	BANKSEL	_bin
	ADDWF	_bin, F, B
	BC	_10446_DS_
	BANKSEL	(_bin + 1)
	DECF	(_bin + 1), F, B
_10446_DS_:
	BRA	_00362_DS_
_00360_DS_:
;	.line	402; pic.c	DisplayString(FIRST_LINE,firstLine);
	MOVLW	HIGH(_firstLine)
	MOVWF	r0x01
	MOVLW	LOW(_firstLine)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	403; pic.c	DisplayString(SECOND_LINE,secondLine);
	MOVLW	HIGH(_secondLine)
	MOVWF	r0x01
	MOVLW	LOW(_secondLine)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_bin
;	.line	404; pic.c	bin++;
	INCF	_bin, F, B
	BNC	_20447_DS_
	BANKSEL	(_bin + 1)
	INCF	(_bin + 1), F, B
_20447_DS_:
_00362_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__info_A	code
_info_A:
;	.line	325; pic.c	info_A()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_isAlarm
;	.line	327; pic.c	if (isAlarm)
	MOVF	_isAlarm, W, B
	BANKSEL	(_isAlarm + 1)
	IORWF	(_isAlarm + 1), W, B
	BTFSC	STATUS, 2
	BRA	_00335_DS_
;	.line	330; pic.c	tempA[0] = ' ';
	MOVLW	0x20
	BANKSEL	_tempA
	MOVWF	_tempA, B
;	.line	331; pic.c	tempA[1] = ' ';
	MOVLW	0x20
	BANKSEL	(_tempA + 1)
	MOVWF	(_tempA + 1), B
;	.line	332; pic.c	tempA[2] = ' ';
	MOVLW	0x20
	BANKSEL	(_tempA + 2)
	MOVWF	(_tempA + 2), B
	BANKSEL	(_secondLine + 9)
;	.line	333; pic.c	tempA[3] = secondLine[9];
	MOVF	(_secondLine + 9), W, B
	BANKSEL	(_tempA + 3)
	MOVWF	(_tempA + 3), B
	BANKSEL	(_secondLine + 10)
;	.line	334; pic.c	tempA[4] = secondLine[10];
	MOVF	(_secondLine + 10), W, B
	BANKSEL	(_tempA + 4)
	MOVWF	(_tempA + 4), B
	BANKSEL	(_secondLine + 11)
;	.line	335; pic.c	tempA[5] = secondLine[11];
	MOVF	(_secondLine + 11), W, B
	BANKSEL	(_tempA + 5)
	MOVWF	(_tempA + 5), B
	BANKSEL	(_secondLine + 12)
;	.line	336; pic.c	tempA[6] = secondLine[12];
	MOVF	(_secondLine + 12), W, B
	BANKSEL	(_tempA + 6)
	MOVWF	(_tempA + 6), B
	BANKSEL	(_secondLine + 13)
;	.line	337; pic.c	tempA[7] = secondLine[13];
	MOVF	(_secondLine + 13), W, B
	BANKSEL	(_tempA + 7)
	MOVWF	(_tempA + 7), B
;	.line	339; pic.c	DisplayString(FIRST_LINE, "Alarm is ON");
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	340; pic.c	DisplayString(SECOND_LINE,tempA);
	MOVLW	HIGH(_tempA)
	MOVWF	r0x01
	MOVLW	LOW(_tempA)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00337_DS_
_00335_DS_:
;	.line	344; pic.c	DisplayString(FIRST_LINE, "Alarm is off");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	345; pic.c	DisplayString(SECOND_LINE,"");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
_00337_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__changeTime	code
_changeTime:
;	.line	304; pic.c	changeTime()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	(_posC + 1)
;	.line	306; pic.c	firstLine[firstTab[posC]]++;
	MOVF	(_posC + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_posC
	MOVF	_posC, W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_firstTab)
	ADDWF	r0x00, F
	MOVLW	HIGH(_firstTab)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
	MOVLW	LOW(_firstLine)
	ADDWF	r0x00, F
	MOVLW	HIGH(_firstLine)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x02
	INCF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	BANKSEL	(_firstLine + 13)
;	.line	310; pic.c	if((firstLine[13]>=':')
	MOVF	(_firstLine + 13), W, B
	ADDLW	0x80
	ADDLW	0x46
	BC	_00305_DS_
	BANKSEL	(_firstLine + 10)
;	.line	311; pic.c	||(firstLine[10]>=':')
	MOVF	(_firstLine + 10), W, B
	ADDLW	0x80
	ADDLW	0x46
	BC	_00305_DS_
	BANKSEL	(_firstLine + 12)
;	.line	312; pic.c	||(firstLine[12]>='6')
	MOVF	(_firstLine + 12), W, B
	ADDLW	0x80
	ADDLW	0x4a
	BC	_00305_DS_
	BANKSEL	(_firstLine + 9)
;	.line	313; pic.c	||(firstLine[9]>='6')
	MOVF	(_firstLine + 9), W, B
	ADDLW	0x80
	ADDLW	0x4a
	BC	_00305_DS_
	BANKSEL	(_firstLine + 7)
;	.line	314; pic.c	||(firstLine[7]>=':'))
	MOVF	(_firstLine + 7), W, B
	ADDLW	0x80
	ADDLW	0x46
	BNC	_00306_DS_
_00305_DS_:
;	.line	316; pic.c	firstLine[firstTab[posC]]='0';
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x30
	MOVWF	INDF0
_00306_DS_:
;	.line	318; pic.c	if(((firstLine[6]>='2')&&(firstLine[7]>='4'))
	MOVFF	(_firstLine + 6), r0x02
	MOVF	r0x02, W
	ADDLW	0x80
	ADDLW	0x4e
	BNC	_00314_DS_
	BANKSEL	(_firstLine + 7)
	MOVF	(_firstLine + 7), W, B
	ADDLW	0x80
	ADDLW	0x4c
	BC	_00311_DS_
_00314_DS_:
;	.line	319; pic.c	||(firstLine[6]>='3'))//24h
	MOVF	r0x02, W
	ADDLW	0x80
	ADDLW	0x4d
	BNC	_00315_DS_
_00311_DS_:
;	.line	321; pic.c	firstLine[firstTab[posC]]='0';
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x30
	MOVWF	INDF0
_00315_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__move	code
_move:
;	.line	274; pic.c	move()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_currentMode
;	.line	276; pic.c	if(currentMode==EDIT_T)
	MOVF	_currentMode, W, B
	XORLW	0x03
	BNZ	_00285_DS_
_00294_DS_:
	BANKSEL	_posC
;	.line	279; pic.c	if(posC==LEN_C)
	MOVF	_posC, W, B
	XORLW	0x05
	BNZ	_00295_DS_
	BANKSEL	(_posC + 1)
	MOVF	(_posC + 1), W, B
	BZ	_00296_DS_
_00295_DS_:
	BRA	_00277_DS_
_00296_DS_:
	BANKSEL	_posC
;	.line	281; pic.c	posC=0;
	CLRF	_posC, B
	BANKSEL	(_posC + 1)
	CLRF	(_posC + 1), B
	BANKSEL	_currentMode
;	.line	282; pic.c	currentMode=ACCUEIL;
	CLRF	_currentMode, B
	BRA	_00287_DS_
_00277_DS_:
	BANKSEL	_posC
;	.line	286; pic.c	posC++;/*On passe à la prochaine position*/
	INCF	_posC, F, B
	BNC	_30448_DS_
	BANKSEL	(_posC + 1)
	INCF	(_posC + 1), F, B
_30448_DS_:
	BRA	_00287_DS_
_00285_DS_:
	BANKSEL	_currentMode
;	.line	289; pic.c	else if(currentMode==EDIT_A)
	MOVF	_currentMode, W, B
	XORLW	0x04
	BNZ	_00287_DS_
_00298_DS_:
	BANKSEL	_posA
;	.line	292; pic.c	if(posA==LEN_A)
	MOVF	_posA, W, B
	XORLW	0x04
	BNZ	_00299_DS_
	BANKSEL	(_posA + 1)
	MOVF	(_posA + 1), W, B
	BZ	_00300_DS_
_00299_DS_:
	BRA	_00280_DS_
_00300_DS_:
	BANKSEL	_posA
;	.line	294; pic.c	posA=0;
	CLRF	_posA, B
	BANKSEL	(_posA + 1)
	CLRF	(_posA + 1), B
	BANKSEL	_currentMode
;	.line	295; pic.c	currentMode=ACCUEIL;
	CLRF	_currentMode, B
	BRA	_00287_DS_
_00280_DS_:
	BANKSEL	_posA
;	.line	299; pic.c	posA++;/*On passe à la prochaine position*/
	INCF	_posA, F, B
	BNC	_40449_DS_
	BANKSEL	(_posA + 1)
	INCF	(_posA + 1), F, B
_40449_DS_:
_00287_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__actionButton2	code
_actionButton2:
;	.line	227; pic.c	actionButton2()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	229; pic.c	switch(currentMode)
	MOVLW	0x07
	BANKSEL	_currentMode
	SUBWF	_currentMode, W, B
	BTFSC	STATUS, 0
	BRA	_00267_DS_
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	CLRF	r0x01
	BANKSEL	_currentMode
	RLCF	_currentMode, W, B
	RLCF	r0x01, F
	RLCF	WREG, W
	RLCF	r0x01, F
	ANDLW	0xfc
	MOVWF	r0x00
	MOVLW	UPPER(_00271_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00271_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00271_DS_)
	ADDWF	r0x00, F
	MOVF	r0x01, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVWF	PCL
_00271_DS_:
	GOTO	_00258_DS_
	GOTO	_00260_DS_
	GOTO	_00261_DS_
	GOTO	_00262_DS_
	GOTO	_00263_DS_
	GOTO	_00259_DS_
	GOTO	_00264_DS_
_00258_DS_:
;	.line	234; pic.c	currentMode=HELLO;
	MOVLW	0x05
	BANKSEL	_currentMode
	MOVWF	_currentMode, B
;	.line	235; pic.c	break;
	BRA	_00267_DS_
_00259_DS_:
	BANKSEL	_currentMode
;	.line	239; pic.c	currentMode=ACCUEIL;
	CLRF	_currentMode, B
;	.line	240; pic.c	break;
	BRA	_00267_DS_
_00260_DS_:
;	.line	244; pic.c	currentMode=ALARM;
	MOVLW	0x02
	BANKSEL	_currentMode
	MOVWF	_currentMode, B
;	.line	245; pic.c	break;
	BRA	_00267_DS_
_00261_DS_:
;	.line	249; pic.c	currentMode=TIME;
	MOVLW	0x01
	BANKSEL	_currentMode
	MOVWF	_currentMode, B
;	.line	250; pic.c	break;
	BRA	_00267_DS_
_00262_DS_:
;	.line	254; pic.c	changeTime();
	CALL	_changeTime
;	.line	255; pic.c	break;
	BRA	_00267_DS_
_00263_DS_:
;	.line	259; pic.c	setAlarm();
	CALL	_setAlarm
;	.line	260; pic.c	break;
	BRA	_00267_DS_
_00264_DS_:
	BANKSEL	_ringtone
;	.line	265; pic.c	ringtone=0;
	CLRF	_ringtone, B
	BANKSEL	(_ringtone + 1)
	CLRF	(_ringtone + 1), B
;	.line	266; pic.c	LED2_IO = 0;
	BCF	_LATJbits, 2
	BANKSEL	_currentMode
;	.line	267; pic.c	currentMode=ACCUEIL;
	CLRF	_currentMode, B
_00267_DS_:
;	.line	271; pic.c	}
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__actionButton1	code
_actionButton1:
;	.line	180; pic.c	actionButton1()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	182; pic.c	switch(currentMode)
	MOVLW	0x07
	BANKSEL	_currentMode
	SUBWF	_currentMode, W, B
	BTFSC	STATUS, 0
	BRA	_00249_DS_
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	CLRF	r0x01
	BANKSEL	_currentMode
	RLCF	_currentMode, W, B
	RLCF	r0x01, F
	RLCF	WREG, W
	RLCF	r0x01, F
	ANDLW	0xfc
	MOVWF	r0x00
	MOVLW	UPPER(_00253_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00253_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00253_DS_)
	ADDWF	r0x00, F
	MOVF	r0x01, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVWF	PCL
_00253_DS_:
	GOTO	_00241_DS_
	GOTO	_00242_DS_
	GOTO	_00243_DS_
	GOTO	_00244_DS_
	GOTO	_00245_DS_
	GOTO	_00240_DS_
	GOTO	_00246_DS_
_00240_DS_:
	BANKSEL	_currentMode
;	.line	187; pic.c	currentMode=ACCUEIL;
	CLRF	_currentMode, B
;	.line	188; pic.c	break;
	BRA	_00249_DS_
_00241_DS_:
;	.line	192; pic.c	currentMode=TIME;
	MOVLW	0x01
	BANKSEL	_currentMode
	MOVWF	_currentMode, B
;	.line	193; pic.c	break;
	BRA	_00249_DS_
_00242_DS_:
;	.line	197; pic.c	currentMode=EDIT_T;
	MOVLW	0x03
	BANKSEL	_currentMode
	MOVWF	_currentMode, B
;	.line	198; pic.c	break;
	BRA	_00249_DS_
_00243_DS_:
;	.line	202; pic.c	currentMode=EDIT_A;
	MOVLW	0x04
	BANKSEL	_currentMode
	MOVWF	_currentMode, B
;	.line	203; pic.c	break;
	BRA	_00249_DS_
_00244_DS_:
;	.line	207; pic.c	move();
	CALL	_move
;	.line	208; pic.c	break;
	BRA	_00249_DS_
_00245_DS_:
;	.line	212; pic.c	move();
	CALL	_move
;	.line	213; pic.c	break;
	BRA	_00249_DS_
_00246_DS_:
	BANKSEL	_ringtone
;	.line	218; pic.c	ringtone=0;
	CLRF	_ringtone, B
	BANKSEL	(_ringtone + 1)
	CLRF	(_ringtone + 1), B
;	.line	219; pic.c	LED2_IO = 0;
	BCF	_LATJbits, 2
	BANKSEL	_currentMode
;	.line	220; pic.c	currentMode=ACCUEIL;
	CLRF	_currentMode, B
_00249_DS_:
;	.line	224; pic.c	}
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__setAlarm	code
_setAlarm:
;	.line	146; pic.c	setAlarm()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_posA
;	.line	149; pic.c	if(posA!=0)
	MOVF	_posA, W, B
	BANKSEL	(_posA + 1)
	IORWF	(_posA + 1), W, B
	BTFSC	STATUS, 2
	BRA	_00217_DS_
	BANKSEL	(_posA + 1)
;	.line	151; pic.c	secondLine[secondTab[posA]]++; //+1
	MOVF	(_posA + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_posA
	MOVF	_posA, W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_secondTab)
	ADDWF	r0x00, F
	MOVLW	HIGH(_secondTab)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
	MOVLW	LOW(_secondLine)
	ADDWF	r0x00, F
	MOVLW	HIGH(_secondLine)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x02
	INCF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	BANKSEL	(_secondLine + 13)
;	.line	152; pic.c	if((secondLine[13]>=':')
	MOVF	(_secondLine + 13), W, B
	ADDLW	0x80
	ADDLW	0x46
	BC	_00204_DS_
	BANKSEL	(_secondLine + 10)
;	.line	153; pic.c	||(secondLine[10]>=':')
	MOVF	(_secondLine + 10), W, B
	ADDLW	0x80
	ADDLW	0x46
	BC	_00204_DS_
	BANKSEL	(_secondLine + 12)
;	.line	154; pic.c	||(secondLine[12]>='6')
	MOVF	(_secondLine + 12), W, B
	ADDLW	0x80
	ADDLW	0x4a
	BC	_00204_DS_
	BANKSEL	(_secondLine + 9)
;	.line	155; pic.c	||(secondLine[9]>=':'))
	MOVF	(_secondLine + 9), W, B
	ADDLW	0x80
	ADDLW	0x46
	BNC	_00205_DS_
_00204_DS_:
;	.line	157; pic.c	secondLine[secondTab[posA]]='0';
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x30
	MOVWF	INDF0
_00205_DS_:
;	.line	159; pic.c	if(((secondLine[9]>='2')&&(secondLine[10]>='4'))
	MOVFF	(_secondLine + 9), r0x02
	MOVF	r0x02, W
	ADDLW	0x80
	ADDLW	0x4e
	BNC	_00212_DS_
	BANKSEL	(_secondLine + 10)
	MOVF	(_secondLine + 10), W, B
	ADDLW	0x80
	ADDLW	0x4c
	BC	_00209_DS_
_00212_DS_:
;	.line	160; pic.c	||(secondLine[9]>='3'))//24h
	MOVF	r0x02, W
	ADDLW	0x80
	ADDLW	0x4d
	BNC	_00219_DS_
_00209_DS_:
;	.line	162; pic.c	secondLine[secondTab[posA]]='0';
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x30
	MOVWF	INDF0
	BRA	_00219_DS_
_00217_DS_:
	BANKSEL	(_secondLine + 7)
;	.line	167; pic.c	if(secondLine[7]=='N')
	MOVF	(_secondLine + 7), W, B
	XORLW	0x4e
	BNZ	_00214_DS_
;	.line	169; pic.c	isAlarm=1;
	MOVLW	0x01
	BANKSEL	_isAlarm
	MOVWF	_isAlarm, B
	BANKSEL	(_isAlarm + 1)
	CLRF	(_isAlarm + 1), B
;	.line	170; pic.c	secondLine[7]='Y';
	MOVLW	0x59
	BANKSEL	(_secondLine + 7)
	MOVWF	(_secondLine + 7), B
	BRA	_00219_DS_
_00214_DS_:
;	.line	174; pic.c	secondLine[7]='N';
	MOVLW	0x4e
	BANKSEL	(_secondLine + 7)
	MOVWF	(_secondLine + 7), B
	BANKSEL	_isAlarm
;	.line	175; pic.c	isAlarm=0;
	CLRF	_isAlarm, B
	BANKSEL	(_isAlarm + 1)
	CLRF	(_isAlarm + 1), B
_00219_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__checkAlarm	code
_checkAlarm:
;	.line	133; pic.c	checkAlarm()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	(_firstLine + 6)
;	.line	135; pic.c	if((firstLine[6]==secondLine[9])
	MOVF	(_firstLine + 6), W, B
	BANKSEL	(_secondLine + 9)
	XORWF	(_secondLine + 9), W, B
	BNZ	_00180_DS_
_00189_DS_:
	BANKSEL	(_firstLine + 7)
;	.line	136; pic.c	&&(firstLine[7]==secondLine[10])
	MOVF	(_firstLine + 7), W, B
	BANKSEL	(_secondLine + 10)
	XORWF	(_secondLine + 10), W, B
	BNZ	_00180_DS_
_00191_DS_:
	BANKSEL	(_firstLine + 9)
;	.line	137; pic.c	&&(firstLine[9]==secondLine[12])
	MOVF	(_firstLine + 9), W, B
	BANKSEL	(_secondLine + 12)
	XORWF	(_secondLine + 12), W, B
	BNZ	_00180_DS_
_00193_DS_:
	BANKSEL	(_firstLine + 10)
;	.line	138; pic.c	&&(firstLine[10]==secondLine[13])
	MOVF	(_firstLine + 10), W, B
	BANKSEL	(_secondLine + 13)
	XORWF	(_secondLine + 13), W, B
	BNZ	_00180_DS_
_00195_DS_:
	BANKSEL	(_firstLine + 12)
;	.line	139; pic.c	&&(firstLine[12]=='0')
	MOVF	(_firstLine + 12), W, B
	XORLW	0x30
	BNZ	_00180_DS_
_00197_DS_:
	BANKSEL	(_firstLine + 13)
;	.line	140; pic.c	&&(firstLine[13]=='0'))
	MOVF	(_firstLine + 13), W, B
	XORLW	0x30
	BNZ	_00180_DS_
;	.line	142; pic.c	ringtone=30;//30 secondes d'alarme
	MOVLW	0x1e
	BANKSEL	_ringtone
	MOVWF	_ringtone, B
	BANKSEL	(_ringtone + 1)
	CLRF	(_ringtone + 1), B
_00180_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__increment	code
_increment:
;	.line	96; pic.c	increment()
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	98; pic.c	firstLine[13]++;
	MOVFF	(_firstLine + 13), r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_firstLine + 13)
	MOVWF	(_firstLine + 13), B
;	.line	99; pic.c	if(firstLine[13]==':')// char après '9'
	MOVF	r0x00, W
	XORLW	0x3a
	BZ	_00158_DS_
	BRA	_00149_DS_
_00158_DS_:
;	.line	101; pic.c	firstLine[13]='0';
	MOVLW	0x30
	BANKSEL	(_firstLine + 13)
	MOVWF	(_firstLine + 13), B
;	.line	102; pic.c	firstLine[12]++;
	MOVFF	(_firstLine + 12), r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_firstLine + 12)
	MOVWF	(_firstLine + 12), B
;	.line	104; pic.c	if(firstLine[12]=='6')// 60 sec
	MOVF	r0x00, W
	XORLW	0x36
	BZ	_00160_DS_
	BRA	_00149_DS_
_00160_DS_:
;	.line	106; pic.c	firstLine[12]='0';
	MOVLW	0x30
	BANKSEL	(_firstLine + 12)
	MOVWF	(_firstLine + 12), B
;	.line	107; pic.c	firstLine[10]++;
	MOVFF	(_firstLine + 10), r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_firstLine + 10)
	MOVWF	(_firstLine + 10), B
;	.line	109; pic.c	if(firstLine[10]==':')
	MOVF	r0x00, W
	XORLW	0x3a
	BNZ	_00149_DS_
;	.line	111; pic.c	firstLine[10]='0';
	MOVLW	0x30
	BANKSEL	(_firstLine + 10)
	MOVWF	(_firstLine + 10), B
;	.line	112; pic.c	firstLine[9]++;
	MOVFF	(_firstLine + 9), r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_firstLine + 9)
	MOVWF	(_firstLine + 9), B
;	.line	114; pic.c	if(firstLine[9]=='6')
	MOVF	r0x00, W
	XORLW	0x36
	BNZ	_00149_DS_
;	.line	116; pic.c	firstLine[9]='0';
	MOVLW	0x30
	BANKSEL	(_firstLine + 9)
	MOVWF	(_firstLine + 9), B
;	.line	117; pic.c	firstLine[7]++;
	MOVFF	(_firstLine + 7), r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_firstLine + 7)
	MOVWF	(_firstLine + 7), B
;	.line	118; pic.c	if(firstLine[7]=='4')// 24h
	MOVF	r0x00, W
	XORLW	0x34
	BNZ	_00149_DS_
;	.line	120; pic.c	firstLine[7]='0';
	MOVLW	0x30
	BANKSEL	(_firstLine + 7)
	MOVWF	(_firstLine + 7), B
;	.line	121; pic.c	firstLine[6]++;
	MOVFF	(_firstLine + 6), r0x00
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_firstLine + 6)
	MOVWF	(_firstLine + 6), B
;	.line	122; pic.c	if(firstLine[6]=='3')//24h
	MOVF	r0x00, W
	XORLW	0x33
	BNZ	_00149_DS_
;	.line	124; pic.c	firstLine[6]='0';
	MOVLW	0x30
	BANKSEL	(_firstLine + 6)
	MOVWF	(_firstLine + 6), B
_00149_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_pic__HighISR	code
_HighISR:
;	.line	45; pic.c	HighISR (void) __interrupt (1)
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	47; pic.c	if(INTCON3bits.INT1F)
	BTFSS	_INTCON3bits, 0
	BRA	_00106_DS_
;	.line	50; pic.c	actionButton1();
	CALL	_actionButton1
;	.line	51; pic.c	INTCON3bits.INT1F  = 0;
	BCF	_INTCON3bits, 0
_00106_DS_:
;	.line	54; pic.c	if(INTCON3bits.INT3F)
	BTFSS	_INTCON3bits, 2
	BRA	_00108_DS_
;	.line	57; pic.c	actionButton2();
	CALL	_actionButton2
;	.line	58; pic.c	INTCON3bits.INT3F  = 0;
	BCF	_INTCON3bits, 2
_00108_DS_:
;	.line	61; pic.c	if(INTCONbits.TMR0IF)
	BTFSS	_INTCONbits, 2
	BRA	_00120_DS_
	BANKSEL	_count
;	.line	64; pic.c	count++;
	INCF	_count, F, B
	BNC	_50450_DS_
	BANKSEL	(_count + 1)
	INCF	(_count + 1), F, B
_50450_DS_:
;	.line	65; pic.c	if(count>=CLOCK)
	MOVLW	0x5b
	BANKSEL	(_count + 1)
	SUBWF	(_count + 1), W, B
	BNZ	_00129_DS_
	MOVLW	0x01
	BANKSEL	_count
	SUBWF	_count, W, B
_00129_DS_:
	BTFSS	STATUS, 0
	BRA	_00117_DS_
;	.line	67; pic.c	count=count-CLOCK;
	MOVLW	0xff
	BANKSEL	_count
	ADDWF	_count, F, B
	MOVLW	0xa4
	BANKSEL	(_count + 1)
	ADDWFC	(_count + 1), F, B
	BANKSEL	_currentMode
;	.line	68; pic.c	if(currentMode==ACCUEIL)
	MOVF	_currentMode, W, B
	BNZ	_00110_DS_
;	.line	70; pic.c	DisplayString(FIRST_LINE,firstLine);
	MOVLW	HIGH(_firstLine)
	MOVWF	r0x01
	MOVLW	LOW(_firstLine)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	71; pic.c	DisplayString(SECOND_LINE,secondLine);
	MOVLW	HIGH(_secondLine)
	MOVWF	r0x01
	MOVLW	LOW(_secondLine)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00111_DS_
_00110_DS_:
;	.line	75; pic.c	blink();
	CALL	_blink
_00111_DS_:
	BANKSEL	_isAlarm
;	.line	77; pic.c	if(isAlarm==1)
	MOVF	_isAlarm, W, B
	XORLW	0x01
	BNZ	_00130_DS_
	BANKSEL	(_isAlarm + 1)
	MOVF	(_isAlarm + 1), W, B
	BZ	_00131_DS_
_00130_DS_:
	BRA	_00113_DS_
_00131_DS_:
;	.line	80; pic.c	checkAlarm();
	CALL	_checkAlarm
_00113_DS_:
	BANKSEL	(_ringtone + 1)
;	.line	82; pic.c	if(ringtone>0)
	MOVF	(_ringtone + 1), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00132_DS_
	MOVLW	0x01
	BANKSEL	_ringtone
	SUBWF	_ringtone, W, B
_00132_DS_:
	BNC	_00115_DS_
;	.line	85; pic.c	currentMode=RINGTONE;
	MOVLW	0x06
	BANKSEL	_currentMode
	MOVWF	_currentMode, B
;	.line	86; pic.c	ringtone--;
	MOVLW	0xff
	BANKSEL	_ringtone
	ADDWF	_ringtone, F, B
	BC	_60451_DS_
	BANKSEL	(_ringtone + 1)
	DECF	(_ringtone + 1), F, B
_60451_DS_:
;	.line	87; pic.c	LED2_IO ^= 1;
	CLRF	r0x00
	BTFSC	_LATJbits, 2
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfb
	IORWF	PRODH, W
	MOVWF	_LATJbits
_00115_DS_:
;	.line	89; pic.c	increment();
	CALL	_increment
_00117_DS_:
;	.line	91; pic.c	INTCONbits.TMR0IF = 0;
	BCF	_INTCONbits, 2
_00120_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
__str_0:
	DB	0x41, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x69, 0x73, 0x20, 0x4f, 0x4e, 0x00
; ; Starting pCode block
__str_1:
	DB	0x41, 0x6c, 0x61, 0x72, 0x6d, 0x20, 0x69, 0x73, 0x20, 0x6f, 0x66, 0x66
	DB	0x00
; ; Starting pCode block
__str_2:
	DB	0x00
; ; Starting pCode block
__str_3:
	DB	0x47, 0x6f, 0x6f, 0x64, 0x20, 0x6d, 0x6f, 0x72, 0x6e, 0x69, 0x6e, 0x67
	DB	0x20, 0x4c, 0x6f, 0x75, 0x76, 0x61, 0x69, 0x6e, 0x2d, 0x4c, 0x61, 0x2d
	DB	0x4e, 0x65, 0x75, 0x76, 0x65, 0x00


; Statistics:
; code size:	 3834 (0x0efa) bytes ( 2.93%)
;           	 1917 (0x077d) words
; udata size:	    6 (0x0006) bytes ( 0.16%)
; access size:	   22 (0x0016) bytes


	end
