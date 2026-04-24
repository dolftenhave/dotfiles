-- Line Numbers
vim.opt.number = true         -- Line numbers on the left
vim.opt.relativenumber = true -- Relative line numbers on the left
vim.opt.cursorline = true     -- Highlights the current line

-- Sets the tab size to be 4 spaces wide
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true -- Automatically indents based on the surrounding context.
vim.opt.autoindent = true  -- Copy indent from the current line.

-- Sets the leader key to space
vim.g.mapleader = " "

-- Tells vim to use the system clipboard for copy pasting.
vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true -- Creates an undofile so that undo's persist between sessions.
vim.opt.backup = false -- do not create a backup file.
vim.opt.writebackup = false -- do not write to a backup file.
vim.opt.swapfile = false -- do not create a swapfile.
vim.opt.autoread = true -- auto-reload changes if outside nvim

