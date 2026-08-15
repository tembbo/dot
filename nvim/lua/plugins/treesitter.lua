-- ============================================================================
-- FILE: ~/.config/nvim/lua/plugins/treesitter.lua
-- ============================================================================
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			ensure_installed = { "lua", "python", "javascript", "html", "css", "java" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
