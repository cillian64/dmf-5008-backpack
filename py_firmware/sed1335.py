# ****************************************************************************
# SED1335 LCD controller library.
#
# (c) 2023 David Turner
#
# Based on the gabotronics AVR library:
# Knut Baardsen @ Baardsen Software, Norway
# Copyright 2009 Gabriel Anzziani.  February 2009, Gabotronics C.A.
# www.gabotronics.com, email: gabriel@gabotronics.com
#
# This program is distributed under the terms of the GNU General Public
# License
# ****************************************************************************

import time
from machine import Pin


try:
    from typing import List
except ImportError:
    # Micropython doesn't have typing
    pass


def lobyte(x):
    return x & 0xff


def hibyte(x):
    return (x >> 8) & 0xff


# Random constants copied from the gabotronics firmware:
LCD_X_SIZE = 128
LCD_Y_SIZE = 128
DISPMEM = 8192
LCD_XTAL = 6000000
TEXT = 0
GRAPHICS = 0x0C

# 0: Screen top-line correction, 1: No screen top-line correction
IV = 1
# 0: Single-panel drive 1: Dual-panel drive
WS = 1
# 0: 8-pixel character height, 1: 16-pixel character height
M2 = 0
# 0: CG RAM1 and CG RAM2 address spaces are not
# contiguous, the CG RAM1 address space is
# treated as character generator RAM, and the
# CG RAM2 address space is treated as character
# generator ROM.
# 1: The CG RAM1 and CG RAM2 address spaces are
# contiguout and are both treated as character
# generator RAM.
M1 = 1
M0 = 0  # 0: Internal CG ROM 1: External CG ROM
WF = 1  # 0: 16-line AC drive 1: two-frame AC drive
FX = 7  # Horizontal character size - 1
FY = 7  # Vertical character size - 1

