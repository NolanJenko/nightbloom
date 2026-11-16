# nightbloom.nvim

A dark Neovim colorscheme that blends **Rose Pine** and **Embark**, leaning into purples.

Rose Pine contributes the soft, slightly dusty accents and the "love / gold / rose / foam / iris"
structure. Embark contributes the brighter pastel glow and its deep space backgrounds. The backgrounds
are indigo: Embark's blue-violet hue (~246°) with a little more saturation, so the purple accents pop
against them. Keywords, functions, the cursor, borders, selection and search all carry a purple tone.

## Palette

| Name       | Hex       | Used for                                   |
|------------|-----------|--------------------------------------------|
| `crust`    | `#0d0c1a` | tab fill                                   |
| `mantle`   | `#110f22` | floats, sidebars, statusline               |
| `base`     | `#18152d` | editor background                          |
| `hl_low`   | `#1c1a35` | cursorline                                 |
| `surface`  | `#1f1c38` | popup menu, folds                          |
| `overlay`  | `#282447` | selected menu item                         |
| `hl_med`   | `#353159` | match paren, LSP references                |
| `hl_high`  | `#48436f` | scrollbar thumb                            |
| `muted`    | `#6b6793` | comments                                   |
| `subtle`   | `#9994c7` | operators, punctuation                     |
| `text`     | `#e3ddf6` | text                                       |
| `iris`     | `#c9b2ff` | functions, primary accent                  |
| `violet`   | `#a98cf6` | keywords, tags                             |
| `orchid`   | `#e2a7f4` | constants, escapes, search                 |
| `lavender` | `#bdb3e8` | properties / fields                        |
| `love`     | `#f27ca5` | booleans, `self`/`this`, errors            |
| `rose`     | `#f0bdca` | numbers, parameter names in doc comments   |
| `gold`     | `#f6ca8c` | strings, warnings                          |
| `foam`     | `#9fdce6` | types (and parameters in `nightbloom-foam`) |
| `pine`     | `#7b93f2` | modules, builtin functions                 |
| `mint`     | `#9de6cc` | parameters, git added, success             |

## Variants

| Colorscheme       | Parameters                                   |
|-------------------|----------------------------------------------|
| `nightbloom`      | mint italic                                  |
| `nightbloom-foam` | foam italic (same hue as types; italic tells them apart) |

Everything else is identical. Switch with `:colorscheme nightbloom-foam`, or set
`parameter_color = "foam"` in `setup()` and keep using `nightbloom`.

## Install

The repo is a standard Neovim plugin layout, so any plugin manager works.

**lazy.nvim** (local folder):

```lua
{
  dir = "~/path/to/nightbloom.nvim", -- or "<you>/nightbloom.nvim" once it's on GitHub
  lazy = false,
  priority = 1000,
  config = function()
    require("nightbloom").setup({})
    vim.cmd.colorscheme("nightbloom")
  end,
}
```

**Without a plugin manager**, copy the folder anywhere and add it to your runtimepath:

```lua
vim.opt.rtp:prepend("~/path/to/nightbloom.nvim")
vim.cmd.colorscheme("nightbloom")
```

## Options

These are the defaults:

```lua
require("nightbloom").setup({
  transparent = false,     -- leave editor/float backgrounds unpainted
  dim_inactive = false,    -- darker background for unfocused windows
  terminal_colors = true,  -- set :terminal ANSI colors
  parameter_color = "mint", -- any palette key ("foam", "rose", ...) or a hex color
  styles = {
    comments = { italic = true },
    keywords = {},           -- e.g. { italic = true } or { bold = true }
    functions = {},
    parameters = { italic = true },
    strings = {},
    types = {},
  },
  on_colors = function(colors) end,           -- tweak the palette
  on_highlights = function(hl, colors) end,  -- tweak or add groups
})
```

Examples:

```lua
require("nightbloom").setup({
  styles = { keywords = { italic = true } },
  on_colors = function(c)
    c.base = "#1a1428" -- even darker background
  end,
  on_highlights = function(hl, c)
    hl.CursorLine = { bg = c.surface }
    hl["@keyword.return"] = { fg = c.love, italic = true }
  end,
})
```

## Lualine

```lua
require("lualine").setup({ options = { theme = "nightbloom" } })
```

Modes: normal = violet, insert = foam, visual = orchid, replace = love, command = gold,
terminal = mint.

## Supported plugins

Treesitter (current and legacy captures), LSP semantic tokens, diagnostics, gitsigns, telescope,
snacks.nvim (picker, indent, dashboard), nvim-cmp, blink.cmp, nvim-tree, neo-tree, oil, which-key,
indent-blankline, mini.indentscope, lazy.nvim, mason, nvim-notify, noice, flash, treesitter-context,
rainbow-delimiters, vim-illuminate, trouble, fidget, nvim-dap, alpha, dashboard.
