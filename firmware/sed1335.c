/*****************************************************************************
SED1335 LCD controller library.

Original library written by:
Knut Baardsen @ Baardsen Software, Norway

Optimized and improved by:
Copyright 2009 Gabriel Anzziani.  February 2009, Gabotronics C.A.
www.gabotronics.com, email: gabriel@gabotronics.com

Clean up and ported to STM32F0 by:
David Turner, February 2017 code@dwt27.co.uk

This program is distributed under the terms of the GNU General Public License
***********************************************************************/

/***********************************************************************
Includes
***********************************************************************/

#include <avr/io.h>
#include <avr/eeprom.h>
#include <avr/pgmspace.h>
#include <util/delay_basic.h>
#include "mygccdef.h"
#include "sed1335.h"

// Small fonts, each character takes 5 nibbles (5 bytes contain 2 characters)
byte EEMEM font[190] = {
    0x00, 0x00, 0x04, 0x44, 0x04,   // 0:   Space !
    0xAA, 0x00, 0x00, 0xAE, 0xEA,   // 1:   " #
    0x4E, 0xC6, 0xEA, 0x24, 0x8A,   // 2:   $ %
    0x4A, 0x4C, 0xE4, 0x40, 0x00,   // 3:   & '
    0x24, 0x44, 0x28, 0x44, 0x48,   // 4:   ( )
    0xA4, 0xA0, 0x00, 0x4E, 0x40,   // 5:   * +
    0x00, 0x04, 0x80, 0x0E, 0x00,   // 6:   , -
    0x00, 0x00, 0x42, 0x24, 0x88,   // 7:   . /
    0x4A, 0xAA, 0x44, 0xC4, 0x4E,   // 8:   0 1
    0xC2, 0x68, 0xEE, 0x26, 0x2E,   // 9:   2 3
    0xAA, 0xE2, 0x2E, 0x8C, 0x2C,   // 10:   4 5
    0xE8, 0xEA, 0xEE, 0x24, 0x44,   // 11:   6 7
    0xEA, 0xEA, 0xEE, 0xAE, 0x2E,   // 12:   8 9
    0x04, 0x04, 0x00, 0x40, 0x48,   // 13:   : ;
    0x24, 0x84, 0x20, 0xE0, 0xE0,   // 14:   < =
    0x84, 0x24, 0x8C, 0x24, 0x04,   // 15:   > ?
    0x0E, 0xEE, 0x2E, 0xAE, 0xAA,   // 16:  @ A
    0xEA, 0xCA, 0xEE, 0x88, 0x8E,   // 17:  B C
    0xCA, 0xAA, 0xCE, 0x8E, 0x8E,   // 18:  D E
    0xE8, 0xE8, 0x8E, 0x8A, 0xAE,   // 19:  F G
    0xAA, 0xEA, 0xAE, 0x44, 0x4E,   // 20:  H I
    0x22, 0x2A, 0xEA, 0xAC, 0xAA,   // 21:  J K
    0x88, 0x88, 0xEA, 0xEA, 0xAA,   // 22:  L M
    0xEA, 0xAA, 0xAE, 0xAA, 0xAE,   // 23:  N O
    0xEA, 0xE8, 0x84, 0xAA, 0xA6,   // 24:  P Q
    0xCA, 0xCA, 0xAE, 0x8E, 0x2E,   // 25:  R S
    0xE4, 0x44, 0x4A, 0xAA, 0xAE,   // 26:  T U
    0xAA, 0xAA, 0x4A, 0xAA, 0xEA,   // 27:  V W
    0xAA, 0x4A, 0xAA, 0xA4, 0x44,   // 28:  X Y
    0xE2, 0x48, 0xE6, 0x44, 0x46,   // 29:  Z [
    0x88, 0x42, 0x2C, 0x44, 0x4C,   // 30:  \ ]
    0x4A, 0x00, 0x00, 0x00, 0x0E,   // 31:  ^ _
    0x42, 0x00, 0x00, 0x0A, 0xAE,   // 32:  ` u     (a)
    0x00, 0xEA, 0xA2, 0x45, 0x99,   // 33:  n /     (b)  (c)
    0x44, 0xD5, 0xD0, 0x05, 0x52,   // 34:  div     (de)
    0x00, 0x32, 0x20, 0x0E, 0xAA,   // 35:  m       (fg)
    0x4E, 0x44, 0xCC, 0x44, 0xE4,   // 36:  up down (h)  (i)
    0x44, 0xAA, 0xE0, 0x00, 0x00    // 37:  delta   (j)
};

