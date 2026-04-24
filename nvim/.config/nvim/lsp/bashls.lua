-- Install with:
-- npm: npm i -g bash-language-server

-- Dependencies:
-- chellcheck: 
--		arch: sudo pacman -S shellcheck

--- @type vim.lsp.Config
return {
	cmd = { "bash-language-server", "start" },
	filetypes = {"bash", "sh", "zsh" },
}
