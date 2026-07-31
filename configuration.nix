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

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  environment.systemPackages = with pkgs; [
    wget
  ];

  system.stateVersion = "26.05"; # Don't change this value

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
