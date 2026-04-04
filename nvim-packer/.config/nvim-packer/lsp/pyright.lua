-- Install:
-- arch: sudo pacman -S pyright

--- @type vim.lsp.Config
return {
	cmd = "pyright-langserver",
	filetypes = { ".py" },
	root_markers = { ".git" },
}
