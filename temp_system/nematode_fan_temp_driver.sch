EESchema Schematic File Version 4
LIBS:nematode_fan_temp_driver-cache
EELAYER 29 0
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
L Connector:Conn_01x02_Female J1
U 1 1 5C9F3C58
P 2000 2500
F 0 "J1" H 2028 2476 50  0000 L CNN
F 1 "AC Socket IEC 320-C8" H 2028 2385 50  0000 L CNN
F 2 "Nematode_Imaging:IEC_320_C8" H 2000 2500 50  0001 C CNN
F 3 "~" H 2000 2500 50  0001 C CNN
	1    2000 2500
	-1   0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5C9F20BA
P 2700 2500
F 0 "F1" V 2900 2550 50  0000 L CNN
F 1 "1A - 250V" V 2800 2250 50  0000 L CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Schurter_0031_8201_Horizontal_Open" V 2630 2500 50  0001 C CNN
F 3 "~" H 2700 2500 50  0001 C CNN
	1    2700 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 2500 2550 2500
$Comp
L Nematod_Imaging:IRM-60-12 PS1
U 1 1 5C9F70F0
P 4200 2600
F 0 "PS1" H 4200 2967 50  0000 C CNN
F 1 "IRM-60-12" H 4200 2876 50  0000 C CNN
F 2 "CONV_IRM-60-12" H 4200 2600 50  0001 L BNN
F 3 "" H 4200 2600 50  0001 L BNN
F 4 "MEAN WELL" H 4200 2600 50  0001 L BNN "Field4"
F 5 "DIP-4 Mean Well" H 4200 2600 50  0001 L BNN "Field5"
F 6 "IRM-60-12" H 4200 2600 50  0001 L BNN "Field6"
F 7 "https://www.digikey.com/product-detail/en/mean-well-usa-inc/IRM-60-12/1866-3063-ND/7704688?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 4200 2600 50  0001 L BNN "Field7"
F 8 "IRM-60 Series 60 W Single Output 12 V Encapsulated Mini On Board Power Supply" H 4200 2600 50  0001 L BNN "Field8"
	1    4200 2600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5C9F88D5
P 3300 2500
F 0 "SW1" H 3300 2735 50  0000 C CNN
F 1 "SW_TOGGLE" H 3300 2644 50  0000 C CNN
F 2 "Nematode_Imaging:toggle_switch" H 3300 2500 50  0001 C CNN
F 3 "~" H 3300 2500 50  0001 C CNN
	1    3300 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2500 3100 2500
Wire Wire Line
	3500 2500 3800 2500
Wire Wire Line
	2200 2600 3750 2600
Wire Wire Line
	3750 2600 3750 2700
Wire Wire Line
	3750 2700 3800 2700
$Comp
L power:GND #PWR0101
U 1 1 5C9F8FBA
P 4600 2750
F 0 "#PWR0101" H 4600 2500 50  0001 C CNN
F 1 "GND" H 4605 2577 50  0000 C CNN
F 2 "" H 4600 2750 50  0001 C CNN
F 3 "" H 4600 2750 50  0001 C CNN
	1    4600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2750 4600 2700
$Comp
L Device:LED D1
U 1 1 5C9FA299
P 5000 2650
F 0 "D1" V 5100 2500 50  0000 C CNN
F 1 "LED" V 5000 2500 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 5000 2650 50  0001 C CNN
F 3 "~" H 5000 2650 50  0001 C CNN
	1    5000 2650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5C9FA86C
P 5000 3000
F 0 "R1" H 5070 3046 50  0000 L CNN
F 1 "1k" H 5070 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4930 3000 50  0001 C CNN
F 3 "~" H 5000 3000 50  0001 C CNN
	1    5000 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_A J2
U 1 1 5C9FAF8C
P 6850 2200
F 0 "J2" H 6620 2189 50  0000 R CNN
F 1 "USB_A" H 6620 2098 50  0000 R CNN
F 2 "Connector_USB:USB_A_CNCTech_1001-011-01101_Horizontal" H 7000 2150 50  0001 C CNN
F 3 " ~" H 7000 2150 50  0001 C CNN
	1    6850 2200
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 5C9FC4C0
P 5650 2000
F 0 "U1" H 5650 2242 50  0000 C CNN
F 1 "3A 5V Reg" H 5650 2151 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 5650 2225 50  0001 C CIN
F 3 "" H 5650 1950 50  0001 C CNN
	1    5650 2000
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U2
U 1 1 5C9FD62D
P 5650 3000
F 0 "U2" H 5650 3242 50  0000 C CNN
F 1 "1A 5V Reg" H 5650 3151 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 5650 3225 50  0001 C CIN
F 3 "" H 5650 2950 50  0001 C CNN
	1    5650 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5CA01757
