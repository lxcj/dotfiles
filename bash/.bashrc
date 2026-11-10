# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

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

# Set default editor
export EDITOR=vim

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

