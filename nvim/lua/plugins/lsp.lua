return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")

			mason.setup({
				ui = {
					border = "rounded",
					backdrop = 100,
					height = 0.8,
					icons = {
						package_installed = "󰄬",
						package_pending = "󰁔",
						package_uninstalled = "󰅖",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"cssls",
					"lua_ls",
					"ruff",
					"rust_analyzer",
					"svelte",
					"tailwindcss",
					"ts_ls",
				},

				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspconfig", {}),
				callback = function()
					vim.keymap.set("n", "A", vim.lsp.buf.code_action)
					vim.keymap.set("n", "D", vim.lsp.buf.definition)
					vim.keymap.set("n", "R", vim.lsp.buf.references)
					vim.keymap.set("n", "H", vim.lsp.buf.hover)
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
}
