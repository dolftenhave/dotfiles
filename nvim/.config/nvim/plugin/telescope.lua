vim.pack.add({
	{src = "https://github.com/nvim-lua/plenary.nvim"},
	{src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"},
	{src = "https://github.com/nvim-telescope/telescope-ui-select.nvim"},
	{src = "https://github.com/nvim-telescope/telescope.nvim"},
})
-- ===================
-- Telescope
-- ===================

-- Build telescope-fzf-native.nvim
local plugins = vim.pack.get({"telescope-fzf-native.nvim"})
for _, plugin in ipairs(plugins) do
	vim.system({"make"}, {cwd = plugin.path})
end

local telescope = require("telescope")

telescope.setup({
	defaults = { preview = { treesitter = false, }, },
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown({}), },
	},
})
telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "telescope find files" })
vim.keymap.set("n", "<leader>fh", function()
				builtin.find_files({ hidden = true }, { desc = "telescope find filec inc hidden files"})
			end, { desc = "telescope find files inc. hidden" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "telescope live grep" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "telescope recent files" })
