{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    bash-language-server
    lua-language-server
    taplo # TOML language server
    vscode-langservers-extracted # HTML/CSS/JSON language servers

    # C tools
    gcc
    libclang
    lldb

    # Go
    gopls
    delve
    golangci-lint
    golangci-lint-langserver

    # Nix
    nil
    nixfmt

    # Node.js
    nodejs_26
    pnpm

    # Python
    python3

    # Ruby
    ruby_4_0
    ruby-lsp

    # Rust
    rustc
    cargo
    clippy
    rust-analyzer
    rustfmt

    # TypeScript
    typescript-go
    typescript-language-server
    oxlint
    oxfmt

    # Zig
    zig
    zls
  ];

  programs.go.enable = true;
  programs.ruff.enable = true;
  programs.uv.enable = true;
}
