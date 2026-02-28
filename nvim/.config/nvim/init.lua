vim.g.project_dir = vim.env.HOME .. "/code"

-- Setup
require ("options")
require ("keymaps")
require ("autocmds")
require ("statusline")
-- require ("lsp")

-- Enables the gruvbox theme
vim.o.termguicolors = true
vim.o.background = "dark"
-- vim.cmd.colorscheme("gruvbox")