P 5000 3150
F 0 "#PWR0102" H 5000 2900 50  0001 C CNN
F 1 "GND" H 5005 2977 50  0000 C CNN
F 2 "" H 5000 3150 50  0001 C CNN
F 3 "" H 5000 3150 50  0001 C CNN
	1    5000 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 5CA03B3E
P 5250 2000
F 0 "#PWR0103" H 5250 1850 50  0001 C CNN
F 1 "+12V" H 5265 2173 50  0000 C CNN
F 2 "" H 5250 2000 50  0001 C CNN
F 3 "" H 5250 2000 50  0001 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2000 5250 2000
$Comp
L power:GND #PWR0104
U 1 1 5CA04429
P 5650 2300
F 0 "#PWR0104" H 5650 2050 50  0001 C CNN
F 1 "GND" H 5655 2127 50  0000 C CNN
F 2 "" H 5650 2300 50  0001 C CNN
F 3 "" H 5650 2300 50  0001 C CNN
	1    5650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2600 6850 2650
Wire Wire Line
	6850 2650 6900 2650
Wire Wire Line
	6950 2650 6950 2600
$Comp
L power:GND #PWR0105
U 1 1 5CA070AF
P 6900 2650
F 0 "#PWR0105" H 6900 2400 50  0001 C CNN
F 1 "GND" H 6905 2477 50  0000 C CNN
F 2 "" H 6900 2650 50  0001 C CNN
F 3 "" H 6900 2650 50  0001 C CNN
	1    6900 2650
	1    0    0    -1  
$EndComp
Connection ~ 6900 2650
Wire Wire Line
	6900 2650 6950 2650
$Comp
L power:+12V #PWR0106
U 1 1 5CA08EBE
P 5300 3000
F 0 "#PWR0106" H 5300 2850 50  0001 C CNN
F 1 "+12V" H 5315 3173 50  0000 C CNN
F 2 "" H 5300 3000 50  0001 C CNN
F 3 "" H 5300 3000 50  0001 C CNN
	1    5300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3000 5350 3000
$Comp
L power:GND #PWR0107
U 1 1 5CA09798
P 5650 3300
F 0 "#PWR0107" H 5650 3050 50  0001 C CNN
F 1 "GND" H 5655 3127 50  0000 C CNN
F 2 "" H 5650 3300 50  0001 C CNN
F 3 "" H 5650 3300 50  0001 C CNN
	1    5650 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5CA0DE7E
P 2350 3550
F 0 "#PWR0108" H 2350 3300 50  0001 C CNN
F 1 "GND" H 2355 3377 50  0000 C CNN
F 2 "" H 2350 3550 50  0001 C CNN
F 3 "" H 2350 3550 50  0001 C CNN
	1    2350 3550
	1    0    0    -1  
$EndComp
Text GLabel 4500 3500 0    50   Input ~ 0
fan_pwm
Wire Wire Line
	4700 2500 5000 2500
Connection ~ 4700 2500
Wire Wire Line
	4600 2500 4700 2500
$Comp
L power:+12V #PWR0109
U 1 1 5C9F9579
P 4700 2500
F 0 "#PWR0109" H 4700 2350 50  0001 C CNN
F 1 "+12V" H 4715 2673 50  0000 C CNN
F 2 "" H 4700 2500 50  0001 C CNN
F 3 "" H 4700 2500 50  0001 C CNN
	1    4700 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0110
U 1 1 5CA11E49
P 3900 4500
F 0 "#PWR0110" H 3900 4350 50  0001 C CNN
F 1 "+12V" H 3915 4673 50  0000 C CNN
F 2 "" H 3900 4500 50  0001 C CNN
F 3 "" H 3900 4500 50  0001 C CNN
	1    3900 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3050 2350 3150
$Comp
L power:GND #PWR0111
U 1 1 5CA154FB
P 2350 4400
F 0 "#PWR0111" H 2350 4150 50  0001 C CNN
F 1 "GND" H 2355 4227 50  0000 C CNN
F 2 "" H 2350 4400 50  0001 C CNN
F 3 "" H 2350 4400 50  0001 C CNN
	1    2350 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3900 2350 4000
$Comp
L power:GND #PWR0113
U 1 1 5CA19CF7
P 2350 5250
F 0 "#PWR0113" H 2350 5000 50  0001 C CNN
F 1 "GND" H 2355 5077 50  0000 C CNN
F 2 "" H 2350 5250 50  0001 C CNN
F 3 "" H 2350 5250 50  0001 C CNN
	1    2350 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4750 2350 4850
