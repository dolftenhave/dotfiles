#!/usr/bin/bash
#
# Dolf ten Have 
# 16/02/2026
#
# This script is largely based on the following script.
# Source: https://github.com/BreadOnPenguins/scripts/blob/master/shortcut-menus/sys

case "$(printf "Shutdown\nReboot\nSleep\nKill" | fuzzel -d --placeholder "..." --mesg "Power Menu:" --border-width="893b2aff" -s "893b2aff")" in
	Shutdown) shutdown now ;;
	Reboot) systemctl reboot -i ;;
	Sleep) slock systemctl suspend -i ;;
	Kill) ps -u "$USER" -o pid,comm%cpu,%mem | fuzzel -d --placeholder "..." --mesg "Kill a task:" | awk '{print $1' | xargs -r kill ;;
esac
