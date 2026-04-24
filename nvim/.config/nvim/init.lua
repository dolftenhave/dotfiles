-- version check to stop vim from breaking.
if vim.version().minor < 12 then
	vim.notify("This config requires nvim 0.12 to work. If you want to run it anyway, then remove the version check in init.lua in your config files.")
	return
end

vim.g.project_dir = vim.env.HOME .. "/code"

-- Setup
require ("options")
require ("keymaps")
require ("autocmds")
require ("lsp")
require ("statusline")

-- Enables the gruvbox theme
vim.o.termguicolors = true
vim.o.background = "dark"
