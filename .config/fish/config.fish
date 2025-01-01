set -g fish_greeting

fish_vi_key_bindings

alias ls "eza --group-directories-first"
alias la "eza --group-directories-first --all"

alias vim nvim

eval (/opt/homebrew/bin/brew shellenv)

fish_add_path (brew --prefix python)/libexec/bin
fish_add_path ~/.cargo/bin

starship init fish | source
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

zoxide init --cmd cd fish | source
