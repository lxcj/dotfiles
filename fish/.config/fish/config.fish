if not status is-interactive
    return 0
end

# Set terminal colors
set -gx TERM xterm-256color

# Set default editor
set -gx EDITOR hx

# Disable greeting
set fish_greeting

# Disable autosuggestions
set -g fish_autosuggestion_enabled 0

# Remove underline from command lines
set fish_color_command normal
set fish_color_valid_path
set fish_color_option normal

# Prompt (Hydro)
set -g hydro_color_pwd blue
set -g hydro_color_git magenta

# Aliases
alias ls 'ls -1Fv --group-directories-first --color=auto'
alias la 'ls -A'
alias ll 'ls -l'
alias lla 'ls -lA'
alias lt 'tree -L 3 -a -I ".git"'
alias cat 'bat --plain'
alias tmp 'cd $(mktemp -d)' # create a temp folder and cd
alias operm 'stat -c "%a %n"' # show octal permission

# Abbreviations
abbr -a c clear
abbr -a mkdir mkdir -p
abbr -a g git
abbr -a gs git status -s
abbr -a ga git add
abbr -a gc git commit
abbr -a gca git commit -a
abbr -a gl git log --oneline
abbr -a glg git log --oneline --graph --all --stat
abbr nv nvim

# FZF
abbr -a f fzf
set -Ux FZF_DEFAULT_OPTS " 
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
fzf --fish | source

# zmx
functions -c fish_prompt _original_fish_prompt 2>/dev/null
function fish_prompt --description 'Write out the prompt'
    if set -q ZMX_SESSION
        echo -n "[$ZMX_SESSION] "
    end
    _original_fish_prompt
end

# Activate mise
mise activate fish | source
