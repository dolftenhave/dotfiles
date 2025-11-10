#!/bin/bash

xrandr --output DP-2 --primary --mode 2560x1440 --pos 2560x0 --rate 120.00 --rotate normal --output HDMI-0 --mode 1920x1080 --scale-from 2560x1440 --pos 0x0 --rate 60.00 --rotate normal    
xrandr --dpi 120
echo "Xft.dpi:120" | xrdb -merge
