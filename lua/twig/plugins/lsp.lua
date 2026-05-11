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
				"marksman",
				"ts_ls",
				"vimls"
			},
			handlers = {
				function(server_name)
					if server_name == "arduino_language_server" then return end
					vim.lsp.config(server_name, { capabilities = capabilities })
					vim.lsp.enable(server_name)
				end,
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

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Arduino LSP Config
		vim.lsp.config("arduino_language_server", {
			capabilities = capabilities,
			cmd = {
				vim.fn.expand("~/.local/share/nvim/mason/bin/arduino-language-server"),
				"-clangd", vim.fn.expand("~/.local/share/nvim/mason/bin/clangd"),
				"-cli", "/usr/local/bin/arduino-cli",
				"-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
				"-fqbn", "arduino:avr:uno",
			},
		})
		vim.lsp.enable("arduino_language_server")

		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gd", vim.diagnostic.open_float, {})
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	end
}
