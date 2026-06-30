.PHONY: stow mise tldr bat

stow:
	stow --restow bash bat mise helix tmux git

mise:
	mise install

tldr:
	tldr --update

bat:
	batcat cache --build

