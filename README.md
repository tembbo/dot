# My Dotfiles

This repository contains my personal dotfiles. It isn't meant to be a turnkey solution to copying my setup. I've tried to keep things relatively simple, but if you wish to copy from this, you'll likely need to tweak some things to fit your own machine.

## Setup

Before proceeding, make sure you have [GNU Stow](https://www.gnu.org/software/stow/) installed.

Clone the repository into a folder in your home directory:

```sh
git clone https://github.com/tembbo/dot .dot
cd .dot
```

Then use stow to create the symlinks:

```sh
stow .
```
