local colors = require("eclipse.colors").setup()

local eclipse = {}

eclipse.normal = {
  a = { bg = colors.gray_2, fg = colors.blue_4 },
  b = { bg = colors.gray_4, fg = colors.blue_4 },
  c = { bg = colors.bg_light0, fg = colors.fg },
}

eclipse.insert = {
  a = { bg = colors.green_2, fg = colors.bg_dark },
  b = { bg = colors.green_3, fg = colors.white_2 },
}

eclipse.command = {
  a = { bg = colors.gray_2, fg = colors.bg_dark },
  b = { bg = colors.bg, fg = colors.white_2 },
}

eclipse.visual = {
  a = { bg = colors.purple_2, fg = colors.bg_dark },
  b = { bg = colors.purple_2, fg = colors.white_2 },
}

eclipse.replace = {
  a = { bg = colors.light_red_2, fg = colors.bg_dark },
  b = { bg = colors.light_red, fg = colors.white_2 },
}

eclipse.inactive = {
  a = { bg = colors.bg_status, fg = colors.blue_4 },
  b = { bg = colors.bg_status, fg = colors.gray_3, gui = "bold" },
  c = { bg = colors.bg_status, fg = colors.gray_4 },
}

if vim.g.eclipse_lualine_bold then
  for _, mode in pairs(eclipse) do
    mode.a.gui = "bold"
  end
end

return eclipse
