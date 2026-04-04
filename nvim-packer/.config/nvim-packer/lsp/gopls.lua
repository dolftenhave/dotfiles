-- Install with:
-- go: go install golang.org/x/tools/gopls@latest

--- @type vim.lsp.Config
return {
	cmd = {"gopls"},
	root_marker = { "go.mod" },
	filetypes = { "go", "gomod", "gowork", "gotmp1" },
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
			compositeLiteralTypes = true,
			constatValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true,
			},
		},
	},
}
