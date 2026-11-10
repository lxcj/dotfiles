#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

echo "==> Installing packages..."

sudo apt install -y \
    stow \
    extrepo \
    gpg \
    curl \
    wget \
    vim \
    fzf \
    fd-find \
    build-essential \
    clang \
    lldb

if ! command -v mise >/dev/null 2>&1; then
    echo
    echo "==> Installing mise..."
    sudo extrepo enable mise
    sudo apt update
    sudo apt install -y mise
fi

echo
echo "==> Creating symlinks..."

cd "$DOTFILES"

stow --restow bash
stow --restow git
stow --restow vim

echo
echo "Setup complete. Restart your shell for changes to take effect."
