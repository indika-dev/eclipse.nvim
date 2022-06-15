local M = {}

local function set_highlights(hlgroups)
  for group, colors in pairs(hlgroups) do
    if not vim.tbl_isempty(colors) then
      vim.api.nvim_set_hl(0, group, colors)
    end
  end
end

local function check_config(config)
  local style_opts = {
    "commentStyle",
    "functionStyle",
    "keywordStyle",
    "typeStyle",
    "statementStyle",
    "variablebuiltinStyle",
  }
  for _, opt in ipairs(style_opts) do
    if type(config[opt]) ~= "table" then
      config[opt] = {}
      vim.notify_once(
        "Kanagawa: deprecated format for Style option in config.xxxStyle: use a table like { italic = true } instead. See README.md for more info.",
        vim.log.levels.ERROR
      )
    end
  end
  for _, hl in pairs(config.overrides) do
    if hl.style then
      hl.style = nil
      vim.notify_once(
        "Kanagawa: deprecated format for highlight style in config.overrides: use the syntax { italic = true } instead. See README.md for more info.",
        vim.log.levels.ERROR
      )
    end
  end
end

--- default config
M.config = {
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = true },
  specialReturn = true,
  specialException = true,
  transparent = false,
  dimInactive = false,
  globalStatus = false,
  colors = {},
  overrides = {},
  theme = "default", -- only one theme atm
}

--- update global configuration with user settings
--@param config user configuration
--@return nil
function M.setup(config)
  M.config = vim.tbl_extend("force", M.config, config or {})
  check_config(M.config)
end

--- load the colorscheme
function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "eclipse"
  vim.o.termguicolors = true

  local colors = require("eclipse.colors").setup()
  local hlgroups = require("eclipse.hlgroups").setup(colors)

  set_highlights(hlgroups)
end

return M
