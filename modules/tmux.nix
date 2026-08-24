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

      # Allow pane navigation with prefix + hjkl (Vim-style)
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Allow pane navigation with Alt instead of prefix
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      # Allow config reloading using prefix + r
      unbind r
      bind r source-file $HOME/.config/tmux/tmux.conf \; display-message "Config reloaded."

      # Switch session via fzf popup (prefix + C-s)
      bind-key C-s display-popup -E \
        "tmux list-sessions -F '#S' | fzf --reverse --height=100% | xargs tmux switch-client -t"

      # Switch window via fzf popup (prefix + C-w)
      bind-key C-w display-popup -E \
        "tmux list-windows -a -F '#S:#I #W' | fzf --reverse --height=100% | cut -d' ' -f1 | xargs tmux switch-client -t"
    '';
  };
}
