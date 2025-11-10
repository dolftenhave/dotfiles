return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		dashboard = {
			sections = {
				{
					section = "terminal",
					cmd = "chafa ~/.config/nvim/images/dashboard.webp --format ansi -w 9 -s 60x23; sleep .1",
					width = 60,
					height = 23,
					padding = 1,
				},
				{
					-- Find files
					pane = 2,
					icon = " ",
					desc = "Find Files",
					padding = 1,
					key = "f",
					action = "<leader>ff",
				},
				{
					pane = 2,
					icon = "b",
					desc = "Browse current directory",
					padding = 1,
					key = "n",
					action = "<C-n>",
				},
				{
					pane = 2,
					icon = " ",
					desc = "Find Text",
					padding = 1,
					key = "g",
					action = "<leader>fg",
				},
				{
					pane = 2,
					icon = " ",
					desc = "Recent Files",
					key = "r",
					padding = 1,
					action = ":lua Snacks.dashboard.pick('oldfiles')",
				},
				{
					pane = 2,
					icon = " ",
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{
					pane = 2,
					icon = " ",
					key = "c",
					desc = "Config",
					padding = 1,
					action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
				},
				{
					pane = 2,
					icon = "󰒲 ",
					key = "L",
					desc = "Lazy",
					padding = 1,
					action = ":Lazy",
					enabled = package.loaded.lazy ~= nil,
				},
				{
					pane = 2,
					icon = " ",
					key = "q",
					desc = "Quit",
					padding = 1,
					acction = ":qa",
				},
			},
		},
	},
}
