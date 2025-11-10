return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			local mason = require("mason")

			vim.keymap.set("n", "<leader>tm", ":Mason<CR>", { desc = "Opens Mason." })

			mason.setup()
		end,
	},
}
