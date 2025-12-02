#!/bin/bash

faces=(󱑖 󱑋 󱑌 󱑍 󱑎 󱑏 󱑐 󱑑 󱑒 󱑓 󱑔 󱑕)

hour=$(date +"%H")
min=$(date +"%M")

echo "%{T2}${faces[(( 10#$hour % 12 ))]}%{T-} $hour:$min"
