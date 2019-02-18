#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install awscli consul gnupg golang jq node nomad pinentry-mac postgresql tmux vault vim yarn
brew cask install docker dropbox google-chrome iterm2 keepassx slack spotify tunnelblick
brew services start postgresql

cp .bash_profile .gitconfig .vimrc $HOME
cp .tmux.conf-mac $HOME/.tmux.conf

mkdir -p $HOME/.gnupg
chmod 700 $HOME/.gnupg
cp gpg-agent.conf-mac $HOME/.gnupg

mkdir -p $HOME/bin
cp ../workspace-* $HOME/bin

mkdir -p $HOME/src
