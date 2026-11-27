.PHONY: stow install

all: stow install

stow:
	stow --restow git fish bat helix tmux mise tealdeer neovim

install:
	yay -S --needed - < packages.txt
