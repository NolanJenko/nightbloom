local nightbloom = require("nightbloom")

return function(name)
  local c = nightbloom.colors(name)
  local bg = nightbloom.config.transparent and "NONE" or c.mantle

  local function mode(accent)
    return {
      a = { fg = c.base, bg = accent, gui = "bold" },
      b = { fg = accent, bg = c.overlay },
      c = { fg = c.subtle, bg = bg },
    }
  end

  return {
    normal   = mode(c.violet),
    insert   = mode(c.foam),
    visual   = mode(c.love),
    replace  = mode(c.pine),
    command  = mode(c.gold),
    terminal = mode(c.mint),
    inactive = {
      a = { fg = c.muted, bg = bg },
      b = { fg = c.muted, bg = bg },
      c = { fg = c.muted, bg = bg },
    },
  }
end
