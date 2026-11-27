if not status is-interactive
    return 0
end

set -gx COLORTERM truecolor
set -gx EDITOR hx

fish_add_path ~/.cargo/bin

set fish_greeting # disable greeting
set -g fish_autosuggestion_enabled 0
set fish_prompt_pwd_dir_length 20
set -g hydro_multiline true
set -g hydro_cmd_duration_threshold 43200000 # set to 12h to avoid displaying duration

# Remove underline from command lines
set fish_color_command normal
set fish_color_valid_path
set fish_color_option normal

# Aliases
alias ls 'ls -1Fv --group-directories-first --color=auto'
alias la 'ls -A'
alias ll 'ls -l'
alias lla 'ls -lA'
alias tmp 'cd $(mktemp -d)'
alias cat bat
alias vi nvim
alias nv nvim

# Abbreviations
abbr -a g git
abbr -a gs git status -s
abbr -a ga git add
abbr -a gc git commit
abbr -a gd git diff
abbr -a gl git log --oneline -n 10
abbr -a c clear

set -gx LS_COLORS "$(vivid generate catppuccin-macchiato)" # colors for fd

# Catppuccin Macchiato for fzf
set -gx FZF_DEFAULT_OPTS "\
    --layout=reverse \
    --color=fg:#cad3f5 \
    --color=bg:#24273a \
    --color=hl:#ed8796 \
    --color=fg+:#cad3f5 \
    --color=bg+:#363a4f \
    --color=hl+:#ed8796 \
    --color=border:#6e738d \
    --color=header:#ed8796 \
    --color=gutter:#232136 \
    --color=spinner:#f4dbd6 \
    --color=info:#c6a0f6 \
    --color=pointer:#f4dbd6 \
    --color=marker:#b7bdf8 \
    --color=prompt:#c6a0f6 \
    --color=selected-bg:#494d64 \
    --color=label:#cad3f5"

# Shell integrations
mise activate fish | source
fzf --fish | source
