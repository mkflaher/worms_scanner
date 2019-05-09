EESchema Schematic File Version 4
LIBS:fludic_system-cache
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
U 1 1 5CA436CF
P 2200 1700
F 0 "J1" H 2228 1676 50  0000 L CNN
F 1 "AC Socket IEC 320-C8" H 2228 1585 50  0000 L CNN
F 2 "Nematode_Imaging:IEC_320_C8" H 2200 1700 50  0001 C CNN
F 3 "~" H 2200 1700 50  0001 C CNN
	1    2200 1700
	-1   0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5CA436D5
P 2900 1700
F 0 "F1" V 3100 1750 50  0000 L CNN
F 1 "1A - 250V" V 3000 1450 50  0000 L CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Schurter_0031_8201_Horizontal_Open" V 2830 1700 50  0001 C CNN
F 3 "~" H 2900 1700 50  0001 C CNN
	1    2900 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2400 1700 2750 1700
$Comp
L Nematod_Imaging:IRM-60-12 PS1
U 1 1 5CA436E1
P 4400 1800
F 0 "PS1" H 4400 2167 50  0000 C CNN
F 1 "IRM-60-12" H 4400 2076 50  0000 C CNN
F 2 "CONV_IRM-60-12" H 4400 1800 50  0001 L BNN
F 3 "" H 4400 1800 50  0001 L BNN
F 4 "MEAN WELL" H 4400 1800 50  0001 L BNN "Field4"
F 5 "DIP-4 Mean Well" H 4400 1800 50  0001 L BNN "Field5"
F 6 "IRM-60-12" H 4400 1800 50  0001 L BNN "Field6"
F 7 "https://www.digikey.com/product-detail/en/mean-well-usa-inc/IRM-60-12/1866-3063-ND/7704688?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 4400 1800 50  0001 L BNN "Field7"
F 8 "IRM-60 Series 60 W Single Output 12 V Encapsulated Mini On Board Power Supply" H 4400 1800 50  0001 L BNN "Field8"
	1    4400 1800
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5CA436E7
P 3500 1700
F 0 "SW1" H 3500 1935 50  0000 C CNN
F 1 "SW_TOGGLE" H 3500 1844 50  0000 C CNN
F 2 "Nematode_Imaging:toggle_switch" H 3500 1700 50  0001 C CNN
F 3 "~" H 3500 1700 50  0001 C CNN
	1    3500 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1700 3300 1700
Wire Wire Line
	3700 1700 4000 1700
Wire Wire Line
	2400 1800 3950 1800
Wire Wire Line
	3950 1800 3950 1900
Wire Wire Line
	3950 1900 4000 1900
$Comp
L power:GND #PWR0101
U 1 1 5CA436F2
P 4800 1950
F 0 "#PWR0101" H 4800 1700 50  0001 C CNN
F 1 "GND" H 4805 1777 50  0000 C CNN
F 2 "" H 4800 1950 50  0001 C CNN
F 3 "" H 4800 1950 50  0001 C CNN
	1    4800 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1950 4800 1900
$Comp
L Device:LED D1
U 1 1 5CA436F9
P 5200 1850
F 0 "D1" V 5300 1700 50  0000 C CNN
F 1 "LED" V 5200 1700 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 5200 1850 50  0001 C CNN
F 3 "~" H 5200 1850 50  0001 C CNN
	1    5200 1850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5CA436FF
P 5200 2200
F 0 "R1" H 5270 2246 50  0000 L CNN
F 1 "1k" H 5270 2155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5130 2200 50  0001 C CNN
F 3 "~" H 5200 2200 50  0001 C CNN
	1    5200 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_A J2
U 1 1 5CA43705
P 7100 1400
F 0 "J2" H 6870 1389 50  0000 R CNN
F 1 "USB_A" H 6870 1298 50  0000 R CNN
F 2 "Connector_USB:USB_A_CNCTech_1001-011-01101_Horizontal" H 7250 1350 50  0001 C CNN
F 3 " ~" H 7250 1350 50  0001 C CNN
	1    7100 1400
	-1   0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 5CA4370B
