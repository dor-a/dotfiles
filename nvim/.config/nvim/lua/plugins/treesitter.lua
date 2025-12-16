return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
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
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.config").setup(opts)
		end,
	},
}
