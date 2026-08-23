{ pkgs, ... }:
{
  imports = [
    ./fzf.nix
    ./git.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    gnumake
    tree
  ];

  programs.bat = {
    enable = true;
    config.theme = "Catppuccin Macchiato";
  };

  programs.fd = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.jq = {
    enable = true;
  };

  programs.navi = {
    enable = true;
    enableFishIntegration = true;
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