P 5850 1200
F 0 "U1" H 5850 1442 50  0000 C CNN
F 1 "3A 5V Reg" H 5850 1351 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 5850 1425 50  0001 C CIN
F 3 "" H 5850 1150 50  0001 C CNN
	1    5850 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5CA43717
P 5200 2350
F 0 "#PWR0102" H 5200 2100 50  0001 C CNN
F 1 "GND" H 5205 2177 50  0000 C CNN
F 2 "" H 5200 2350 50  0001 C CNN
F 3 "" H 5200 2350 50  0001 C CNN
	1    5200 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 5CA4371D
P 5450 1200
F 0 "#PWR0103" H 5450 1050 50  0001 C CNN
F 1 "+12V" H 5465 1373 50  0000 C CNN
F 2 "" H 5450 1200 50  0001 C CNN
F 3 "" H 5450 1200 50  0001 C CNN
	1    5450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1200 5450 1200
$Comp
L power:GND #PWR0104
U 1 1 5CA43724
P 5850 1500
F 0 "#PWR0104" H 5850 1250 50  0001 C CNN
F 1 "GND" H 5855 1327 50  0000 C CNN
F 2 "" H 5850 1500 50  0001 C CNN
F 3 "" H 5850 1500 50  0001 C CNN
	1    5850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1800 7100 1850
Wire Wire Line
	7100 1850 7150 1850
Wire Wire Line
	7200 1850 7200 1800
$Comp
L power:GND #PWR0105
U 1 1 5CA4372D
P 7150 1850
F 0 "#PWR0105" H 7150 1600 50  0001 C CNN
F 1 "GND" H 7155 1677 50  0000 C CNN
F 2 "" H 7150 1850 50  0001 C CNN
F 3 "" H 7150 1850 50  0001 C CNN
	1    7150 1850
	1    0    0    -1  
$EndComp
Connection ~ 7150 1850
Wire Wire Line
	7150 1850 7200 1850
Wire Wire Line
	4900 1700 5200 1700
Connection ~ 4900 1700
Wire Wire Line
	4800 1700 4900 1700
$Comp
L power:+12V #PWR0106
U 1 1 5CA43753
P 4900 1700
F 0 "#PWR0106" H 4900 1550 50  0001 C CNN
F 1 "+12V" H 4915 1873 50  0000 C CNN
F 2 "" H 4900 1700 50  0001 C CNN
F 3 "" H 4900 1700 50  0001 C CNN
	1    4900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2000 5200 2050
$Comp
L Transistor_BJT:2N2219 Q3
U 1 1 5CA58CBE
P 2350 5500
F 0 "Q3" H 2540 5546 50  0000 L CNN
F 1 "2N2222" H 2540 5455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92" H 2550 5425 50  0001 L CIN
F 3 "" H 2350 5500 50  0001 L CNN
	1    2350 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5CA58CC4
P 2450 5700
F 0 "#PWR0107" H 2450 5450 50  0001 C CNN
F 1 "GND" H 2455 5527 50  0000 C CNN
F 2 "" H 2450 5700 50  0001 C CNN
F 3 "" H 2450 5700 50  0001 C CNN
	1    2450 5700
	1    0    0    -1  
$EndComp
Text GLabel 2150 5500 0    50   Input ~ 0
pump_2_ctrl
Wire Wire Line
	2450 5250 2450 5300
Wire Wire Line
	2750 5250 2450 5250
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5CA58CCD
P 3100 4950
F 0 "J8" H 3208 5131 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3208 5040 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 3100 4950 50  0001 C CNN
F 3 "~" H 3100 4950 50  0001 C CNN
	1    3100 4950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2750 5050 2750 5250
Connection ~ 2450 5250
$Comp
L Device:D D6
U 1 1 5CA58CD5
P 2450 5100
F 0 "D6" H 2450 5316 50  0000 C CNN
F 1 "D" H 2450 5225 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 2450 5100 50  0001 C CNN
F 3 "~" H 2450 5100 50  0001 C CNN
	1    2450 5100
	0    1    1    0   
$EndComp
Connection ~ 2450 4950
Wire Wire Line
	2450 4950 2900 4950
Wire Wire Line
	2750 5050 2900 5050
