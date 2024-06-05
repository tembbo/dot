alias vim="nvim"
alias ll="eza --long --no-time --icons=always --git-ignore --all --sort=type"
alias lt="eza --long --no-time --tree --icons=always --git-ignore --all --sort=type"

if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:$HOME/.cache/go/bin"
export GOPATH="$HOME/.cache/go"
export GOMODCACHE="$HOME/.cache/go/pkg/mod"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/guse/.bun/_bun" ] && source "/Users/guse/.bun/_bun"

eval "$(zoxide init --cmd cd zsh)"

eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
