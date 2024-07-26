local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.termguicolors = true
opt.signcolumn = "yes"

opt.ignorecase = true
opt.smartcase = true

opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.swapfile = false

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", {})
