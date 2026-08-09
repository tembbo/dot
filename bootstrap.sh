#!/usr/bin/env bash
set -euo pipefail

# ── configuration ──────────────────────────────────────────────────────────
DOTS_DIR="$HOME/.dots"
REPO="https://github.com/tembbo/dots.git"

# ── colors & logging ───────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log()     { echo -e "${BLUE}[*]${NC} $1"; }
success() { echo -e "${GREEN}[✓]${NC} $1"; }
warn()    { echo -e "${YELLOW}[!]${NC} $1"; }
error()   { echo -e "${RED}[✗]${NC} $1" >&2; exit 1; }

usage() {
    cat <<'EOF'
Usage: bootstrap.sh [options]

Sets up a fresh macOS machine: installs Homebrew & stow, clones (or updates)
~/.dots, links dotfiles into ~/.config, and sets fish as the login shell.

Options:
  -h, --help    Show this help
EOF
}

# ── option parsing ─────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help) usage; exit 0 ;;
        *) error "Unknown option: $1 (see --help)" ;;
    esac
    shift
done

# ── pre-flight checks ──────────────────────────────────────────────────────
[[ "$OSTYPE" == "darwin"* ]] || error "This script only works on macOS"
[[ "$(id -u)" -ne 0 ]]        || error "Don't run this as root"

ARCH="$(uname -m)"
[[ "$ARCH" == "arm64" ]] || warn "Not running on Apple Silicon ($ARCH) — using /usr/local Homebrew paths"

BREW_BIN="/opt/homebrew/bin/brew"
[[ "$ARCH" == "arm64" ]] || BREW_BIN="/usr/local/bin/brew"

if ! xcode-select -p &>/dev/null; then
    warn "Xcode Command Line Tools not found — Homebrew's installer will trigger them"
fi

log "Starting bootstrap (host: $(hostname -s), arch: $ARCH)"

# ── homebrew ───────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null && [[ ! -x "$BREW_BIN" ]]; then
    log "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    success "Homebrew installed"
else
    success "Homebrew already installed"
fi
eval "$("$BREW_BIN" shellenv)"

# ── stow ───────────────────────────────────────────────────────────────────
if ! command -v stow &>/dev/null; then
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

# ── fish login shell ───────────────────────────────────────────────────────
if command -v fish &>/dev/null; then
    FISH_BIN="$(command -v fish)"
    CURRENT_SHELL="$(dscl . -read "/Users/$USER" UserShell 2>/dev/null | awk '{print $2}')"
    if [[ "$CURRENT_SHELL" == "$FISH_BIN" ]]; then
        success "fish is already your login shell"
    else
        log "Setting fish as your login shell (may prompt for sudo)..."
        if ! grep -qxF "$FISH_BIN" /etc/shells 2>/dev/null; then
            echo "$FISH_BIN" | sudo tee -a /etc/shells >/dev/null
        fi
        if sudo chsh -s "$FISH_BIN" "$USER"; then
            success "Login shell set to fish"
        else
            warn "Couldn't set login shell — run manually: chsh -s $FISH_BIN"
        fi
    fi
else
    warn "fish not found — skipping login shell setup"
fi

# ── post-install reminders ─────────────────────────────────────────────────
echo ""
log "Post-install steps:"
echo "  1. Restart your terminal (or run: exec fish)"
echo "  2. First nvim run installs plugins: nvim"
echo ""
success "Bootstrap complete!"