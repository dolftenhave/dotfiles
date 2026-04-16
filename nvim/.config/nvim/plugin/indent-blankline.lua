vim.pack.add({
	{
		src = "https://github.com/lukas-reineke/indent-blankline.nvim"
	}
})

-- Hooks
local hooks = require("ibl.hooks")
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

-- Setup
require("ibl").setup({
	indent = {
		char = "▎",
		--tab_char = "▎",
		tab_char = "▎",
	},
	whitespace = {
		remove_blankline_trail = false,
	},
	scope = {
		enabled = true,
		char = "╎",
		--show_exact_scope = true,
		--include = {
		--	node_type = {
		--		{
		--			["*"] = { "*" },
		--		},
		--	},
		--},
	}
})
