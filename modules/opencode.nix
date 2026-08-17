{ config, pkgs, lib, ... }:
{
  programs.opencode = {
    enable = true;
    package = pkgs.stdenvNoCC.mkDerivation rec {
      pname = "opencode";
      version = "1.18.12";
      src = pkgs.fetchurl {
        url = "https://github.com/anomalyco/opencode/releases/download/v${version}/opencode-linux-x64.tar.gz";

        hash = "sha256-ei47cGMGsE+/U1O2fZFrCAH82lZfnuAhvqKncgeWFFI=";
      };
      sourceRoot = ".";
      dontFixup = true;
      installPhase = "install -Dm755 opencode $out/bin/opencode";
    };
    tui = {
      theme = "catppuccin-macchiato";
    };
    settings.permission = {
      edit = "ask";
      bash = {
        "*" = "ask";
        "git *" = "ask";
        "git diff*" = "allow";
        "git log*" = "allow";
        "git show*" = "allow";
        "git status*" = "allow";
        "rm *" = "deny";
      };
    };
  };
}

