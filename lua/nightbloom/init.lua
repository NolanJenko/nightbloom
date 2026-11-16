local M = {}

---@class NightbloomConfig
M.config = {
  transparent = false,     -- don't paint editor / float backgrounds
  dim_inactive = false,    -- darker background for unfocused windows
  terminal_colors = true,  -- set vim.g.terminal_color_0..15
  parameter_color = "mint", -- palette key ("mint", "foam", ...) or a hex color
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    parameters = { italic = true },
    strings = {},
    types = {},
  },
  ---@type fun(colors: NightbloomPalette)|nil
  on_colors = nil,
  ---@type fun(highlights: table<string, table>, colors: NightbloomPalette)|nil
  on_highlights = nil,
}

---@param opts NightbloomConfig|nil
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

--- Palette after `on_colors` overrides have been applied.
---@return NightbloomPalette
function M.colors()
  local colors = vim.deepcopy(require("nightbloom.palette"))
  if M.config.on_colors then
    M.config.on_colors(colors)
  end
  return colors
end

---@param name string|nil colorscheme name (variants pass their own)
---@param overrides NightbloomConfig|nil per-variant config, applied over setup()
function M.load(name, overrides)
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = name or "nightbloom"

  local config = vim.tbl_deep_extend("force", M.config, overrides or {})
  local hl = require("nightbloom.highlights")
  local colors = M.colors()
  local groups = hl.get(colors, config)

  if config.on_highlights then
    config.on_highlights(groups, colors)
  end

  for name, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, name, spec)
  end

  if config.terminal_colors then
    hl.terminal(colors)
  end
end

return M
