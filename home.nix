{ pkgs, ... }:

{
  home.username = "lx";
  home.homeDirectory = "/home/lx";
  home.stateVersion = "26.05"; # You should not change this value

  home.packages = with pkgs; [
    fd
    ripgrep
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
    tree-sitter
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

  programs.git = {
    enable = true;
    settings.init.defaultBranch = "main";
  };

  programs.bat = {
    enable = true;
    config.theme = "Catppuccin Macchiato";
  };

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];
    interactiveShellInit = ''
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
    shellAliases = {
      ls = "ls -1Fv --group-directories-first --color=auto";
      la = "ls -A";
      ll = "ls -l";
      lla = "ls -lA";
      lt = "tree -L 3 -a -I '.git'";
      cat = "bat --plain";
      tmp = "cd $(mktemp -d)"; # cd to a new temp folder
    };
    shellAbbrs = {
      c = "clear";
      mkdir = "mkdir -p";
      g = "git";
      gs = "git status -s";
      ga = "git add";
      gc = "git commit";
      gca = "git commit -a";
      gl = "git log --oneline";
      glg = "git log --oneline --graph --all --stat";
      gd = "git diff";
      nv = "nvim";
      f = "fzf";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      # Catppuccin Macchiato
      fg = "#cad3f5";
      bg = "#24273a";
      hl = "#ed8796";
      "fg+" = "#cad3f5";
      "bg+" = "#363a4f";
      "hl+" = "#ed8796";
      border = "#6e738d";
      header = "#ed8796";
      gutter = "#232136";
      spinner = "#f4dbd6";
      info = "#c6a0f6";
      pointer = "#f4dbd6";
      marker = "#b7bdf8";
      prompt = "#c6a0f6";
      selected-bg = "#494d64";
      label = "#cad3f5";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_macchiato";
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
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    clock24 = true;
    prefix = "C-a";
    baseIndex = 1;
    terminal = "tmux-256color";
    extraConfig = ''
      set -ga terminal-overrides ",*:RGB"
      unbind -T root MouseDown3Pane # Disable right click menu
      set -g set-clipboard on
      set-option -g renumber-windows on
      set -g status-position top
      set -g status-style bg=default,fg=blue,bright
      set -g pane-active-border-style fg=blue
      set -g pane-border-style "fg=black"
    '';
  };

  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    globalConfig = {
      settings = {
        ruby.compile = false;
        python.compile = false;
      };
      tools = {
        ruby = "4.0.6";
      };
    };
  };

  programs.tealdeer = {
    enable = true;
    settings.display = {
      compact = true;
      use_pager = false;
    };
  };
}
