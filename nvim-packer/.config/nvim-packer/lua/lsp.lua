vim.lsp.enable({
	"lua_ls",
	"jsonls",
	"gopls",
	"yamlls",
	"bashls",
	"clangd",
	"rust-analyzer",
	"markdown_oxide",
	"pyright",
	"sqls",
	"qmlls",
})

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})
