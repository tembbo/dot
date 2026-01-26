local options = {
	tabstop = 4,
	shiftwidth = 4,
	expandtab = false,
	breakindent = true,

	cursorline = true,
	number = true,
	relativenumber = true,
	scrolloff = 10,
	showmode = false,
	signcolumn = "yes",
	title = true,
	wrap = false,

	ignorecase = true,
	smartcase = true,

	clipboard = "unnamedplus",
	confirm = true,
	undofile = true,
	updatetime = 250,
	timeoutlen = 300,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end
