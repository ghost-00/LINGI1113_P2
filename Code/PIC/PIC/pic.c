//
//  pic.c
//  PIC
//
//  Created by Jos Zigabe and Mehdi Dumoulin.
//
#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"
#include <string.h>
#include <stdlib.h>
#include "Include/LCDBlocking.h"
#include "pic.h"

/*Ecran de démarrage*/
char firstLine[] = "Time  00:00:00";
char secondLine[] = "Alarm  N 00:00";
/*Emplacement des caractères a modifier
 sur la première ligne de l'écran (00:00:00)*/
int firstTab[]={6,7,9,10,12,13};
/*Emplacement des caractères a modifier
 sur la seconde ligne de l'écran (00:00:00)*/
int secondTab[]={7,9,10,12,13};
/*Position du curseur de la première ligne "clock"*/
int posC = 0;
/*Position du curseur de la seconde ligne "alarm"*/
int posA = 0;
int bin=0;
int isAlarm=0;
/*Temps d'alarme*/
int ringtone=0;
/*Le mode d'initialisation affiché à l'écran*/
Mode currentMode=ACCUEIL;
unsigned int count = 0;
char temp1[]="               ";
char temp2[]="               ";
char tempA[]="        ";
/*
 Fonction appelé à chaque interruption :
 - Soit qqn a appuyé sur un bouton, dans ce cas on fait appel à la méthode relative au bouton
 - Soit il s'est écoulé 1 seconde
 */
