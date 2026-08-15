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
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>sk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").builtin()
			end,
			desc = "[S]earch [S]elect Telescope",
		},
		{
			"<leader>sw",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "[S]earch current [W]ord",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<leader>sd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<leader>sr",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "[S]earch [R]esume",
		},
		{
			"<leader>s.",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = '[S]earch Recent Files ("." for repeat)',
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
