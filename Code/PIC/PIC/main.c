//
//  main.c
//  PIC
//
//  Created by Jos Zigabe and Mehdi Dumoulin
//  Copyright (c) 2013 Jos Zigabe. All rights reserved.
//
#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"
#include "pic.h"
#include <string.h>
#include <stdlib.h>
#include "Include/LCDBlocking.h"
void
main(void)
{
	LED0_TRIS = 0; // Configure 1st led pin as output (yellow)
	LED1_TRIS = 0; // Configure 2nd led pin as output (red)
	LED2_TRIS = 0; // Configure 3rd led pin as output (red)
	
	BUTTON0_TRIS = 1; // Configure button0 as input
	BUTTON1_TRIS = 1; // Configure button1 as input
    
	RCONbits.IPEN      = 1;   // Enable interrupts priority levels
	INTCON3bits.INT1F  = 0;   // Clear INT1 flag
	INTCON3bits.INT3F  = 0;   // Clear INT3 flag
	INTCON3bits.INT1P  = 1;   // Connect INT1 interrupt (button 1) to high priority
    
	INTCON2bits.INTEDG1= 0;   // INT1 interrupts on falling edge
	INTCON2bits.INTEDG3= 0;   // INT3 interrupts on falling edge
	INTCONbits.GIE     = 1;   // Enable high priority interrupts
	INTCON3bits.INT1E  = 1;   // Enable INT1 interrupt (button 1)
	INTCON3bits.INT3E  = 1;   // Enable INT3 interupt (button 0)
    
	T0CONbits.T0CS   = 0; //use timer0 instruction cycle clock
	LCDInit();
	init_board();
	
	DisplayString(FIRST_LINE,firstLine);
	DisplayString(SECOND_LINE,secondLine);
	//
	INTCON2bits.TMR0IP	 = 1; // Interruption du au timer = interruption haute
	INTCONbits.TMR0IF = 0; // reset flag
	T0CONbits.T08BIT = 1; // use timer0 8-bit counter
	T0CONbits.PSA = 1; // disable timer0 prescaler
	INTCONbits.TMR0IE = 1; // On active les interuptions TMR0
	LED1_IO = 0; //turn off the led
	LED2_IO = 0;
	LED0_IO = 0;
}