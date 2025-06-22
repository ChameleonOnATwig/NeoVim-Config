return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c",
					"dockerfile",
					"gitignore",
					"javascript",
					"json",
					"lua",
					"typescript",
					"vim",
					"vimdoc"
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	},
}
