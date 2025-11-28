set fish_greeting

set -gx EDITOR (which nvim)

alias ls "eza --group-directories-first"
alias la "eza --group-directories-first --all"
alias vim nvim

if status is-interactive
	and not set -q TMUX

	if tmux has-session -t dev 2>/dev/null
		tmux attach-session -t dev
	else
		tmux new-session -s dev
		tmux attach-session -t dev
	end
end
