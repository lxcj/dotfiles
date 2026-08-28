{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
  ];

  programs.ruff.enable = true;
  programs.uv.enable = true;
}
