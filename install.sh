#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install awscli consul gnupg golang jq node nomad pinentry-mac postgresql tmux vault vim
brew cask install docker dropbox google-chrome iterm2 keepassx slack spotify tunnelblick
brew services start postgresql

tar -C /Applications -xzf $HOME/Documents/apps/1Password.app.tar.gz

cp .bash_profile .gitconfig .tmux.conf .vimrc $HOME

mkdir -p $HOME/.gnupg
chmod 700 $HOME/.gnupg
cp gpg-agent.conf $HOME/.gnupg

mdir -p $HOME/bin
cp workspace-* $HOME/bin