$Comp
L Transistor_BJT:2N2219 Q5
U 1 1 5CA5AE98
P 2350 7000
F 0 "Q5" H 2540 7046 50  0000 L CNN
F 1 "2N2222" H 2540 6955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92" H 2550 6925 50  0001 L CIN
F 3 "" H 2350 7000 50  0001 L CNN
	1    2350 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5CA5AE9E
P 2450 7200
F 0 "#PWR0108" H 2450 6950 50  0001 C CNN
F 1 "GND" H 2455 7027 50  0000 C CNN
F 2 "" H 2450 7200 50  0001 C CNN
F 3 "" H 2450 7200 50  0001 C CNN
	1    2450 7200
	1    0    0    -1  
$EndComp
Text GLabel 2150 7000 0    50   Input ~ 0
pump_3_ctrl
Wire Wire Line
	2450 6750 2450 6800
Wire Wire Line
	2750 6750 2450 6750
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 5CA5AEA7
P 3100 6450
F 0 "J10" H 3208 6631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3208 6540 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 3100 6450 50  0001 C CNN
F 3 "~" H 3100 6450 50  0001 C CNN
	1    3100 6450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2750 6550 2750 6750
Connection ~ 2450 6750
$Comp
L Device:D D8
U 1 1 5CA5AEAF
P 2450 6600
F 0 "D8" H 2450 6816 50  0000 C CNN
F 1 "D" H 2450 6725 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 2450 6600 50  0001 C CNN
F 3 "~" H 2450 6600 50  0001 C CNN
	1    2450 6600
	0    1    1    0   
$EndComp
Connection ~ 2450 6450
Wire Wire Line
	2450 6450 2900 6450
Wire Wire Line
	2750 6550 2900 6550
$Comp
L Transistor_BJT:2N2219 Q2
U 1 1 5CA5C00E
P 4050 3800
F 0 "Q2" H 4240 3846 50  0000 L CNN
F 1 "2N2222" H 4240 3755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92" H 4250 3725 50  0001 L CIN
F 3 "" H 4050 3800 50  0001 L CNN
	1    4050 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5CA5C014
P 4150 4000
F 0 "#PWR0109" H 4150 3750 50  0001 C CNN
F 1 "GND" H 4155 3827 50  0000 C CNN
F 2 "" H 4150 4000 50  0001 C CNN
F 3 "" H 4150 4000 50  0001 C CNN
	1    4150 4000
	1    0    0    -1  
$EndComp
Text GLabel 3850 3800 0    50   Input ~ 0
pump_4_ctrl
Wire Wire Line
	4150 3550 4150 3600
Wire Wire Line
	4450 3550 4150 3550
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5CA5C01D
P 4800 3250
F 0 "J7" H 4908 3431 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4908 3340 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 4800 3250 50  0001 C CNN
F 3 "~" H 4800 3250 50  0001 C CNN
	1    4800 3250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4450 3350 4450 3550
Connection ~ 4150 3550
$Comp
L Device:D D5
U 1 1 5CA5C025
P 4150 3400
F 0 "D5" H 4150 3616 50  0000 C CNN
F 1 "D" H 4150 3525 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 4150 3400 50  0001 C CNN
F 3 "~" H 4150 3400 50  0001 C CNN
	1    4150 3400
	0    1    1    0   
$EndComp
Connection ~ 4150 3250
Wire Wire Line
	4150 3250 4600 3250
Wire Wire Line
	4450 3350 4600 3350
$Comp
L Transistor_BJT:2N2219 Q4
U 1 1 5CA5D7A0
P 4050 5500
F 0 "Q4" H 4240 5546 50  0000 L CNN
F 1 "2N2222" H 4240 5455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92" H 4250 5425 50  0001 L CIN
F 3 "" H 4050 5500 50  0001 L CNN
	1    4050 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5CA5D7A6
P 4150 5700
F 0 "#PWR0110" H 4150 5450 50  0001 C CNN
F 1 "GND" H 4155 5527 50  0000 C CNN
F 2 "" H 4150 5700 50  0001 C CNN
F 3 "" H 4150 5700 50  0001 C CNN
	1    4150 5700
	1    0    0    -1  
