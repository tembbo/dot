return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				go = { "gofumpt" },
				html = { "prettier" },
				javascript = { "biome" },
				json = { "biome" },
				lua = { "stylua" },
				python = { "ruff" },
				rust = { "rustfmt" },
				svelte = { "rustywind" },
			},
			format_on_save = {
				lsp_format = "first",
				timeout_ms = 500,
			},
		})
	end,
}
