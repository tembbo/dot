return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},

	dependencies = {
		{
			"mason-org/mason.nvim",
			cmd = "Mason",
			opts = {},
		},

		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",

		{
			"j-hui/fidget.nvim",
			opts = {},
		},
	},

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", {
				clear = true,
			}),

			callback = function(event)
				local buffer = event.buf

				local function map(lhs, rhs, description, mode)
					vim.keymap.set(mode or "n", lhs, rhs, {
						buffer = buffer,
						desc = "LSP: " .. description,
					})
				end

				map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("gra", vim.lsp.buf.code_action, "[G]oto code [A]ction", {
					"n",
					"x",
				})
				map("K", vim.lsp.buf.hover, "Hover documentation")
				map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				local telescope = require("telescope.builtin")

				map("grr", telescope.lsp_references, "[G]oto [R]eferences")
				map("gri", telescope.lsp_implementations, "[G]oto [I]mplementation")
				map("grd", telescope.lsp_definitions, "[G]oto [D]efinition")
				map("gO", telescope.lsp_document_symbols, "Open document symbols")
				map("gW", telescope.lsp_dynamic_workspace_symbols, "Open workspace symbols")
				map("grt", telescope.lsp_type_definitions, "[G]oto [T]ype definition")

				local client = vim.lsp.get_client_by_id(event.data.client_id)

				if not client then
					return
				end

				-- Highlight references under the cursor.
				if client:supports_method("textDocument/documentHighlight", buffer) then
					local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", {
						clear = false,
					})

					vim.api.nvim_create_autocmd({
						"CursorHold",
						"CursorHoldI",
					}, {
						buffer = buffer,
						group = highlight_group,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({
						"CursorMoved",
						"CursorMovedI",
					}, {
						buffer = buffer,
						group = highlight_group,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", {
							clear = true,
						}),

						callback = function(detach_event)
							vim.lsp.buf.clear_references()

							vim.api.nvim_clear_autocmds({
								group = highlight_group,
								buffer = detach_event.buf,
							})
						end,
					})
				end

				-- Toggle inlay hints when supported.
				if client:supports_method("textDocument/inlayHint", buffer) then
					map("<leader>th", function()
						local enabled = vim.lsp.inlay_hint.is_enabled({
							bufnr = buffer,
						})

						vim.lsp.inlay_hint.enable(not enabled, {
							bufnr = buffer,
						})
					end, "[T]oggle inlay [H]ints")
				end
			end,
		})

		local servers = {
			ts_ls = {},
			zls = {},
			tailwindcss = {},
			fish_lsp = {},

			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},

						format = {
							enable = false,
						},
					},
				},

				on_init = function(client)
					if not client.workspace_folders then
						return
					end

					local path = client.workspace_folders[1].name
					local config_exists = vim.uv.fs_stat(path .. "/.luarc.json")
						or vim.uv.fs_stat(path .. "/.luarc.jsonc")

					if path ~= vim.fn.stdpath("config") and config_exists then
						return
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},

						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
					})
				end,
			},
		}

		local ensure_installed = vim.tbl_keys(servers)

		vim.list_extend(ensure_installed, {
			"stylua",
			"prettier",
			"shfmt",
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = true,
			automatic_enable = false,
		})

		for name, server in pairs(servers) do
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

			vim.lsp.config(name, server)
			vim.lsp.enable(name)
		end
	end,
}
