#!/bin/sh

sudo apt-get update
sudo apt-get install -y awscli curl vim git build-essential xorg libx11-dev libxft-dev libxinerama-dev keepassx xbacklight upower alsa-tools unzip openvpn net-tools nmap nodejs npm

mkdir -p $HOME/{bin,src,tmp}
cp .bash_profile .gitconfig .vimrc .xinitrc .Xresources $HOME
cp .tmux.conf-linux $HOME/.tmux.conf
cp workspace-* $HOME/bin

if [ ! -d "/etc/X11/xorg.conf.d" ]; then
	sudo mkdir -p "/etc/X11/xorg.conf.d"
fi

if [ ! -f "/etc/X11/xorg.conf.d/20-video.conf" ]; then
	sudo cp "20-video.conf" "/etc/X11/xorg.conf.d"
fi

DWM_VERSION="6.2"
if [ ! -f /usr/local/bin/dwm ]; then
	cd $HOME/tmp
	curl -L "https://dl.suckless.org/dwm/dwm-$DWM_VERSION.tar.gz" | tar xzf -
	cd "dwm-$DWM_VERSION"
	curl "https://raw.githubusercontent.com/osm/dotfiles/master/dvm-tags-$DWM_VERSION.diff" | patch -p1
	make
	sudo make install
fi

ST_VERSION="0.8.2"
if [ ! -f "/usr/local/bin/st" ]; then
	cd $HOME/tmp
	curl "https://dl.suckless.org/st/st-$ST_VERSION.tar.gz" | tar xzf -
	cd "st-$ST_VERSION"
	curl "https://st.suckless.org/patches/clipboard/st-clipboard-$ST_VERSION.diff" | patch -p1
	curl "https://raw.githubusercontent.com/osm/dotfiles/master/st-font-$ST_VERSION.diff" | patch -p1
	curl "https://raw.githubusercontent.com/osm/dotfiles/master/st-term-$ST_VERSION.diff" | patch -p1
	make
	sudo make install
fi

DMENU_VERSION="4.9"
if [ ! -f "/usr/local/bin/dmenu" ]; then
	cd "/tmp"
	curl "https://dl.suckless.org/tools/dmenu-$DMENU_VERSION.tar.gz" | tar xzf -
	cd "st-$DMENU_VERSION"
	make
	sudo make install
fi

VAULT_VERSION="1.0.3"
if [ ! -f "/usr/local/bin/vault" ]; then
	curl https://releases.hashicorp.com/vault/$VAULT_VERSION/vault_${VAULT_VERSION}_linux_amd64.zip -o /tmp/vault.zip
	sudo mv vault /usr/local/bin
fi

if [ ! -f "/usr/bin/google-chrome" ]; then
	curl "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -
	echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
	sudo apt-get update
	sudo apt-get install -y google-chrome-stable
fi

if [ ! -f "/usr/bin/yarn" ]; then
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt-get update
	sudo apt-get install -y yarn
fi

if [ ! -f "/usr/bin/spotify" ]; then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install -y spotify-client
fi

if [ ! -d $HOME/.dropbox-dist ]; then
	cd $HOME
	curl -L "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
fi
