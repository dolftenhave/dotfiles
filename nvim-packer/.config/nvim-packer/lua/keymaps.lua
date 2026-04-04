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

vim.keymap.set("n", "<Leader>of", function() 
	-- TODO make it quitable by q, and non editable.
	local max_height = vim.api.nvim_win_get_height(0)
	local max_width = vim.api.nvim_win_get_width(0)

	local height = math.floor(max_height * 0.8)
	local width = math.floor(max_width * 0.8)

	local col = math.floor(max_width * 0.1)
	local row = math.floor(max_height * 0.1)

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		height = height,
		width = width, 
		col = col,
		row = row,
	})
end, {noremap = true, desc = "open floating window"})
