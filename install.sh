#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing packages..."
sudo apt update
xargs -r sudo apt install -y < $DOTFILES/packages.txt

if ! command -v mise >/dev/null 2>&1; then
    echo
    echo "==> Installing mise..."
    sudo extrepo enable mise
    sudo apt update
    sudo apt install -y mise
fi

echo
echo "==> Copying config files..."
cp -a $DOTFILES/config/. ~

echo
echo "==> Updating tools..."
batcat cache --build
tldr --update
mise install

echo
echo "Setup complete. Restart your shell."

