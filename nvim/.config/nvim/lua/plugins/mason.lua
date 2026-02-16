return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					backage_uninstalled = "✗",
				},
			},
		},
		config = function()
			local mason = require("mason")

			vim.keymap.set("n", "<leader>tm", ":Mason<CR>", { desc = "Opens Mason." })

			mason.setup()
		end,
	},
}
