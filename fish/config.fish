set -g fish_greeting

alias ls "eza --group-directories-first"
alias la "eza --group-directories-first --all"

alias vi nvim

set -x GPG_TTY $(tty)

if command -v brew > /dev/null
    fish_add_path /opt/homebrew/bin
    fish_add_path (brew --prefix python)/libexec/bin
end

starship init fish | source
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

zoxide init --cmd cd fish | source
