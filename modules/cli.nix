{ pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./opencode.nix
    ./pi.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    gnumake
    tree
  ];

  programs.codex.enable = true;
  programs.fd.enable = true;
  programs.jq.enable = true;
  programs.yt-dlp.enable = true;

  programs.bat = {
    enable = true;
    config.theme = "Catppuccin Macchiato";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.navi = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.ripgrep = {
    enable = true;
    arguments = [
      "--smart-case" # Search case-insensitively
    ];
  };

  programs.tealdeer = {
    enable = true;
    settings = {
      display.compact = true;
      updates.auto_update = false;
    };
  };

  programs.vivid = {
    enable = true;
    enableFishIntegration = true;
    activeTheme = "catppuccin-macchiato";
  };
}
