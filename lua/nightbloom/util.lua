local M = {}

local function rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

--- Mix `fg` over `bg`. alpha = 1 returns fg, alpha = 0 returns bg.
---@param fg string hex color
---@param bg string hex color
---@param alpha number 0..1
---@return string
function M.blend(fg, bg, alpha)
  local fr, fgr, fb = rgb(fg)
  local br, bgr, bb = rgb(bg)
  local function mix(a, b)
    return math.floor(a * alpha + b * (1 - alpha) + 0.5)
  end
  return string.format("#%02x%02x%02x", mix(fr, br), mix(fgr, bgr), mix(fb, bb))
end

return M
