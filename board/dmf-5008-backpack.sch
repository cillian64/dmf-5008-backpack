EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:tlv61220
LIBS:stm32f0xxcxtx
LIBS:hv823
LIBS:swd_tc
LIBS:microusb
LIBS:dmf-5008-backpack-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X25 P1
U 1 1 58950F23
P 10450 3050
F 0 "P1" H 10450 4350 50  0000 C CNN
F 1 "CONN_01X25" V 10550 3050 50  0000 C CNN
F 2 "footprints:lcd_full" H 10450 3050 50  0001 C CNN
F 3 "" H 10450 3050 50  0000 C CNN
	1    10450 3050
	1    0    0    -1  
$EndComp
$Comp
L TLV61220 IC?
U 1 1 589CF8E1
P 5700 1350
F 0 "IC?" H 5700 1675 50  0000 C CNN
F 1 "TLV61220" H 5700 1584 50  0000 C CNN
F 2 "agg:SOT-23-6" H 3250 -1650 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv61220.pdf" H 3250 -1750 50  0001 L CNN
F 4 "2323546" H 3250 -1850 50  0001 L CNN "Farnell"
	1    5700 1350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 P?
U 1 1 589CF943
P 1400 1400
F 0 "P?" H 1319 1075 50  0000 C CNN
F 1 "CONN_01X03" H 1319 1166 50  0000 C CNN
F 2 "" H -300 100 50  0000 C CNN
F 3 "" H -300 100 50  0000 C CNN
	1    1400 1400
	-1   0    0    1   
$EndComp
$Comp
L SWITCH_INV SW?
U 1 1 589CF9D4
P 2500 1100
F 0 "SW?" H 2500 1425 50  0000 C CNN
F 1 "SWITCH_INV" H 2500 1334 50  0000 C CNN
F 2 "" H 450 -50 50  0000 C CNN
F 3 "" H 450 -50 50  0000 C CNN
	1    2500 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1300 1900 1300
Wire Wire Line
	1900 1300 1900 1100
Wire Wire Line
	1900 1100 2000 1100
$Comp
L +3V3 #PWR?
U 1 1 589CFA3F
P 3050 950
F 0 "#PWR?" H 0   -100 50  0001 C CNN
F 1 "+3V3" H 3065 1123 50  0000 C CNN
F 2 "" H 0   50  50  0000 C CNN
F 3 "" H 0   50  50  0000 C CNN
	1    3050 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 950  3050 1000
Wire Wire Line
	3050 1000 3000 1000
$Comp
L +5V #PWR?
U 1 1 589CFA6C
P 3200 1150
F 0 "#PWR?" H 150 0   50  0001 C CNN
F 1 "+5V" H 3215 1323 50  0000 C CNN
F 2 "" H 150 150 50  0000 C CNN
F 3 "" H 150 150 50  0000 C CNN
	1    3200 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1150 3200 1200
Wire Wire Line
	3200 1200 3000 1200
$Comp
L +3V3 #PWR?
U 1 1 589CFB16
P 4700 1200
F 0 "#PWR?" H 350 -250 50  0001 C CNN
F 1 "+3V3" H 4715 1373 50  0000 C CNN
F 2 "" H 350 -100 50  0000 C CNN
F 3 "" H 350 -100 50  0000 C CNN
	1    4700 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1250 5300 1250
$Comp
L +5V #PWR?
U 1 1 589CFB65
P 6800 1050
F 0 "#PWR?" H 1750 -550 50  0001 C CNN
F 1 "+5V" H 6815 1223 50  0000 C CNN
F 2 "" H 1750 -400 50  0000 C CNN
F 3 "" H 1750 -400 50  0000 C CNN
	1    6800 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1050 6200 1250
Wire Wire Line
	6200 1250 6100 1250
Text Label 10250 1850 2    60   ~ 0
EL_A
Text Label 10250 1950 2    60   ~ 0
EL_B
$Comp
L +5V #PWR?
U 1 1 589CFE02
P 9750 1950
F 0 "#PWR?" H 9800 2000 50  0001 C CNN
F 1 "+5V" H 9765 2123 50  0000 C CNN
F 2 "" H 0   -250 50  0000 C CNN
F 3 "" H 0   -250 50  0000 C CNN
	1    9750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 1950 9750 2950
