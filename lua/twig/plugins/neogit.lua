return {
	"NeogitOrg/neogit",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim"
	},

	cmd = "Neogit",

	config = function()
		require("neogit").setup({
			kind = "split", -- opens neogit in a split 
			signs = {
				-- { CLOSED, OPENED }
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},
			integrations = {
				diffview = true
			}
		})
	end
}
