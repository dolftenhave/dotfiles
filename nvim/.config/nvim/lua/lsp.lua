vim.lsp.enable({
	"lua_ls",
	"jsonls",
	"gopls",
	"yamlls",
	"bashls",
	"clangd",
})

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})
