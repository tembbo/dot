return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "gofumpt" },
				javascript = { "prettier" },
				lua = { "stylua" },
				python = { "black", "isort" },
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
