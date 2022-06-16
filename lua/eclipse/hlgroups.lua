local M = {}

-- generate highlights table
-- @param colors color (theme) color table created by require("eclipse.colors").setup()
-- @param config config options (optional)
function M.setup(_, config)
	config = vim.tbl_extend("force", require("eclipse").config, config or {})

	local colors = {
		bg = "#ffffff",
		fg = "#000000",
		bg_dim = "Gray",
		fg_dark = "#f8f8f8",
		bg_dark = "#707070",
		bg_light = "#e7e7ff",

		incSearch = {
			fg = "#404040",
			bg = "#e0e040",
		},

		search = {
			fg = "#544060",
			bg = "#f0c0ff",
		},

		diag = {
			error = { fg = "#f8f8f8", bg = "#4040ff" },
			warning = { fg = "#f8f8f8", bg = "#4040ff" },
			info = { fg = "#f8f8f8", bg = "#4040ff" },
			hint = { fg = "#f8f8f8", bg = "#4040ff" },
		},
		modeMsg = { fg = "#d06000" },
		moreMsg = { fg = "#0090a0" },
		question = { fg = "#8000ff" },

		diff = {
			text = { fg = "Red", bg = "#ffd0d0" },
			change = { fg = "Black", bg = "#ffe7e7" },
			delete = { bg = "#e7e7ff" },
			add = { fg = "Blue", bg = "#e7e7ff" },
		},

		git = {
			added = { fg = "Blue", bg = "#e7e7ff" },
			removed = { bg = "#e7e7ff" },
			changed = { fg = "Black", bg = "#ffe7e7" },
		},
		statusLine = { fg = "#ffffff", bg = "#4570aa" },
		statusLineNC = { fg = "#ffffff", bg = "#75a0da" },
		vertSplit = { fg = "#f8f8f8", bg = "#904838" },
		wildMenu = { fg = "#f8f8f8", bg = "#ff3030" },

		cursor = { fg = "#ffffff", bg = "#0080f0" },
		lCursor = { fg = "#ffffff", bg = "#8040ff" },
		cursorIM = { fg = "#ffffff", bg = "#8040ff" },

		folded = { fg = "#804030", bg = "#fff0d0" },
		foldColumn = { fg = "#6b6b6b", bg = "#e7e7e7" },

		pMenu = { bg = "Green", fg = "White" },
		pMenuSel = { bg = "White", fg = "Black" },
		pMenuSBar = { bg = "Red", fg = "White" },
		pMenuThumb = { bg = "White", fg = "Red" },

		directory = { fg = "#7050ff" },
		lineNr = { fg = "#6b6b6b", bg = "#eeeeee" },
		nonText = { fg = "#707070", bg = "#e7e7e7" },
		specialKey = { fg = "#c0c0c0" },
		title = { fg = "#0033cc" },
		visual = { fg = "#804020", bg = "#ffc0a0" },

		comment = { fg = "#236e25" },
		constant = { fg = "#00884c" },
		error = { fg = "#f8f8f8", bg = "#4040ff" },
		preProc = { fg = "#683821" },
		special = { fg = "#8040f0" },
		statement = { fg = "#b64f90" },
		todo = { fg = "#ff5050", bg = "White" },
		type = { fg = "#7f0055" },
		underlined = { fg = "Blue" },
		string = { fg = "#8010a0" },
		number = { fg = "#0000ff" },
		identifier = { fg = "Gray" },
		operator = { fg = "Gray" },
		keyword = { fg = "Black" },
		specialException = { fg = "Pink" },
		specialReturn = { fg = "Pink" },
		regex = { fg = "#804020" },
		specialVar = { fg = "DarkMagenta" },
		func = { fg = "Black" },
	}

	local hlgroups = {
		Comment = vim.tbl_extend("force", { fg = colors.comment.fg }, config.commentStyle),
		ColorColumn = { bg = colors.bg },
		Conceal = { fg = "Pink", bold = true },
		Cursor = { fg = colors.cursor.fg, bg = colors.cursor.bg },
		lCursor = { fg = colors.lCursor.fg, bg = colors.lCursor.bg },
		CursorIM = { fg = colors.cursorIM.fg, bg = colors.cursorIM.bg },
		CursorLine = { bg = "Pink" },
		CursorColumn = { link = "CursorLine" },
		Directory = { fg = colors.directory.fg },
		DiffAdd = { bg = colors.diff.add.bg, fg = colors.diff.add.fg },
		DiffChange = { bg = colors.diff.change.bg, fg = colors.diff.change.fg },
		DiffDelete = { fg = colors.diff.delete.fg, bg = colors.diff.delete.bg },
		DiffText = { bg = colors.diff.text.bg, fg = colors.diff.text.fg },
		EndOfBuffer = { fg = "Pink" }, --colors.bg },
		-- TermCursor = {},
		-- TermCursorNC = {},
		ErrorMsg = { fg = colors.diag.error.fg, bg = colors.diag.error.bg },
		VertSplit = { fg = colors.vertSplit.fg, bg = colors.vertSplit.bg },
		WinSeparator = config.globalStatus and {
			fg = "Pink", --colors.bg_light1,
			bg = config.dimInactive and colors.bg_dim or "NONE",
		} or { link = "VertSplit" },
		Folded = { fg = colors.folded.fg, bg = colors.folded.bg },
		FoldColumn = { fg = colors.foldColumn.fg, bg = colors.foldColumn.bg },
		SignColumn = { link = "FoldColumn" }, -- = colors.bg },
		SignColumnSB = { link = "SignColumn" },
		Substitute = { bg = "Pink" }, --fg = colors.fg, bg = colors.git.removed },
		LineNr = { fg = colors.lineNr.fg, bg = colors.lineNr.bg },
		CursorLineNr = { link = "LineNr" },
		MatchParen = { bold = true },
		ModeMsg = { fg = colors.modeMsg.fg, bold = true },
		MsgArea = { fg = "Pink" },
		-- MsgSeparator = {},
		MoreMsg = { fg = colors.moreMsg.fg },
		NonText = { fg = colors.nonText.fg, bg = colors.nonText.bg },
		Normal = { fg = colors.fg, bg = not config.transparent and colors.bg or "NONE" },
		NormalNC = config.dimInactive and { fg = colors.fg_dark, bg = colors.bg_dim } or { link = "Normal" },
		NormalSB = { link = "Normal" },
		NormalFloat = { fg = colors.fg, bg = colors.bg_dim },
		FloatBorder = { fg = colors.vertSplit.fg, bg = colors.vertSplit.bg },
		Pmenu = { fg = colors.pMenu.fg, bg = colors.pMenu.bg },
		PmenuSel = { fg = colors.pMenuSel.fg, bg = colors.pMenuSel.bg },
		PmenuSbar = { fg = colors.pMenuSBar.fg, bg = colors.pMenuSBar.bg },
		PmenuThumb = { fg = colors.pMenuThumb.fg, bg = colors.pMenuThumb.bg },
		Question = { link = "MoreMsg" },
		QuickFixLine = { link = "CursorLine" },
		Search = { fg = colors.search.fg, bg = colors.search.bg },
		CurSearch = {
			link = "Search", --[[ IncSearch ]]
		},
		IncSearch = { fg = colors.incSearch.fg, bg = colors.incSearch.bg },
		SpecialKey = { fg = colors.specialKey.fg },
		SpellBad = { undercurl = true, sp = colors.diag.error.bg },
		SpellCap = { undercurl = true, sp = colors.diag.warning.bg },
		SpellLocal = { undercurl = true, sp = colors.diag.warning.bg },
		SpellRare = { undercurl = true, sp = colors.diag.warning.bg },
		StatusLine = { fg = colors.statusLine.fg, bg = colors.statusLine.bg },
		StatusLineNC = { fg = colors.statusLineNC.fg, bg = colors.statusLineNC.bg },
		TabLine = { bg = colors.bg_dark, fg = colors.fg_dark },
		TabLineFill = { bg = colors.bg },
		TabLineSel = { fg = colors.fg_dark, bg = colors.bg_light },
		Title = { fg = colors.title.fg, bold = true },
		Visual = { fg = colors.visual.fg, bg = colors.visual.bg },
		VisualNOS = { link = "Visual" },
		WarningMsg = { fg = colors.diag.warning.fg, bg = colors.diag.warning.bg },
		Whitespace = { fg = colors.bg_light },
		WildMenu = { fg = colors.wildMenu.fg, bg = colors.wildMenu.bg },

		Constant = { fg = colors.constant.fg },
		String = { fg = colors.string.fg },
		Character = { link = "String" },
		Number = { fg = colors.number.fg },
		Boolean = { fg = colors.number.fg, bold = true },
		Float = { link = "Number" },

		Identifier = { fg = colors.identifier.fg },
		Function = vim.tbl_extend("force", { fg = colors.identifier.fg }, config.functionStyle),
		Method = { link = "Function" },
		Statement = vim.tbl_extend("force", { fg = colors.statement.fg }, config.statementStyle),
		-- Conditional = {},
		-- Repeat = {},
		-- Label = { link = 'Statement' }, --TODO: check default
		Operator = { fg = colors.operator.fg },
		Keyword = vim.tbl_extend("force", { fg = colors.keyword.fg }, config.keywordStyle),
		Exception = { fg = colors.special.fg },

		PreProc = { fg = colors.preProc.fg },
		-- Include = {},
		-- Define = {},
		-- Macro = {},
		-- PreCondit = {},

		Type = vim.tbl_extend("force", { fg = colors.type.fg }, config.typeStyle),
		Struct = { link = "Type" },
		-- StorageClass = {},
		-- Structure = {},
		-- Typedef = {},

		Special = { fg = colors.special.fg },
		-- SpecialChar = {},
		-- Tag = {},
		-- Delimiter = { fg = c.br},
		-- SpecialComment = {},
		-- Debug = {},

		Underlined = { fg = colors.special.fg, underline = true },
		Bold = { bold = true },
		Italic = { italic = true },

		Ignore = { link = "NonText" },

		Error = { fg = colors.diag.error.fg, bg = colors.diag.error.bg },
		Todo = { fg = "White", bg = "Blue", bold = true },

		qfLineNr = { link = "lineNr" },
		qfFileName = { link = "Directory" },

		-- htmlH1 = {},
		-- htmlH2 = {},

		-- mkdHeading = {},
		-- mkdCode = {},
		-- mkdCodeDelimiter = {},
		-- mkdCodeStart = {},
		-- mkdCodeEnd = {},
		-- mkdLink = {},

		-- markdownHeadingDelimiter = {},
		markdownCode = { fg = colors.statement.fg },
		markdownCodeBlock = { fg = colors.statement.fg },
		markdownEscape = { fg = "NONE" },
		-- markdownH1 = {},
		-- markdownH2 = {},
		-- markdownLinkText = {},

		debugPC = { bg = colors.diff.delete.bg },
		debugBreakpoint = { fg = colors.special.fg },

		LspReferenceText = { bg = colors.bg_light },
		LspReferenceRead = { bg = colors.fg_dark },
		LspReferenceWrite = { bg = "Orange" },

		DiagnosticError = { fg = colors.diag.error.fg, bg = colors.diag.error.bg },
		DiagnosticWarn = { fg = colors.diag.warning.fg, bg = colors.diag.warning.bg },
		DiagnosticInfo = { fg = colors.diag.info.fg, bg = colors.diag.info.bg },
		DiagnosticHint = { fg = colors.diag.hint.fg, bg = colors.diag.hint.bg },

		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticSignHint = { link = "DiagnosticHint" },

		DiagnosticVirtualTextError = { link = "DiagnosticError" },
		DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

		DiagnosticUnderlineError = { undercurl = true, sp = colors.diag.error.bg },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.diag.warning.bg },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.diag.info.bg },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.diag.hint.bg },

		LspSignatureActiveParameter = { fg = colors.diag.warning.fg, bg = colors.diag.warning.bg },
		LspCodeLens = { fg = colors.comment.fg },

		-- ALEErrorSign = {},
		-- ALEWarningSign = {},

		-- TSAnnotation = {},
		TSAttribute = { link = "Constant" },
		-- TSBoolean = {},
		-- TSCharacter = {},
		-- TSComment = {},
		-- TSNote = { fg = c.fg_dark, bg = c.diag.hint, nocombine = true, bold = true}, -- links to SpecialComment -> Special
		TSWarning = { link = "Todo" }, --default
		TSDanger = { link = "WarningMsg" }, --default
		TSConstructor = { fg = colors.keyword.fg }, -- Function/Special/Statement/Keyword
		-- TSConditional = {},
		-- TSConstant = {},
		-- TSConstBuiltin = {},
		-- TSConstMacro = {},
		-- TSError = { fg = colors.diag.error },
		-- TSException = { link = 'Exception' }, -- default, -> statement
		TSException = vim.tbl_extend(
			"force",
			{ fg = config.specialException and colors.special.fg or colors.statement.fg },
			config.statementStyle
		),
		TSField = { link = "Identifier" }, -- default
		-- TSField = { link = 'Variable'},
		-- TSFloat = {},
		-- TSFunction = {},
		-- TSFuncBuiltin = {link = "Function" },
		-- TSFuncMacro = {},
		-- TSInclude = {},
		TSKeyword = { link = "Keyword" },
		-- TSKeywordFunction = { link = "Keyword" }, -- default
		-- TSKeywordFunction = { link = "Function" },
		TSKeywordReturn = vim.tbl_extend(
			"force",
			{ fg = config.specialReturn and colors.special.fg or colors.keyword },
			config.keywordStyle
		),
		TSLabel = { link = "Label" },
		TSMethod = { link = "Function" },
		-- TSNamespace = {},
		-- TSNone = {},
		-- TSNumber = {},
		TSOperator = { link = "Operator" },
		TSKeywordOperator = { fg = colors.operator.fg, bold = true },
		TSParameter = { link = "Identifier" }, -- default
		-- TSParameterReference = {},
		TSProperty = { link = "Identifier" }, -- default
		-- TSPunctDelimiter = { fg = c.op },
		TSPunctDelimiter = { fg = colors.fg },
		TSPunctBracket = { link = "TSPunctDelimiter" },
		TSPunctSpecial = { link = "TSPunctDelimiter" },
		-- TSRepeat = {},
		-- TSString = {},
		TSStringRegex = { fg = colors.regex.fg },
		TSStringEscape = { fg = colors.regex.fg, bold = true },
		-- TSSymbol = {},
		-- TSType = {},
		-- TSTypeBuiltin = {},
		TSVariable = { fg = colors.fg },
		TSVariableBuiltin = vim.tbl_extend("force", { fg = colors.special.fg }, config.variablebuiltinStyle),

		-- TSTag = {},
		-- TSTagDelimiter = {},
		-- TSText = {},
		-- TSTextReference = { fg = c.sp2 },
		-- TSEmphasis = {},
		-- TSUnderline = {},
		-- TSStrike = {},
		-- TSTitle = {},
		-- TSLiteral = {},
		-- TSURI = {},

		-- Lua
		-- luaTSProperty = {},

		-- LspTrouble
		-- LspTroubleText = {},
		-- LspTroubleCount = {},
		-- LspTroubleNormal = {},

		-- Illuminate
		-- illuminatedWord = {},
		-- illuminatedCurWord = {},

		-- Git
		diffAdded = { fg = colors.git.added.fg, bg = colors.git.added.bg },
		diffRemoved = { fg = colors.git.removed.fg, bg = colors.git.removed.bg },
		diffDeleted = { fg = colors.git.removed.fg, bg = colors.git.removed.bg },
		diffChanged = { fg = colors.git.changed.fg, bg = colors.git.changed.bg },
		diffOldFile = { fg = colors.git.removed.fg, bg = colors.git.removed.bg },
		diffNewFile = { fg = colors.git.added.fg, bg = colors.git.added.bg },
		-- diffFile = { fg = c.steelGray },
		-- diffLine = { fg = c.steelGray },
		-- diffIndexLine = { link = 'Identifier' },

		-- Neogit
		-- NeogitBranch = {},
		-- NeogitRemote = {},
		-- NeogitHunkHeader = {},
		-- NeogitHunkHeaderHighlight = {},
		-- NeogitDiffContextHighlight = {},
		-- NeogitDiffDeleteHighlight = {},
		-- NeogitDiffAddHighlight = {},

		-- GitGutter
		-- GitGutterAdd = {},
		-- GitGutterChange = {},
		-- GitGutterDelete = {},

		-- GitSigns
		GitSignsAdd = { link = "diffAdded" },
		GitSignsChange = { link = "diffChanged" },
		GitSignsDelete = { link = "diffDeleted" },
		GitSignsDeleteLn = { bg = colors.diff.delete.bg },

		-- Telescope                      = {},
		TelescopeBorder = { fg = colors.vertSplit.fg, bg = colors.vertSplit.bg },
		TelescopeResultsClass = { link = "TSType" },
		TelescopeResultsStruct = { link = "TSType" },
		TelescopeResultsVariable = { link = "TSVariable" },

		-- NvimTree                       = {},
		NvimTreeNormal = { link = "Normal" },
		NvimTreeNormalNC = { link = "NormalNC" },
		NvimTreeRootFolder = { fg = colors.title.fg, bold = true },
		NvimTreeGitDirty = { fg = colors.git.changed.fg, bg = colors.git.changed.bg },
		NvimTreeGitNew = { fg = colors.git.added.fg, bg = colors.git.added.bg },
		NvimTreeGitDeleted = { bg = colors.git.removed.bg, fg = "Red" },
		NvimTreeSpecialFile = { fg = colors.special.fg },
		-- NvimTreeIndentMarker           = {},
		NvimTreeImageFile = { fg = colors.special.fg },
		NvimTreeSymlink = { link = "Type" },
		NvimTreeFolderName = { link = "Directory" },
		NvimTreeExecFile = { fg = "Green", bold = true },
		NvimTreeGitStaged = { fg = colors.git.added.fg, bg = colors.git.added.bg },
		NvimTreeOpenedFile = { fg = colors.special.fg, italic = true },

		-- Fern
		-- FernBranchText = {},

		-- glyph = {},
		-- GlyphPalette1 = {},
		-- GlyphPalette2 = {},
		-- GlyphPalette3 = {},
		-- GlyphPalette4 = {},
		-- GlyphPalette6 = {},
		-- GlyphPalette7 = {},
		-- GlyphPalette9 = {},

		-- Dashboard
		DashboardShortCut = { fg = colors.visual.fg },
		DashboardHeader = { fg = colors.git.removed.fg },
		DashboardCenter = { fg = colors.identifier.fg },
		DashboardFooter = { fg = colors.identifier.fg },

		-- WhichKey = {},
		-- WhichKeyGroup = {},
		-- WhichKeyDesc = {},
		-- WhichKeySeperator = {},
		-- WhichKeySeparator = {},
		-- WhichKeyFloat = {},
		-- WhichKeyValue = {},

		-- LspSaga
		-- DiagnosticWarning = {},
		-- DiagnosticInformation = {},

		-- LspFloatWinNormal = {},
		-- LspFloatWinBorder = {},
		-- LspSagaBorderTitle = {},
		-- LspSagaHoverBorder = {},
		-- LspSagaRenameBorder = {},
		-- LspSagaDefPreviewBorder = {},
		-- LspSagaCodeActionBorder = {},
		-- LspSagaFinderSelection = {},
		-- LspSagaCodeActionTitle = {},
		-- LspSagaCodeActionContent = {},
		-- LspSagaSignatureHelpBorder = {},
		-- ReferencesCount = {},
		-- DefinitionCount = {},
		-- DefinitionIcon = {},
		-- ReferencesIcon = {},
		-- TargetWord = {},

		-- Floaterm
		FloatermBorder = { fg = colors.vertSplit.fg, bg = colors.vertSplit.bg },

		-- NeoVim                         = {},
		healthError = { fg = colors.diag.error.fg, bg = colors.diag.error.bg },
		healthSuccess = { bg = "Green", fg = "White" },
		healthWarning = { fg = colors.diag.warning.fg, bg = colors.diag.warning.bg },

		-- BufferLine
		-- BufferLineIndicatorSelected = {},
		-- BufferLineFill = {},

		-- Barbar = {},
		-- BufferCurrent = {},
		-- BufferCurrentIndex = {},
		-- BufferCurrentMod = {},
		-- BufferCurrentSign = {},
		-- BufferCurrentTarget = {},
		-- BufferVisible = {},
		-- BufferVisibleIndex = {},
		-- BufferVisibleMod = {},
		-- BufferVisibleSign = {},
		-- BufferVisibleTarget = {},
		-- BufferInactive = {},
		-- BufferInactiveIndex = {},
		-- BufferInactiveMod = {},
		-- BufferInactiveSign = {},
		-- BufferInactiveTarget = {},
		-- BufferTabpages = {},
		-- BufferTabpage = {},

		-- Sneak
		-- Sneak = {},
		-- SneakScope = {},

		-- Hop
		-- HopNextKey = {},
		-- HopNextKey1 = {},
		-- HopNextKey2 = {},
		-- HopUnmatched = {},

		-- LightspeedGreyWash = {},

		-- Cmp
		CmpDocumentation = { link = "NormalFloat" },
		CmpDocumentationBorder = { link = "FloatBorder" },
		CmpCompletion = { link = "Pmenu" },
		CmpCompletionSel = { link = "PmenuSel" },
		CmpCompletionBorder = { fg = colors.search.fg, bg = colors.search.bg },
		CmpCompletionThumb = { link = "PmenuThumb" },
		CmpCompletionSbar = { link = "PmenuSbar" },

		CmpItemAbbr = { fg = colors.pMenu.fg, bg = colors.pMenu.bg },
		CmpItemAbbrDeprecated = { fg = colors.comment.fg, strikethrough = true },

		CmpItemAbbrMatch = { fg = colors.func.fg },
		CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },

		CmpItemKindDefault = { fg = colors.constant.fg },
		CmpItemMenu = { fg = colors.comment.fg },

		CmpItemKindVariable = { fg = colors.fg_dark },

		CmpItemKindFunction = { link = "Function" },
		CmpItemKindMethod = { link = "Function" },

		CmpItemKindConstructor = { link = "TSConstructor" },

		CmpItemKindClass = { link = "Type" },
		CmpItemKindInterface = { link = "Type" },
		CmpItemKindStruct = { link = "Type" },

		CmpItemKindProperty = { link = "TSProperty" },
		CmpItemKindField = { link = "TSField" },
		CmpItemKindEnum = { link = "Identifier" },

		CmpItemKindSnippet = { fg = colors.special.fg },

		CmpItemKindText = { link = "TSText" },

		CmpItemKindModule = { link = "TSInclude" },

		CmpItemKindFile = { link = "Directory" },
		CmpItemKindFolder = { link = "Directory" },

		CmpItemKindKeyword = { link = "TSKeyword" },
		CmpItemKindTypeParameter = { link = "Identifier" },
		CmpItemKindConstant = { link = "Constant" },
		CmpItemKindOperator = { link = "Operator" },
		CmpItemKindReference = { link = "TSParameterReference" },
		CmpItemKindEnumMember = { link = "TSField" },

		CmpItemKindValue = { link = "String" },
		-- CmpItemKindUnit = {},
		-- CmpItemKindEvent = {},
		-- CmpItemKindColor = {},

		-- IndentBlankline
		IndentBlanklineChar = { fg = colors.bg_light },
		IndentBlanklineSpaceChar = { fg = colors.bg_light },
		IndentBlanklineSpaceCharBlankline = { fg = colors.bg_light },
		IndentBlanklineContextChar = { fg = colors.bg_light },
		IndentBlanklineContextStart = { sp = colors.bg_light, underline = true },
	}

	for hl, specs in pairs(config.overrides) do
		if hlgroups[hl] and not vim.tbl_isempty(specs) then
			hlgroups[hl].link = nil
		end
		hlgroups[hl] = vim.tbl_extend("force", hlgroups[hl] or {}, specs)
	end

	return hlgroups
end

return M
