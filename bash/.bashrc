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
export TERM="xterm-256color"

# Set default editor
export EDITOR=vim

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

# Search and edit dotfile
dot() {
    local file=$(
        fd --type f --hidden --exclude .git . "$HOME/dotfiles" |
        fzf --prompt="dotfiles > " --reverse
    )
    [[ -n "$file" ]] && $EDITOR "$file"
}

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

