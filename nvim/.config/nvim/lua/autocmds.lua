-- Return to the last position in the buffer.
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

-- split the help docs horizontal instead of vertical
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.cmd("wincmd L")
	end,
})
