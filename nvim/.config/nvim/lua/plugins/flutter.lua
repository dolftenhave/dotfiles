return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			lsp = {
				settings = {
					showTodos = true,
					updateImportsOnRename = true,
					color = {
						enabled = true,
						background = true,
					},
				},
			},
		})
	end,

	vim.keymap.set("n", "<leader>fs", "<cmd>FlutterRun<cr>", { desc = "FlutterRun" }),
	vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRestart<cr>", { desc = "FlutterRestart" }),
	vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", { desc = "FlutterRunEmulators" }),
	vim.keymap.set("n", "<leader>ft", "<cmd>FlutterLogToggle<cr>", { desc = "Toggles the flutter log." }),
}
