-- Install:
-- npm: npm i -g vscode-langservers-extracted

--- @type vim.lsp.Config
return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetype = { "json", "jsonc" },
	settings = {
		json = {
			validate = { enabled = true },
		},
	},
}
