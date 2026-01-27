vim.lsp.config("gopls", {
	settings = {
		["gopls"] = {
			hints = {
				enabled = true,
				assignVariableTypes = true,
				parameterNames = true,
			},
		},
	},
})
