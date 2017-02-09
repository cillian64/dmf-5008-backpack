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
LIBS:max14521
LIBS:tlv61220
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
L MAX14521 IC?
U 1 1 589CF444
P 4900 3950
F 0 "IC?" H 4900 5075 50  0000 C CNN
F 1 "MAX14521" H 4900 4984 50  0000 C CNN
F 2 "agg:QFN-24-EP-MAX" H -50 -1150 50  0001 L CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX14521E.pdf" H -50 -1250 50  0001 L CNN
F 4 "" H -50 -1350 50  0001 L CNN "Farnell"
	1    4900 3950
	1    0    0    -1  
$EndComp
$Comp
L TLV61220 IC?
U 1 1 589CF8E1
P 5000 1600
F 0 "IC?" H 5000 1925 50  0000 C CNN
F 1 "TLV61220" H 5000 1834 50  0000 C CNN
F 2 "agg:SOT-23-6" H 2550 -1400 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv61220.pdf" H 2550 -1500 50  0001 L CNN
F 4 "2323546" H 2550 -1600 50  0001 L CNN "Farnell"
	1    5000 1600
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
P 4550 1450
F 0 "#PWR?" H 200 0   50  0001 C CNN
F 1 "+3V3" H 4565 1623 50  0000 C CNN
F 2 "" H 200 150 50  0000 C CNN
F 3 "" H 200 150 50  0000 C CNN
	1    4550 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1450 4550 1500
Wire Wire Line
	4550 1500 4600 1500
$Comp
L +5V #PWR?
U 1 1 589CFB65
P 5450 1450
F 0 "#PWR?" H 400 -150 50  0001 C CNN
F 1 "+5V" H 5465 1623 50  0000 C CNN
F 2 "" H 400 0   50  0000 C CNN
F 3 "" H 400 0   50  0000 C CNN
	1    5450 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1450 5450 1500
Wire Wire Line
	5450 1500 5400 1500
$Comp
L +3V3 #PWR?
U 1 1 589CFBC0
P 4450 3000
F 0 "#PWR?" H 450 100 50  0001 C CNN
F 1 "+3V3" H 4465 3173 50  0000 C CNN
F 2 "" H 450 250 50  0000 C CNN
F 3 "" H 450 250 50  0000 C CNN
	1    4450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3000 4450 3050
Wire Wire Line
	4450 3050 4500 3050
Text Label 10250 1850 2    60   ~ 0
EL1
Text Label 10250 1950 2    60   ~ 0
EL2
Text Label 5300 3450 0    60   ~ 0
EL1
Text Label 5300 3850 0    60   ~ 0
EL2
NoConn ~ 5300 3550
NoConn ~ 5300 3650
NoConn ~ 5300 3750
$Comp
L +5V #PWR?
U 1 1 589CFE02
P 9950 1950
F 0 "#PWR?" H 10000 2000 50  0001 C CNN
F 1 "+5V" H 9965 2123 50  0000 C CNN
F 2 "" H 200 -250 50  0000 C CNN
F 3 "" H 200 -250 50  0000 C CNN
	1    9950 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 1950 9950 2950
Wire Wire Line
	9950 2050 10250 2050
Wire Wire Line
	9950 2550 10250 2550
Connection ~ 9950 2050
$Comp
L GND #PWR?
U 1 1 589CFE50
P 9700 2650
F 0 "#PWR?" H 9750 2700 50  0001 C CNN
F 1 "GND" H 9705 2477 50  0000 C CNN
F 2 "" H -200 150 50  0000 C CNN
F 3 "" H -200 150 50  0000 C CNN
	1    9700 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2650 10250 2650
Wire Wire Line
	9950 2950 10250 2950
Connection ~ 9950 2550
$EndSCHEMATC
