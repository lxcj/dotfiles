{ ... }:
let
  borderstyle = "single";
in
{
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
    };

    luaLoader.enable = true;
    globals.mapleader = " ";

    opts = {
      mouse = "nv"; # Enable mouse in normal and visual mode

      winborder = borderstyle; # Set border style for floating windows

      clipboard = "unnamedplus"; # Sync clipboard with system
      undofile = true; # Enable undo history
      confirm = true; # Enable confirm dialog for unsaved changes
      showmode = false; # Hide mode as it is shown in the status line

      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers

      # Set indentation
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;

      wrap = false; # Disable line wrap

      # Make search case-insensitive
      ignorecase = true;
      smartcase = true;

      scrolloff = 8;
      sidescrolloff = 8;

      updatetime = 300;
      timeoutlen = 300;

      completeopt = [ "menuone" "noselect" "popup" ];
    };

    keymaps = [
      { mode = "n"; key = "<Esc>"; action = "<cmd>nohlsearch<cr>"; } # Clear search highlights

      { mode = "i"; key = ";;"; action = "<Esc>m`A;<Esc>`'li"; } # Add semicolon at EOL
      { mode = "i"; key = ",,"; action = "<Esc>m`A,<Esc>`'li"; } # Add comma at EOL

      # Disable yank on delete/change
      { mode = [ "n" "v" ]; key = "d"; action = "\"_d"; }
      { mode = [ "n" "v" ]; key = "D"; action = "\"_D"; }
      { mode = [ "n" "v" ]; key = "c"; action = "\"_c"; }
      { mode = [ "n" "v" ]; key = "C"; action = "\"_C"; }
      { mode = [ "n" "v" ]; key = "s"; action = "\"_s"; }
      { mode = [ "n" "v" ]; key = "S"; action = "\"_S"; }
      { mode = "n"; key = "x"; action = "\"_x"; }
      { mode = "n"; key = "X"; action = "\"_X"; }
    ];

    autoCmd = [
      { event = [ "VimEnter" ]; nested = true; callback.__raw = ''
        function()
          if vim.fn.argc() == 0 then
            require("persistence").load()
          end
        end
      ''; }
      { event = "TextYankPost"; command = "lua vim.highlight.on_yank()"; }
      {
        event = "LspAttach";
        callback.__raw = ''
          function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            if client ~= nil and client:supports_method("textDocument/completion") then
              vim.lsp.completion.enable( true, client.id, args.buf, { autotrigger = true })
            end
          end
        '';
      }
    ];

    diagnostic.settings = {
      virtual_text = true;
      severity_sort = true;

      float = {
        style = "minimal";
        border = "single";
        source = "if_many";

        header = "";
        prefix = "";
      };
    };

    lsp.servers = {
      bashls.enable = true;
      cssls.enable = true;
      gopls.enable = true;
      html.enable = true;
      lua_ls.enable = true;
      nil_ls.enable = true;
      oxfmt.enable = true;
      oxlint.enable = true;
      ruby_lsp.enable = true;
      rust_analyzer.enable = true;
      taplo.enable = true;
      ts_ls.enable = true;
      zls.enable = true;
    };

    plugins.gitsigns.enable = true;
    plugins.lspconfig.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.treesitter.enable = true;

    plugins.fzf-lua = {
      enable = true;

      settings = {
        winopts = {
          border = borderstyle;
          preview.border = borderstyle;
        };

        files = {
          file_icons = false;
          hidden = false;
        };

        defaults.formatter = "path.dirname_first"; # Grey-out path before filename
      };

      keymaps = {
        "<leader>f" = { action = "files"; options.desc = "Open file picker"; };
        "<leader>b" = { action = "buffers"; options.desc = "Open buffer picker"; };
        "<leader>d" = { action = "quickfix"; options.desc = "Open quickfix list"; };
        "<leader>s" = { action = "treesitter"; options.desc = "Open symbol picker"; };
        "<leader>a" = { action = "lsp_code_actions"; options.desc = "Code actions"; };
        "<leader>/" = { action = "live_grep"; options.desc = "Search in current folder"; };
        "<leader>?" = { action = "commands"; options.desc = "Search commands"; };

        "<leader>gs" = { action = "git_status"; options.desc = "Show Git status"; };
        "<leader>gl" = { action = "git_bcommits"; options.desc = "Show Git commits (current file)"; };
      };
    };

    plugins.lualine = {
      enable = true;

      settings = {
        options = {
          icons_enabled = true;
          theme = "auto";
          section_separators = { left = ""; right = ""; };
        };

        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" ];
          lualine_c = [ "filename" ];

          lualine_x = [ "filetype" ];
          lualine_y = [ "lsp_status" ];
          lualine_z = [ "location" ];
        };
      };
    };

    plugins.persistence = {
      enable = true;

      settings.options = [
        "buffers"
        "curdir"
        "tabpages"
        "winsize"
      ];
    };

    plugins.web-devicons = {
      enable = true;

      settings = {
        color_icons = true;
        variant = "dark";
      };
    };

    plugins.which-key = {
      enable = true;

      settings = {
        delay = 0;
        preset = "helix";
        win.border = borderstyle;
      };
    };
  };
}
