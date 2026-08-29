set fish_greeting
fish_vi_key_bindings

set -gx EDITOR (which nvim)

alias ls "eza --group-directories-first"
alias la "eza --group-directories-first --all"
alias vim nvim
alias oc opencode

set -e fish_user_paths
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path ~/.bun/bin
fish_add_path ~/.local/bin
fish_add_path ~/.local/bin/zig-aarch64-macos-0.16.0
fish_add_path ~/.opencode/bin
# fish_add_path ~/.local/bin/zig-aarch64-macos-0.17.0-dev.44+0177cb57c

set -x GPG_TTY (tty)

bind -M insert ctrl-f accept-autosuggestion
