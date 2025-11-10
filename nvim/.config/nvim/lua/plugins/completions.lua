return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"nvim-treesitter/nvim-treesitter",
		"fang2hou/blink-copilot",
	},
	opts = {
		-- dissables completion with markdown files.
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
			default = { "lsp", "path", "snippets", "buffer" },

			per_filetype = {
				dart = { inherit_defaults = true, "copilot" },
			},

			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
