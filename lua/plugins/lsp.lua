return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded" },
			virtual_text = { spacing = 2, source = "if_many" },
			underline = true,
		})
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local servers = {
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = { command = "clippy" },
						procMacro = { enable = true },
					},
				},
			},

			taplo = {
				settings = {
					evenBetterToml = {
						schema = { enabled = true },
					},
				},
			},

			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						completion = { callSnippet = "Replace" },
					},
				},
			},

			gopls = {
				hints = {
					assignVariableTypes = true,
					parameterNames = true,
				},
			},
		}

		local ensure_installed = vim.tbl_keys(servers)
		vim.list_extend(ensure_installed, {
			"stylua",
			"gofumpt",
			"gomodifytags",
			"gotests",
			"iferr",
			"impl",
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = {
					"rust_analyzer",
				},
			},
		})
	end,
}
