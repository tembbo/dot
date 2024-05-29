return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	config = function()
		local oil = require("oil")
		oil.setup({
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 4,
			},
		})
		vim.keymap.set("n", "-", oil.toggle_float, {})
	end,
}
