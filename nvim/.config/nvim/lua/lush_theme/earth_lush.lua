--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

--black
local black = hsl(23, 33, 8)
local black_bright = hsl(28, 16, 51)
--red
local red = hsl(11, 53, 35)
local red_bright = hsl(11, 53, 55)
--green
local green = hsl(74, 39, 30)
local green_bright = hsl(74, 39, 55)
--yellow
local yellow = hsl(38, 71, 35)
local yellow_bright = hsl(38, 71, 55)
--blue
local blue = hsl(201, 17, 35)
local blue_bright = hsl(201, 17, 55)
--magenta
local magenta = hsl(10, 34, 36)
local magenta_bright = hsl(10, 34, 55)
--teal
local cyan = hsl(168, 27, 33)
local cyan_bright = hsl(168, 27, 55)
--white
local white = hsl(26, 20, 35)
local white_bright = hsl(34, 35, 86)

local bg0_h = hsl(23, 33, 8) -- color0
local bg0 = hsl(23, 29, 10)
local bg1 = hsl(23, 24, 13)
local bg2 = hsl(23, 22, 19)
local bg3 = hsl(22, 22, 24)
local bg4 = hsl(26, 20, 35) -- color7

local background = bg0_h


local fg0 = hsl(28, 16, 51) -- color8
local fg1 = hsl(30, 21, 63)
local fg2 = hsl(32, 22, 69)
local fg3 = hsl(32, 25, 75)
local fg4 = hsl(32, 28, 80)
local fg5 = hsl(34, 35, 86) -- color 15

