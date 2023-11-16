#!/bin/sh

trackpad_id=$(xinput | grep pointer | tail -n 1 | grep -o "id=[0-9]\+" | cut -d= -f2)
xinput --set-prop $trackpad_id "libinput Accel Speed" 0.5

setxkbmap -model pc105 -layout se
xbacklight -set 15
xrdb -merge "$HOME/.Xresources"
xset r rate 250 60
xsetroot -solid "#000000"

while true; do
	bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage: | awk '{ print $2 }')
	date=$(date "+%Y-%m-%d %H:%M")
	vpns=$(wg show | awk '/interface:/{ if (x == "") x = $2; else x = x " | " $2 } END { if (x != "") print x " |" }')
	xsetroot -name "$vpns $bat | $date"
	sleep 5
done&

google-chrome&
keepassx&
xbindkeys -f $HOME/.xbindkeysrc&

exec dwm
