return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
      -- "java",
			"bash",
			"c",
			"diff",
			"json",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"query",
			"regex",
			"toml",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"rust",
			"go",
			"gomod",
			"gosum",
			"gowork",
      "zig",
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = parsers,
			callback = function()
				vim.treesitter.start()
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
			end,
		})

		require("nvim-treesitter").install(parsers)
	end,
}