/***********************************************************************
Write specified command to LCD panel.
This is an internal function...
***********************************************************************/
void lcd_write_command(byte command) {
    LCDCTLPORT |= A0;
    LCDCTLPORT &= ~(WR);
    LCDDATAPORT = command;
    asm("nop");
    LCDCTLPORT |= WR;
}

/***********************************************************************
Write specified data to LCD panel.
This is an internal function...
***********************************************************************/
void lcd_write_data(byte data) {
    LCDCTLPORT &= ~(A0);
    LCDCTLPORT &= ~(WR);
    LCDDATAPORT = data;
    LCDCTLPORT |= WR;
}


/***********************************************************************
Read data from LCD panel at position given by lcd_pixel command.
This is an internal function...
************************************************************************/
unsigned char lcd_read_data(void) {
    unsigned char data;
    LCDCTLPORT |= A0;
    LCDCTLPORT &= ~(RD);
    LCDDATADDR = 0x00;
    asm("nop");
    data = LCDDATAPIN;
    LCDCTLPORT |= RD;
    LCDDATADDR = 0xff;
    return data;
}

/***********************************************************************
Initialize the LCD controller. Read the documentation for the
controller in use. If any other than SED1335 values can be wrong !
***********************************************************************/
void lcd_init(byte mode) {
    unsigned int SAD3;
    LCDDATAPORT = 0x00;                 // Setup LCD Data bus port
//    LCDDATADDR = 0xFF;                // Port direction already set at main
    LCDCTLPORT |= WR | RD | RST;        // Setup LCD control bus port
//    LCDCTLDDR  = CS | RST | WR | RD | A0; // already set at main
//    delay_ms(2);                        // Reset the LCD
//    LCDCTLPORT &= ~RST;
    delay_ms(100);
//    LCDCTLPORT |= RST;
    // System
    lcd_write_command(SYSTEM_SET);                   // C: SYSTEM SET command
    lcd_write_data(0x10|IV<<5|WS<<3|M2<<2|M1<<1|M0); // P1: 0 0 IV 1 W/S M2 M1 M0
    lcd_write_data((WF<<7)+(0x07 & FX));        // P2: WF 0 0 0 0 FX2 FX1 FX0
    lcd_write_data(0x0F & FY);                  // P3: 0 0 0 0 FY3 FY2 FY1 FY0
    lcd_write_data(CR);                         // P4: C/R
    lcd_write_data(TCR);                        // P5: TC/R
    lcd_write_data(LF);                         // P6: L/F
    lcd_write_data(APL);                        // P7: APL
    lcd_write_data(APH);                        // P8: APH
    // Scroll
    lcd_write_command(SCROLL);
    lcd_write_data(SAD1L);                  // SAD1L
    lcd_write_data(SAD1H);                  // SAD1H
    lcd_write_data(SL1);                    // SL1
    lcd_write_data(SAD2L);                  // SAD2L
    lcd_write_data(SAD2H);                  // SAD2H
    lcd_write_data(SL2);                    // SL2
    if(mode==TEXT) {
        SAD3 = (SAD1H<<8+SAD1L) + (APL*(SL1/(FY+1)));
        lcd_write_data(lobyte(SAD3));       // SAD3L
        lcd_write_data(hibyte(SAD3));       // SAD3H
    }
    else {
        lcd_write_data(SAD3L);              // SAD3L
        lcd_write_data(SAD3H);              // SAD3H
    }
    lcd_write_data(SAD4L);                  // SAD4L
    lcd_write_data(SAD4H);                  // SAD4H
    // Horizontal scroll
    lcd_write_command(HDOT_SCR);
    lcd_write_data(0x00);
    // Overlay
    lcd_write_command(OVLAY);
    lcd_write_data(mode);           // mode=TEXT:       Screen 1 & 3 Text,
                                    // mode=GRAPHICS:   Screen 1 & 3 Graphics
                                    // Screen 2 & 4 Graphics only
/*    // CGRAM Address
    lcd_write_command(CGRAM_ADR);
    lcd_write_data(SAGL);           // SAGL
    lcd_write_data(SAGH);           // SAGH*/
    // Display On/Off I
    lcd_write_command(DISP_OFF);    // Display off
    lcd_write_data(0x14);
    // Cursor write
    lcd_write_command(CSRW);
    lcd_write_data(0x00);
    lcd_write_data(0x00);
    // Cursor format
    lcd_write_command(CSRFORM);
    lcd_write_data(0x05);
    lcd_write_data(0x87);
    // Curson direction
    lcd_write_command(CSR_RIGHT);
    // Display On/Off II
    lcd_write_command(DISP_ON);     // Display on
    lcd_write_data(0x54);           // Cursor flash off

//    lcd_clear_text();
    lcd_clear_graphics();
    lcd_clear_graphics2();
    lcd_goto(0,0);
}

