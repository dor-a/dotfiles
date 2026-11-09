local ensure_installed = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"yaml",
	"json",
	"markdown",
	"markdown_inline",
	"bash",
	"python",
	"javascript",
	"typescript",
	"html",
	"css",
	"terraform",
	"dockerfile",
	"git_config",
	"gitignore",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.install(ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter-setup", { clear = true }),
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if not lang then
						return
					end

					-- auto_install: fetch parsers for filetypes not in ensure_installed
					if not vim.list_contains(ts.get_installed(), lang) then
						if not vim.list_contains(ts.get_available(), lang) then
							return
						end
						ts.install(lang):await(function()
							if vim.api.nvim_buf_is_valid(args.buf) then
								pcall(vim.treesitter.start, args.buf, lang)
								vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
							end
						end)
						return
					end

					if pcall(vim.treesitter.start, args.buf, lang) then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
