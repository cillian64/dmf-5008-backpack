# dmf-5008-backpack
Controller backpack for Optrex DMF-5008N-S display

![Front of the panel](panel_front.png)

![Back of the panel](panel_back.png)

# Documents
 - [DMF 5000 series manual](http://www.rigelcorp.com/8051/Optrex_Dmf5000.pdf)
 - [DMF-5008 datasheet (in German)](https://www.gabotronics.com/download/datasheets/dmf5008.pdf)
 - [Datasheet](http://www.pollin.de/shop/downloads/D120367D.PDF) (in German)
 - [SED1335 manual](http://www.gabotronics.com/download/datasheets/sed1335e.pdf)
 - [Example library](http://www.gabotronics.com/download/sed1335/sed1335.zip)
 - [Example schematic](http://www.rlocman.ru/i/Image/2011/07/18/Xminilab_sch.gif)
 - [Example PCB](http://www.gabotronics.com/discontinued-products/pcb-avr-xmegalab.htm)

# Interface and code
 - Accept ASCII characters and print them as normal, compatible with the
   Sparkfun LCD backpack protocol.
 - Maybe accept some sort of control characters to do drawing primitives
 - Maybe implement some of the ASCII drawing character code-pages.
 - Add headers for SPI, I2C, and UART. Pico has USB built-in.
 - Look at the gabotronics library.

# Parts and notes
 - Raspberry Pi Pico W as the controller.  The PIOs can drive the
   6800/8080-style parallel interface, and the Wi-Fi capability means it can
   easily run as a standalone networked display.  It can also do UART or
   USB-serial for a PC-controlled display.
 - DIY the EL inverter.  Use a 555 timer to make a ~2kHz square wave oscillator
   then put the result into an 8:1300 audio transformer to step up to ~1000Vac.
 - RP2040 pins are not 5V tolerant so clamping will be needed.
 - For RP2040->Display pins, the display VIH=VCC-2.2=2.8V, RP2040 VOH=2.62V
 - How many pins need level shifting in each direction?
   - RP2040->Display: 6
   - Bidi data:       8
   - So 14x bidi level shifters?

# PIO algorithm for 6800 parallel interface
PIO setup
- PINCTRL_OUT_BASE = D0-D7
- PINCTRL_OUT_COUNT = 8
- PINCTRL_SET_BASE = A0,CS,WR,RD
- PINCTRL_SET_COUNT = 4
- EXECCTRL_SIDE_PINDIR = PINS
- PINCTRL_SIDESET_BASE = A0,CS,WR,RD
- PINCTRL_SIDESET_COUNT = 4

LCD_RES and EL_ENABLE shouldn't need fast control so can be driven from
software.

Write:
- Output from FIFO to D0-D7 (prepare data)
    - Side-set A0, CS, WR, RD (setup)
- Immediate set CS, WR, RD (rising edge actions write, & reset to idle states)

Read:
    (reads are rare so do all the PINDIR fiddling on them to make write faster)
- Immediate set PINDIRS to inputs
- Immediate set A0, CS, WR, RD (setup)
- Input from D0-D7 to FIFO (read data)
- Immediate set CE, RD (action read)
- Immediate set PINDIRS to outputs

Pin config:
D0-D7 need to be contiguous, and with endian-ness in the right order
A0,CS,WR,RD need to be contiguous, but order is unimportant.

How does software control the PIO to tell it when to read and write and how
many bytes to do for each?

Speed - overall write operations are limited to about 8.33MHz (120ns) just by
the signal timing constraints. Reads are slower.

What I need from the EL driver: ~110V, 400-1000Hz. I have 7 displays. Shipping is ~£5.38
So maybe just buy 7x HV833 or 7x MIC4830.  Are all the single MSOP-8s drop-in compatible?

EL driver chips: Standard single MSOP-8 of which Microchip has stock
-------------------------------------------------------------------------------
- HV853     50-500Hz    160Vpp   Single MSOP-8   Microchip has MSOP-8 for £1.37
- MIC4826   60-1000Hz   160Vpp   Single MSOP-8   Microchip has MSOP-8 for £1.36
- HV833     60-1000Hz   180Vpp   Single MSOP-8   Microchip has MSOP-8 for £1.50
- MIC4830   60-1000Hz   180Vpp   Single MSOP-8   Microchip has MSOP-8 for £1.34
- HV859       -1000Hz   210Vpp   Single MSOP-8   Microchip has MSOP-8 for £1.10

EL driver chips: Others
-------------------------------------------------------------------------------
- HV852     50-500Hz    160Vpp   Single MSOP-8   Inductorless. Microchip has MSOP-8 for £1.37
- MIC4833  150-1500Hz   220Vpp   Dual 12VDFN     Slew rate control, PWM dimming, wave shaping. Microchip has no stock.
- MAX14514 (v nice, dimmable, but v expensive)
- D355B (doesn't seem to really exist)
- HV823     ??????      180Vpp   Single SOIC-8   Microchip has SOIC8 for £1.77
- HV857L      -1000Hz   190Vpp   Single MSOP-8   Mouser has MSOP-8 for £1.17 or DFN-8 for £1.21 (microchip has WDFN for £1.10)
- MIC4827   60-1000Hz   180Vpp   Single MSOP-8   Microchip has 12x MSOP-8 for £1.50
- MP3802    60-1000Hz   240Vpp   Single MSOP-8   Mouser has MSOP-8 for £2.08



