return {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
		},
	},
}
