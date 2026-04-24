local icons = require("icons")

local M = {}

vim.o.showmode = false

local git_branch = ""
local git_status = ""
local is_repo = false

--- Returns the git branch and if the file is being tracked.
--- @return string
function M.git_component()
	git_branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")

	if git_branch ~= "" then
		is_repo = true
	end

	-- Adds the git diff to the status line
	if is_repo then
		local stats = {}
		local raw_status = vim.fn.system(string.format("git diff --numstat %s", vim.fn.expand("%:t")))

		for stat in string.gmatch(raw_status, "%d") do
			table.insert(stats, stat)
		end

		if stats[1] ~= nil then
			git_status = string.format("%%#DiagnosticOk#+%s", stats[1])
		end
		if stats[1] ~= nil then
			git_status = string.format("%s %%#DiagnosticError#-%s%%#StatusLine#", git_status, stats[2])
		end
	end

	return table.concat {
		icons.misc.git,
		git_branch,
		" ",
		git_status,
	}
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
---@return string
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

	local hl = "Other"

	if mode:find "NORMAL" then
		hl = "Normal"
	elseif mode:find 'PENDING' then
		hl = 'Pending'
	elseif mode:find 'VISUAL' then
		hl = 'Visual'
	elseif mode:find 'INSERT' or mode:find 'SELECT' then
		hl = 'Insert'
	elseif mode:find 'COMMAND' or mode:find 'TERMINAL' or mode:find 'EX' then
		hl = 'Command'
	end

	return string.format("[%%#StatuslineMode%s#%s]", hl, mode)
end

-- Return the number of hints, warnings and errors in the current buffer.
--- @return string
function M.diagnostic_component()
	if vim.diagnostic == nil then
		return ""
	end
	local hlg = { "DiagnosticError", "DiagnosticWarn", "DiagnosticHint", "DiagnosticInfo" }
	local icon = { icons.diagnostics.ERROR, icons.diagnostics.WARN, icons.diagnostics.HINT, icons.diagnostics.INFO }
	local diagnostics = vim.diagnostic.count(0)
	local component = ""

	for severity, count in pairs(diagnostics) do
		component = string.format(" %s %%#%s#%s%d", component, hlg[severity], icon[severity], count)
	end

	return component
end

--- Returns the position of the cursor in the current buffer.
--- @return string
function M.position_component()
	return "%l/%L"
end

--- Renders the statusline based on the current buffer.
---@return string
function M.render()
	---@param components string[]
	---@return string
	local function concat_components(components)
		return vim.iter(components):skip(1):fold(components[1], function(acc, component)
			return #component > 0 and string.format("%s %s", acc, component) or acc
		end)
	end

	return table.concat {
		concat_components {
			M.mode_component(),
		},
		"%t",
		concat_components {
			M.diagnostic_component()
		},
		" %=",
		concat_components {
			M.git_component(),
			M.filetype_component(),
		},
		"%l/%L",
	}
end

function M.inactive()
	return " %t"
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = group,
	desc = "Active statusline on focus",
	callback = function()
		vim.opt_local.statusline = "%!v:lua.require('statusline').render()"
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = group,
	desc = "Inactive statusline when unfocused.",
	callback = function()
		vim.opt_local.statusline = "%!v:lua.require('statusline').inactive"
	end,
})

return M
