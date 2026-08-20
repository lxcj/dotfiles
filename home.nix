{ pkgs, ... }:
{
  home.username = "lx";
  home.homeDirectory = "/home/lx";

  imports = [
    ./modules/git.nix
    ./modules/ssh.nix
    ./modules/bat.nix
    ./modules/fish.nix
    ./modules/fzf.nix
    ./modules/helix.nix
    ./modules/tmux.nix
    ./modules/tealdeer.nix
    # ./modules/mise.nix
    ./modules/opencode.nix
  ];

  home.packages = with pkgs; [
    tree fd ripgrep navi
    neovim tree-sitter

    bash-language-server
    lua-language-server
    vscode-langservers-extracted # HTML/CSS/JSON language servers
    taplo # TOML language server

    # C tools
    gcc libclang lldb gnumake

    # Ruby
    ruby_4_0 ruby-lsp

    # Rust
    rustc cargo clippy rust-analyzer rustfmt

    # Node.js
    nodejs_26 pnpm

    # Nix
    nil nixfmt

    # Zig
    zig zls
    
    # Go
    go gopls delve golangci-lint golangci-lint-langserver

    # TypeScript
    typescript-go typescript-language-server oxlint oxfmt
  ];

  home.sessionVariables = {
    COLORTERM = "truecolor";
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  # https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "26.05";
}
