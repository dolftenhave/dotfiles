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
--	"vimdoc_ls",
})

vim.diagnostic.config({
	severity_sort = true,
	virtual_lines = false,
	underline = true,
	virtual_text = {
		spacing = 2,
		source = "if_many",
		prefix = "●",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
		[vim.diagnostic.severity.HINT] = "H",
		},
	},
})
