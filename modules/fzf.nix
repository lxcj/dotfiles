{ config, pkgs, lib, ... }:
{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      # Catppuccin Macchiato
      fg = "#cad3f5";
      bg = "#24273a";
      hl = "#ed8796";
      "fg+" = "#cad3f5";
      "bg+" = "#363a4f";
      "hl+" = "#ed8796";
      border = "#6e738d";
      header = "#ed8796";
      gutter = "#232136";
      spinner = "#f4dbd6";
      info = "#c6a0f6";
      pointer = "#f4dbd6";
      marker = "#b7bdf8";
      prompt = "#c6a0f6";
      selected-bg = "#494d64";
      label = "#cad3f5";
    };
  };
}
