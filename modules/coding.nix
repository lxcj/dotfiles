{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./neovim.nix
    ./opencode.nix

    ./go.nix
    ./python.nix
    ./ruby.nix
    ./rust.nix
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

    # Node.js
    nodejs_26
    pnpm

    # Nix
    nil
    nixfmt

    # Zig
    zig
    zls
  ];
}
