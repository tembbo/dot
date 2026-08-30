return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "-", "<cmd>Oil --float<cr>" },
	},
	cmd = { "Oil" },
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["q"] = "actions.close",
			["<Esc>"] = "actions.close",
		},
	},
}
