return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				go = { "gofumpt" },
				html = { "prettier" },
				javascript = { "prettier" },
				lua = { "stylua" },
				python = { "black", "isort" },
				rust = { "rustfmt" },
				vue = { "prettier", "rustywind" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