$EndComp
Text GLabel 3850 5500 0    50   Input ~ 0
pump_5_ctrl
Wire Wire Line
	4150 5250 4150 5300
Wire Wire Line
	4450 5250 4150 5250
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 5CA5D7AF
P 4800 4950
F 0 "J9" H 4908 5131 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4908 5040 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 4800 4950 50  0001 C CNN
F 3 "~" H 4800 4950 50  0001 C CNN
	1    4800 4950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4450 5050 4450 5250
Connection ~ 4150 5250
$Comp
L Device:D D7
U 1 1 5CA5D7B7
P 4150 5100
F 0 "D7" H 4150 5316 50  0000 C CNN
F 1 "D" H 4150 5225 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 4150 5100 50  0001 C CNN
F 3 "~" H 4150 5100 50  0001 C CNN
	1    4150 5100
	0    1    1    0   
$EndComp
Connection ~ 4150 4950
Wire Wire Line
	4150 4950 4600 4950
Wire Wire Line
	4450 5050 4600 5050
$Comp
L Transistor_BJT:2N2219 Q6
U 1 1 5CA5E868
P 4000 7150
F 0 "Q6" H 4190 7196 50  0000 L CNN
F 1 "2N2222" H 4190 7105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92" H 4200 7075 50  0001 L CIN
F 3 "" H 4000 7150 50  0001 L CNN
	1    4000 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5CA5E86E
P 4100 7350
F 0 "#PWR0111" H 4100 7100 50  0001 C CNN
F 1 "GND" H 4105 7177 50  0000 C CNN
F 2 "" H 4100 7350 50  0001 C CNN
F 3 "" H 4100 7350 50  0001 C CNN
	1    4100 7350
	1    0    0    -1  
$EndComp
Text GLabel 3800 7150 0    50   Input ~ 0
pump_6_ctrl
Wire Wire Line
	4100 6900 4100 6950
Wire Wire Line
	4400 6900 4100 6900
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 5CA5E877
P 4750 6600
F 0 "J11" H 4858 6781 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4858 6690 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 4750 6600 50  0001 C CNN
F 3 "~" H 4750 6600 50  0001 C CNN
	1    4750 6600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4400 6700 4400 6900
Connection ~ 4100 6900
$Comp
L Device:D D9
U 1 1 5CA5E87F
P 4100 6750
F 0 "D9" H 4100 6966 50  0000 C CNN
F 1 "D" H 4100 6875 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 4100 6750 50  0001 C CNN
F 3 "~" H 4100 6750 50  0001 C CNN
	1    4100 6750
	0    1    1    0   
$EndComp
Connection ~ 4100 6600
Wire Wire Line
	4100 6600 4550 6600
Wire Wire Line
	4400 6700 4550 6700
$Comp
L Device:CP1 C1
U 1 1 5CA015D1
P 6300 1350
F 0 "C1" H 6415 1396 50  0000 L CNN
F 1 "1u" H 6415 1305 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H5.0mm_P2.00mm" H 6300 1350 50  0001 C CNN
F 3 "~" H 6300 1350 50  0001 C CNN
	1    6300 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5CA05F4A
P 6300 1500
F 0 "#PWR0112" H 6300 1250 50  0001 C CNN
F 1 "GND" H 6305 1327 50  0000 C CNN
F 2 "" H 6300 1500 50  0001 C CNN
F 3 "" H 6300 1500 50  0001 C CNN
	1    6300 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1200 6300 1200
Wire Wire Line
	6300 1200 6600 1200
Connection ~ 6300 1200
Wire Wire Line
	1350 2700 1250 2700
Wire Wire Line
	1950 2700 2100 2700
$Comp
L power:GND #PWR0113
U 1 1 5CA673C7
P 2100 3000
F 0 "#PWR0113" H 2100 2750 50  0001 C CNN
F 1 "GND" H 2105 2827 50  0000 C CNN
F 2 "" H 2100 3000 50  0001 C CNN
F 3 "" H 2100 3000 50  0001 C CNN
	1    2100 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 5CA673C1
