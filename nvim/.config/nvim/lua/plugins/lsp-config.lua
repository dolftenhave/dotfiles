return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			"neovim/nvim-lspconfig",
		},

		config = function()
			local mlspc = require("mason-lspconfig")

			mlspc.setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"markdown_oxide",
					"jdtls",
					"air",
					"gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("air")
			vim.lsp.enable("gopls")
			vim.lsp.enable("harper_ls", {
				filetypes = { "markdown" },
				settings = { ["harper_ls"] = { dialect = "Australian" } },
				on_attach = function(client, bufnr)
					if vim.bo[bufnr].filetype ~= "markdown" then
						client.stop()
						return
					end
					-- attach logic
				end,
			})
			vim.lsp.enable("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = {
								vim.api.nvim_get_runtime_file("", true),
								"${3rd}/luv/library",
							},
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			})

			vim.lsp.enable("clangd", {
				settings = {
					cpp = {
						workspace = { library = { vim.fs.abspath("~/code/uni/349/microbit-v2-samples/libraries") } },
					},
				},
			})

			vim.lsp.enable("markdown_oxide")
			vim.lsp.enable("jdtls")

			--Custom binds
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "lsp Hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Get definition." })
			vim.keymap.set("n", "gc", vim.lsp.buf.declaration, { desc = "Get declaration." })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>do",
				'<cmd>lua vim.diagnostic.open_float({focusable = false, border = "single", scope = "line"})<CR>',
				{ noremap = true, silent = true }
			)
			vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Go to the next diagnostic" })
			vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, { desc = "Go to the next diagnostic" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "lsp buffer code action" })
			--vim.api.nvim_set_keymap("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {silent = false})
			-- shows the diagnostic messages
			vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
		end,
	},
}
