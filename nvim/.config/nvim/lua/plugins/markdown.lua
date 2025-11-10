-- For `plugins/markview.lua` users.
return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		-- For `nvim-treesitter` users.
		priority = 49,

		-- For blink.cmp's completion
		-- source
		dependencies = {
			"saghen/blink.cmp",
		},

		vim.keymap.set("n", "<C-m>", ":Markview Toggle<CR>"),
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		vim.keymap.set("n", "<leader>m", ":MarkdownPreviewToggle<CR>"),
	},
}
