return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,

	config = function()
		local treesitter = require("nvim-treesitter")
		local available_parsers = treesitter.get_available()

		local function attach_parser(buffer, language)
			if not vim.api.nvim_buf_is_valid(buffer) then
				return
			end

			if not vim.treesitter.language.add(language) then
				return
			end

			vim.treesitter.start(buffer, language)

			local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil

			if has_indent_query then
				vim.bo[buffer].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end

		local group = vim.api.nvim_create_augroup("treesitter", {
			clear = true,
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = group,

			callback = function(args)
				local buffer = args.buf
				local language = vim.treesitter.language.get_lang(args.match)

				if not language then
					return
				end

				local installed = treesitter.get_installed("parsers")

				if vim.tbl_contains(installed, language) then
					attach_parser(buffer, language)
					return
				end

				if not vim.tbl_contains(available_parsers, language) then
					attach_parser(buffer, language)
					return
				end

				treesitter.install(language):await(function()
					attach_parser(buffer, language)
				end)
			end,
		})
	end,
}
