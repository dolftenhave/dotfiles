#!/usr/bin/bash
#
# Dolf ten Have 
# 16/02/2026
#
# This script is largely based on the following script.
# Source: https://github.com/BreadOnPenguins/scripts/blob/master/shortcut-menus/sys

CONTENT=$(echo -en "Shutdown\0icon\x1fsystem-shutdown\nLogout\0icon\x1fsystem-log-out\nReboot\0icon\x1fsystem-reboot\nSleep\0icon\x1fsystem-suspend\nKill\0icon\x1fprocess-stop" | fuzzel -d --minimal-lines --icon-theme="Adwaita" )
case "$CONTENT" in
	Shutdown) shutdown now ;;
	# Only works with sway
	Logout) swaymsg exit ;;
	Reboot) systemctl reboot -i ;;
	Sleep) slock && systemctl suspend -i ;;
	Kill) ps -u "$USER" -o pid,comm,%cpu,%mem | fuzzel -d --placeholder "..." --mesg "Kill a task:" | awk '{print $1}' | xargs -r kill ;;
esac
