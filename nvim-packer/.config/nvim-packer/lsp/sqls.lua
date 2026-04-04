-- Install:
-- arch: sudo npm i -g sql-language-server

--- @type vim.lsp.Config
return {
	cmd = {"sqls"},
	filetypes = { "sql", "mysql", "plsql" },
	root_markers = { ".git" },
	settings = {
		sqls = {
			connections = {
		
			}
		},
	},
}
