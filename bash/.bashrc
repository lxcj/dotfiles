#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias grep='grep --color=auto'
alias cat='bat --theme="Dracula"'
alias cd..='cd ..'

# Custom prompt
PS1='\e[34m\]\w\[\e[m\]\n\\$ '

export TERM=xterm-256color

eval "$(mise activate bash)"

