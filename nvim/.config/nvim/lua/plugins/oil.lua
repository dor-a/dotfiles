return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		keys = {
			{ "<leader>f", "<cmd>Oil<cr>" },
		},
		dependencies = {
			"refractalize/oil-git-status.nvim",
			"nvim-mini/mini.icons"
			-- "mini.nvim",
		},
		opts = {
			win_options = {
				signcolumn = "yes:2",
			},
			view_options = {
				show_hidden = true,
			},
		},
		config = function(_, opts)
			require("mini.icons").setup()

			require("oil").setup(opts)
			require("oil-git-status").setup({
				show_ignored = false,
			})
		end,
	},
}
