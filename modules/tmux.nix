{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    prefix = "C-a";
    baseIndex = 1;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
    ];
    extraConfig = ''
      set -ga terminal-overrides ",*:RGB"
      unbind -T root MouseDown3Pane # Disable right click menu
      set -g set-clipboard on
      set-option -g renumber-windows on
      set -g status-position top
      set -g status-style bg=default,fg=blue,bright
      set -g window-status-current-style "fg=magenta"
      set -g pane-active-border-style fg=blue
      set -g pane-border-style "fg=black"
      set -g extended-keys on
      set -g extended-keys-format csi-u

      set -g status-left-length 30

      # Status bar right side: "tmux" label that turns red+bold while prefix is held
      set -g status-right-length 20
      set -g status-right '#{?client_prefix,#[fg=red]#[bold],#[fg=blue,bright]}tmux'

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

      # Allow window switching with Shift + arrow keys
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # Allow config reloading using prefix + r
      unbind r
      bind r source-file $HOME/.config/tmux/tmux.conf \; display-message "Config reloaded."

      # Terminal popup
      bind C-t display-popup -E "fish"

      # Switch session via fzf popup (prefix + C-f)
      # xargs -I {} keeps the whole line as one arg so session names with spaces work
      bind-key C-f display-popup -E \
        "tmux list-sessions -F '#S' | fzf --reverse --height=100% | xargs -I {} tmux switch-client -t {}"

      # Switch window via fzf popup (prefix + C-w)
      # '|' delimiter isolates the switch target (#S:#I) from the window name (#W),
      # so window names containing spaces don't break the cut; xargs -I {} preserves spaces.
      bind-key C-w display-popup -E \
        "tmux list-windows -a -F '#S:#I|#W' | fzf --reverse --height=100% | cut -d'|' -f1 | xargs -I {} tmux switch-client -t {}"

      # tmux-resurrect: (manual save: prefix + C-s, restore: prefix + C-r)
      set -g @resurrect-capture-pane-contents "on"
      # Restore running processes in panes
      set -g @resurrect-processes 'pi opencode'

      # tmux-continuum: auto-restore when the tmux server starts (saves every 15 min by default)
      set -g @continuum-restore "on"
    '';
  };
}
