{ pkgs, ... }:
{
  home.packages = with pkgs; [
    typescript-go
    typescript-language-server
    oxlint
    oxfmt
  ];
}
