-- Same statusline as nightbloom, rebuilt against this variant's palette.
-- (Clearing the cache keeps it from reusing whichever variant loaded first.)
package.loaded["lualine.themes.nightbloom"] = nil
return require("lualine.themes.nightbloom")
