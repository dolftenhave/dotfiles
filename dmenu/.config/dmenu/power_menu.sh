#!/usr/bin/bash

# source: https://github.com/BreadOnPenguins/scripts/blob/master/shortcuts-menus/sys

case "$(printf "Kill\nSleep\nReboot\nShutdown" | dmenu -i -c -l 4 -p "Power Options..." -sb \#cc241d)" in
	Kill) ps -u "$USER" -o pid,comm,%cpu,%mem | dmenu -i -c -l 10 -p "Kill..." | awk '{print $1}' | xargs -r kill ;;
	Sleep) slock systemctl suspend -i ;;
	Reboot) systemctl reboot -i ;;
	Shutdown) shutdown now ;;
	*) exit 1 ;;
esac
