#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias grep='rg'
alias find='fd'
alias cat='bat --theme="Dracula"'

# Custom prompt
PS1='\e[34m\]\w\[\e[m\]\n\\$ '

export TERM=xterm-256color

eval "$(mise activate bash)"

export PATH=~/.config/composer/vendor/bin:$PATH

