local palette_colors = {

	white_1 = "#ffffff",
	white_2 = "#f8f8f8",
	white_3 = "#eeeeee",
	gray_2 = "#6b6b6b",
	gray_3 = "#707070",
	gray_4 = "#c0c0c0",
	light_gray_2 = "#e7e7ff",
	light_gray_3 = "#e7e7e7",
	black = "#000000",
	yellow = "#e0e040",
	unknown_1 = "#404040",
	unknown_2 = "#544060",
	light_blue_1 = "#4580aa",
	light_blue_2 = "#75a0da",
	blue = "#4040ff",
	blue_2 = "#0080f0",
	blue_4 = "#0000ff",
	blue_5 = "#0033cc",
	dark_red_2 = "#7f0055",
	light_red = "#ff3030",
	light_red_2 = "#ff5050",
	pink = "#b64f90",
	green = "#0090a0",
	green_2 = "#236e25",
	green_3 = "#00884c",
	beige = "#ffd0d0",
	light_beige = "#ffe7e7",
	orange = "#ffc0a0",
	dark_orange = "#b07800",
	orange_2 = "#d06000",
	brown_1 = "#683821",
	brown_2 = "#804030",
	brown_3 = "#804020",
	brown_4 = "#904838",
	purple_1 = "#8040f0",
	purple_2 = "#8000ff",
	purple_3 = "#8040ff",
	dark_purple = "#8010a0",
}

local M = {}

--- generate color table
-- @param config config options containing colors and theme fields (optional)
-- @return table of palette colors and theme colors merged with config.colors
function M.setup(config)
	config = vim.tbl_extend("force", require("eclipse").config, config or {})
	local colors = vim.tbl_extend("force", palette_colors, config.colors)
	local theme = require("eclipse.themes")[config.theme](colors)
	theme = vim.tbl_extend("force", theme, config.colors)
	return vim.tbl_extend("force", theme, colors)
end

return M
