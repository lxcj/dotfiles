if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
export TERM=xterm-256color
export EDITOR=helix

# Set PATH
set -gx PATH "$HOME/.bun/bin" $PATH
set -gx PATH "$HOME/go/bin" $PATH
set -gx PATH "$HOME/.config/composer/vendor/bin" $PATH

# Ruby
if type -q ruby && type -q gem
    # Get the user‑gem directory (e.g. /home/user/.gem)
    set -l gem_dir (ruby -r rubygems -e 'puts Gem.user_dir')
    # Prepend its bin sub‑directory to PATH
    set -gx PATH "$gem_dir/bin" $PATH
end

# Aliases
alias cat 'bat --theme="Dracula"'
alias ls 'eza -1F --group-directories-first'
alias la 'ls -a'
alias ll 'ls -l --octal-permissions'
alias lla 'ls -la --octal-permissions'
alias lt 'ls --tree'
alias hx helix

mise activate fish | source
starship init fish | source