# Address range covered by one display line
CR = LCD_X_SIZE // (FX + 1) - 1
TCR = (LCD_XTAL // 70 // LCD_Y_SIZE) // 9
LF = LCD_Y_SIZE - 1
APL = CR + 1
APH = 0
SL1 = LCD_Y_SIZE >> WS
SL2 = LCD_Y_SIZE >> WS

# Screen layer 1 pointer
SAD1L = lobyte(LCD_Y_SIZE * APL)
SAD1H = hibyte(LCD_Y_SIZE * APL)
# Screen layer 2 pointer (Graphics)
SAD2L = 0x00
SAD2H = 0x00
# Screen layer 3 pointer
SAD3L = lobyte(3 * SL1 * APL)
SAD3H = hibyte(3 * SL1 * APL)
# Screen layer 4 pointer (Graphics)
SAD4L = lobyte(SL1 * APL)
SAD4H = hibyte(SL1 * APL)

# CGRAM Address
SAGL = 0x00
SAGH = 0x0A

# LCD commands copied from the gabotronics firmware:
# LCD Commands: COMMAND    // (# of bytes after command)
SYSTEM_SET = 0x40  # (8) Initialize Device
SLEEP_IN = 0x53    # (0) Enter stand-by mode
DISP_ON = 0x59     # (1) Enable display flashing
DISP_OFF = 0x58    # (1) Disable display flashing
SCROLL = 0x44      # (10) Set display start address and display regions
CSRFORM = 0x5D     # (2) Set cursor type
CGRAM_ADR = 0x5C   # (2) Set start address of character generator RAM
CSR_RIGHT = 0x4C   # (0) Set direction of cursor movement: right
CSR_LEFT = 0x4D    # (0) Set direction of cursor movement: left
CSR_UP = 0x4E      # (0) Set direction of cursor movement: up
CSR_DOWN = 0x4F    # (0) Set direction of cursor movement: down
HDOT_SCR = 0x5A    # (1) Set horizontal scroll position
OVLAY = 0x5B       # (1) Set display overlay format
CSRW = 0x46        # (2) Set cursor address
CSRR = 0x47        # (2) Read cursor address
MWRITE = 0x42      # Write to display memory
MREAD = 0x43       # Read from display memory


class Sed1335:
    """ Controls a SED1335 LED controller """

    def __init__(
            self,
            cs: Pin,
            a0: Pin,
            wr: Pin,
            rd: Pin,
            reset: Pin,
            # Data pins, with D0 first and D7 last
            data: List[Pin],
            mode="text"
            ):
        """ Initialise the LCD controller"""
        # Store pins for later use
        self.cs = cs
        self.a0 = a0
        self.wr = wr
        self.rd = rd
        self.reset = reset
        self.data = data

        # Set pins to sensible states
        self.cs.on()
        self.wr.on()
        self.rd.on()

        # Reset the LCD
        self.reset.off()
        self._delay(microseconds=100000)  # 100ms, chosen randomly
        self.reset.on()
        self._delay(microseconds=100000)  # 100ms, chosen randomly

        self._write_command(SYSTEM_SET)
        # P1: 0 0 IV 1 W/S M2 M1 M0
        self._write_data(0x10 | IV << 5 | WS << 3 | M2 << 2 | M1 << 1 | M0)
        self._write_data((WF << 7) + (0x07 & FX))  # P2: WF 0 0 0 0 FX2 FX1 FX0
        self._write_data(0x0F & FY)            # P3: 0 0 0 0 FY3 FY2 FY1 FY0
        self._write_data(CR)                   # P4: C/R
        self._write_data(TCR)                  # P5: TC/R
        self._write_data(LF)                   # P6: L/F
        self._write_data(APL)                  # P7: APL
        self._write_data(APH)                  # P8: APH

        # Scroll
        self._write_command(SCROLL)
        self._write_data(SAD1L)  # SAD1L
        self._write_data(SAD1H)  # SAD1H
        self._write_data(SL1)    # SL1
        self._write_data(SAD2L)  # SAD2L
        self._write_data(SAD2H)  # SAD2H
        self._write_data(SL2)    # SL2
        if mode == "text":
            SAD3 = ((SAD1H << 8) + SAD1L) + (APL * (SL1 // (FY + 1)))
            self._write_data(lobyte(SAD3))  # SAD3L
            self._write_data(hibyte(SAD3))  # SAD3H
        else:
            self._write_data(SAD3L)  # SAD3L
            self._write_data(SAD3H)  # SAD3H
        self._write_data(SAD4L)  # SAD4L
        self._write_data(SAD4H)  # SAD4H
        # Horizontal scroll
        self._write_command(HDOT_SCR)
        self._write_data(0x00)
        # Overlay
        self._write_command(OVLAY)
        # mode=TEXT:       Screen 1 & 3 Text,
        # mode=GRAPHICS:   Screen 1 & 3 Graphics
        # Screen 2 & 4 Graphics only
        self._write_data(TEXT if mode == "text" else GRAPHICS)

        # Display On/Off I
        self._write_command(DISP_OFF)  # Display off
        self._write_data(0x14)
        # Cursor write
        self._write_command(CSRW)
        self._write_data(0x00)
        self._write_data(0x00)
        # Cursor format
        self._write_command(CSRFORM)
        self._write_data(0x05)
        self._write_data(0x87)
        # Curson direction
        self._write_command(CSR_RIGHT)
        # Display On/Off II
        self._write_command(DISP_ON)  # Display on
        self._write_data(0x54)        # Cursor flash off

        self.clear_text()
        self.clear_graphics()
        self.clear_graphics2()
        self.goto(0, 0)

    def _delay(self, microseconds=1):
        """ Standard delay for hold time"""
        time.sleep_us(microseconds)

    def _write_data(self, data: int):
        """ Write a data byte to the controller """
        self.cs.off()
        self.a0.off()
        self.wr.off()

        for data_pin in self.data:
            data_pin.value(data & 0x01)
            data >>= 1

        self._delay()  # hold time

        self.wr.on()
        self.cs.on()

    def _write_command(self, command: int):
        """ Write a command byte to the controller """
        self.cs.off()
        self.a0.on()
        self.wr.off()

        for data_pin in self.data:
            data_pin.value(command & 0x01)
            command >>= 1

        self._delay()  # hold time

        self.wr.on()
        self.cs.on()

    def goto(self, x, y):
        addr = y * APL + x
        lo = lobyte(addr)
        hi = SAD1H + hibyte(addr)
        self._write_command(CSRW)
        self._write_data(lo)
        self._write_data(hi)

    def clear_text(self):
        self._write_command(CSR_RIGHT)
        self._write_command(CSRW)
        self._write_data(SAD1L)
        self._write_data(SAD1H)
        self._write_command(MWRITE)
        for _ in range(APL*(LCD_Y_SIZE/FY)):
            self._write_data(ord(' '))

    def clear_graphics(self):
        self._write_command(CSR_RIGHT)
        self._write_command(CSRW)  # Set cursor address
        self._write_data(SAD2L)
        self._write_data(SAD2H)
        self._write_command(MWRITE)  # Write to display memory
        for _ in range(2048):
            self._write_data(0)

    def clear_graphics2(self):
        self._write_command(CSR_RIGHT)
        self._write_command(CSRW)  # Set cursor address
        self._write_data(0)
        self._write_data(8)
        self._write_command(MWRITE)  # Write to display memory
        for _ in range(2048):
            self._write_data(0)

    def puts(self, string):
        self._write_command(MWRITE)
        for c in string:
            self._write_data(ord(c))