Wire Wire Line
	9750 2050 10250 2050
Wire Wire Line
	9750 2550 10250 2550
Connection ~ 9750 2050
$Comp
L GND #PWR?
U 1 1 589CFE50
P 10000 2250
F 0 "#PWR?" H 10050 2300 50  0001 C CNN
F 1 "GND" H 10005 2077 50  0000 C CNN
F 2 "" H 100 -250 50  0000 C CNN
F 3 "" H 100 -250 50  0000 C CNN
	1    10000 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 2950 10250 2950
Connection ~ 9750 2550
$Comp
L STM32F0xxCxTx IC?
U 1 1 589F4142
P 3550 4650
F 0 "IC?" H 3550 6575 50  0000 C CNN
F 1 "STM32F042C6T6" H 3550 6484 50  0000 C CNN
F 2 "agg:LQFP-48" H -400 -1400 50  0001 L CNN
F 3 "http://www.st.com/resource/en/datasheet/stm32f042c6.pdf" H -400 -1500 50  0001 L CNN
F 4 "110-6612" H 3550 4650 60  0001 C CNN "RS"
	1    3550 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A2450D
P 1650 1550
F 0 "#PWR?" H -200 -200 50  0001 C CNN
F 1 "GND" H 1655 1377 50  0000 C CNN
F 2 "" H -200 50  50  0000 C CNN
F 3 "" H -200 50  50  0000 C CNN
	1    1650 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1550 1650 1500
Wire Wire Line
	1650 1500 1600 1500
Text Label 1650 1400 0    60   ~ 0
UART_IN
Wire Wire Line
	1650 1400 1600 1400
Text Label 4650 4950 0    60   ~ 0
UART_IN
Text Label 4650 4850 0    60   ~ 0
EL_DISABLE
$Comp
L HV823 IC?
U 1 1 58A62E88
P 7800 5450
F 0 "IC?" H 7800 5875 50  0000 C CNN
F 1 "HV823" H 7800 5784 50  0000 C CNN
F 2 "agg:SOIC-8" H 400 1050 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/HV823%20C082213.pdf" H 400 950 50  0001 L CNN
	1    7800 5450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 58A62F84
P 6450 5200
F 0 "#PWR?" H 6500 5250 50  0001 C CNN
F 1 "+5V" H 6465 5373 50  0000 C CNN
F 2 "" H -600 1550 50  0000 C CNN
F 3 "" H -600 1550 50  0000 C CNN
	1    6450 5200
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A62FAA
P 6450 5450
F 0 "C?" H 6565 5496 50  0000 L CNN
F 1 "100n" H 6565 5405 50  0000 L CNN
F 2 "" H 438 1950 50  0000 C CNN
F 3 "" H 400 2100 50  0000 C CNN
	1    6450 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 5200 6450 5300
Wire Wire Line
	6450 5250 7300 5250
Connection ~ 6450 5250
$Comp
L GND #PWR?
U 1 1 58A63041
P 6450 5600
F 0 "#PWR?" H 6500 5650 50  0001 C CNN
F 1 "GND" H 6455 5427 50  0000 C CNN
F 2 "" H 400 1700 50  0000 C CNN
F 3 "" H 400 1700 50  0000 C CNN
	1    6450 5600
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 58A630A2
P 7150 5550
F 0 "R?" V 6954 5550 50  0000 C CNN
F 1 "2M" V 7045 5550 50  0000 C CNN
F 2 "" H 950 1550 50  0000 C CNN
F 3 "" H 950 1550 50  0000 C CNN
	1    7150 5550
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 58A6314C
P 7150 5650
F 0 "R?" V 6950 5650 50  0000 C CNN
F 1 "750k" V 7050 5650 50  0000 C CNN
F 2 "" H 750 1700 50  0000 C CNN
F 3 "" H 750 1700 50  0000 C CNN
	1    7150 5650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 5550 7050 5650
