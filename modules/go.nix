{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gopls
    delve
    golangci-lint
    golangci-lint-langserver
  ];

  programs.go.enable = true;
}
