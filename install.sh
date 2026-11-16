#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Creating symlinks..."

mkdir -p ~/.config/mise
mkdir -p ~/.config/tmux
mkdir -p ~/.config/bat/themes

ln -sf $DOTFILES/bash/.bashrc $HOME/.bashrc
ln -sf $DOTFILES/git/.gitconfig $HOME/.gitconfig
ln -sf $DOTFILES/bat/'Catppuccin Macchiato.tmTheme' $HOME/.config/bat/themes/'Catppuccin Macchiato.tmTheme'
ln -sf $DOTFILES/mise/config.toml $HOME/.config/mise/config.toml
ln -sfnT $DOTFILES/neovim/ $HOME/.config/nvim
ln -sf $DOTFILES/tmux/tmux.conf $HOME/.config/tmux/tmux.conf

batcat cache --build

echo "==> Installing packages..."

sudo apt update
sudo apt install -y \
    extrepo \
    gpg \
    curl \
    wget \
    vim \
    bat \
    fzf \
    fd-find \
    ripgrep \
    jq \
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