Text Label 6800 6000 2    60   ~ 0
EL_DISABLE
Wire Wire Line
	6800 6000 6950 6000
Wire Wire Line
	6950 6000 6950 5600
Wire Wire Line
	6950 5600 7050 5600
Connection ~ 7050 5600
$Comp
L GND #PWR?
U 1 1 58A6395F
P 7300 5350
F 0 "#PWR?" H 7350 5400 50  0001 C CNN
F 1 "GND" H 7305 5177 50  0001 C CNN
F 2 "" H 250 1750 50  0000 C CNN
F 3 "" H 250 1750 50  0000 C CNN
	1    7300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 5550 7300 5550
Wire Wire Line
	7300 5650 7250 5650
$Comp
L INDUCTOR_SMALL L?
U 1 1 58A63DBE
P 8650 4950
F 0 "L?" V 8604 5027 50  0000 L CNN
F 1 "INDUCTOR_SMALL" V 8695 5027 50  0000 L CNN
F 2 "" H 750 1700 50  0000 C CNN
F 3 "" H 750 1700 50  0000 C CNN
	1    8650 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 5250 8650 5250
$Comp
L +5V #PWR?
U 1 1 58A6416F
P 8650 4700
F 0 "#PWR?" H 8700 4750 50  0001 C CNN
F 1 "+5V" H 8665 4873 50  0000 C CNN
F 2 "" H 1300 1900 50  0000 C CNN
F 3 "" H 1300 1900 50  0000 C CNN
	1    8650 4700
	1    0    0    -1  
$EndComp
$Comp
L D_Small D?
U 1 1 58A64241
P 8400 5350
F 0 "D?" H 8300 5300 50  0000 C CNN
F 1 "D_Small" H 8600 5300 50  0000 C CNN
F 2 "" V 500 1950 50  0000 C CNN
F 3 "" V 500 1950 50  0000 C CNN
	1    8400 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 5200 8650 5350
Wire Wire Line
	8650 5350 8500 5350
Connection ~ 8650 5250
Text Label 8300 5550 0    60   ~ 0
EL_A
Text Label 8300 5650 0    60   ~ 0
EL_B
Wire Wire Line
	4700 1200 4700 1300
$Comp
L C C?
U 1 1 58A64F79
P 4700 1450
F 0 "C?" H 4815 1496 50  0000 L CNN
F 1 "10u" H 4815 1405 50  0000 L CNN
F 2 "" H 588 -200 50  0000 C CNN
F 3 "" H 550 -50 50  0000 C CNN
	1    4700 1450
	1    0    0    -1  
$EndComp
Connection ~ 4700 1250
$Comp
L GND #PWR?
U 1 1 58A64FF1
P 4700 1600
F 0 "#PWR?" H 550 -550 50  0001 C CNN
F 1 "GND" H 4705 1427 50  0000 C CNN
F 2 "" H 550 -300 50  0000 C CNN
F 3 "" H 550 -300 50  0000 C CNN
	1    4700 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1350 5250 1350
Wire Wire Line
	5250 1350 5250 1250
Connection ~ 5250 1250
$Comp
L INDUCTOR_SMALL L?
U 1 1 58A652C8
P 5700 1900
F 0 "L?" H 5700 1722 50  0000 C CNN
F 1 "4u7" H 5700 1813 50  0000 C CNN
F 2 "" H 250 -50 50  0000 C CNN
F 3 "" H 250 -50 50  0000 C CNN
	1    5700 1900
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 58A65346
P 5300 1450
F 0 "#PWR?" H 750 -450 50  0001 C CNN
F 1 "GND" H 5305 1277 50  0000 C CNN
F 2 "" H 750 -200 50  0000 C CNN
F 3 "" H 750 -200 50  0000 C CNN
	1    5300 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1250 5100 1900
Wire Wire Line
	5100 1900 5450 1900
Connection ~ 5100 1250
Wire Wire Line
	5950 1900 6200 1900
Wire Wire Line
	6200 1900 6200 1450