/***********************************************************************
Clears the text layer / screen.
***********************************************************************/
void lcd_clear_text(void) {
    unsigned int i;
    lcd_write_command(CSR_RIGHT);
    lcd_write_command(CSRW);
    lcd_write_data(SAD1L);
    lcd_write_data(SAD1H);
    lcd_write_command(MWRITE);
    for(i=0; i<APL*(LCD_Y_SIZE/FY); i++) lcd_write_data(' ');
}

/***********************************************************************
Goto specified column and line. 0,0 is the upper left corner.
***********************************************************************/
void lcd_goto(byte column, byte row) {
    unsigned int addr;
    byte lo;
    byte hi;
    addr = row*APL + column;
    lo = lobyte(addr);
    hi = SAD1H+hibyte(addr);
    lcd_write_command(CSRW);
    lcd_write_data(lo);
    lcd_write_data(hi);
}

/***********************************************************************
Write strings to the text layer. Set position with lcd_goto.
Text will wrap if to long to show on one line.
Read string from normal RAM.
**********************************************************************
void lcd_write_string(char *ptr) {
    lcd_write_command(MWRITE);
    while (*ptr != 0x00) lcd_write_data(*ptr++);
}
*/

/***********************************************************************
Write strings to the text layer. Set position with lcd_goto.
Text will wrap if to long to show on one line.
Read string from program memory.
***********************************************************************/
void lcd_puts(const PROGMEM char *ptr) {
    lcd_write_command(MWRITE);
    while (pgm_read_byte(ptr) != 0x00) lcd_write_data(pgm_read_byte(ptr++));
}


/***********************************************************************
Print a positive integer 0-255 to the text layer.
***********************************************************************/
void PrintN(byte Data) {
	byte D1=0,D2=0,D3=0;
	while (Data>=100)	{ D3++; Data-=100; }
	while (Data>=10)	{ D2++; Data-=10; }
	while (Data>=1)		{ D1++; Data-=1; }
    lcd_write_command(MWRITE);
    lcd_write_data(0x30+D3);
    lcd_write_data(0x30+D2);
    lcd_write_data(0x30+D1);
    lcd_write_data(' ');
}

/***********************************************************************
Show or hide cursor. 0=Hide, 1=no flashing, 2=1Hz, 3=1Hz
***********************************************************************/
void lcd_show_cursor(byte rate) {
    if(rate>=4) return;
    lcd_write_command(DISP_ON);
    lcd_write_data(0x14+rate);
}


