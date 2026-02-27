vim.keymap.set("n", "<leader>s", ":so ~/.config/nvim/init.lua<CR>", { desc = "Source init.lua" }) -- neovim config.
vim.keymap.set("n", "<leader>x", ":so %<CR>", { desc = "Runs the current lua file" }) -- Run the current line of lua code in the file.
vim.keymap.set("n", "<leader>X", ":.lua<CR>", { desc = "Runs the current line of lua" }) -- Run the current lua file


vim.keymap.set("n", "<leader>h", ":noh<CR>", { desc = "Turn off highlights" })

-- Copies the path and the line of the current file to the clipboard.
vim.keymap.set("n", "<Leader>xc", ":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>",
	{ silent = true, desc = "Coppies the current path of the file and the line number to the clipboard." })
vim.keymap.set("n", "<Leader>xf", ":call setreg('+', expand('%:.')<CR>",
	{ silent = true, desc = "Coppies the path of the current file to the clipboard" })
-- Goes to the current location in the clipboard.
vim.keymap.set("n", "<Leader>xo", ":e <C-r>+<CR>", { noremap = true, desc = "Go to location in clipboard" })
