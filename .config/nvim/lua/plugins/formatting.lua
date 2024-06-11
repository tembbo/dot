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
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
