{ config, pkgs, lib, ... }:
{
  programs.tealdeer = {
    enable = true;
    settings.display = {
      compact = true;
      use_pager = false;
    };
  };
}
