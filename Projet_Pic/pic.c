
#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"

#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
//#include "Include/TCPIP_Stack/Delay.h"

#define CLOCK 23297
//  23297.5136
#define FIRST_LINE 0
#define SECOND_LINE 16
#define MODE0 0
#define MODE1 1
#define MODE2 2
#define MODE3 3
#define MODE4 4

#define LONGC 5
#define LONGA 4


void DisplayString(BYTE pos, char* text);
void DisplayWORD(BYTE pos, WORD w);
size_t strlcpy(char *dst, const char *src, size_t siz);
void increment();
void changeTime();
void setAlarm();
void main(void);
void actionButton1();
void actionButton2();
void init_board(void);
void move();
void increment();
void blink();
void checkAlarm();

char textFirstLine[] = "Clock 00:00:00";
char textSecondLine[] = "Alarm  N 00:00";
int tabFirst[]={6,7,9,10,12,13}; //place des char a modifier dans la première ligne (00:00:00)
int tabSecond[]={7,9,10,12,13}; //place des char a modifier dans la deuxième ligne (N 00:00)
int posC = 0;
int posA = 0;
int bin=0;
int isAlarm=0;
int ringtone=0;
int currentMode=MODE0;
unsigned int count = 0;
char temp1[]="               ";
char temp2[]="               ";

/**
 Fonction appelé à chaque interruption :
 - Soit qqn a appuyé sur un bouton -> Appel de la méthode relative au bouton
 - Soit il s'est écoulé 1 seconde
 **/
void HighISR (void) __interrupt (1)
{
    
	if(INTCON3bits.INT1F)
	{
		//interruption Bouton 1
		actionButton1();
        INTCON3bits.INT1F  = 0;
		//reset flag
	}
	if(INTCON3bits.INT3F)
	{
		//interruption Bouton 2
		actionButton2();
        INTCON3bits.INT3F  = 0;
		//reset flag
	}
    
	if(INTCONbits.TMR0IF)
	{
		//interruption timer
        count++;
        if(count>=CLOCK)
		{
            count=count-CLOCK;
			if(currentMode==MODE0)
			{
				DisplayString(FIRST_LINE,textFirstLine);
				DisplayString(SECOND_LINE,textSecondLine);
			}
			else
				blink();
            
			if(isAlarm)
			{
				checkAlarm();
			}
			if(ringtone>0)
			{
				ringtone--;
				LED2_IO ^= 1;
			}
			increment();
 		}
    	INTCONbits.TMR0IF = 0;
        //reset flag
	}
}


/**
 Ajout d'une seconde en comptant l'éventuel décalage ou passe d'un jour
 **/
void increment()
{
	textFirstLine[13]++;
	if(textFirstLine[13]==':')// char after '9'
	{
		textFirstLine[13]='0';
		textFirstLine[12]++;
        
		if(textFirstLine[12]=='6')// 60 sec
		{
			textFirstLine[12]='0';
			textFirstLine[10]++;
            
			if(textFirstLine[10]==':')
			{
				textFirstLine[10]='0';
				textFirstLine[9]++;
                
				if(textFirstLine[9]=='6')
				{
					textFirstLine[9]='0';
					textFirstLine[7]++;
					if(textFirstLine[7]=='4')// 24h
					{
						textFirstLine[7]='0';
						textFirstLine[6]++;
						if(textFirstLine[6]=='3')//24h
						{
							textFirstLine[6]='0';
						}
					}
				}
			}
            
		}
	}
	
}


/**
 Déclenchement de l'alarme pendant 30sec si c'est l'heure
 **/
void checkAlarm()
{
	if((textFirstLine[6]==textSecondLine[9])&&(textFirstLine[7]==textSecondLine[10])&&(textFirstLine[9]==textSecondLine[12])
       &&(textFirstLine[10]==textSecondLine[13])&&(textFirstLine[12]=='0')&&(textFirstLine[13]=='0'))
	{
		ringtone=30;//30 seconds of ringtone
	}
}


/**
 Incrémentation de l'élement où on se trouve en tenant compte d'un éventuel repport
 **/
void changeTime()
{
	textFirstLine[tabFirst[posC]]++;
	//Interruption possible ici => double incrémentation => >= sur toutes les conditions
	if((textFirstLine[13]>=':')||(textFirstLine[10]>=':')||(textFirstLine[12]>='6')||(textFirstLine[9]>='6')||(textFirstLine[7]>=':'))
		textFirstLine[tabFirst[posC]]='0';
	if(((textFirstLine[6]>='2')&&(textFirstLine[7]>='4'))||(textFirstLine[6]>='3'))//24h
		textFirstLine[tabFirst[posC]]='0';
    
}

/**
 - Soit incrémentation de l'heure de l'alarme
 - Soit Activation ou désactivation de l'alarme
 (en fonction de la position du curseur)
 **/
void setAlarm()
{
	if(posA!=0)
	{
		textSecondLine[tabSecond[posA]]++;
		if((textSecondLine[13]>=':')||(textSecondLine[10]>=':')||(textSecondLine[12]>='6')||(textSecondLine[9]>=':'))
			textSecondLine[tabSecond[posA]]='0';
		if(((textSecondLine[9]>='2')&&(textSecondLine[10]>='4'))||(textSecondLine[9]>='3'))//24h
			textSecondLine[tabSecond[posA]]='0';
	}
	else
	{
		if(textSecondLine[7]=='N')
		{
			isAlarm=1;
			textSecondLine[7]='Y';
		}
		else
		{
			textSecondLine[7]='N';
			isAlarm=0;
		}
	}
    
}

/**
 Déplacement position curseur + Ajustement mode si nécéssaire
 **/
