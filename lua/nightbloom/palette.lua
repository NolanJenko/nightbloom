-- Nightbloom palette
-- A blend of Rose Pine and Embark, pushed toward violet.
--
-- Backgrounds are indigo: Embark's blue-violet hue (~246°) with a little more
-- saturation, so the editor reads as deep blue-violet and the purple accents
-- pop against it. Accents borrow Rose Pine's soft, desaturated warmth and
-- Embark's brighter pastel glow.

---@class NightbloomPalette
local palette = {
  -- Backgrounds (darkest -> lightest)
  crust    = "#0d0c1a", -- tab fill, deepest surfaces
  mantle   = "#110f22", -- floats, sidebars, statusline
  base     = "#18152d", -- editor background
  hl_low   = "#1c1a35", -- cursorline, color column
  surface  = "#1f1c38", -- popup menu, folds
  overlay  = "#282447", -- selected menu item, lualine b
  hl_med   = "#353159", -- match paren, references, whitespace
  hl_high  = "#48436f", -- scrollbar thumb, strong separators

  -- Foregrounds
  muted    = "#6b6793", -- comments
  subtle   = "#9994c7", -- operators, punctuation, secondary UI text
  text     = "#e3ddf6", -- main text

  -- Purples (the lead accents)
  iris     = "#c9b2ff", -- functions, primary UI accent (Embark purple x Rose Pine iris)
  violet   = "#a98cf6", -- keywords, tags (Embark dark purple, brightened)
  orchid   = "#e2a7f4", -- constants, escapes, search (pink-leaning purple)
  lavender = "#bdb3e8", -- properties / fields

  -- Supporting accents
  love     = "#f27ca5", -- booleans, errors, builtin vars (Rose Pine love x Embark red)
  rose     = "#f0bdca", -- numbers, parameter names in doc comments
  gold     = "#f6ca8c", -- strings, warnings (Rose Pine gold x Embark yellow)
  foam     = "#9fdce6", -- types (Rose Pine foam x Embark cyan)
  pine     = "#7b93f2", -- modules, builtins (Rose Pine pine, shifted to periwinkle)
  mint     = "#9de6cc", -- parameters, git added, success (Embark green)
}

return palette
