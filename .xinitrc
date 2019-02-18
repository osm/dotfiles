#!/bin/sh

setxkbmap -model pc105 -layout se
xbacklight -set 15
xmodmap -e "remove Lock = Caps_Lock" -e "keysym Caps_Lock = Escape"
xrdb -merge "$HOME/.Xresources"
xset r rate 200 60

while true; do
	date=$(date +'%Y-%m-%d %H:%M')
	bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage: | awk '{ print $2 }')
	vpn=$(ifconfig tun0 >/dev/null 2>&1 && echo 1 || echo 0)
	load=$(awk '{ print $1 " " $2 " " $3 }' /proc/loadavg)
	xsetroot -name "load: $load | vpn: $vpn | bat: $bat | $date"
	sleep 5
done&

exec dwm
