#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

echo "==> Installing packages..."

sudo apt install -y \
    gpg \
    stow \
    curl \
    wget \
    vim \
    fzf \
    fd-find

echo
echo "==> Creating symlinks..."

cd "$DOTFILES"

stow --restow bash
stow --restow git
stow --restow vim

echo
echo "Setup complete. Restart your shell for changes to take effect."
