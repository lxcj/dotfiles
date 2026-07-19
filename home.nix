{ config, pkgs, ... }:

{
  home.username = "lx";
  home.homeDirectory = "/home/lx";
  home.stateVersion = "26.05"; # You should not change this value

  home.packages = with pkgs; [
    neovim
    nodejs_26
    pnpm
    rustup
    zig
    go

    # Language servers
    nil # nix
    nixfmt
    ruby-lsp
    bash-language-server
    lua-language-server
    vscode-langservers-extracted # html/css/json
    taplo # toml
    zls # zig
    gotools
    delve # go debugger
    golangci-lint
    golangci-lint-langserver

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage environment variables here.
  home.sessionVariables = {
    TERM = "xterm-256color";
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  programs.git.enable = true;
  programs.git.settings.init.defaultBranch = "main";

  programs.bat.enable = true;
  programs.bat.config.theme = "Dracula";

  programs.fish.enable = true;
  programs.fish.plugins = [
    {
      name = "hydro";
      src = pkgs.fishPlugins.hydro.src;
    }
  ];
  programs.fish.interactiveShellInit = ''
    set fish_greeting # Disable greeting
    set -g fish_autosuggestion_enabled 0
    set fish_prompt_pwd_dir_length 20
    set -g hydro_prefix_git " "
    set -g hydro_cmd_duration_threshold 43200000 # set to 12h to avoid displaying duration
 
    # Remove underline from command lines
    set fish_color_command normal
    set fish_color_valid_path
    set fish_color_option normal
  '';
  programs.fish.shellAliases = {
    ls = "ls -1Fv --group-directories-first --color=auto";
    la = "ls -A";
    ll = "ls -l";
    lla = "ls -lA";
    lt = "tree -L 3 -a -I '.git'";
    cat = "bat --plain";
    tmp = "cd $(mktemp -d)"; # cd to a new temp folder
  };
  programs.fish.shellAbbrs = {
    c = "clear";
    mkdir = "mkdir -p";
    g = "git";
    gs = "git status -s";
    ga = "git add";
    gc = "git commit";
    gca = "git commit -a";
    gl = "git log --oneline";
    glg = "git log --oneline --graph --all --stat";
    nv = "nvim";
    f = "fzf";
  };

  programs.fzf.enable = true;
  programs.fzf.enableFishIntegration = true;
  programs.fzf.colors = {
    # Rose Pine Moon
    fg = "#908caa";
    bg = "#232136";
    hl = "#ea9a97";
    "fg+" = "#e0def4";
    "bg+" = "#393552";
    "hl+" = "#ea9a97";
    border = "#44415a";
    header = "#3e8fb0";
    gutter = "#232136";
    spinner = "#f6c177";
    info = "#9ccfd8";
    pointer = "#c4a7e7";
    marker = "#eb6f92";
    prompt = "#908caa";
  };

  programs.helix.enable = true;
  programs.helix.settings = {
    theme = "rose_pine_moon";
    editor = {
      true-color = true;
      color-modes = true;
      bufferline = "always"; # Enable tab bar
      default-yank-register = "+";
    };
    editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
    editor.file-picker.hidden = false;
    editor.lsp.auto-signature-help = false;
    keys.normal = {
      esc = ["collapse_selection" "keep_primary_selection"];
      D = "kill_to_line_end";
      d = "delete_selection_noyank";
      c = "change_selection_noyank";
      C-p = "signature_help";
    };
    keys.insert = {
      esc = ["collapse_selection" "keep_primary_selection" "normal_mode"];
      C-p = "signature_help";
    };
    keys.select = {
      esc = ["collapse_selection" "keep_primary_selection" "normal_mode"];
      y = ["yank_main_selection_to_clipboard" "normal_mode"];
    };
  };

  programs.tmux.enable = true;

  programs.mise.enable = true;
  programs.mise.enableFishIntegration = true;
  programs.mise.globalConfig = {
    settings = {
      ruby.compile = false;
      python.compile = false;
    };
    tools = {
      ruby = "4.0.6";
    };
  };

  programs.tealdeer.enable = true;
  programs.tealdeer.settings.display = {
    compact = true;
    use_pager = false;
  };
}