$Comp
L power:GND #PWR0115
U 1 1 5CA2005D
P 2350 6150
F 0 "#PWR0115" H 2350 5900 50  0001 C CNN
F 1 "GND" H 2355 5977 50  0000 C CNN
F 2 "" H 2350 6150 50  0001 C CNN
F 3 "" H 2350 6150 50  0001 C CNN
	1    2350 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5650 2350 5750
Wire Wire Line
	5000 2800 5000 2850
$Comp
L Transistor_FET:BS170 Q4
U 1 1 5CA20049
P 2250 5950
F 0 "Q4" H 2456 5996 50  0000 L CNN
F 1 "BS170" H 2456 5905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2450 5875 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BS/BS170.pdf" H 2250 5950 50  0001 L CNN
	1    2250 5950
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BS170 Q2
U 1 1 5CA154E6
P 2250 4200
F 0 "Q2" H 2456 4246 50  0000 L CNN
F 1 "BS170" H 2456 4155 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2450 4125 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BS/BS170.pdf" H 2250 4200 50  0001 L CNN
	1    2250 4200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BS170 Q1
U 1 1 5C9FE776
P 2250 3350
F 0 "Q1" H 2456 3396 50  0000 L CNN
F 1 "BS170" H 2456 3305 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2450 3275 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BS/BS170.pdf" H 2250 3350 50  0001 L CNN
	1    2250 3350
	1    0    0    -1  
$EndComp
Text GLabel 2050 4200 0    50   Input ~ 0
fan_2_ctrl
Text GLabel 2050 3350 0    50   Input ~ 0
fan_1_ctrl
$Comp
L Transistor_FET:BS170 Q3
U 1 1 5CA19CE3
P 2250 5050
F 0 "Q3" H 2456 5096 50  0000 L CNN
F 1 "BS170" H 2456 5005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2450 4975 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BS/BS170.pdf" H 2250 5050 50  0001 L CNN
	1    2250 5050
	1    0    0    -1  
$EndComp
Text GLabel 2050 5050 0    50   Input ~ 0
fan_3_ctrl
Text GLabel 2050 5950 0    50   Input ~ 0
fan_4_ctrl
Text GLabel 4500 4100 0    50   Input ~ 0
fan_2_ctrl
Text GLabel 4500 4000 0    50   Input ~ 0
fan_1_ctrl
Text GLabel 4500 4200 0    50   Input ~ 0
fan_3_ctrl
Text GLabel 4500 4300 0    50   Input ~ 0
fan_4_ctrl
Text GLabel 6150 3000 2    50   Input ~ 0
5V
$Comp
L power:GND #PWR0117
U 1 1 5CA37DDC
P 3950 5800
F 0 "#PWR0117" H 3950 5550 50  0001 C CNN
F 1 "GND" H 3955 5627 50  0000 C CNN
F 2 "" H 3950 5800 50  0001 C CNN
F 3 "" H 3950 5800 50  0001 C CNN
	1    3950 5800
	1    0    0    -1  
$EndComp
Text GLabel 4500 6000 0    50   Input ~ 0
temp_2
Text GLabel 4500 5900 0    50   Input ~ 0
5V
Text GLabel 4500 6300 0    50   Input ~ 0
temp_3
Text GLabel 4500 6200 0    50   Input ~ 0
5V
Text GLabel 4500 6600 0    50   Input ~ 0
temp_4
Text GLabel 4500 6500 0    50   Input ~ 0
5V
$Comp
L power:GND #PWR0120
U 1 1 5CA3C5AD
P 3950 6700
F 0 "#PWR0120" H 3950 6450 50  0001 C CNN
F 1 "GND" H 3955 6527 50  0000 C CNN
F 2 "" H 3950 6700 50  0001 C CNN
F 3 "" H 3950 6700 50  0001 C CNN
	1    3950 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5CA8472F
P 6250 2150
F 0 "C1" H 6368 2196 50  0000 L CNN
F 1 "CP" H 6368 2105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 6288 2000 50  0001 C CNN
F 3 "~" H 6250 2150 50  0001 C CNN
	1    6250 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2000 6250 2000
Wire Wire Line
	6250 2000 6550 2000
Connection ~ 6250 2000
$Comp
L power:GND #PWR0112
U 1 1 5CA88494
P 6250 2300
F 0 "#PWR0112" H 6250 2050 50  0001 C CNN
F 1 "GND" H 6255 2127 50  0000 C CNN
F 2 "" H 6250 2300 50  0001 C CNN
F 3 "" H 6250 2300 50  0001 C CNN
	1    6250 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5CA8A07B
P 6050 3200
F 0 "C2" H 6168 3246 50  0000 L CNN
F 1 "CP" H 6168 3155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 6088 3050 50  0001 C CNN
F 3 "~" H 6050 3200 50  0001 C CNN
	1    6050 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3000 6050 3000
Wire Wire Line
	6050 3050 6050 3000
