return {
  "mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
		"nvim-telescope/telescope.nvim",
	},
  config = function()
    require("mason").setup()

    require("mason-tool-installer").setup({
      ensure_installed = {
        "rust_analyzer",
        "zls",
        "taplo",
        "lua_ls",
        "gopls",
        "stylua",
        "gofumpt",
        "gomodifytags",
        "gotests",
        "iferr",
        "impl",
      },
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

