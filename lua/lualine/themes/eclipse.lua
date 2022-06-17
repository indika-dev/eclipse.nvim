local colors = require("eclipse.colors").setup()

local eclipse = {}

eclipse.normal = {
	a = { bg = "LightGray", fg = "Blue" },
	b = { bg = "LightGray", fg = "Black" },
	c = { bg = "LightGray", fg = "Black" },
}

eclipse.insert = {
	a = { bg = "LightGray", fg = "Green" },
	b = { bg = "LightGray", fg = "Green" },
}

eclipse.command = {
	a = { bg = "LightGray", fg = colors.fg_dark },
	b = { bg = "LightGray", fg = colors.fg_dark },
}

eclipse.visual = {
	a = { bg = "LightGray", fg = colors.visual.fg },
	b = { bg = "LightGray", fg = colors.visual.fg },
}

eclipse.replace = {
	a = { bg = "LightGray", fg = "LightRed" },
	b = { bg = "LightGray", fg = "LightRed" },
}

eclipse.inactive = {
	a = { bg = colors.bg_dim, fg = colors.fg_dark },
	b = { bg = colors.bg_dim, fg = colors.fg_dark, gui = "bold" },
	c = { bg = colors.bg_dim, fg = colors.fg_dark },
}

if vim.g.eclipse_lualine_bold then
	for _, mode in pairs(eclipse) do
		mode.a.gui = "bold"
	end
end

return eclipse
