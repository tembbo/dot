return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>p",
			function()
				require("conform").format({ async = true, lsp_format = "never" })
			end,
		},
	},
	opts = {
		formatters_by_ft = {
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "never",
		},
	},
}
