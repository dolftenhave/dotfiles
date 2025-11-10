-- Provides vertical linec to show what block of code you are currently in.
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local ibl = require("ibl")
		vim.opt.listchars:append("eol:t")

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			--vim.api.nvim_set_hl(0, "IblScope", { fg = "normal" })
			--vim.api.nvim_set_hl(0, "IblIndent", { link = "normal" })
		end)
		ibl.setup({
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
			},
		})
	end,
}
