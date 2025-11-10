---@class ColorSync
local M = {}
M.tmux_command = "tmux "
M.components = {
	'set-option status-left "#[bg=<bg>, fg=<fg>] [#S] #[bg=${GRAY},fg=${FG}] pane: #P "',
	'set-option status-right "#[bg=${GRAY},fg=${FG}] #{pane_current_path} #[bg=<bg>, fg=<fg>] #h "',
}

---@class Mode
---@field fg string?
---@field bg string?
---@field cmds string[]?
---@field highlight_group_name string

---@class Modes
---@field mode {[string]:Mode}
M.modes = {
	fallback = { highlight_group_name = "lualine_a_normal" },
	n = { highlight_group_name = "lualine_a_normal" },
	c = { highlight_group_name = "lualine_a_command" },
	v = { highlight_group_name = "lualine_a_visual" },
	i = { highlight_group_name = "lualine_a_insert" },
	r = { highlight_group_name = "lualine_a_replace" },
}

M.to_hex = function(n)
	local b = n % 256
	local g = ((n - b) / 256) % 256
	local r = ((n - b) / 256 ^ 2) - g / 256
	return string.format("#%02X%02X%02X", r, g, b)
end

---@param mode Mode
M.source_hex = function(mode)
	local cl_map = vim.api.nvim_get_hl(0, { name = mode.highlight_group_name })
	mode.fg = M.to_hex(cl_map["fg"])
	mode.bg = M.to_hex(cl_map["bg"])
end

M.compile_commands = function()
	for _, mode in pairs(M.modes) do
		M.source_hex(mode)
		mode.cmds = {}
		for _, component in ipairs(M.components) do
			local c = M.tmux_command .. string.gsub(component, "<fg>", mode.fg)
			c = string.gsub(c, "<bg>", mode.bg)
			table.insert(mode.cmds, c)
		end
	end
end

M.set_mode = function(mode)
	for _, c in ipairs(M.modes[mode].cmds) do
		--	print(c)
		vim.fn.jobstart(c)
	end
end

M.setup = function(enabled)
	if not enabled then
		return
	end

	M.compile_commands()
	vim.api.nvim_create_autocmd({ "ModeChanged", "WinEnter", "FocusGained", "BufEnter" }, {
		pattern = "*:*",
		callback = function()
			local mode = vim.fn.mode()
			mode = string.lower(mode)
			local success = pcall(function()
				M.set_mode(mode)
			end)
			if not success then
				--fallback mode.
				M.set_mode("fallback")
			end
		end,
	})
end

return M
