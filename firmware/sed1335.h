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
Port, PINS and LCD defines 
***********************************************************************/

#include <avr/pgmspace.h>

// Data port
#define LCDDATAPIN  PINC
#define LCDDATADDR  DDRC
#define LCDDATAPORT PORTC
// Control port
#define LCDCTLPIN   PINB
#define LCDCTLDDR   DDRB
#define LCDCTLPORT  PORTB
// Control pins
#define CS          0       // Not used in MULTIKIT1
#define RST			0       // Not used in MULTIKIT1
#define RD          _BV(0)
#define WR          _BV(1)
#define A0          _BV(2)
// LCD display info, specific to the display used:
// DMF5008N: 128x128 pixels, 8kB RAM
#define LCD_X_SIZE  128
#define LCD_Y_SIZE  128
#define DISPMEM     8192
#define LCD_XTAL    6000000
#define TEXT        0
#define GRAPHICS    0x0C

#define IV          1       // 0: Screen top-line correction
                            // 1: No screen top-line correction
#define WS          1       // 0: Single-panel drive 1: Dual-panel drive
#define M2          0       // 0: 8-pixel character height
                            // 1: 16-pixel character height
#define M1          1       // 0: CG RAM1 and CG RAM2 address spaces are not
                            // contiguous, the CG RAM1 address space is
                            // treated as character generator RAM, and the
                            // CG RAM2 address space is treated as character
                            // generator ROM.
                            // 1: The CG RAM1 and CG RAM2 address spaces are
                            // contiguout and are both treated as character
                            // generator RAM.
#define M0          0       // 0: Internal CG ROM 1: External CG ROM
#define WF          1       // 0: 16-line AC drive 1: two-frame AC drive
#define FX          7       // Horizontal character size - 1
#define FY          7       // Vertical character size - 1
#define CR          (LCD_X_SIZE/(FX+1)-1)
                            // Address range covered by one display line
#define TCR         ((LCD_XTAL / 70 / LCD_Y_SIZE) / 9)
#define LF          (LCD_Y_SIZE - 1)
#define APL         (CR+1)
#define APH         0
#define SL1         (LCD_Y_SIZE>>WS)
#define SL2         (LCD_Y_SIZE>>WS)
#define SAD1L       (lobyte((unsigned int)LCD_Y_SIZE*APL)) // Screen layer 1 pointer
#define SAD1H       (hibyte((unsigned int)LCD_Y_SIZE*APL))
#define SAD2L       0x00                                // Screen layer 2 pointer (Graphics)
#define SAD2H       0x00
#define SAD3L       (lobyte(3*(unsigned int)SL1*APL))   // Screen layer 3 pointer
#define SAD3H       (hibyte(3*(unsigned int)SL1*APL))
#define SAD4L       (lobyte((unsigned int)SL1*APL))     // Screen layer 4 pointer (Graphics)
#define SAD4H       (hibyte((unsigned int)SL1*APL))
#define SAGL        0x00    // CGRAM Address
#define SAGH        0x0A

// LCD Commands: COMMAND    // (# of bytes after command)
#define SYSTEM_SET  0x40    // (8) Initialize Device
#define SLEEP_IN    0x53    // (0) Enter stand-by mode
#define DISP_ON     0x59    // (1) Enable display flashing
#define DISP_OFF    0x58    // (1) Disable display flashing
#define SCROLL      0x44    // (10) Set display start address and display regions
#define CSRFORM     0x5D    // (2) Set cursor type
#define CGRAM_ADR   0x5C    // (2) Set start address of character generator RAM
#define CSR_RIGHT   0x4C    // (0) Set direction of cursor movement: right
#define CSR_LEFT    0x4D    // (0) Set direction of cursor movement: left
#define CSR_UP      0x4E    // (0) Set direction of cursor movement: up
#define CSR_DOWN    0x4F    // (0) Set direction of cursor movement: down
#define HDOT_SCR    0x5A    // (1) Set horizontal scroll position
#define OVLAY       0x5B    // (1) Set display overlay format
#define CSRW        0x46    // (2) Set cursor address
#define CSRR        0x47    // (2) Read cursor address
#define MWRITE      0x42    // Write to display memory
#define MREAD       0x43    // Read from display memory

/***********************************************************************
Prototypes
***********************************************************************/
// General LCD functions
byte lcd_read_data(void);
void lcd_write_data(byte data);
void lcd_write_command(byte command);
void lcd_init(byte mode);
void lcd_delay(void);
// Text functions
void lcd_clear_text(void);
void lcd_goto(byte row, byte col);
//void lcd_write_string(char *ptr);
void lcd_puts(const PROGMEM char*);
void lcd_show_cursor(byte rate);
void PrintN(byte Data);
// Graphic functions
void lcd_clear_graphics(void);
void lcd_clear_graphics2(void);
void pixel(byte x, byte y, byte show);
//byte read_pixel(byte x, byte y);
void lcd_rectangle(byte x1, byte y1, byte x2, byte y2, byte show);
void lcd_line(byte x1, byte y1, byte x2, byte y2, byte show);
void lcd_circle(byte x, byte y, byte radius, byte show);
void lcd_degree_line(byte degree, byte inner_radius, byte outer_radius, byte show);
void put_2char(byte c1, byte c2);
byte EENibble(unsigned int adr);
void tiny_print(byte x, byte y, byte *ptr);
void tiny_printp(byte x, byte y, const PROGMEM char *ptr);
void printu(signed long int Data, byte unit);
void printF(byte x, byte y, fixed fData);
