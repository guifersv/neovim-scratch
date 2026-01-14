return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		dependencies = {
			{
				"vhyrro/luarocks.nvim",
				priority = 1000,
				opts = {
					rocks = { "luautf8" },
				},
			},
		},
		opts = {},
	},
}
