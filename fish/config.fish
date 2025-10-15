set -g fish_greeting

alias ls "eza --group-directories-first"
alias la "eza --group-directories-first --all"

alias vi nvim

if command -v brew > /dev/null
    fish_add_path /opt/homebrew/bin
end

starship init fish | source
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

zoxide init --cmd cd fish | source

atuin init fish | sed "s/-k up/up/g" | source
atuin init fish | sed "s/-k up/up/g"
