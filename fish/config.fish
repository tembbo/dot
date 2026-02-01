set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

set -gx EDITOR (which nvim)

alias ls "eza --group-directories-first"
alias la "eza --group-directories-first --all"
alias vim nvim
alias oc opencode

set -e fish_user_paths
fish_add_path /opt/homebrew/bin
fish_add_path ~/.bun/bin

set -x GPG_TTY (tty)
