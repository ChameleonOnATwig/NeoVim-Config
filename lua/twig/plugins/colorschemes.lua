return {
	{
		"morhetz/gruvbox",
		name = "gruvbox",
		lazy = false,
		priority = 1000,

		config = function()
			vim.cmd("colorscheme gruvbox")
		end
	},

	{
		"folke/tokyonight.nvim",
		name = "tokyo-night"
	},

	{
		"rose-pine/neovim",
		name = "rose-pine"
	},
}
