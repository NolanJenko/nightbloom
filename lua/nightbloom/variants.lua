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

  frostwood = {
    crust = "#090d10", mantle = "#141c21", base = "#0e1418",
    hl_low = "#1b252b", surface = "#1b252b", overlay = "#243139",
    hl_med = "#243139", hl_high = "#32434c",
    muted = "#667c86", subtle = "#8a9da6", text = "#d5e0e4",
    cursor = "#eef4f6",
  },

  winter_pine = {
    crust = "#090f12", mantle = "#172527", base = "#0c1317",
    hl_low = "#172527", surface = "#203234", overlay = "#2c3c44",
    hl_med = "#2c3c44", hl_high = "#3a5357",
    muted = "#657e82", subtle = "#90a5aa", text = "#d8e4e1",
    cursor = "#d8e4e1",
    diff_add = "#1d342b", diff_chg = "#21343f", diff_del = "#36262d",
    diff_text = "#2b4756",
  },

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

-- The Frostwood palettes share syntax roles and differ in accent colors.
local frostwood = {
  iris = "#8f9be0", violet = "#7fb2d0", lavender = "#a4d4e4",
  love = "#dc7e90", rose = "#b79ac6", gold = "#bfb89e", foam = "#a4d4e4",
  pine = "#b48e7c", mint = "#b5cc98",
  control = "keyword", string = "#94a878", punctuation = "#5d8ca6",
  folder = "violet",
}

M.syntax.frostwood = frostwood
M.syntax.frostwood_sage = vim.tbl_extend("force", frostwood, {
  string = "#8aa894", mint = "#a9cdb6",
})
M.syntax.frostwood_moss_light = vim.tbl_extend("force", frostwood, {
  iris = "#9aa6f5", violet = "#79bde8", lavender = "#a8e0f2",
  love = "#ea7d95", rose = "#c79fe0", foam = "#a8e0f2", mint = "#cfe0b8",
  string = "#b4c59c", punctuation = "#62a0c0",
})
M.syntax.winter_pine = {
  iris = "#94d2ff", violet = "#b9b3da", lavender = "#aec1d6",
  love = "#e599a4", rose = "#d5a7b8", gold = "#e2c18f", foam = "#80d2bc",
  pine = "#d5a7b8", mint = "#80d2bc",
  control = "keyword", string = "#aac9b3", punctuation = "#91c1c8",
  folder = "iris",
}

---@type table<string, { background: string, syntax: string }>
M.list = {
  ["nightbloom-frostwood"] = { background = "frostwood", syntax = "frostwood" },
  ["nightbloom-frostwood-sage"] = { background = "frostwood", syntax = "frostwood_sage" },
  ["nightbloom-frostwood-moss-light"] = { background = "frostwood", syntax = "frostwood_moss_light" },
  ["nightbloom-winter-pine"] = { background = "winter_pine", syntax = "winter_pine" },
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
