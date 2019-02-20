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
	vpn=$(ifconfig tun0 >/dev/null 2>&1 && echo 1 || echo 0)
	wifi=$(ifconfig wlp2s0 | grep inet >/dev/null 2>&1 && echo 1 || echo 0)
	slack=$(grep "Updated unread_cnt for" "$HOME/.config/Slack/logs/webapp-<replace>-console.log" | tail -n 1 | awk '{ if ($NF == 0) { print 0 } else { print 1 }}')
	xsetroot -name "load: $load | slack: $slack | wifi: $wifi | vpn: $vpn | bat: $bat | $date"
	sleep 5
done&

exec dwm
