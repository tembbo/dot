return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*",

	dependencies = {
		"rafamadriz/friendly-snippets",

		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = vim.fn.has("win32") == 0 and "make install_jsregexp" or nil,

			config = function()
				require("luasnip").setup()

				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},

	opts = {
		keymap = {
			preset = "none",

			["<C-e>"] = {
				"hide",
			},

			["<CR>"] = {
				"accept",
				"fallback",
			},

			["<Tab>"] = {
				"accept",
				"fallback",
			},

			["<C-j>"] = {
				"select_next",
				"fallback",
			},

			["<C-k>"] = {
				"select_prev",
				"fallback",
			},
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},

		snippets = {
			preset = "luasnip",
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
				"lazydev",
			},

			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},

		fuzzy = {
			implementation = "lua",
		},

		signature = {
			enabled = true,
		},
	},
}
