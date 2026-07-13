#!/usr/bin/env bash

# HSTR configuration - add this to ~/.bashrc
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
    { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n

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

# mkdir
alias mkdir="mkdir -p"

# bat
alias cat='bat --plain'

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
