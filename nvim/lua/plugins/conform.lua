return {
	"stevearc/conform.nvim",
	event = { "BufReadPost" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
		},
	},
	opts = {
		format_on_save = function()
			return {
				timeout_ms = 1000,
				lsp_format = "fallback",
			}
		end,
		formatters_by_ft = {
			c = { "clang-format" },
			lua = { "stylua" },
			html = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },
			zig = { "zls" },
		},
	},
}
