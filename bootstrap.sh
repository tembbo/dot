#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # no color

log() { echo -e "${BLUE}[*]${NC} $1"; }
success() { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
error() {
	echo -e "${RED}[✗]${NC} $1"
	exit 1
}

[[ "$(uname)" == "Darwin" ]] || error "This script only works on macOS"
[[ "$(uname -m)" == "arm64" ]] || warn "This is primarily meant for Apple Silicon (arm64), you're on $(uname -m)"

if ! command -v brew &>/dev/null; then
	log "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	success "Homebrew installed"
else
	success "Homebrew already installed"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

if ! command -v stow &>/dev/null; then
	log "Installing stow..."
	brew install stow
	success "stow installed"
else
	success "stow already installed"
fi

DOTS_DIR="$HOME/.dots"
if [[ -d "$DOTS_DIR/.git" ]]; then
	success "Dotfiles already at $DOTS_DIR"
	log "Updating dotfiles..."
	git -C "$DOTS_DIR" pull --ff-only
else
	log "Cloning dotfiles..."
	git clone https://github.com/tembbo/dots.git "$DOTS_DIR"
	success "Dotfiles cloned to $DOTS_DIR"
fi

mkdir -p "$HOME/.config"
cd "$DOTS_DIR"

log "Linking dotfiles..."
stow --restow .
success "Dotfiles linked"

success "Bootstrap complete!"
