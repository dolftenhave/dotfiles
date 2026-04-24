-- Install with:
--		arch: sudo pacman -S markdown-oxide

--- @type vim.lsp.Config
return {
	cmd = { "markdown-oxide" },
	filetypes = { "markdown" },
	root_markers = { ".git", ".obsidian", ".moxide.toml" },
}
