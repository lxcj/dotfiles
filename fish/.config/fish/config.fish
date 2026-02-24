if status is-interactive
  # Commands to run in interactive sessions can go here
  alias cat 'bat --theme="Dracula"'
  alias ls 'ls --color=auto'
  alias ll 'ls -l'
  alias la 'ls -a'
  alias lla 'ls -la'
  alias grep rg
  alias find fd
  alias tr tree
  alias ff fastfetch
  alias v nvim
end

set fish_greeting
bind tab accept-autosuggestion

export TERM=xterm-256color

starship init fish | source
mise activate fish | source

