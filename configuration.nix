{ pkgs, ... }:
{
  wsl.enable = true;
  wsl.defaultUser = "lx";

  time.timeZone = "Europe/Paris";

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

  # https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "26.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d --delete-generations +10";
  };

  security.sudo-rs.enable = true;

  programs.nix-ld.enable = true;
}