local foreground = fg5

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		Conceal { fg = bg4 },                              -- Placeholder characters substituted for concealed text (see 'conceallevel')
		--
		Normal { fg = foreground, bg = background },       -- Normal text
		Comment { fg = black_bright },                     -- Any comment
		Cursor { bg = fg0 },                               -- Character under the cursor
		Error { fg = red_bright },                         -- Any erroneous construct

		CurSearch { bg = yellow_bright, fg = Normal.bg },  -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor { Cursor },                                -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM { Cursor },                               -- Like Cursor, but used when in IME mode |CursorIM|
		CursorLine { bg = bg3 },                           -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorColumn { CursorLine },                       -- Screen-column at the cursor, when 'cursorcolumn' is set.

		Directory { fg = cyan_bright },                    -- Directory names (and other special names in listings)
		DiffAdd { bg = green, fg = green_bright },         -- Diff mode: Added line |diff.txt|
		DiffChange { bg = white },                         -- Diff mode: Changed line |diff.txt|
		DiffDelete { bg = red },                           -- Diff mode: Deleted line |diff.txt|
		DiffText { bg = cyan },                            -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer { fg = black_bright },                 -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor { Cursor },                             -- Cursor in a focused terminal
		TermCursorNC { bg = Cursor.bg.darken(30) },        -- Cursor in an unfocused terminal
		ErrorMsg { Error },                                -- Error messages on the command line
		VertSplit { fg = Comment.fg.lighten(20) },         -- Column separating vertically split windows
		Folded { fg = Comment.fg.lighten(20) },            -- Line used for closed folds
		FoldColumn { fg = Comment.fg.darken(20) },         -- 'foldcolumn'
		SignColumn { FoldColumn },                         -- Column where |signs| are displayed
		IncSearch { CurSearch },                           -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute { fg = yellow_bright },                 -- |:substitute| replacement text highlighting
		LineNr         { fg = Comment.fg, bg = Normal.bg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove { fg = Comment.fg },                   -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow { fg = Comment.fg },                   -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr { fg = yellow_bright, bg = CursorLine.bg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold { fg = Normal.fg },                 -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign { fg = Normal.fg },                 -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen { fg = Normal.fg, bg = CursorLine.bg }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg { Normal },                                -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea { Normal },                                -- Area for messages and cmdline
		MsgSeparator { Normal },                           -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg { fg = cyan_bright },                      -- |more-prompt|
		NonText { fg = black_bright },                     -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		NormalFloat { Normal },                            -- Normal text in floating windows.
		FloatBorder { Normal },                            -- Border of floating windows.
		FloatTitle { gui = "bold", fg = Normal.fg },       -- Title of floating windows.
		NormalNC { fg = Normal.fg.darken(20) },            -- normal text in non-current windows
		Pmenu { Normal },                                  -- Popup menu: Normal item.
		PmenuSel { bg = CursorLine.bg },                   -- Popup menu: Selected item.
		PmenuKind {},                                      -- Popup menu: Normal item "kind"
		PmenuKindSel { bg = PmenuSel.bg },                 -- Popup menu: Selected item "kind"
		PmenuExtra { fg = red_bright },                    -- Popup menu: Normal item "extra text"
		PmenuExtraSel { bg = PmenuSel.bg },                -- Popup menu: Selected item "extra text"
		PmenuSbar { bg = bg4 },                            -- Popup menu: Scrollbar.
		PmenuThumb { fg = Normal.bg, bg = Normal.fg },     -- Popup menu: Thumb of the scrollbar.
		Question { fg = cyan_bright },                     -- |hit-enter| prompt and yes/no questions
		QuickFixLine { Question },                         -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search { fg = Normal.bg, bg = yellow },            -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine { bg = bg1 },                 -- Status line of current window
		StatusLineNC { bg = StatusLine.bg.darken(5) }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine { bg = bg3 },                    -- Tab pages line, not active tab page label
		TabLineFill { bg = bg2 },                -- Tab pages line, where there are no labels
		TabLineSel { bg = bg4, gui = "bold" },   -- Tab pages line, active tab page label
		Title { gui = "bold" },                  -- Titles for output from ":set all", ":autocmd" etc.
		Visual { bg = bg2 },                     -- Visual mode selection
		VisualNOS { bg = Visual.bg.darken(10) }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { Error },                    -- Warning messages
		Whitespace { Normal },                   -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator { Normal },                 -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu { fg = yellow_bright },         -- Current match in 'wildmenu' completion
		WinBar { bg = bg3 },                     -- Window bar of current window
		WinBarNC { bg = bg2 },                   -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.


		Constant { fg = green_bright }, -- (*) Any constant
		String { fg = green_bright }, --   A string constant: "this is a string"
		Character { String },         --   A character constant: 'c', '\n'
		Number { fg = yellow_bright }, --   A number constant: 234, 0xff
		Boolean { fg = magenta_bright }, --   A boolean constant: TRUE, false
		Float { Number },             --   A floating point constant: 2.3e10

		Identifier { fg = blue_bright }, -- (*) Any variable name
		Function { fg = red_bright }, --   Function name (also: methods for classes)

		Statement { fg = red_bright }, -- (*) Any statement
		Conditional { Statement },    --   if, then, else, endif, switch, etc.
		Repeat { Statement },         --   for, do, while, etc.
		Label { Statement },          --   case, default, etc.
		Operator { Statement },       --   "sizeof", "+", "*", etc.
		Keyword { fg = red_bright },  --   any other keyword
		Exception { Statement },      --   try, catch, throw

		PreProc { Normal },           -- (*) Generic Preprocessor
		Include { fg = magenta_bright }, --   Preprocessor #include
		Define { fg = green_bright }, --   Preprocessor #define
		Macro { Define },             --   Same as Define
		PreCondit { Include },        --   Preprocessor #if, #else, #endif, etc.

		Type { fg = blue_bright },    -- (*) int, long, char, etc.
		StorageClass {},              --   static, register, volatile, etc.
		Structure { fg = red_bright }, --   struct, union, enum, etc.
		Typedef { Type },             --   A typedef

		Special { fg = Normal.fg },   -- (*) Any special symbol
		SpecialChar { fg = yellow_bright }, --   Special character in a constant
		Tag { Special },              --   You can use CTRL-] on this
		Delimiter { Special },        --   Character that needs attention
		SpecialComment { Comment },   --   Special things inside a comment (e.g. '\n')
		Debug { Special },            --   Debugging statements

		Underlined { gui = "underline" }, -- Text that stands out, HTML links
		Ignore { Comment },           -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Todo { fg = yellow_bright },  -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError { Error },       -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn { fg = yellow_bright }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo { fg = blue_bright }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = cyan_bright }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk { fg = green_bright }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError { fg = DiagnosticError.fg, gui = "underline" }, -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn { fg = DiagnosticWarn.fg, gui = "underline" }, -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo { fg = DiagnosticInfo.fg, gui = "underline" }, -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint { fg = DiagnosticHint.fg, gui = "underline" }, -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk { fg = DiagnosticOk.fg, gui = "underline" }, -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		sym "@text.literal" { Comment },       -- Comment
		sym "@text.reference" { Identifier },  -- Identifier
		sym "@text.title" { gui = "bold" },    -- Title
		sym "@text.uri" { gui = "undrline" },  -- Underlined
		sym "@text.underline" { gui = "underline" }, -- Underlined
		sym "@text.todo" { Todo },             -- Todo
		sym "@comment" { Comment },            -- Comment
		sym "@punctuation" { Delimiter },      -- Delimiter
		sym "@constant" { Constant },          -- Constant
		sym "@constant.builtin" { Special },   -- Special
		sym "@constant.macro" { Define },      -- Define
		sym "@define" { Define },              -- Define
		sym "@macro" { Macro },                -- Macro
		sym "@string" { String },              -- String
		sym "@string.escape" { SpecialChar },  -- SpecialChar
		sym "@string.special" { SpecialChar }, -- SpecialChar
		sym "@character" { Character },        -- Character
		sym "@character.special" { SpecialChar }, -- SpecialChar
		sym "@number" { Number },              -- Number
		sym "@boolean" { Boolean },            -- Boolean
		sym "@float" { Float },                -- Float
		sym "@function" { Function },          -- Function
		sym "@function.builtin" { Special },   -- Special
		sym "@function.macro" { Macro },       -- Macro
		sym "@parameter" { Identifier },       -- Identifier
		sym "@method" { Function },            -- Function
		sym "@field" { Identifier },           -- Identifier
		sym "@property" { Identifier },        -- Identifier
		sym "@constructor" { Special },        -- Special
		sym "@conditional" { Conditional },    -- Conditional
		sym "@repeat" { Repeat },              -- Repeat
		sym "@label" { Label },                -- Label
		sym "@operator" {},                    -- Operator
		sym "@keyword" { Keyword },            -- Keyword
		sym "@exception" {},                   -- Exception
		sym "@variable" { Identifier },        -- Identifier
		sym "@type" { Type },                  -- Type
		sym "@type.definition" { Typedef },    -- Typedef
		sym "@storageclass" { StorageClass },  -- StorageClass
		sym "@structure" { Structure },        -- Structure
		sym "@namespace" { Identifier },       -- Identifier
		sym "@include" { Include },            -- Include
		sym "@preproc" { PreProc },            -- PreProc
		sym "@debug" { Debug },                -- Debug
		sym "@tag" { Tag },                    -- Tag

		-- Lualine
		-- lualine_a_insert = { }
		-- lualine_b_insert = { }
		-- lualine_c_insert = { }
		-- lualine_a_command = { }
		-- lualine_b_command = { }
		-- lualine_c_command = { }
		-- lualine_a_replace = { }
		-- lualine_b_replace = { }
		-- lualine_c_replace = { }
		-- lualine_a_visual = { }
		-- lualine_b_visual = { }
		-- lualine_c_visual = { }
		-- lualine_a_inactive = { }
		-- lualine_b_inactive = { }
		-- lualine_c_inactive = { }
		-- lualine_a_terminal = { }
		-- lualine_b_terminal = { }
		-- lualine_c_terminal = { }
		-- lualine_a_normal { fg = fg3, bg = background },
		-- lualine_b_normal { fg = Normal.fg, bg = bg4 },
		-- lualine_c_normal = { fg = Normal.fg, bg = bg1},
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
