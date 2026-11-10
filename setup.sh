#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

echo "==> Creating symlinks..."

ln -sf $DOTFILES/bash/.bashrc ~/.bashrc
ln -sf $DOTFILES/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES/mise/config.toml ~/.config/mise/config.toml
ln -sfnT $DOTFILES/neovim/ ~/.config/nvim

echo "==> Installing packages..."

sudo apt install -y \
    extrepo \
    gpg \
    curl \
    wget \
    vim \
    fzf \
    fd-find \
    ripgrep \
    build-essential \
    clang \
    lldb

if ! command -v mise >/dev/null 2>&1; then
    echo
    echo "==> Installing mise..."
    sudo extrepo enable mise
    sudo apt update
    sudo apt install -y mise
    mise install
fi

echo
echo "Setup complete. Restart your shell for changes to take effect."