/***********************************************************************
Clears the graphic layer
***********************************************************************/
void lcd_clear_graphics(void) {
    unsigned int i;
    lcd_write_command(CSR_RIGHT);
    lcd_write_command(CSRW);    // Set cursor address
    lcd_write_data(SAD2L);
    lcd_write_data(SAD2H);
    lcd_write_command(MWRITE);    // Write to display memory
    LCDCTLPORT &= ~(A0);
    LCDDATAPORT = 0;
    for(i=2048; i;) {
        LCDCTLPORT &= ~(WR);
        asm("nop");
        LCDCTLPORT |= WR;
        i--;
    }
}

/***********************************************************************
Clears the second graphic layer.
***********************************************************************/
void lcd_clear_graphics2(void) {
    unsigned int i;
    lcd_write_command(CSR_RIGHT);
    lcd_write_command(CSRW);    // Set cursor address
    lcd_write_data(0);
    lcd_write_data(8);
    lcd_write_command(MWRITE);    // Write to display memory
    LCDCTLPORT &= ~(A0);
    LCDDATAPORT = 0;
    for(i=2048; i;) {
        LCDCTLPORT &= ~(WR);
        asm("nop");
        LCDCTLPORT |= WR;
        i--;
    }
}

/***********************************************************************
Write pixel data to the display at specified position.
Set show to 0 to clear pixel, 255 to set
***********************************************************************/
void pixel(byte x, byte y, byte show) {
    unsigned int Address;
    byte Offset;
    byte low;
    byte high;
    byte data;
    Address = (y<<4) + ((byte)(x>>3));  // Optimized for 128x128 display
//  Address = (y*APL) + (x/(FX+1));     // Generic display
    low = (byte) (Address & 0x00ff);
    high = (byte) ((Address & 0xff00) >> 8);
    lcd_write_command(CSRW);        // Set cursor address
    lcd_write_data(low);
    lcd_write_data(high);
    lcd_write_command(MREAD);       // Read data
    Offset = (byte)(0x80 >> (x & 0x07));

    // Read LCD data
    LCDCTLPORT |= A0;
    LCDCTLPORT &= ~(RD);
    LCDDATADDR = 0x00;              // Port as input
    asm("nop");
    data = LCDDATAPIN;
    LCDCTLPORT |= RD;
    LCDDATADDR = 0xff;

    if(show==255 || show>prandom()) data |= Offset;   // SET
    else data &= ~Offset;               // CLEAR

    lcd_write_command(CSRW);            // Set cursor address
    lcd_write_data(low);
    lcd_write_data(high);
    lcd_write_command(MWRITE);
    lcd_write_data(data);
}

/***********************************************************************
Draws a rectangle from x1,y1 to x2,y2.
Set show to 1 to draw pixel, set to 0 to hide pixel.
***********************************************************************/
void lcd_rectangle(byte x1, byte y1, byte x2, byte y2, byte show) {
    byte i;
    for (i=x1; i<=x2; i++) { pixel(i,y1,show); pixel(i,y2,show); }
    for (i=y1; i<=y2; i++) { pixel(x1,i,show); pixel(x2,i,show); }
}


/***********************************************************************
Draws a line from x,y at given degree from inner_radius to outer_radius.
Set show to 1 to draw pixel, set to 0 to hide pixel.
***********************************************************************/
/*void lcd_degree_line(byte x, byte y, byte degree, byte inner_radius,
    byte outer_radius, byte show) {
    byte fx,fy,tx,ty;
    fx = x + ((signed int)inner_radius * (sint[degree])>>7);
    fy = y - ((signed int)inner_radius * (sint[(byte)(degree+64)])>>7);
    tx = x + ((signed int)outer_radius * (sint[degree])>>7);
    ty = y - ((signed int)outer_radius * (sint[(byte)(degree+64)])>>7);
    lcd_line(fx,fy,tx,ty,show);
    lcd_write_command(0x46);
    lcd_write_data(17);
    lcd_write_data(0);
    PrintN(fx);
    PrintN(fy);
    PrintN(tx);
    PrintN(ty);
}*/


