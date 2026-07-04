#!/usr/bin/env bash

# history config
export HISTSIZE=1500
export HISTFILESIZE=3000
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:la:ll:lla:cd:pwd:clear:history"
export HISTTIMEFORMAT="[%F %T] " # timestamp
shopt -s histappend # append to the history file, don't overwrite it

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
PS1='\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " on  %s")\[\033[00m\]\n❯ '

# ls aliases
alias ls='ls -1Fv --group-directories-first --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

# mkdir
alias mkdir="mkdir -p"

# bat
alias cat='batcat --plain'

# fd
alias fd='fdfind'

# grep
alias grep='grep --color=auto'

# git abbreviations
alias g='git'
alias gs='git status'
alias gc='git commit'

# create a temp folder and cd
alias tmp='cd $(mktemp -d)'

# mise (keep this at the end)
eval "$(mise activate bash)"
