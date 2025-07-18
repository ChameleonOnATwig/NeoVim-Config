return {
	"nvim-treesitter/nvim-treesitter",

	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	config = function() 
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"dockerfile",
				"gitignore",
				"javascript",
				"json",
				"lua",
				"markdown",
				"typescript",
				"vim",
				"vimdoc"
			},
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true }
		})
	end
}
