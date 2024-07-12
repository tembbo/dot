alias vim="nvim"
alias ls="eza --icons=always --all --sort=type"

if [[ $(uname -s) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

. "$HOME/.cargo/env"

export PATH="$PATH:$HOME/.cache/go/bin"
export GOPATH="$HOME/.cache/go"
export GOMODCACHE="$HOME/.cache/go/pkg/mod"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

source <(fzf --zsh)

eval "$(zoxide init zsh --cmd cd)"

eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
