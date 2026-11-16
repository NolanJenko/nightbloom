-- Nightbloom palette
-- A blend of Rose Pine and Embark, pushed toward violet.
--
-- Backgrounds sit at hue ~258° (Rose Pine is ~249°, Embark ~246°), so the
-- editor reads as dusky violet rather than navy. Accents borrow Rose Pine's
-- soft, desaturated warmth and Embark's brighter pastel glow.

---@class NightbloomPalette
local palette = {
  -- Backgrounds (darkest -> lightest)
  crust    = "#100c1a", -- tab fill, deepest surfaces
  mantle   = "#150f21", -- floats, sidebars, statusline
  base     = "#1d162d", -- editor background
  hl_low   = "#221a35", -- cursorline, color column
  surface  = "#251c38", -- popup menu, folds
  overlay  = "#2f2546", -- selected menu item, lualine b
  hl_med   = "#3d3258", -- match paren, references, whitespace
  hl_high  = "#51446f", -- scrollbar thumb, strong separators

  -- Foregrounds
  muted    = "#746892", -- comments
  subtle   = "#a295c6", -- operators, punctuation, secondary UI text
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
