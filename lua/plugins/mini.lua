return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.bufremove").setup()
		require("mini.splitjoin").setup({
			mappings = {
				toggle = "gz",
			},
		})
		require("mini.cursorword").setup()
		require("mini.surround").setup({
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				suffix_last = "l",
				suffix_next = "n",
			},
		})
		require("mini.diff").setup({
			view = {
				style = "number",
			},
		})
	end,
}
