function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"morhetz/gruvbox",
		name = "gruvbox",
		lazy = false,
		priority = 1000,

		config = function()
			vim.cmd.colorscheme("gruvbox")
		end
	},

	{
		"folke/tokyonight.nvim",
		name = "tokyo-night"
	},

	{
		"rose-pine/neovim",
		name = "rose-pine"
	}
}