Wire Wire Line
	6200 1450 6100 1450
$Comp
L R_Small R?
U 1 1 58A65510
P 6550 1200
F 0 "R?" H 6609 1246 50  0000 L CNN
F 1 "R_Small" H 6609 1155 50  0000 L CNN
F 2 "" H 900 -300 50  0000 C CNN
F 3 "" H 900 -300 50  0000 C CNN
	1    6550 1200
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 58A6555B
P 6550 1500
F 0 "R?" H 6609 1546 50  0000 L CNN
F 1 "R_Small" H 6609 1455 50  0000 L CNN
F 2 "" H 800 -250 50  0000 C CNN
F 3 "" H 800 -250 50  0000 C CNN
	1    6550 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A655A6
P 6550 1600
F 0 "#PWR?" H 750 -400 50  0001 C CNN
F 1 "GND" H 6555 1427 50  0000 C CNN
F 2 "" H 750 -150 50  0000 C CNN
F 3 "" H 750 -150 50  0000 C CNN
	1    6550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1350 6550 1350
Wire Wire Line
	6550 1300 6550 1400
Connection ~ 6550 1350
Wire Wire Line
	6200 1050 6800 1050
Wire Wire Line
	6550 1050 6550 1100
Connection ~ 6550 1050
$Comp
L +3V3 #PWR?
U 1 1 58A66E0D
P 2950 2850
F 0 "#PWR?" H 50  -200 50  0001 C CNN
F 1 "+3V3" H 2965 3023 50  0000 C CNN
F 2 "" H 50  -50 50  0000 C CNN
F 3 "" H 50  -50 50  0000 C CNN
	1    2950 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2850 2950 3350
Wire Wire Line
	2950 2950 3050 2950
Wire Wire Line
	2950 3050 3050 3050
Connection ~ 2950 2950
Wire Wire Line
	2950 3150 3050 3150
Connection ~ 2950 3050
Wire Wire Line
	2950 3250 3050 3250
Connection ~ 2950 3150
Wire Wire Line
	2950 3350 3050 3350
Connection ~ 2950 3250
$Comp
L GND #PWR?
U 1 1 58A6701E
P 2900 3850
F 0 "#PWR?" H 100 100 50  0001 C CNN
F 1 "GND" H 2905 3677 50  0001 C CNN
F 2 "" H 100 350 50  0000 C CNN
F 3 "" H 100 350 50  0000 C CNN
	1    2900 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3850 3050 3850
Wire Wire Line
	2950 3550 2950 3850
Wire Wire Line
	2950 3750 3050 3750
Connection ~ 2950 3850
Wire Wire Line
	2950 3650 3050 3650
Connection ~ 2950 3750
Wire Wire Line
	2950 3550 3050 3550
Connection ~ 2950 3650
$Comp
L C C?
U 1 1 58A67425
P 1050 3250
F 0 "C?" H 1100 3350 50  0000 L CNN
F 1 "4u7" H 1050 3150 50  0000 L CNN
F 2 "" H -862 100 50  0000 C CNN
F 3 "" H -900 250 50  0000 C CNN
	1    1050 3250
	1    0    0    -1  
$EndComp
Text Notes 1200 3050 0    60   ~ 0
VDD
$Comp
L C C?
U 1 1 58A6791D
P 1250 3250
F 0 "C?" H 1300 3350 50  0000 L CNN
F 1 "100n" H 1250 3150 50  0000 L CNN
F 2 "" H -662 100 50  0000 C CNN
F 3 "" H -700 250 50  0000 C CNN
	1    1250 3250
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A679BB
P 1450 3250
F 0 "C?" H 1500 3350 50  0000 L CNN
F 1 "100n" H 1450 3150 50  0000 L CNN
F 2 "" H -462 100 50  0000 C CNN
F 3 "" H -500 250 50  0000 C CNN
	1    1450 3250
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A67DCC
P 1700 3250
F 0 "C?" H 1750 3350 50  0000 L CNN
F 1 "4u7" H 1700 3150 50  0000 L CNN
F 2 "" H -212 100 50  0000 C CNN
F 3 "" H -250 250 50  0000 C CNN
	1    1700 3250
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A67E16
P 1900 3250
F 0 "C?" H 1950 3350 50  0000 L CNN
F 1 "100n" H 1900 3150 50  0000 L CNN
F 2 "" H -12 100 50  0000 C CNN
F 3 "" H -50 250 50  0000 C CNN
	1    1900 3250
	1    0    0    -1  