/***********************************************************************
Draws a circle with center at x,y with given radius.
Set show to 1 to draw pixel, set to 0 to hide pixel.
***********************************************************************
void lcd_circle(byte x, byte y, byte radius, byte show) {
    int xc = 0;
    int yc = radius;
    int p = 3 - (radius<<1);
    while (xc <= yc) {
        pixel(x + xc, y + yc, show);
        pixel(x + xc, y - yc, show);
        pixel(x - xc, y + yc, show);
        pixel(x - xc, y - yc, show);
        pixel(x + yc, y + xc, show);
        pixel(x + yc, y - xc, show);
        pixel(x - yc, y + xc, show);
        pixel(x - yc, y - xc, show);
        if (p < 0) p += (xc++ << 2) + 6;
        else p += ((xc++ - yc--)<<2) + 10;
    }
}*/

void lcd_line(byte x1, byte y1, byte x2, byte y2, byte show) {
    byte i,dxabs,dyabs,x,y;
    signed char dx,dy,stepx,stepy;
    dx=(signed char)x2-x1;      // the horizontal distance of the line
    dy=(signed char)y2-y1;      // the vertical distance of the line
    if(dy<0) { dyabs=-dy; stepy=-1; }
    else { dyabs=dy; stepy=1; }
    if(dx<0) { dxabs=-dx; stepx=-1; }
    else {dxabs=dx; stepx=1; }
    x=(byte)(dyabs>>1);
    y=(byte)(dxabs>>1);
    pixel(x1,y1,show);
    if (dxabs>=dyabs) { // the line is more horizontal than vertical
        for(i=0;i<dxabs;i++) {
            y+=dyabs;
            if (y>=dxabs) {
                y-=dxabs;
                y1+=stepy;
            }
            x1+=stepx;
            pixel(x1,y1,show);
        }
    }
    else {  // the line is more vertical than horizontal
        for(i=0;i<dyabs;i++) {
            x+=dxabs;
            if (x>=dyabs) {
                x-=dyabs;
                x1+=stepx;
            }
            y1+=stepy;
            pixel(x1,y1,show);
        }
    }
}

// Read Nibble from EEPROM
byte EENibble(unsigned int adr) {
    byte a;
    if(adr&1) {
        a=adr>>1;
        return 0x0F & eeprom_read_byte(&font[a]);
    }
    else {
        a=adr>>1;
        return (byte)(eeprom_read_byte(&font[a])>>4);
    }
}

// put_2char function
// Cursor increment has to be set to down
void put_2char(byte c1, byte c2) {
    unsigned int a1, a2;
    if(c1) a1=(unsigned int)(c1-0x20)*5;
    else a1=0;
    a2=(unsigned int)(c2-0x20)*5;
    lcd_write_command(MWRITE);
    lcd_write_data((byte)(EENibble(a2++)<<4) |
                          EENibble(a1++));
    lcd_write_data((byte)(EENibble(a2++)<<4) |
                          EENibble(a1++));
    lcd_write_data((byte)(EENibble(a2++)<<4) |
                          EENibble(a1++));
    lcd_write_data((byte)(EENibble(a2++)<<4) |
                          EENibble(a1++));
    lcd_write_data((byte)(EENibble(a2++)<<4) |
                          EENibble(a1++));
}

/*// Print small font text
void tiny_print(byte x, byte y, byte *ptr) {
    while (*ptr != 0x00) {
        lcd_goto(x++,y);
        put_2char(*ptr, *ptr++);
        if((*ptr++)==0) break;
    }
}*/

// Print small font text from program memory
void tiny_printp(byte x, byte y, const PROGMEM char *ptr) {
    byte c1,c2;
    while (pgm_read_byte(ptr) != 0x00) {
        lcd_goto(x++,y);
        c1 = pgm_read_byte(ptr++);
        c2 = pgm_read_byte(ptr++);
        put_2char(c2, c1);
        if(c2==0) break;
    }
}
