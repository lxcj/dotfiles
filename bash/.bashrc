# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:ll:cd:pwd:clear:history"
shopt -s histappend # append to the history file, don't overwrite it

# check the window size after each command
shopt -s checkwinsize

# Set term colors
export COLORTERM="truecolor"

# Set default editor
export EDITOR=nvim

# Custom prompt
PS1='\[\033[01;34m\]\w\[\033[00m\]\n❯ '

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Make completion case-insensitive
bind 'set completion-ignore-case on'

# Aliases
alias ls='ls -1Fv --group-directories-first --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

alias tmp='cd $(mktemp -d)'
alias mkdir='mkdir -p'

alias gs='git status -s'
alias gc='git commit'
alias gca='git commit --all'
alias gl='git log --oneline -n 10'
alias gd='git diff'

alias fd='fdfind'
alias nv='nvim'

alias dot='cd $HOME/dotfiles' # Change dir to dotfiles

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Catpuccin Macchiato for fzf
export FZF_DEFAULT_OPTS="--color=fg:#cad3f5
    --color=bg:#24273a
    --color=hl:#ed8796
    --color=fg+:#cad3f5
    --color=bg+:#363a4f
    --color=hl+:#ed8796
    --color=border:#6e738d
    --color=header:#ed8796
    --color=gutter:#232136
    --color=spinner:#f4dbd6
    --color=info:#c6a0f6
    --color=pointer:#f4dbd6
    --color=marker:#b7bdf8
    --color=prompt:#c6a0f6
    --color=selected-bg:#494d64
    --color=label:#cad3f5"

# Set up mise
eval "$(mise activate bash)"

# pnpm
export PNPM_HOME='/home/lx/.local/share/pnpm'
case ":$PATH:" in
  ":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

