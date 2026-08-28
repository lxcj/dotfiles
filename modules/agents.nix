{ ... }:
{
  imports = [
    ./opencode.nix
    ./pi.nix
  ];

  programs.codex.enable = true;
}
