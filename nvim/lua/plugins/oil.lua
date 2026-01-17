return {
	"stevearc/oil.nvim",
	lazy = false,
	keys = {
		{ "-", "<cmd>Oil --float<cr>" },
	},
	cmd = { "Oil" },
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
	},
}
