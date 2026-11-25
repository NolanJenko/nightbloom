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

-- Syntax roles and the accent each one follows when unset. Resolved in this
-- order, so a later role may name an earlier one (control = "keyword").
local roles = {
  { "keyword", "violet" },
  { "control", "love" },
  { "builtin", "pine" },
  { "func", "iris" },
  { "string", "gold" },
  { "type", "foam" },
  { "property", "lavender" },
  { "punctuation", "subtle" },
  { "folder" }, -- no default: each folder group keeps its own stock color
}

--- Stock palette -> variant overrides -> `on_colors` -> syntax roles.
---@param config NightbloomConfig
---@param name string|nil colorscheme name, used to find variant overrides
---@return NightbloomPalette
local function resolve(config, name)
  local colors = vim.deepcopy(require("nightbloom.palette"))
  local variant = require("nightbloom.variants").palette(name)
  if variant then
    colors = vim.tbl_extend("force", colors, variant)
  end
  if config.on_colors then
    config.on_colors(colors)
  end
  -- Resolved last so a user tweaking `iris` etc. in on_colors still moves
  -- whatever follows it. A role may name another palette key.
  for _, r in ipairs(roles) do
    local role, default = r[1], r[2]
    local value = colors[role] or default
    if value then
      colors[role] = colors[value] or value
    end
  end
  return colors
end

--- Palette of the named or active colorscheme, with `on_colors` applied.
---@param name string|nil
---@return NightbloomPalette
function M.colors(name)
  return resolve(M.config, name or M.active)
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
  M.active = vim.g.colors_name

  local config = vim.tbl_deep_extend("force", M.config, overrides or {})
  local hl = require("nightbloom.highlights")
  local colors = resolve(config, M.active)
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