$EndComp
Text Notes 1750 3050 0    60   ~ 0
VDDIO2
$Comp
L C C?
U 1 1 58A680BC
P 2150 3250
F 0 "C?" H 2200 3350 50  0000 L CNN
F 1 "1u" H 2150 3150 50  0000 L CNN
F 2 "" H 238 100 50  0000 C CNN
F 3 "" H 200 250 50  0000 C CNN
	1    2150 3250
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58A6813D
P 2350 3250
F 0 "C?" H 2400 3350 50  0000 L CNN
F 1 "10n" H 2350 3150 50  0000 L CNN
F 2 "" H 438 100 50  0000 C CNN
F 3 "" H 400 250 50  0000 C CNN
	1    2350 3250
	1    0    0    -1  
$EndComp
Text Notes 2200 3050 0    60   ~ 0
VDDA
Wire Wire Line
	1050 3100 1450 3100
Wire Wire Line
	1700 3100 1900 3100
Wire Wire Line
	2150 3100 2350 3100
Wire Wire Line
	2150 3400 2350 3400
Wire Wire Line
	1700 3400 1900 3400
Wire Wire Line
	1050 3400 1450 3400
Connection ~ 1250 3400
$Comp
L GND #PWR?
U 1 1 58A68502
P 1250 3400
F 0 "#PWR?" H 100 -300 50  0001 C CNN
F 1 "GND" H 1255 3227 50  0000 C CNN
F 2 "" H 100 -50 50  0000 C CNN
F 3 "" H 100 -50 50  0000 C CNN
	1    1250 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A68558
P 1800 3400
F 0 "#PWR?" H 350 -150 50  0001 C CNN
F 1 "GND" H 1805 3227 50  0000 C CNN
F 2 "" H 350 100 50  0000 C CNN
F 3 "" H 350 100 50  0000 C CNN
	1    1800 3400
	1    0    0    -1  
$EndComp
Connection ~ 1800 3400
$Comp
L GND #PWR?
U 1 1 58A685B0
P 2250 3400
F 0 "#PWR?" H 400 -400 50  0001 C CNN
F 1 "GND" H 2255 3227 50  0000 C CNN
F 2 "" H 400 -150 50  0000 C CNN
F 3 "" H 400 -150 50  0000 C CNN
	1    2250 3400
	1    0    0    -1  
$EndComp
Connection ~ 2250 3400
$Comp
L +3V3 #PWR?
U 1 1 58A686B8
P 1050 3100
F 0 "#PWR?" H 100 50  50  0001 C CNN
F 1 "+3V3" H 1065 3273 50  0000 C CNN
F 2 "" H 100 200 50  0000 C CNN
F 3 "" H 100 200 50  0000 C CNN
	1    1050 3100
	1    0    0    -1  
$EndComp
Connection ~ 1050 3100
Connection ~ 1700 3100
$Comp
L +3V3 #PWR?
U 1 1 58A68712
P 1700 3100
F 0 "#PWR?" H 350 0   50  0001 C CNN
F 1 "+3V3" H 1715 3273 50  0000 C CNN
F 2 "" H 350 150 50  0000 C CNN
F 3 "" H 350 150 50  0000 C CNN
	1    1700 3100
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 58A687F0
P 2150 3100
F 0 "#PWR?" H 250 50  50  0001 C CNN
F 1 "+3V3" H 2165 3273 50  0000 C CNN
F 2 "" H 250 200 50  0000 C CNN
F 3 "" H 250 200 50  0000 C CNN
	1    2150 3100
	1    0    0    -1  