P 2100 2850
F 0 "C2" H 2215 2896 50  0000 L CNN
F 1 "1u" H 2215 2805 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H5.0mm_P2.00mm" H 2100 2850 50  0001 C CNN
F 3 "~" H 2100 2850 50  0001 C CNN
	1    2100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2700 2450 3200
$Comp
L power:GND #PWR0114
U 1 1 5CA64E05
P 1650 3000
F 0 "#PWR0114" H 1650 2750 50  0001 C CNN
F 1 "GND" H 1655 2827 50  0000 C CNN
F 2 "" H 1650 3000 50  0001 C CNN
F 3 "" H 1650 3000 50  0001 C CNN
	1    1650 3000
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U2
U 1 1 5CA52249
P 1650 2700
F 0 "U2" H 1650 2942 50  0000 C CNN
F 1 "1A 6V Reg" H 1650 2851 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 1650 2925 50  0001 C CIN
F 3 "" H 1650 2650 50  0001 C CNN
	1    1650 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0115
U 1 1 5CA50C36
P 1250 2700
F 0 "#PWR0115" H 1250 2550 50  0001 C CNN
F 1 "+12V" H 1265 2873 50  0000 C CNN
F 2 "" H 1250 2700 50  0001 C CNN
F 3 "" H 1250 2700 50  0001 C CNN
	1    1250 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3300 2900 3300
Wire Wire Line
	2450 3200 2900 3200
Connection ~ 2450 3200
$Comp
L Device:D D4
U 1 1 5CA454F2
P 2450 3350
F 0 "D4" H 2450 3566 50  0000 C CNN
F 1 "D" H 2450 3475 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 2450 3350 50  0001 C CNN
F 3 "~" H 2450 3350 50  0001 C CNN
	1    2450 3350
	0    1    1    0   
$EndComp
Connection ~ 2450 3500
Wire Wire Line
	2750 3300 2750 3500
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 5CA4D063
P 3100 3200
F 0 "J6" H 3208 3381 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3208 3290 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 3100 3200 50  0001 C CNN
F 3 "~" H 3100 3200 50  0001 C CNN
	1    3100 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2750 3500 2450 3500
Wire Wire Line
	2450 3500 2450 3550
Text GLabel 2150 3750 0    50   Input ~ 0
pump_1_ctrl
$Comp
L power:GND #PWR0116
U 1 1 5CA46652
P 2450 3950
F 0 "#PWR0116" H 2450 3700 50  0001 C CNN
F 1 "GND" H 2455 3777 50  0000 C CNN
F 2 "" H 2450 3950 50  0001 C CNN
F 3 "" H 2450 3950 50  0001 C CNN
	1    2450 3950
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 5CA4595A
P 2350 3750
F 0 "Q1" H 2540 3796 50  0000 L CNN
F 1 "2N2222" H 2540 3705 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92" H 2550 3675 50  0001 L CIN
F 3 "" H 2350 3750 50  0001 L CNN
	1    2350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2700 2450 2700
Connection ~ 2100 2700
Wire Wire Line
	4150 2700 2450 2700
Wire Wire Line
	4150 2700 4150 3250
Connection ~ 2450 2700
Wire Wire Line
	1350 4600 1250 4600
Wire Wire Line
	1950 4600 2100 4600
$Comp
L power:GND #PWR0117
U 1 1 5CA8579C
P 2100 4900
F 0 "#PWR0117" H 2100 4650 50  0001 C CNN
F 1 "GND" H 2105 4727 50  0000 C CNN
F 2 "" H 2100 4900 50  0001 C CNN
F 3 "" H 2100 4900 50  0001 C CNN
	1    2100 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C3
U 1 1 5CA857A2
P 2100 4750
F 0 "C3" H 2215 4796 50  0000 L CNN
F 1 "1u" H 2215 4705 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H5.0mm_P2.00mm" H 2100 4750 50  0001 C CNN
F 3 "~" H 2100 4750 50  0001 C CNN
	1    2100 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5CA857A8
