# Define your hostname here. 
# You can override this at runtime with: make switch HOSTNAME=my-laptop
HOSTNAME ?= $(shell hostname)

.PHONY: switch test

## Switch to the new configuration (makes it the boot default)
switch:
	sudo nixos-rebuild switch --flake ".#$(HOSTNAME)"

## Test the new configuration (activates it without adding to boot menu)
test:
	sudo nixos-rebuild test --flake ".#$(HOSTNAME)"

