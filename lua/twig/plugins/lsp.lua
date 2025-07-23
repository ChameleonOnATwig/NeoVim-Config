return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp"
	},

	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"arduino_language_server",
				"clangd",
				"dockerls",
				"lua_ls",
				"ts_ls",
				"vimls"
			}
		})

		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					-- Native snippet support (Neovim v0.10+)
					vim.lsp.util.expand_snippet(args.body)
				end
			},

			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete()
			}),

			sources = {
					{ name = "buffer" },
					{ name = "nvim_lsp" },
					{ name = "path" }
			}
		})

		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	end
}
