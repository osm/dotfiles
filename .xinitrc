#!/bin/sh

setxkbmap -model pc105 -layout se
xbacklight -set 15
xinput --set-prop 11 "libinput Accel Speed" 1
xmodmap -e "remove Lock = Caps_Lock" -e "keysym Caps_Lock = Escape"
xrdb -merge "$HOME/.Xresources"
xset r rate 250 60

while true; do
	bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage: | awk '{ print $2 }')
	date=$(date +'%Y-%m-%d %H:%M')
	load=$(awk '{ print $1 "/" $2 "/" $3 }' /proc/loadavg)
	vpn_wrk=$(ifconfig tun0 >/dev/null 2>&1 && echo 1 || echo 0)
	vpn_home=$(ifconfig wg0 >/dev/null 2>&1 && echo 1 || echo 0)
	wifi=$(ifconfig wlp2s0 | grep inet >/dev/null 2>&1 && echo 1 || echo 0)
	vol=$(amixer sget Master | awk -F"[][]" '/dB/ { print $2 }')
	xsetroot -name "load: $load | wifi: $wifi | wrk: $vpn_wrk | home: $vpn_home | vol: $vol | bat: $bat | $date"
	sleep 5
done&

/home/osm/.dropbox-dist/dropboxd&
google-chrome&
keepassx&

exec dwm
