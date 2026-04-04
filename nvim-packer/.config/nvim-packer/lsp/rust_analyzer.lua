-- install with:
--		rustup: rustup component add rust-analyzer

--- @type vim.lsp.Config
return {
	cmd = { "rust-analyzer" },
	filetype = {"rust"},
	root_markers = { "Cargo.toml", "rust-project.json" },
	settins = {
		["rust-analyzer"] = {
			inlayHints = {
				chainingHints = { enable = false },
			},
		},
	},
}
