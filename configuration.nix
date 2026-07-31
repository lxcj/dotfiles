{ config, lib, pkgs, ... }:
{
  imports = [
    # include NixOS-WSL modules
    # <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "lx";

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  system.stateVersion = "26.05"; # Don't change this value

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
