{ config, pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    settings.init.defaultBranch = "main";
  };
}
