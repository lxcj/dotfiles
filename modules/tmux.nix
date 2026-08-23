{ ... }:
{
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
      set -g extended-keys on
      set -g extended-keys-format csi-u

      # Switch session via fzf popup (prefix + C-s)
      bind-key C-s display-popup -E \
        "tmux list-sessions -F '#S' | fzf --reverse --height=100% | xargs tmux switch-client -t"
    '';
  };
}
