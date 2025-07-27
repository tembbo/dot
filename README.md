# ☕ My Dotfiles

A collection of my personal configuration files.

> [!WARNING]
> Don't blindly use my settings unless you know what you're doing.

## 🚀 Installation

Before proceeding, ensure that you have [GNU Stow](https://www.gnu.org/software/stow/) installed.

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

## 🛠️ Configured tools

This repository contains configurations for the following tools:

- **[Neovim](nvim)** - Text editor
- **[tmux](tmux/tmux.conf)** - Terminal multiplexer
- **[fish](fish/config.fish)** - Shell
- **[Git](git/config)** - Version control
- **[Ghostty](ghostty/config)** - Terminal emulator
- **[Starship](starship/starship.toml)** - Prompt
