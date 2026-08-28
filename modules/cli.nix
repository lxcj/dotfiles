{ pkgs, ... }:
{
  imports = [
    ./direnv.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    gnumake
    tree
  ];

  programs.fd.enable = true;
  programs.jq.enable = true;

  programs.bat = {
    enable = true;
    config.theme = "Catppuccin Macchiato";
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