Connection ~ 6050 3000
Wire Wire Line
	6050 3000 6150 3000
$Comp
L power:GND #PWR0114
U 1 1 5CA8BB7B
P 6050 3350
F 0 "#PWR0114" H 6050 3100 50  0001 C CNN
F 1 "GND" H 6055 3177 50  0000 C CNN
F 2 "" H 6050 3350 50  0001 C CNN
F 3 "" H 6050 3350 50  0001 C CNN
	1    6050 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5800 4500 5800
Text GLabel 4500 5700 0    50   Input ~ 0
temp_1
Text GLabel 4500 5600 0    50   Input ~ 0
5V
Text GLabel 2350 3050 2    50   Input ~ 0
fan_1_src
Text GLabel 2350 3900 2    50   Input ~ 0
fan_2_src
Text GLabel 2350 4750 2    50   Input ~ 0
fan_3_src
Text GLabel 2350 5650 2    50   Input ~ 0
fan_4_src
Text GLabel 4500 4400 0    50   Input ~ 0
fan_1_src
Wire Wire Line
	3900 4500 4500 4500
$Comp
L power:+12V #PWR0116
U 1 1 5CAA6C7D
P 3900 4800
F 0 "#PWR0116" H 3900 4650 50  0001 C CNN
F 1 "+12V" H 3915 4973 50  0000 C CNN
F 2 "" H 3900 4800 50  0001 C CNN
F 3 "" H 3900 4800 50  0001 C CNN
	1    3900 4800
	1    0    0    -1  
$EndComp
Text GLabel 4500 4700 0    50   Input ~ 0
fan_2_src
Wire Wire Line
	3900 4800 4500 4800
$Comp
L power:+12V #PWR0118
U 1 1 5CAA74ED
P 3900 5100
F 0 "#PWR0118" H 3900 4950 50  0001 C CNN
F 1 "+12V" H 3915 5273 50  0000 C CNN
F 2 "" H 3900 5100 50  0001 C CNN
F 3 "" H 3900 5100 50  0001 C CNN
	1    3900 5100
	1    0    0    -1  
$EndComp
Text GLabel 4500 5000 0    50   Input ~ 0
fan_3_src
Wire Wire Line
	3900 5100 4500 5100
$Comp
L power:+12V #PWR0119
U 1 1 5CAA7C35
P 3900 5400
F 0 "#PWR0119" H 3900 5250 50  0001 C CNN
F 1 "+12V" H 3915 5573 50  0000 C CNN
F 2 "" H 3900 5400 50  0001 C CNN
F 3 "" H 3900 5400 50  0001 C CNN
	1    3900 5400
	1    0    0    -1  
$EndComp
Text GLabel 4500 5300 0    50   Input ~ 0
fan_4_src
Wire Wire Line
	3900 5400 4500 5400
$Comp
L power:GND #PWR0121
U 1 1 5CAB0924
P 3950 6100
F 0 "#PWR0121" H 3950 5850 50  0001 C CNN
F 1 "GND" H 3955 5927 50  0000 C CNN
F 2 "" H 3950 6100 50  0001 C CNN
F 3 "" H 3950 6100 50  0001 C CNN
	1    3950 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6100 4500 6100
$Comp
L power:GND #PWR0122
U 1 1 5CAB149B
P 3950 6400
F 0 "#PWR0122" H 3950 6150 50  0001 C CNN
F 1 "GND" H 3955 6227 50  0000 C CNN
F 2 "" H 3950 6400 50  0001 C CNN
F 3 "" H 3950 6400 50  0001 C CNN
	1    3950 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6400 4500 6400
Wire Wire Line
	3950 6700 4500 6700
Text GLabel 4500 3900 0    50   Input ~ 0
temp_4
Text GLabel 4500 3800 0    50   Input ~ 0
temp_3
Text GLabel 4500 3700 0    50   Input ~ 0
temp_2
Text GLabel 4500 3600 0    50   Input ~ 0
temp_1
$Comp
L Connector:Conn_01x33_Male J3
U 1 1 5CAD3C65
P 4700 5100
F 0 "J3" H 4672 5124 50  0000 R CNN
F 1 "Conn_01x33_Male" H 4672 5033 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x33_P2.00mm_Vertical" H 4700 5100 50  0001 C CNN
F 3 "~" H 4700 5100 50  0001 C CNN
	1    4700 5100
	-1   0    0    -1  
$EndComp
Text GLabel 4500 4600 0    50   Input ~ 0
fan_pwm
Text GLabel 4500 5200 0    50   Input ~ 0
fan_pwm
Text GLabel 4500 5500 0    50   Input ~ 0
fan_pwm
Text GLabel 4500 4900 0    50   Input ~ 0
fan_pwm
$EndSCHEMATC
