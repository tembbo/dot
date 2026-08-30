return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			disabled_filetypes = {
				"alpha",
				"dashboard",
				"oil",
			},
		},
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
		},
	},
}
