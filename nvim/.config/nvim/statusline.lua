local icons = require("icons")


local M = {}

vim.o.showmode = false

---@type table<string, boolean>
local statusline_hls = {}

---@param hl string
---@return string
function M.get_or_create(hl)
	local hl_name = "Statusline" .. hl

	if not statusline_hl[hl] then
		local bg_hl = vim.api.nvim_get_hl(0, {name = "StatusLine" })
		local fg_hl = vim.api.nvim_get_hl(0, {name = hl })

local cached_branch = ""
local last_check = 0
--- Returns the git branch name, if any
--- @return string
function M.git_branch()
	local now = vim.loop.now()
	if now - last_check > 5000 then
		cached_branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
		last_check = now
	end
	if cached_branch ~= "" then
		return " \u{e752} " .. cached_branch .. " " 
	end
	return ""
end

--- Returnts the an icon based on the filetype
--- @return string
function M.file_type()
	local ft = vim.bo.filetype

	if ft = "" then
		return ""
	end

	return ((icons.filetype[ft] or "  ") .. ft)
end

--- The current mode
--- @return string
function M.mode()
	local mode_to_str = {
		['n'] = 'NORMAL',
		['no'] = 'OP-PENDING',
		['nov'] = 'OP-PENDING',
		['noV'] = 'OP-PENDING',
		['no\22'] = 'OP-PENDING',
		['niI'] = 'NORMAL',
		['niR'] = 'NORMAL',
		['niV'] = 'NORMAL',
		['nt'] = 'NORMAL',
		['ntT'] = 'NORMAL',
		['v'] = 'VISUAL',
		['vs'] = 'VISUAL',
		['V'] = 'VISUAL',
		['Vs'] = 'VISUAL',
		['\22'] = 'VISUAL',
		['\22s'] = 'VISUAL',
		['s'] = 'SELECT',
		['S'] = 'SELECT',
		['\19'] = 'SELECT',
		['i'] = 'INSERT',
		['ic'] = 'INSERT',
		['ix'] = 'INSERT',
		['R'] = 'REPLACE',
		['Rc'] = 'REPLACE',
		['Rx'] = 'REPLACE',
		['Rv'] = 'VIRT REPLACE',
		['Rvc'] = 'VIRT REPLACE',
		['Rvx'] = 'VIRT REPLACE',
		['c'] = 'COMMAND',
		['cv'] = 'VIM EX',
		['ce'] = 'EX',
		['r'] = 'PROMPT',
		['rm'] = 'MORE',
		['r?'] = 'CONFIRM',
		['!'] = 'SHELL',
		['t'] = 'TERMINAL',
	}

	local mode = mode_to_str[vim.api.nvim_get_mode().mode] or "UNKNOWN"

	-- Create the components.
end

vim.o.statusline = "%!v:lua.require('statusline').render()"

return M
