-- Install with: 
--		arch: sudo pacman -S qt6-declarative

--- @type vim.lsp.Config
return {
	cmd = { "qmlls" },
	filetypes = { "qml", "qmljs" },
	root_markers = { ".git" },
}
