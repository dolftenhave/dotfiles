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
})

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})
