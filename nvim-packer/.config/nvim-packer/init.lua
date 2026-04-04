vim.g.project_dir = vim.env.HOME .. "/code"

-- Setup
require ("options")
require ("keymaps")
require ("autocmds")
require ("plugins")
require ("lsp")
require ("statusline")

-- Enables the gruvbox theme
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")
