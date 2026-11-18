-- Variant colorschemes: a background ramp paired with a syntax scheme.
--
-- The two halves are independent, so mixing is a one-word edit in `M.list`.
-- Everything here is a palette override; the stock `nightbloom` is untouched.
--
-- Syntax roles (`keyword`, `control`, `func`, `string`, `type`, `property`,
-- `punctuation`, `folder`) take a hex color or the name of another palette key
-- (`keyword = "love"`, or `control = "keyword"` to share).
local M = {}

M.backgrounds = {
  -- Embark's, as shipped in palette.lua.
  stock = {},

  -- Rose Pine's own base, with the in-between steps derived. Darker and less
  -- saturated than Embark's, so the pastel accents read as dusty, not glowing.
  dusk = {
    crust    = "#110f1c",
    mantle   = "#151320",
    base     = "#191724",
    hl_low   = "#1f1d2e",
    surface  = "#242236",
    overlay  = "#2a2740",
    hl_med   = "#403d52",
    hl_high  = "#524f67",
  },
}

M.syntax = {
  -- Every accent at ~70% chroma (the Rose Pine half of the blend, less of the
  -- Embark glow). Hexes are the stock accents with chroma scaled in OKLCH.
  -- Keywords and control flow share the dusty violet (italic keywords are set
  -- in colors/nightbloom-dusty.lua), so nothing uses pink or red for them.
  -- Function names are a clear blue (shared with folders), types the one
  -- saturated note (indigo), properties teal and builtins foam, so each sits
  -- in its own hue. Punctuation is a dim slate that recedes behind them.
  dusty = {
    iris = "#c3b4ea", violet = "#a391da", lavender = "#b9b3d8", love = "#db88a3",
    rose = "#e3bfc8", gold = "#e8caa0", foam = "#acd5dc", pine = "#8193d5",
    mint = "#acdecb",
    keyword = "violet", control = "keyword", builtin = "foam",
    func = "#84aee3", type = "#8477f3", property = "#7fbec5",
    punctuation = "#7e8796", folder = "#84aee3",
  },
}

---@type table<string, { background: string, syntax: string }>
M.list = {
  ["nightbloom-dusty"] = { background = "stock", syntax = "dusty" },
}

--- Palette overrides for a variant colorscheme, or nil for the stock ones.
---@param name string|nil
---@return table<string, string>|nil
function M.palette(name)
  local v = name and M.list[name]
  if not v then
    return nil
  end
  return vim.tbl_extend("force", M.backgrounds[v.background], M.syntax[v.syntax])
end

return M
