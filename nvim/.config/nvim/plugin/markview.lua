vim.pack.add({
	{ src = "https://github.com/OXY2DEV/markview.nvim" },
})

vim.keymap.set("n", "<C-m>", ":Markview Toggle<CR>")
