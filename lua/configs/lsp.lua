vim.lsp.config("lua_ls", {
	settings = {
		["Lua"] = {
			diagnostics = { globals = { "vim" } },
			completion = { callSnippet = "Replace" },
		},
	},
})

vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded" },
	virtual_text = { spacing = 2, source = "if_many" },
	underline = true,
})
