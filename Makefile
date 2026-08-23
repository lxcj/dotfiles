HOSTNAME ?= $(shell hostname)

.PHONY: switch test

# Switch to the new configuration
switch:
	sudo nixos-rebuild switch --flake ".#$(HOSTNAME)"

# Test the new configuration
test:
	sudo nixos-rebuild test --flake ".#$(HOSTNAME)"

