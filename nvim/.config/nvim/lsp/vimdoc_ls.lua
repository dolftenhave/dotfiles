--- Instilation:
--- sh: cargo install vimdoc-language-server

---@type vim.lsp.Config
return {
	cmd = { "vimdoc-language-server" },
	filetype = {"help"},
	root_markers = { "doc", ".git" },
	workspace_required = false,
}
