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

	-- Blink
	{src = gh("rafamadriz/friendly-snippets")},
	{src = gh("saghen/blink.cmp"),
		version = vim.version.range("1.*"),
},
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
	"make",
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

-- ===================
-- Blink.cmp
-- ===================

require("blink.cmp").setup({
	enabled = function()
			return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
		end,
		keymap = {
			preset = "default",
			["<C-u>"] = { "scroll_signature_up", "fallback" },
			["<C-d>"] = { "scroll_signature_down", "fallback" },
			--["<Tab>"] = { "accept" },
		},

		signature = {
			enabled = true,
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			-- ensures that the text at the start of the word is taken into account when writing completion.
			keyword = { range = "full" },

			-- The auto show menu.
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{
							"kind_icon",
							"label",
							"label_description",
							gap = 1,
						},
						{
							"kind",
							gap = 1,
						},
						-- this shows the source of the suggestion. e.g. lsp or snippets this the end
						{
							"source_name",
						},
					},
					components = {
						label = {
							ellipsis = true,
						},
					},

					treesitter = { "lsp" },
				},
				--auto_show = function()
				--	return not in_treesitter_capture("comment")
				--end,
			},

			documentation = {
				window = {border = "rounded"},
				auto_show = true,
				treesitter_highlighting = true,
			},
		},

		sources = {
			default = { "lsp", "path", "buffer", "snippets" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
})
