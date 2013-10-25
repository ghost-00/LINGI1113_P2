//
//  pic.h
//  PIC
//
//  Created by Jos Zigabe and Mehdi Dumoulin.
//

#ifndef PIC_pic_h
#define PIC_pic_h

#define CLOCK 23297
#define FIRST_LINE 0
#define SECOND_LINE 16
#define LEN_C 5
#define LEN_A 4
/*Les different interfaces*/
typedef enum Mode {
    ACCUEIL,
    TIME,
    ALARM,
    EDIT_T,
    EDIT_A,
    SET_A,
    HELLO,
    RINGTONE
}Mode;
/*"Cette méthode retourne les information relative à l'alarme"*/
void
info_A();
/*Cette méthode permet à utilisateur de pouvoir modifier 
 *l'heure à l'aide du curseur
 */
void
changeTime();
/*Cette méthode permet d'une part de régler le réveil et d'autre part 
 *d'activer ou de désactiver le réveil en fonction du curseur
 */
void
setAlarm();
/*Cette méthode vérifie l'heure actuelle actuelle est la compare
 *à celle du réveil, si les deux heures correspondent on active l'alarme
 */
void
checkAlarm();
/*Cette permet de faire les selection des differents Mode disponible
 */
void
actionButton1();
/*Cette permet d'effectuer differentes modification 
 *des elements selectionnés selon le mode actuel
 */
void
actionButton2();
/*Cette méthode nous permet de passer 
 *d'un champ éditable de l'heure à un autre
 */
void
move();
/*Cette méthode initialise la carte à zéro.
 */
void
init_board(void);
/*Cette méthode effectue l'incrémentation d'une seconde
 *en tenant compte qu'il peut y avoir un report
 */
void
increment();
/*Cette méthode permet d'afficher deux éléments de manière successif
 *sur l'écran LCD.
 */
void
blink();
/*************************************************
 Function DisplayString:
 Writes an IP address to string to the LCD display
 starting at pos
 *************************************************/
void
DisplayString(BYTE pos, char* text);
/*************************************************
 Function DisplayWORD:
 writes a WORD in hexa on the position indicated by
 pos.
 - pos=0 -> 1st line of the LCD
 - pos=16 -> 2nd line of the LCD
 
 __SDCC__ only: for debugging
 *************************************************/
void
DisplayWORD(BYTE pos, WORD w);
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
size_t
strlcpy(char *dst, const char *src, size_t siz);
#endif
