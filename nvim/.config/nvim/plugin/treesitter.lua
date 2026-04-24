-- Ensures that TSUpdate is called every time that treesitter is updated.
vim.api.nvim_create_autocmd("PackChanged", { callback = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == "nvim-treesitter" and kind == "update" then
		if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
		vim.cmd("TSUpdate")
	end
end })

vim.pack.add({
	{ 
		src = "https://github.com/nvim-treesitter/nvim-treesitter" ,
		-- master is depricated.
		version = "main",
	},
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" } ,
})

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
