# ☕ My Dotfiles

A collection of my personal configuration files.

> [!WARNING]
> Don't blindly use my configurations unless you know what you're doing.

## Install

Before proceeding, make sure to install [GNU Stow](https://www.gnu.org/software/stow/).

1. **Clone the repository**:

   ```sh
   git clone https://github.com/realguse/dot.git ~/.dot
   ```

2. **Navigate into the cloned directory**:

   ```sh
   cd ~/.dot
   ```

3. **Apply the configuration**:

   ```sh
   stow .
   ```

## Configured Tools

This repository contains configurations for the following tools:

- **[Neovim](nvim)** - Text editor
- **[tmux](tmux/tmux.conf)** - Terminal multiplexer
- **[fish](fish/config.fish)** - Shell
- **[Git](git/config)** - Version control
- **[Ghostty](ghostty/config)** - Terminal emulator
- **[Starship](starship/starship.toml)** - Prompt
- **[Atuin](atuin/config.toml)** - Shell history
