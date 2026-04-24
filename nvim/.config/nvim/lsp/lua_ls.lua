-- Install
-- Arch: sudo pacman -S lua-language-server

---	@type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { { ".luarc.json", ".luarc.jsonc", }, ".git" },

	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspaces = {
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
				},
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		}
	}
}
