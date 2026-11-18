-- Nightbloom palette
-- A blend of Rose Pine and Embark, pushed toward violet.
--
-- Backgrounds are Embark's exactly: base is Embark's space1, and crust,
-- overlay, hl_med and hl_high are its space0, space2, space3 and space4. The
-- in-between steps are blends of those. Accents borrow Rose Pine's soft,
-- desaturated warmth and Embark's brighter pastel glow, leaning purple.

---@class NightbloomPalette
local palette = {
  -- Backgrounds (darkest -> lightest)
  crust    = "#100e23", -- tab fill, deepest surfaces (Embark space0)
  mantle   = "#17152a", -- floats, sidebars, statusline
  base     = "#1e1c31", -- editor background (Embark space1)
  hl_low   = "#242139", -- cursorline, color column
  surface  = "#28243e", -- popup menu, folds
  overlay  = "#2f2a47", -- selected menu item, lualine b (Embark space2)
  hl_med   = "#3e3859", -- match paren, references, whitespace (Embark space3)
  hl_high  = "#585273", -- scrollbar thumb, strong separators (Embark space4)

  -- Foregrounds
  muted    = "#726d96", -- comments
  subtle   = "#9c97c8", -- operators, punctuation, secondary UI text
  text     = "#e3ddf6", -- main text

  -- Purples (the lead accents)
  iris     = "#c9b2ff", -- functions, primary UI accent (Embark purple x Rose Pine iris)
  violet   = "#a98cf6", -- keywords, tag attributes (Embark dark purple, brightened)
  lavender = "#bdb3e8", -- properties / fields

  -- Supporting accents
  love     = "#f27ca5", -- control flow, escapes, macros, tags, errors (Rose Pine love x Embark red)
  rose     = "#f0bdca", -- numbers, booleans, constants, doc-comment params
  gold     = "#f6ca8c", -- strings, decorators, search, warnings (Rose Pine gold x Embark yellow)
  foam     = "#9fdce6", -- types (Rose Pine foam x Embark cyan)
  pine     = "#7b93f2", -- modules, builtins, self/this (Rose Pine pine, shifted to periwinkle)
  mint     = "#9de6cc", -- parameters, git added, success (Embark green)

  -- Optional syntax roles, resolved in init.lua. Unset, they follow the accents:
  --   keyword -> violet   (local, function, import)
  --   control -> love     (if, for, return)
  --   builtin -> pine     (builtin functions, variables and modules: pcall, vim, self)
  --   func    -> iris     (function names)
  --   string  -> gold     (string literals)
  --   type    -> foam     (type names, declarations, builtin types)
  --   property    -> lavender (fields and properties: opts.name)
  --   punctuation -> subtle   (operators, brackets, delimiters)
  --   folder  -> (unset)  (directory names and icons; unset keeps each group's own color)
  -- Set one to a hex color, or to another key here (e.g. keyword = "pine").
}

return palette