void
HighISR (void) __interrupt (1)
{
	if(INTCON3bits.INT1F)
	{
		/*interruption Bouton1*/
		actionButton1();
        INTCON3bits.INT1F  = 0;
		//reset flag
	}
	if(INTCON3bits.INT3F)
	{
		/*interruption Bouton2*/
		actionButton2();
        INTCON3bits.INT3F  = 0;
		//reset flag
	}
	if(INTCONbits.TMR0IF)
	{
		/*interruption timer*/
        count++;
        if(count>=CLOCK)
		{
            count=count-CLOCK;
			if(currentMode==ACCUEIL)
			{
				DisplayString(FIRST_LINE,firstLine);
				DisplayString(SECOND_LINE,secondLine);
			}
            else
            {
				blink();
            }
			if(isAlarm==1)
			{
                /*Si l'alarme est activé on compare l'heure à celle de l'alarme*/
				checkAlarm();
			}
			if(ringtone>0)
			{
                /*Si l'heure actuel correspond à celle de l'alarme*/
                currentMode=RINGTONE;
				ringtone--;
				LED2_IO ^= 1;
			}
			increment();
 		}
    	INTCONbits.TMR0IF = 0;
        //reset flag
	}
}
void
increment()
{
	firstLine[13]++;
	if(firstLine[13]==':')// char après '9'
	{
		firstLine[13]='0';
		firstLine[12]++;
        
		if(firstLine[12]=='6')// 60 sec
		{
			firstLine[12]='0';
			firstLine[10]++;
            
			if(firstLine[10]==':')
			{
				firstLine[10]='0';
				firstLine[9]++;
                
				if(firstLine[9]=='6')
				{
					firstLine[9]='0';
					firstLine[7]++;
					if(firstLine[7]=='4')// 24h
					{
						firstLine[7]='0';
						firstLine[6]++;
						if(firstLine[6]=='3')//24h
						{
							firstLine[6]='0';
						}
					}
				}
			}
		}
	}
}
void
checkAlarm()
{
	if((firstLine[6]==secondLine[9])
       &&(firstLine[7]==secondLine[10])
       &&(firstLine[9]==secondLine[12])
       &&(firstLine[10]==secondLine[13])
       &&(firstLine[12]=='0')
       &&(firstLine[13]=='0'))
	{
		ringtone=30;//30 secondes d'alarme
	}
}
void
setAlarm()
{
    /*Si le curseur de la seconde ligne "alarm" est déplacé vers la droite*/
	if(posA!=0)
	{
		secondLine[secondTab[posA]]++; //+1
		if((secondLine[13]>=':')
           ||(secondLine[10]>=':')
           ||(secondLine[12]>='6')
           ||(secondLine[9]>=':'))
        {
			secondLine[secondTab[posA]]='0';
        }
		if(((secondLine[9]>='2')&&(secondLine[10]>='4'))
           ||(secondLine[9]>='3'))//24h
        {
			secondLine[secondTab[posA]]='0';
        }
	}
	else
	{
		if(secondLine[7]=='N')
		{
			isAlarm=1;
			secondLine[7]='Y';
		}
		else
		{
			secondLine[7]='N';
			isAlarm=0;
		}
	}
}
void
actionButton1()
{
	switch(currentMode)
	{
        case HELLO:
            /*Dans le cas d'une interruption effectué par
             le bouton1 dans l'interface HELLO*/
			currentMode=ACCUEIL;
            break;
		case ACCUEIL:
            /*Dans le cas d'une interruption effectué par
             le bouton1 dans l'interface ACCUEIL*/
			currentMode=TIME;
            break;
		case TIME:
            /*Dans le cas d'une interruption effectué par
             le bouton1 dans l'interface TIME*/
			currentMode=EDIT_T;
            break;
		case ALARM:
            /*Dans le cas d'une interruption effectué par
             le bouton1 dans l'interface ALARM*/
			currentMode=EDIT_A;
            break;
		case EDIT_T:
            /*Dans le cas d'une interruption effectué par
             le bouton1 dans l'interface EDIT_A*/
			move();
            break;
		case EDIT_A:
            /*Dans le cas d'une interruption effectué par
             le bouton1 dans l'interface EDIT*/
			move();
            break;
        case RINGTONE:
            /*Dans le cas d'une interruption effectué par
             le bouton1 dans l'interface RIGTONE,
             on coupe l''alarme*/
            ringtone=0;
            LED2_IO = 0;
			currentMode=ACCUEIL;
            break;
		default:
            break;
	}
}
void
actionButton2()
{
	switch(currentMode)
	{
		case ACCUEIL:
            /*Dans le cas d'une interruption effectué par
             le bouton2 dans l'interface ACCUEIL*/
			currentMode=HELLO;
            break;
        case HELLO:
            /*Dans le cas d'une interruption effectué par
             le bouton2 dans l'interface HELLO*/
			currentMode=ACCUEIL;
            break;
		case TIME:
            /*Dans le cas d'une interruption effectué par
             le bouton2 dans l'interface TIME*/
			currentMode=ALARM;
            break;
		case ALARM:
            /*Dans le cas d'une interruption effectué par
             le bouton2 dans l'interface ALARM*/
			currentMode=TIME;
            break;
		case EDIT_T:
            /*Dans le cas d'une interruption effectué par
             le bouton2 dans l'interface EDIT_T*/
			changeTime();
            break;
		case EDIT_A:
            /*Dans le cas d'une interruption effectué par
             le bouton2 dans l'interface EDIT_A*/
			setAlarm();
            break;
        case RINGTONE:
            /*Dans le cas d'une interruption effectué par
             le bouton1 dans l'interface RIGTONE,
             on coupe l''alarme*/
            ringtone=0;
            LED2_IO = 0;
			currentMode=ACCUEIL;
            break;
		default:
            break;
	}
}
void
move()
{
	if(currentMode==EDIT_T)
	{
        /*Si on arrive au dernier élément éditable de l'heure*/
		if(posC==LEN_C)
		{
			posC=0;
			currentMode=ACCUEIL;
		}
		else
        {
            posC++;/*On passe à la prochaine position*/
        }
	}
	else if(currentMode==EDIT_A)
	{
        /*Si on arrive au dernier élément éditable de l'alarme*/
		if(posA==LEN_A)
		{
			posA=0;
			currentMode=ACCUEIL;
		}
		else
        {
            posA++;/*On passe à la prochaine position*/
        }
	}
}
void
changeTime()
{
	firstLine[firstTab[posC]]++;
	/*Interruption possible ici
     => double incrémentation
     => >= sur toutes les conditions*/
	if((firstLine[13]>=':')
       ||(firstLine[10]>=':')
       ||(firstLine[12]>='6')
       ||(firstLine[9]>='6')
       ||(firstLine[7]>=':'))
    {
		firstLine[firstTab[posC]]='0';
    }
	if(((firstLine[6]>='2')&&(firstLine[7]>='4'))
       ||(firstLine[6]>='3'))//24h
    {
		firstLine[firstTab[posC]]='0';
    }
}
void
info_A()
{
    if (isAlarm)
    {
        
        tempA[0] = ' ';
        tempA[1] = ' ';
        tempA[2] = ' ';
        tempA[3] = secondLine[9];
        tempA[4] = secondLine[10];
        tempA[5] = secondLine[11];
        tempA[6] = secondLine[12];
        tempA[7] = secondLine[13];
        
        DisplayString(FIRST_LINE, "Alarm is ON");
        DisplayString(SECOND_LINE,tempA);
    }
    else
    {
        DisplayString(FIRST_LINE, "Alarm is off");
        DisplayString(SECOND_LINE,"");
    }
}
void
blink()
{
	strlcpy(temp1,firstLine,16);
	strlcpy(temp2,secondLine,16);
    
	if(bin)//Rentre si bin = 1 => Déjà afficher quelque chose sur écran sans "trou"/curseur
	{
		if(currentMode==TIME)
		{
			temp1[0]=' ';
			temp1[1]=' ';
			temp1[2]=' ';
			temp1[3]=' ';
			temp1[4]=' ';
			DisplayString(FIRST_LINE,temp1);
			DisplayString(SECOND_LINE,temp2);
		}
		else if(currentMode==ALARM)
		{
			temp2[0]=' ';
			temp2[1]=' ';
			temp2[2]=' ';
			temp2[3]=' ';
			temp2[4]=' ';
			DisplayString(FIRST_LINE,temp1);
			DisplayString(SECOND_LINE,temp2);
		}
		else if(currentMode==EDIT_T)
		{
			temp1[firstTab[posC]]=' ';
			DisplayString(FIRST_LINE,temp1);
			DisplayString(SECOND_LINE,temp2);
		}
		else if(currentMode==EDIT_A)
		{
			temp2[secondTab[posA]]=' ';
			DisplayString(FIRST_LINE,temp1);
			DisplayString(SECOND_LINE,temp2);
            
		}
        else if(currentMode==HELLO)
        {
            info_A();
        }
        else if(currentMode==RINGTONE)
		{
            /*Good morning LLN*/
			DisplayString(FIRST_LINE,"Good morning Louvain-La-Neuve");
		}
		bin--;
	}
	else
	{
		DisplayString(FIRST_LINE,firstLine);
		DisplayString(SECOND_LINE,secondLine);
		bin++;
	}
}
void
init_board(void) {
	TRISJbits.TRISJ0=0; // configure PORTJ0 for output (LED)
	TRISJbits.TRISJ1=0; // configure PORTJ1 for output (LED)
}
#if defined(__SDCC__)
void
DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
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
#endif
void
DisplayString(BYTE pos, char* text)
{
    BYTE l= strlen(text)+1;
    BYTE max= 32-pos;
    strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
    LCDUpdate();
    
}
size_t
strlcpy(char *dst, const char *src, size_t siz)
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

