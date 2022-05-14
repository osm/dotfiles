#!/bin/sh

setxkbmap -model pc105 -layout se
xbacklight -set 15
xinput --set-prop 12 "libinput Accel Speed" 1
xmodmap -e "remove Lock = Caps_Lock" -e "keysym Caps_Lock = Escape"
xrdb -merge "$HOME/.Xresources"
xset r rate 250 60
xsetroot -solid "#000000"

while true; do
	bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage: | awk '{ print $2 }')
	date=$(date "+%Y-%m-%d %H:%M")
	vpn_wrk=$(ifconfig wg1 >/dev/null 2>&1 && echo 1 || echo 0)
	vpn_home=$(ifconfig wg0 >/dev/null 2>&1 && echo 1 || echo 0)
	xsetroot -name "$vpn_wrk | $vpn_home | $bat | $date"
	sleep 5
done&

google-chrome&
keepassx&

exec dwm
