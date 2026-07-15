#!/usr/bin/env bash

# history config
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)

# check the window size after each command
shopt -s checkwinsize

# set locale and encoding
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# set terminal colors
export TERM="xterm-256color"

# set default editor
export EDITOR=hx

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# make completion case-insensitive
bind 'set completion-ignore-case on'

# add bin to path if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# add local bin to path if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# custom prompt
source /usr/share/git-core/contrib/completion/git-prompt.sh
PS1='\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " on \[\e[35m\] %s\[\e[m\]")\[\033[00m\]\n❯ '

# ls aliases
alias ls='ls -1Fv --group-directories-first --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

# tree
alias lt="tree -L 3 -a -I '.git'"

# mkdir
alias mkdir="mkdir -p"

# bat
alias cat='bat --plain'

# fd
alias fd='fdfind'

# grep
alias grep='grep --color=auto'

# fzf
alias f='fzf'

# git abbreviations
alias g='git'
alias gs='git status -s'
alias gc='git commit'
alias gl='git log --oneline --graph --all --stat'

# create a temp folder and cd
alias tmp='cd $(mktemp -d)'

# mise (keep this at the end)
eval "$(mise activate bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
