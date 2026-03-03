-- Install with:
-- arch: sudo pacman -S clang

--- @type vim.lsp.Config
return {
	cmd = {
		"clangd",
		"--background-index",
		"--query-drivers=**arm-none-eabi-g*",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"fallback-stryle=none",
		"--function-arg-placeholder=false",
	},
	filetypes = { "c", "cpp" },
	root_markers = { ".clangd" },
}