P 1650 4900
F 0 "#PWR0118" H 1650 4650 50  0001 C CNN
F 1 "GND" H 1655 4727 50  0000 C CNN
F 2 "" H 1650 4900 50  0001 C CNN
F 3 "" H 1650 4900 50  0001 C CNN
	1    1650 4900
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U3
U 1 1 5CA857AE
P 1650 4600
F 0 "U3" H 1650 4842 50  0000 C CNN
F 1 "1A 6V Reg" H 1650 4751 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 1650 4825 50  0001 C CIN
F 3 "" H 1650 4550 50  0001 C CNN
	1    1650 4600
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0119
U 1 1 5CA857B4
P 1250 4600
F 0 "#PWR0119" H 1250 4450 50  0001 C CNN
F 1 "+12V" H 1265 4773 50  0000 C CNN
F 2 "" H 1250 4600 50  0001 C CNN
F 3 "" H 1250 4600 50  0001 C CNN
	1    1250 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4600 2450 4600
Connection ~ 2100 4600
Wire Wire Line
	2450 4600 2450 4950
Wire Wire Line
	2450 4600 4150 4600
Wire Wire Line
	4150 4600 4150 4950
Connection ~ 2450 4600
Wire Wire Line
	1150 6150 1050 6150
Wire Wire Line
	1750 6150 1900 6150
$Comp
L power:GND #PWR0120
U 1 1 5CA94FE8
P 1900 6450
F 0 "#PWR0120" H 1900 6200 50  0001 C CNN
F 1 "GND" H 1905 6277 50  0000 C CNN
F 2 "" H 1900 6450 50  0001 C CNN
F 3 "" H 1900 6450 50  0001 C CNN
	1    1900 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C4
U 1 1 5CA94FEE
P 1900 6300
F 0 "C4" H 2015 6346 50  0000 L CNN
F 1 "1u" H 2015 6255 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H5.0mm_P2.00mm" H 1900 6300 50  0001 C CNN
F 3 "~" H 1900 6300 50  0001 C CNN
	1    1900 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5CA94FF4
P 1450 6450
F 0 "#PWR0121" H 1450 6200 50  0001 C CNN
F 1 "GND" H 1455 6277 50  0000 C CNN
F 2 "" H 1450 6450 50  0001 C CNN
F 3 "" H 1450 6450 50  0001 C CNN
	1    1450 6450
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U4
U 1 1 5CA94FFA
P 1450 6150
F 0 "U4" H 1450 6392 50  0000 C CNN
F 1 "1A 6V Reg" H 1450 6301 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 1450 6375 50  0001 C CIN
F 3 "" H 1450 6100 50  0001 C CNN
	1    1450 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0122
U 1 1 5CA95000
P 1050 6150
F 0 "#PWR0122" H 1050 6000 50  0001 C CNN
F 1 "+12V" H 1065 6323 50  0000 C CNN
F 2 "" H 1050 6150 50  0001 C CNN
F 3 "" H 1050 6150 50  0001 C CNN
	1    1050 6150
	1    0    0    -1  
$EndComp
Connection ~ 1900 6150
Wire Wire Line
	2450 6150 2450 6450
Wire Wire Line
	1900 6150 2450 6150
Wire Wire Line
	2450 6150 4100 6150
Wire Wire Line
	4100 6150 4100 6600
Connection ~ 2450 6150
$Comp
L Connector:Conn_01x06_Male J4
U 1 1 5CA9CCE1
P 7000 3000
F 0 "J4" H 6972 2974 50  0000 R CNN
F 1 "Conn_01x06_Male" H 6972 2883 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x06_P2.00mm_Vertical" H 7000 3000 50  0001 C CNN
F 3 "~" H 7000 3000 50  0001 C CNN
	1    7000 3000
	-1   0    0    -1  
$EndComp
Text GLabel 6800 2800 0    50   Input ~ 0
pump_1_ctrl
Text GLabel 6800 3100 0    50   Input ~ 0
pump_4_ctrl
Text GLabel 6800 2900 0    50   Input ~ 0
pump_2_ctrl
Text GLabel 6800 3200 0    50   Input ~ 0
pump_5_ctrl
Text GLabel 6800 3000 0    50   Input ~ 0
pump_3_ctrl
Text GLabel 6800 3300 0    50   Input ~ 0
pump_6_ctrl
$Comp
L Device:LED D3
U 1 1 5CAB0C99
P 6800 4000
F 0 "D3" V 6900 3850 50  0000 C CNN
F 1 "LED" V 6800 3850 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 6800 4000 50  0001 C CNN
F 3 "~" H 6800 4000 50  0001 C CNN
	1    6800 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5CAB0C9F
