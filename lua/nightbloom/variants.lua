-- Experimental variants: a background ramp paired with a syntax scheme.
--
-- The two halves are independent, so mixing is a one-word edit in `M.list`.
-- Everything here is a palette override; the stock `nightbloom` is untouched.
--
-- Syntax roles (`keyword`, `control`, `func`) take a hex color or the name of
-- another palette key (`keyword = "love"`, or `control = "keyword"` to share).
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

-- Each scheme avoids pink/red for keywords, control flow and function names,
-- and takes control flow (`if`, `for`, `return`) in the keyword color.
M.syntax = {
  -- Keywords go cornflower blue (shared with builtins like `self` / `vim`);
  -- function names keep their lavender.
  blue = { pine = "#5598f6", keyword = "pine", control = "keyword" },

  -- Stays all-purple, split by lightness: deep indigo `function`, pale
  -- lavender `name`.
  indigo = { keyword = "#8477f3", control = "keyword", func = "#d7c7fe" },

  -- Keywords keep their violet; function names go mint. Parameters move to
  -- foam (see colors/nightbloom-mint.lua) so mint belongs to functions alone.
  mint = { control = "keyword", func = "mint" },

  -- Wider range. Warm keywords against cool function names: the two ends of
  -- the wheel, so they can't blur. Strings leave gold for mint so peach and
  -- gold don't compete; parameters go foam italic (colors/nightbloom-ember.lua).
  ember = { keyword = "#f4a16d", control = "keyword", string = "mint" },

  -- Rose Pine's cool side: teal keywords, lavender names, gold strings. Teal
  -- is darker and more saturated than foam types, so the two stay apart.
  lagoon = { keyword = "#30c6bf", control = "keyword" },

  -- Every accent at ~70% chroma (the Rose Pine half of the blend, less of the
  -- Embark glow), dusty periwinkle keywords in italics, soft lavender names.
  -- Hexes are the stock accents with chroma scaled in OKLCH. Types are the one
  -- saturated note (indigo, as in nightbloom-indigo) and folders a clear blue.
  -- To cut the purple: properties go foam teal and punctuation a cool slate.
  dusty = {
    iris = "#c3b4ea", violet = "#a391da", lavender = "#b9b3d8", love = "#db88a3",
    rose = "#e3bfc8", gold = "#e8caa0", foam = "#acd5dc", pine = "#8193d5",
    mint = "#acdecb",
    keyword = "pine", control = "keyword",
    type = "#8477f3", folder = "#84aee3",
    property = "foam", punctuation = "#90a0b4",
  },
}

---@type table<string, { background: string, syntax: string }>
M.list = {
  ["nightbloom-blue"]   = { background = "stock", syntax = "blue" },
  ["nightbloom-indigo"] = { background = "stock", syntax = "indigo" },
  ["nightbloom-mint"]   = { background = "stock", syntax = "mint" },
  ["nightbloom-ember"]  = { background = "stock", syntax = "ember" },
  ["nightbloom-lagoon"] = { background = "stock", syntax = "lagoon" },
  ["nightbloom-dusty"]  = { background = "stock", syntax = "dusty" },
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
