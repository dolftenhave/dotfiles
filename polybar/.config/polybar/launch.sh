#!/usr/bin/env bash
polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar_primary.log /tmp/polybar_secondary.log
polybar --reload primary 2>&1 | tee -a /tmp/polybar_primary.log & disown
polybar --reload secondary 2>&1 | tee -a /tmp/polybar_secondary.log & disown

echo "Bars launched..."
