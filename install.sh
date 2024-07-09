#!/bin/bash

set -eo pipefail

if [ "$(uname)" != "Darwin" ]; then
    echo "Script not designed to run on $(uname)"
    exit 1
fi

sudo cp .gitconfig ~/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
brew update
brew install neovim

mkdir -p ~/.config
mkdir -p ~/.config/nvim
sudo cp init.vim ~/.config/nvim/init.vim

brew install tmux
brew install fzf
brew install reattach-to-user-namespace

sudo cp .tmux.conf ~/
sudo cp .tmux.theme ~/

sudo cp .profile ~/