$EndComp
Connection ~ 2150 3100
$Comp
L SWD_TC P?
U 1 1 58A690BA
P 3600 7100
F 0 "P?" H 3600 7425 50  0000 C CNN
F 1 "SWD_TC" H 3600 7334 50  0000 C CNN
F 2 "agg:TC2030-NL" H 1450 2750 50  0001 L CNN
F 3 "" H 1350 3150 50  0001 C CNN
	1    3600 7100
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 58A694C0
P 3200 7000
F 0 "#PWR?" H 3250 7050 50  0001 C CNN
F 1 "+3V3" H 3215 7173 50  0000 C CNN
F 2 "" H -450 -150 50  0000 C CNN
F 3 "" H -450 -150 50  0000 C CNN
	1    3200 7000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A69519
P 3200 7200
F 0 "#PWR?" H 3250 7250 50  0001 C CNN
F 1 "GND" H 3205 7027 50  0000 C CNN
F 2 "" H 0   50  50  0000 C CNN
F 3 "" H 0   50  50  0000 C CNN
	1    3200 7200
	1    0    0    -1  
$EndComp
Text Label 3200 7100 2    60   ~ 0
nRST
Text Label 2550 4150 2    60   ~ 0
nRST
$Comp
L C C?
U 1 1 58A6A0B1
P 2600 4300
F 0 "C?" H 2715 4346 50  0000 L CNN
F 1 "100n" H 2715 4255 50  0000 L CNN
F 2 "" H 88  0   50  0000 C CNN
F 3 "" H 50  150 50  0000 C CNN
	1    2600 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58A6A11A
P 2600 4450
F 0 "#PWR?" H 50  -200 50  0001 C CNN
F 1 "GND" H 2605 4277 50  0000 C CNN
F 2 "" H 50  50  50  0000 C CNN
F 3 "" H 50  50  50  0000 C CNN
	1    2600 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4150 3050 4150
Connection ~ 2600 4150
Text Label 4000 7000 0    60   ~ 0
SWDIO
Text Label 4000 7100 0    60   ~ 0
SWDCLK
NoConn ~ 4000 7200
Text Label 4050 4350 0    60   ~ 0
SWDIO
Text Label 4050 4450 0    60   ~ 0
SWDCLK
$Comp
L MICROUSB J?
U 1 1 58A6BE6E
P 5950 7250
F 0 "J?" H 6031 7675 50  0000 C CNN
F 1 "MICROUSB" H 6031 7584 50  0000 C CNN
F 2 "agg:MICROUSB_MOLEX_47589-0001" H -750 1000 50  0001 L CNN
F 3 "" H -300 1700 50  0001 C CNN
F 4 "1568023" H -750 900 50  0001 L CNN "Farnell"
	1    5950 7250
	1    0    0    -1  
$EndComp
Text Label 6250 7150 0    60   ~ 0
USB_DM
Text Label 6250 7250 0    60   ~ 0
USB_DP
$Comp
L +5V #PWR?
U 1 1 58A6C39A
P 6350 7000
F 0 "#PWR?" H 6400 7050 50  0001 C CNN
F 1 "+5V" H 6365 7173 50  0000 C CNN
F 2 "" H -300 1700 50  0000 C CNN
F 3 "" H -300 1700 50  0000 C CNN
	1    6350 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 7000 6350 7050
Wire Wire Line
	6350 7050 6250 7050
NoConn ~ 6250 7550
$Comp
L GND #PWR?
U 1 1 58A6D0CF
P 6400 7550
F 0 "#PWR?" H 6450 7600 50  0001 C CNN
F 1 "GND" H 6405 7377 50  0000 C CNN
F 2 "" H -350 1650 50  0000 C CNN
F 3 "" H -350 1650 50  0000 C CNN
	1    6400 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 7550 6400 7450
Wire Wire Line
	6400 7450 6250 7450
NoConn ~ 6250 7350
Text Label 4050 4150 0    60   ~ 0
USB_DM
Text Label 4050 4250 0    60   ~ 0
USB_DP
Text Label 10250 2150 2    60   ~ 0
LCD_RES
Wire Wire Line
	10200 2450 10250 2450
