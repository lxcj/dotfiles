{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    tree-sitter
  ];

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/config/nvim";
}
