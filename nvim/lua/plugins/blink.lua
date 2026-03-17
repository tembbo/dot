return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = {
			preset = "none",
			["<C-e>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		fuzzy = { implementation = "prefer_rust" },
	},
}
