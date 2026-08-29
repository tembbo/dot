return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,

	config = function()
		local treesitter = require("nvim-treesitter")

		---@param buf integer
		---@param language string
		local function try_attach(buf, language)
			if not vim.api.nvim_buf_is_valid(buf) then
				return
			end

			-- Load the parser if it exists.
			if not vim.treesitter.language.add(language) then
				return
			end

			-- Enable Treesitter highlighting.
			vim.treesitter.start(buf, language)

			-- Enable Treesitter indentation when the language supports it.
			local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil

			if has_indent_query then
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end

		local available_parsers = treesitter.get_available()

		local group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = group,

			callback = function(args)
				local buf = args.buf
				local filetype = args.match

				local language = vim.treesitter.language.get_lang(filetype)
				if not language then
					return
				end

				local installed_parsers = treesitter.get_installed("parsers")

				if vim.tbl_contains(installed_parsers, language) then
					-- The parser is already installed.
					try_attach(buf, language)
				elseif vim.tbl_contains(available_parsers, language) then
					-- Install the parser, then attach it to the buffer.
					treesitter.install(language):await(function()
						try_attach(buf, language)
					end)
				else
					-- Try to attach a parser installed outside nvim-treesitter.
					try_attach(buf, language)
				end
			end,
		})
	end,
}
