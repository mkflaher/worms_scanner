#!/bin/bash
scanimage -d epson2 --mode Gray --gamma-correction='High contrast printing' --format PNG --resolution 1200 > scans/scan_$(date +%Y%m%d%H%M).png
