#!/usr/bin/env bash

# History config
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)

# Check the window size after each command
shopt -s checkwinsize

# Set locale and encoding
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Set terminal colors
export TERM="xterm-256color"

# Set default editor
export EDITOR=hx

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

# Add bin to path if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Add local bin to path if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Custom prompt
source /usr/share/git-core/contrib/completion/git-prompt.sh
PS1='\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " on \[\e[35m\] %s\[\e[m\]")\[\033[00m\]\n❯ '

# Aliases
alias ls='ls -1Fv --group-directories-first --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias lt="tree -L 3 -a -I '.git'"
alias ..="cd .."
alias cd..="cd .."
alias c="clear"
alias mkdir="mkdir -p"
alias tmp='cd $(mktemp -d)' # create a temp folder and cd
alias cat='bat --plain'
alias grep='grep --color=auto'
alias f='fzf'

# Git abbreviations
alias g='git'
alias gs='git status -s'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit'
alias gca='git commit -a'
alias gl='git log --oneline'
alias glg='git log --oneline --graph --all --stat'
alias clone='git clone'

# Add zmx indicator to prompt
if [[ -n $ZMX_SESSION ]]; then
  export PS1="[$ZMX_SESSION] ${PS1}"
fi

# Set up fzf key bindings, fuzzy completion and colors
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
eval "$(fzf --bash)"

# Activate mise
eval "$(mise activate bash)"
