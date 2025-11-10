return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 1,
			options = {
				relativenumber = false,
			},
		},

		plugins = {
			options = {
				showcmd = true,
				laststatus = 3,
			},
		},
	},

	vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode." }),
}