P 6800 4350
F 0 "R4" H 6870 4396 50  0000 L CNN
F 1 "1k" H 6870 4305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6730 4350 50  0001 C CNN
F 3 "~" H 6800 4350 50  0001 C CNN
	1    6800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5CAB0CA5
P 6800 4500
F 0 "#PWR0123" H 6800 4250 50  0001 C CNN
F 1 "GND" H 6805 4327 50  0000 C CNN
F 2 "" H 6800 4500 50  0001 C CNN
F 3 "" H 6800 4500 50  0001 C CNN
	1    6800 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4150 6800 4200
$Comp
L Device:LED D2
U 1 1 5CAB310C
P 5800 4000
F 0 "D2" V 5900 3850 50  0000 C CNN
F 1 "LED" V 5800 3850 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 5800 4000 50  0001 C CNN
F 3 "~" H 5800 4000 50  0001 C CNN
	1    5800 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5CAB3112
P 5800 4350
F 0 "R3" H 5870 4396 50  0000 L CNN
F 1 "1k" H 5870 4305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5730 4350 50  0001 C CNN
F 3 "~" H 5800 4350 50  0001 C CNN
	1    5800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5CAB3118
P 5800 4500
F 0 "#PWR0124" H 5800 4250 50  0001 C CNN
F 1 "GND" H 5805 4327 50  0000 C CNN
F 2 "" H 5800 4500 50  0001 C CNN
F 3 "" H 5800 4500 50  0001 C CNN
	1    5800 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4150 5800 4200
$Comp
L Switch:SW_Push SW2
U 1 1 5CAB6DD9
P 6850 2300
F 0 "SW2" H 6850 2585 50  0000 C CNN
F 1 "SW_Push" H 6850 2494 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 6850 2500 50  0001 C CNN
F 3 "~" H 6850 2500 50  0001 C CNN
	1    6850 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2300 6600 1200
$Comp
L Device:R R2
U 1 1 5CABB758
P 7400 2500
F 0 "R2" H 7470 2546 50  0000 L CNN
F 1 "1k" H 7470 2455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7330 2500 50  0001 C CNN
F 3 "~" H 7400 2500 50  0001 C CNN
	1    7400 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5CAC0F1E
P 7400 2650
F 0 "#PWR0125" H 7400 2400 50  0001 C CNN
F 1 "GND" H 7405 2477 50  0000 C CNN
F 2 "" H 7400 2650 50  0001 C CNN
F 3 "" H 7400 2650 50  0001 C CNN
	1    7400 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2300 7400 2300
Wire Wire Line
	7400 2300 7400 2350
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5CAC4B8C
P 7850 2300
F 0 "J3" H 7822 2232 50  0000 R CNN
F 1 "Conn_01x01_Male" H 7822 2323 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x01_P2.00mm_Vertical" H 7850 2300 50  0001 C CNN
F 3 "~" H 7850 2300 50  0001 C CNN
	1    7850 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	7650 2300 7550 2300
Connection ~ 7400 2300
Text GLabel 7550 2000 2    50   Input ~ 0
button
Wire Wire Line
	7550 2300 7550 2000
Connection ~ 7550 2300
Wire Wire Line
	7550 2300 7400 2300
Connection ~ 6600 1200
Wire Wire Line
	6600 1200 6800 1200
Wire Wire Line
	6650 2300 6600 2300
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5CACEF53
P 7250 3650
F 0 "J5" H 7358 3831 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7358 3740 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 7250 3650 50  0001 C CNN
F 3 "~" H 7250 3650 50  0001 C CNN
	1    7250 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7050 3750 6800 3750
Wire Wire Line
	6800 3750 6800 3850
Wire Wire Line
	7050 3650 5800 3650
Wire Wire Line
	5800 3650 5800 3850
Text GLabel 6800 3750 0    50   Input ~ 0
light_B
Text GLabel 5800 3650 0    50   Input ~ 0
light_A
$EndSCHEMATC