Wire Wire Line
	10200 2250 10200 2650
Wire Wire Line
	10250 2350 10200 2350
Connection ~ 10200 2450
Wire Wire Line
	10000 2250 10250 2250
Connection ~ 10200 2350
Connection ~ 10200 2250
Wire Wire Line
	10200 2650 10250 2650
Text Label 10250 2750 2    60   ~ 0
V0
$Comp
L POT RV?
U 1 1 58A6FE12
P 9200 2750
F 0 "RV?" V 9154 2673 50  0000 R CNN
F 1 "POT" V 9245 2673 50  0000 R CNN
F 2 "" H 50  450 50  0000 C CNN
F 3 "" H 50  450 50  0000 C CNN
	1    9200 2750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 58A6FF25
P 9200 2900
F 0 "#PWR?" H 9250 2950 50  0001 C CNN
F 1 "GND" H 9205 2727 50  0000 C CNN
F 2 "" H 300 1000 50  0000 C CNN
F 3 "" H 300 1000 50  0000 C CNN
	1    9200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2750 9350 2750
Text Label 10250 2850 2    60   ~ 0
LCD_CS
Text Label 10250 3050 2    60   ~ 0
LCD_D7
Text Label 10250 3150 2    60   ~ 0
LCD_D6
Text Label 10250 3750 2    60   ~ 0
LCD_D0
Text Label 10250 3650 2    60   ~ 0
LCD_D1
Text Label 10250 3550 2    60   ~ 0
LCD_D2
Text Label 10250 3450 2    60   ~ 0
LCD_D3
Text Label 10250 3350 2    60   ~ 0
LCD_D4
Text Label 10250 3250 2    60   ~ 0
LCD_D5
Text Label 10250 3850 2    60   ~ 0
LCD_RD
Text Label 10250 3950 2    60   ~ 0
LCD_WR
Text Label 10250 4050 2    60   ~ 0
LCD_A0
Text Label 10250 4150 2    60   ~ 0
SEL1
$Comp
L GND #PWR?
U 1 1 58A70FA9
P 10250 4250
F 0 "#PWR?" H 10300 4300 50  0001 C CNN
F 1 "GND" H 10255 4077 50  0000 C CNN
F 2 "" H 0   100 50  0000 C CNN
F 3 "" H 0   100 50  0000 C CNN
	1    10250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 4150 9600 4150
$Comp
L +5V #PWR?
U 1 1 58A71EB5
P 9200 2600
F 0 "#PWR?" H 9250 2650 50  0001 C CNN
F 1 "+5V" H 9215 2773 50  0000 C CNN
F 2 "" H -100 0   50  0000 C CNN
F 3 "" H -100 0   50  0000 C CNN
	1    9200 2600
	1    0    0    -1  
$EndComp
Text Label 4650 3650 0    60   ~ 0
LCD_D7
Text Label 4650 3750 0    60   ~ 0
LCD_D6
Text Label 4650 4350 0    60   ~ 0
LCD_D0
Text Label 4650 4250 0    60   ~ 0
LCD_D1
Text Label 4650 4150 0    60   ~ 0
LCD_D2
Text Label 4650 4050 0    60   ~ 0
LCD_D3
Text Label 4650 3950 0    60   ~ 0
LCD_D4
Text Label 4650 3850 0    60   ~ 0
LCD_D5
Text Label 4650 4450 0    60   ~ 0
LCD_RD
Text Label 4650 4550 0    60   ~ 0
LCD_WR
Text Label 4650 4650 0    60   ~ 0
LCD_A0
Text Label 4650 3550 0    60   ~ 0
LCD_CS
$Comp
L GND #PWR?
U 1 1 58A726C1
P 9600 4150
F 0 "#PWR?" H 9650 4200 50  0001 C CNN
F 1 "GND" H 9605 3977 50  0000 C CNN
F 2 "" H 0   50  50  0000 C CNN
F 3 "" H 0   50  50  0000 C CNN
	1    9600 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
