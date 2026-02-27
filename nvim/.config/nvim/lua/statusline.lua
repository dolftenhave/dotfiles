local icons = require("icons")


local M = {}

vim.o.showmode = false

local branch = ""
local tracked = ""
local last_check = 0

--- Returns the git branch and if the file is being tracked.
--- @return string
function M.git_component()
	local now = vim.loop.now()

	if now - last_check > 5000 then
		branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
		tracked = vim.fn.system(string.format("git ls-files --error-unmatch %s 2>/dev/null", vim.fn.expand("%:t"))) 
		last_check = now
	end

	if branch ~= "" then
		if tracked ~= "" then
			tracked = "tracked"
		end
		return icons.misc.git .. branch .. " " .. tracked 
	end
	return ""
end

--- Returnts the an icon based on the filetype
--- @return string
function M.filetype_component()
	local ft = vim.bo.filetype

	if ft == "" then
		return ""
	end

	return ((icons.filetype[ft] or "  ") .. ft)
end

--- The current mode
--- @return string
function M.mode_component()
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

	return string.format("[%s]", mode)

	-- Create the components.
end

--- Returns the position of the cursor in the current buffer.
--- @return string
function M.position_component()
	local line = vim.fn.line "."
	local line_count = vim.api.nvim_buf_line_count(0)
	local col = vim.fn.virtcol "."

	return table.concat {
		string.format("%d", line),
		string.format("/%d c: %d", line_count, col),
	}
end

--- Renders the statusline based on the current buffer.
---@return string
function M.render()
	---@param components string[]
	---@return string
	local function concat_components(components)
		return vim.iter(components):skip(1):fold(components[1], function(acc, component)
			return #component > 0 and string.format("%s    %s", acc, component) or acc
		end)
	end

	return table.concat {
		concat_components {
			M.mode_component(),
			M.git_component(),
		},
		--concat_components {
		--	vim.diagnostic.status(),
	--		M.file_type(),
	--		M.position(),
	--	},
		" ",
	}
end

vim.o.statusline = "%!v:lua.require('statusline').render()"

return M
