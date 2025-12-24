return {
	"saghen/blink.cmp",
	event = { "InsertEnter" },
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},
		},
		keymap = {
			preset = "default",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
