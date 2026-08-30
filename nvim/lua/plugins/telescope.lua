return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},

	keys = {
		{
			"<leader>sh",
			function()
				require("telescope.builtin").help_tags()
			end,
		},
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files()
			end,
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
		},
		{
			"<leader>sd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
	},

	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
}
