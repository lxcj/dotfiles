{ ... }:
{
  # https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";

  home.username = "lx";
  home.homeDirectory = "/home/lx";

  programs.home-manager.enable = true;

  imports = [
    ./modules/cli.nix
    ./modules/coding.nix
    ./modules/fish.nix
    ./modules/ssh.nix
  ];

  home.sessionVariables = {
    COLORTERM = "truecolor";
    EDITOR = "nvim";
  };
}
