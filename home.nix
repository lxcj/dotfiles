{ config, pkgs, ... }:
{
  home.username = "lx";
  home.homeDirectory = "/home/lx";

  imports = [
    ./modules/git.nix
    ./modules/bat.nix
    ./modules/fish.nix
    ./modules/fzf.nix
    ./modules/helix.nix
    ./modules/tmux.nix
    ./modules/mise.nix
    ./modules/tealdeer.nix
  ];

  home.packages = with pkgs; [
    tree fd ripgrep navi
    neovim

    ruby-lsp
    bash-language-server
    lua-language-server
    vscode-langservers-extracted
    taplo # toml
    tree-sitter

    # C tools
    gcc libclang lldb gnumake

    # Rust
    rustc cargo clippy rust-analyzer rustfmt

    # Node.js
    nodejs_26 pnpm

    # Nix
    nil nixfmt

    # Zig
    zig zls
    
    # Go
    go gotools delve golangci-lint golangci-lint-langserver

    # TypeScript
    typescript-go typescript-language-server oxlint oxfmt
  ];

  home.sessionVariables = {
    TERM = "xterm-256color";
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  # https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
}
