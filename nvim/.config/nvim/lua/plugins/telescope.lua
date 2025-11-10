return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
			},
		},

		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "telescope find files" })
			vim.keymap.set("n", "<leader>fh", function()
				builtin.find_files({ hidden = true })
			end, { desc = "telescope find files inc. hidden" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "telescope live grep" })

			require("telescope").setup({
				defaults = {
					preview = {
						-- fixes an issue thrown when searching
						treesitter = false,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("ui-select")
		end,
	},
}
