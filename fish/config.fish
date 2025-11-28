set fish_greeting

set -gx EDITOR (which nvim)

alias ls "eza --group-directories-first"
alias la "eza --group-directories-first --all"
alias vim nvim

if status is-interactive
	and not set -q TMUX
	tmux new-session -A -s dev
end
