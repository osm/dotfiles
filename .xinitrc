#!/bin/sh

setxkbmap -model pc105 -layout se
xbacklight -set 15

trackpad_id=$(xinput | grep pointer | tail -n 1 | grep -o "id=[0-9]\+" | cut -d= -f2)
xinput --set-prop $trackpad_id "libinput Accel Speed" 0.5
xrdb -merge "$HOME/.Xresources"
xset r rate 250 60
xsetroot -solid "#000000"

while true; do
	bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage: | awk '{ print $2 }')
	date=$(date "+%Y-%m-%d %H:%M")
	vpn_home=$(ifconfig wg0 >/dev/null 2>&1 && echo 1 || echo 0)
	vpn_wrk=$(ifconfig wg1 >/dev/null 2>&1 && echo 1 || echo 0)
	xsetroot -name "$vpn_wrk | $vpn_home | $bat | $date"
	sleep 5
done&

google-chrome&
keepassx&

exec dwm
