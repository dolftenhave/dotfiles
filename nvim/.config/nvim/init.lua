vim.g.project_dir = vim.env.HOME .. "/code"

-- Setup
require ("settings")
require ("keymaps")
require ("autocmds")
require ("statusline")
require ("winbar")
require ("lsp")

-- Enables the gruvbox theme
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")
