#!/bin/sh

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install -y curl vim git build-essential xorg libx11-dev \
	libxft-dev libxinerama-dev libxrandr-dev keepassx xbacklight \
	upower alsa-tools alsa-utils pulseaudio unzip net-tools nmap \
	tmux apt-transport-https ca-certificates software-properties-common \
	bc xclip xsel oathtool wpasupplicant jq rclone age rsync feh \
	resolvconf wireguard scrot sqlite whois iptables iptables-persistent

if [ ! -d "$HOME/.bin" ]; then
	mkdir $HOME/.bin
fi

if [ ! -d "$HOME/bin" ]; then
	mkdir $HOME/bin
fi

if [ ! -d "$HOME/src" ]; then
	mkdir $HOME/src
fi

if [ ! -d "$HOME/tmp" ]; then
	mkdir $HOME/tmp
fi

if [ ! -d "$HOME/dl" ]; then
	mkdir $HOME/dl
fi

cp .gitconfig .vimrc .xinitrc .Xresources .bashrc .tmux.conf $HOME
cp .bin/* $HOME/.bin/

if [ ! -d "$HOME/.config/ncspot" ]; then
	mkdir -p "$HOME/.config/ncspot"
	cp ncspot.toml "$HOME/.config/ncspot/config.toml"
fi

if [ ! -d "/etc/X11/xorg.conf.d" ]; then
	sudo mkdir -p "/etc/X11/xorg.conf.d"
fi

if [ ! -f "/etc/X11/xorg.conf.d/20-video.conf" ]; then
	sudo cp "20-video.conf" "/etc/X11/xorg.conf.d"
fi

if [ ! -f /usr/local/bin/dwm ]; then
	cd $HOME/tmp
	git clone https://github.com/osm/dwm.git
	cd dwm
	make
	sudo make install
fi

if [ ! -f "/usr/local/bin/st" ]; then
	cd $HOME/tmp
	git clone https://github.com/osm/st.git
	cd st
	make
	sudo make install
fi

DMENU_VERSION="5.2"
if [ ! -f "/usr/local/bin/dmenu" ]; then
	cd $HOME/tmp
	curl "https://dl.suckless.org/tools/dmenu-$DMENU_VERSION.tar.gz" | tar xzf -
	cd "dmenu-$DMENU_VERSION"
	make
	sudo make install
fi

SLOCK_VERSION="1.5"
if [ ! -f "/usr/local/bin/slock" ]; then
	cd $HOME/tmp
	curl "https://dl.suckless.org/tools/slock-$SLOCK_VERSION.tar.gz" | tar xzf -
	cd "slock-$SLOCK_VERSION"
	make
	sudo make install
fi

if [ ! -d "$HOME/.rustup" ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

GO_VERSION="1.20.3"
if [ ! -d "/usr/local/go" ]; then
	curl -L https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz >/tmp/go$GO_VERSION.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf /tmp/go$GO_VERSION.linux-amd64.tar.gz
fi

NCSPOT_VERSION="0.13.1"
if [ ! -f "$HOME/.bin/ncspot" ]; then
	curl https://dumpinen.com/5K2jTaZcMYU >/tmp/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb
	sudo dpkg -i /tmp/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb
	curl -L https://github.com/hrkfdn/ncspot/releases/download/v$NCSPOT_VERSION/ncspot-v$NCSPOT_VERSION-linux-x86_64.tar.gz | tar xvfz - -C "$HOME/bin"
fi

if [ ! -f "/usr/bin/google-chrome" ]; then
	curl "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -
	echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
	sudo apt-get update
	sudo apt-get install -y google-chrome-stable
fi
