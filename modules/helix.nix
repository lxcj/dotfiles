{ config, pkgs, lib, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_macchiato";
      editor = {
        true-color = true;
        color-modes = true;
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
}
