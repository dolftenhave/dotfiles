-- Copies the path and the line of the current file to the clipboard.
vim.keymap.set("n", "<Leader>xc", ":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>",
	{ silent = true, desc = "Coppies the current path of the file and the line number to the clipboard." })
vim.keymap.set("n", "<Leader>xf", ":call setreg('+', expand('%:.')<CR>",
	{ silent = true, desc = "Coppies the path of the current file to the clipboard" })
-- Goes to the current location in the clipboard.
vim.keymap.set("n", "<Leader>xo", ":e <C-r>+<CR>", { noremap = true, desc = "Go to location in clipboard" })

vim.keymap.set("n", "<C-n>", ":Ex<CR>", { noremap = true, desc = "Open NetRW" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
		vim.keymap.set("n", "<leader>gf", function() vim.lsp.buf.format({ async = true }) end,
			{ buffer = bufnr, desc = "Format Buffer" })
	end,
})