void move()
{
	if(currentMode==MODE3)
	{
		if(posC==LONGC)
		{
			posC=0;
			currentMode=MODE0;
		}
		else
            posC++;
	}
    
	else if(currentMode==MODE4)
	{
		if(posA==LONGA)
		{
			posA=0;
			currentMode=MODE0;
		}
		else
            posA++;
	}
}

/**
 Ajustement du mode en fonction du bouton utilisé + déplacement si nécéssaire
 **/
void actionButton1()
{
	switch(currentMode)
	{
		case MODE0:
			currentMode=MODE1;
            break;
		case MODE1:
			currentMode=MODE2;
            break;
		case MODE2:
			currentMode=MODE1;
            break;
		case MODE3:
			move();
            break;
		case MODE4:
			move();
            break;
            
		default:
            break;
	}
	
}

/**
 Ajustement du mode en fonction du bouton utilisé + déplacement si nécéssaire
 **/

void actionButton2()
{
	switch(currentMode)
	{
		case MODE0:
			currentMode=MODE1;
            break;
		case MODE1:
			currentMode=MODE3;
            break;
		case MODE2:
			currentMode=MODE4;
            break;
		case MODE3:
			changeTime();
            break;
		case MODE4:
			setAlarm();
            break;
            
		default:
            break;
	}
	
}

/**
 Affichage clignotement
 **/
void blink()
{
	strlcpy(temp1,textFirstLine,16);
	strlcpy(temp2,textSecondLine,16);
    
	if(bin)//Rentre si bin = 1 => Déjà afficher quelque chose sur écran sans "trou"/curseur
	{
		if(currentMode==MODE1)
		{
			temp1[0]=' ';
			temp1[1]=' ';
			temp1[2]=' ';
			temp1[3]=' ';
			temp1[4]=' ';
			DisplayString(FIRST_LINE,temp1);
			DisplayString(SECOND_LINE,temp2);
		}
		else if(currentMode==MODE2)
		{
			temp2[0]=' ';
			temp2[1]=' ';
			temp2[2]=' ';
			temp2[3]=' ';
			temp2[4]=' ';
			DisplayString(FIRST_LINE,temp1);
			DisplayString(SECOND_LINE,temp2);
		}
		else if(currentMode==MODE3)
		{
			temp1[tabFirst[posC]]=' ';
			DisplayString(FIRST_LINE,temp1);
			DisplayString(SECOND_LINE,temp2);
		}
		else if(currentMode==MODE4)
		{
			temp2[tabSecond[posA]]=' ';
			DisplayString(FIRST_LINE,temp1);
			DisplayString(SECOND_LINE,temp2);
            
		}
		bin--;
	}
	else
	{
		DisplayString(FIRST_LINE,textFirstLine);
		DisplayString(SECOND_LINE,textSecondLine);
		bin++;
	}
}

void main(void)
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
	
	DisplayString(FIRST_LINE,textFirstLine);
	DisplayString(SECOND_LINE,textSecondLine);
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

void init_board(void) {
	TRISJbits.TRISJ0=0; // configure PORTJ0 for output (LED)
	TRISJbits.TRISJ1=0; // configure PORTJ1 for output (LED)
}


/*************************************************
 Function DisplayWORD:
 writes a WORD in hexa on the position indicated by
 pos.
 - pos=0 -> 1st line of the LCD
 - pos=16 -> 2nd line of the LCD
 
 __SDCC__ only: for debugging
 *************************************************/
#if defined(__SDCC__)
void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
{
    BYTE WDigit[6]; //enough for a  number < 65636: 5 digits + \0
    BYTE j;
    BYTE LCDPos=0;  //write on first line of LCD
    unsigned radix=10; //type expected by sdcc's ultoa()
    
    LCDPos=pos;
    ultoa(w, WDigit, radix);
    for(j = 0; j < strlen((char*)WDigit); j++)
    {
        LCDText[LCDPos++] = WDigit[j];
    }
    if(LCDPos < 32u)
        LCDText[LCDPos] = 0;
    LCDUpdate();
}
/*************************************************
 Function DisplayString:
 Writes an IP address to string to the LCD display
 starting at pos
 *************************************************/
void DisplayString(BYTE pos, char* text)
{
    BYTE l= strlen(text)+1;
    BYTE max= 32-pos;
    strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
    LCDUpdate();
    
}
#endif


/*-------------------------------------------------------------------------
 *
 * strlcpy.c
 *    strncpy done right
 *
 * This file was taken from OpenBSD and is used on platforms that don't
 * provide strlcpy().  The OpenBSD copyright terms follow.
 *-------------------------------------------------------------------------
 */

/*  $OpenBSD: strlcpy.c,v 1.11 2006/05/05 15:27:38 millert Exp $    */

/*
 * Copyright (c) 1998 Todd C. Miller <Todd.Miller@courtesan.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/*
 * Copy src to string dst of size siz.  At most siz-1 characters
 * will be copied.  Always NUL terminates (unless siz == 0).
 * Returns strlen(src); if retval >= siz, truncation occurred.
 * Function creation history:  http://www.gratisoft.us/todd/papers/strlcpy.html
 */
size_t strlcpy(char *dst, const char *src, size_t siz)
{
    char       *d = dst;
    const char *s = src;
    size_t      n = siz;
    
    /* Copy as many bytes as will fit */
    if (n != 0)
    {
        while (--n != 0)
        {
            if ((*d++ = *s++) == '\0')
                break;
        }
    }
    
    /* Not enough room in dst, add NUL and traverse rest of src */
    if (n == 0)
    {
        if (siz != 0)
            *d = '\0';          /* NUL-terminate dst */
        while (*s++)
            ;
    }
    
    
    
    return (s - src - 1);       /* count does not include NUL */
}
