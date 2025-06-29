return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},

	config = function()
		require("lualine").setup {
			options = {
				theme = "gruvbox"
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "location" },
				lualine_z = { function()
					return " " .. os.date("%-I:%02M %p")
				end }
			}
		}
	end
}
