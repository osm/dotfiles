#!/bin/sh

sudo apt-get update
sudo apt-get install -y awscli curl vim git build-essential xorg libx11-dev libxft-dev libxinerama-dev keepassx xbacklight upower alsa-tools alsa-utils unzip openvpn net-tools nmap nodejs npm tmux apt-transport-https ca-certificates software-properties-common bc postgresql-client-common postgresql-client-10 xclip xsel oathtool wpasupplicant

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

cp .gitconfig .vimrc .xinitrc .Xresources $HOME
cp .bash_profile-linux $HOME/.bashrc
cp .tmux.conf-linux $HOME/.tmux.conf
cp workspace-* $HOME/bin
cp vol* $HOME/bin
cp random-image $HOME/bin

mkdir -p $HOME/.gnupg
chmod 700 $HOME/.gnupg
cp gpg-agent.conf-linux $HOME/.gnupg/gpg-agent.conf
pkill -HUP gpg-agent

if [ ! -d "/etc/X11/xorg.conf.d" ]; then
	sudo mkdir -p "/etc/X11/xorg.conf.d"
fi

if [ ! -f "/etc/X11/xorg.conf.d/20-video.conf" ]; then
	sudo cp "20-video.conf" "/etc/X11/xorg.conf.d"
fi

if [ ! -f /usr/local/bin/dwm ]; then
	cd $HOME/tmp
	git clone git@github.com:osm/dwm.git
	cd dwm
	make
	sudo make install
fi

if [ ! -f "/usr/local/bin/st" ]; then
	cd $HOME/tmp
	git clone git@github.com:osm/st.git
	cd st
	make
	sudo make install
fi

DMENU_VERSION="4.9"
if [ ! -f "/usr/local/bin/dmenu" ]; then
	cd $HOME/tmp
	curl "https://dl.suckless.org/tools/dmenu-$DMENU_VERSION.tar.gz" | tar xzf -
	cd "dmenu-$DMENU_VERSION"
	make
	sudo make install
fi

VAULT_VERSION="1.0.3"
if [ ! -f "/usr/local/bin/vault" ]; then
	cd $HOME/tmp
	curl https://releases.hashicorp.com/vault/$VAULT_VERSION/vault_${VAULT_VERSION}_linux_amd64.zip -o vault.zip
	unzip vault.zip
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

if [ 1 -eq 2 ] && [ ! -f "/usr/bin/docker" ]; then
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io
	sudo usermod -a -G docker $USER
fi

if [ ! -d $HOME/.dropbox-dist ]; then
	cd $HOME
	curl -L "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
fi
