#!/usr/bin/env bash
set -euo pipefail

DOTS_DIR="$HOME/.dots"
REPO="https://github.com/tembbo/dots.git"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # no color

log() { echo -e "${BLUE}[*]${NC} $1"; }
success() { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
error() {
	echo -e "${RED}[✗]${NC} $1" >&2
	exit 1
}

if [[ "$(uname)" == "Darwin" ]]; then
	error "This script only works on macOS"
fi

if test ! $(which brew); then
	log "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	success "Homebrew installed"
else
	success "Homebrew already installed"
fi
eval "$(/opt/homebrew/bin/brew shellenv fish)"

if test ! $(which stow); then
	log "Installing stow..."
	brew install stow
	success "stow installed"
else
	success "stow already installed"
fi

# ── dotfiles ───────────────────────────────────────────────────────────────
FIRST_RUN=false
if [[ -d "$DOTS_DIR/.git" ]]; then
	log "Updating dotfiles..."
	git -C "$DOTS_DIR" pull --ff-only
	success "Dotfiles up to date"
else
	log "Cloning dotfiles..."
	git clone "$REPO" "$DOTS_DIR"
	FIRST_RUN=true
	success "Dotfiles cloned from $REPO"
fi

mkdir -p "$HOME/.config"
cd "$DOTS_DIR"

# ── link dotfiles ──────────────────────────────────────────────────────────
if $FIRST_RUN; then
	log "Linking dotfiles..."
	stow .
else
	log "Restowing dotfiles..."
	stow --restow .
fi
success "Dotfiles linked into ~/.config"

success "Bootstrap complete!"
