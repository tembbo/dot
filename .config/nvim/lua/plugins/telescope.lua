return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {
						additional_args = { "--hidden" },
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", builtin.find_files, {})
			vim.keymap.set("n", "<leader>g", builtin.live_grep, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
