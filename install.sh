#!/bin/bash

set -eo pipefail

if [ "$(uname)" != "Darwin" ]; then
    echo "Script not designed to run on $(uname)"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Git config
cp "$SCRIPT_DIR/gitconfig" ~/.gitconfig

# Install brew packages
brew update
brew install neovim
brew install ripgrep
brew install fzf
brew install tmux
brew install reattach-to-user-namespace
brew install zsh-autosuggestions

# Neovim config (lua-based with lazy.nvim)
mkdir -p ~/.config/nvim/lua/config
mkdir -p ~/.config/nvim/lua/plugins
cp "$SCRIPT_DIR/nvim/init.lua" ~/.config/nvim/init.lua
cp "$SCRIPT_DIR/nvim/lua/config/"*.lua ~/.config/nvim/lua/config/
cp "$SCRIPT_DIR/nvim/lua/plugins/"*.lua ~/.config/nvim/lua/plugins/

# Tmux config
cp "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf
cp "$SCRIPT_DIR/tmux.theme" ~/.tmux.theme

# Zsh config (if exists)
if [ -f "$SCRIPT_DIR/zshrc" ]; then
    cp "$SCRIPT_DIR/zshrc" ~/.zshrc
fi

# Source local secrets if they exist
if [ -f "$SCRIPT_DIR/zshrc.local" ]; then
    cp "$SCRIPT_DIR/zshrc.local" ~/.zshrc.local
fi

echo "Dotfiles installed successfully!"

