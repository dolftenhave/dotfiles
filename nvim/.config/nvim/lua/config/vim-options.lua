-- line numbers./init
vim.wo.number = true
vim.wo.relativenumber = true

-- Sets the tab width too 4 spaces
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dart",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

vim.g.mapleader = " "

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.opt.clipboard = "unnamedplus" --makes nvim use the system clipboard

vim.keymap.set("n", "<leader>s", ":so ~/.config/nvim/init.lua<CR>", { desc = "Source init.lua" })

vim.opt.cursorline = true

vim.keymap.set("n", "<leader>x", ":so %<CR>", { desc = "Runs the current lua file" })
vim.keymap.set("n", "<leader>X", ":.lua<CR>", { desc = "Runs the current line of lua" })

-- Sets the focus gained and focus lost events
vim.cmd("execute 'set <FocusGained>=\\e[I'")
vim.cmd("execute 'set <FocusLost>=\\e[O'")

--vim.o.winborder = "rounded"

-- Return to the last position in the buffer.
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

vim.opt.undofile = true

vim.keymap.set("n", "<leader>h", ":noh<CR>", { desc = "Turn off highlights" })

-- Copies the path and the line of the current file to the clipboard.
vim.keymap.set("n", "<Leader>xc", ":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>", {silent = true, desc = "Coppies the current path of the file and the line number to the clipboard."})
vim.keymap.set("n", "<Leader>xf", ":call setreg('+', expand('%:.')<CR>", {silent = true, desc = "Coppies the path of the current file to the clipboard"})
-- Goes to the current location in the clipboard.
vim.keymap.set("n", "<Leader>xo", ":e <C-r>+<CR>", { noremap = true, desc = "Go to location in clipboard" })

--vim.keymap.set("n", "<C-w>v", "<leader>wv", { desc = "Split windows vertecally." })
--vim.keymap.set("n", "<C-w>s", "<leader>wb", { desc = "Split windiws horizontally." })
--vim.keymap.set("n", "<C-w>h", "<leader>wh", { desc = "Move to the left window." })
--vim.keymap.set("n", "<C-w>j", "<leader>wj", { desc = "Move to the lower window." })
--vim.keymap.set("n", "<C-w>k", "<leader>wk", { desc = "Move to the upper window." })
--vim.keymap.set("n", "<C-w>l", "<leader>wl", { desc = "Move to the right window." })
--vim.keymap.set("n", "<C-w>x", "<leader>wx", { desc = "Swap windows." })

-- vim.opt.list = true
-- vim.opt.listchars:append({ eol = "↴" })
