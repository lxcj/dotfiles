{ config, ... }:
{
  imports = [
    ./opencode.nix
    ./pi.nix
  ];

  home.file.".agents/skills".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/config/agents/skills";

  programs.codex = {
    enable = true;
  };
}
