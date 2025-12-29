set fish_greeting

set -gx EDITOR (which nvim)

alias ls "eza --group-directories-first"
alias la "eza --group-directories-first --all"
alias vim nvim

set -e fish_user_paths
fish_add_path /opt/homebrew/bin
fish_add_path ~/.bun/bin
