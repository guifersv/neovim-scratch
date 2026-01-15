return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│", tab_char = "│", highlight = "OasisPrimary" },
			scope = { show_start = false, show_end = false, highlight = "OasisAccent" },
			exclude = {
				buftypes = { "terminal", "nofile" },
				filetypes = { "help", "alpha", "dashboard", "Trouble", "lazy", "NvimTree" },
			},
			whitespace = {
				remove_blankline_trail = true,
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{ "mluders/comfy-line-numbers.nvim", opts = {} },
}
