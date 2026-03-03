--- @param name string
--- @return string
local gh = function(name) return string.format("https://github.com/%s", name) end

vim.pack.add({
	{ src = gh("sellisonleao/gruvbox.nvim") },
	{ 
		src = gh("nvim-treesitter/nvim-treesitter") ,
		-- master is depricated.
		version = "main",
	},
	{ src = gh("nvim-treesitter/nvim-treesitter-context") } ,

	-- Telescope and dependencies
	{src = gh("nvim-lua/plenary.nvim")},
	{src = gh("nvim-telescope/telescope-fzf-native.nvim")},
	{src = gh("nvim-telescope/telescope-ui-select.nvim")},
	{src = gh("nvim-telescope/telescope.nvim")},
})

-- ===================
-- Tree Sitter
-- ===================
ts = require("nvim-treesitter")

ts.install({
	"bash",
	"c",
	"cpp",
	"css",
	"csv",
	"go",
	"html",
	"java",
	"json",
	"latex",
	"lua",
	"makefile",
	"markdown",
	"markdown_inline",
	"nix",
	"python",
	"qmljs",
	"rust",
	"sql",
	"vim",
	"vimdoc",
	"yaml",
})

-- TODO I think this works? Check that :TSUpdate is being called when nvim launches.
ts.update()

require("treesitter-context").setup({
	enable = true,
	multiwindow = false,
	max_lines = 0,
	min_window_height = 0,
	line_numbers = true,
	multiline_threshold = 20,
	trim_scope = "outer",
	mode = "cursor",
	separator = nil,
	zindex = 20,
	on_attach = nil,
})


-- ===================
-- Telescope
-- ===================

-- Build telescope-fzf-native.nvim
plugins = vim.pack.get({"telescope-fzf-native.nvim"})
for _, plugin in ipairs(plugins) do
	vim.system({"make"}, {cwd = plugin.path})
end

telescope = require("telescope")

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
