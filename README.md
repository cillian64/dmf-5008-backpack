# dmf-5008-backpack
Controller backpack for Optrex DMF-5008N-S display

![Front of the panel](panel_front.png)

![Back of the panel](panel_back.png)

# Documents
 - [DMF 5000 series manual](http://www.rigelcorp.com/8051/Optrex_Dmf5000.pdf)
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
 - Just accept USART, no point in SPI slave.
 - Probably worth using a modified version of the gabotronics library.

# Parts and notes
 - STM32F042C6T6 in LQFP-48 should be able to bit-bang the parallel interface,
   do UART, chat to the I2C EL inverter, and do USB CDC.
 - MAX14521 is the only EL inverter with appropriate voltage which I can easily
   acquire.  Nice that I can dim it over I2C. Run it off 3v3. Ground hoop it.
 - TLV1220 will easily provide the 20mA I need on 5V for the display
 - Need a simple 3v3 LDO for running off 5V sources
 - Level conversion: all the pins on teh display I talk to are TTL, which means
   they will accept 2.5V as a high signal.  Only question is whether the STM32
   has enough 5V tolerant pins for receiving the TTL signals.
 -
