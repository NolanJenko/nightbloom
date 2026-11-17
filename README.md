# nightbloom.nvim

A dark Neovim colorscheme that blends **Rose Pine** and **Embark**, leaning into purples.

Rose Pine contributes the soft, slightly dusty accents and the "love / gold / rose / foam / iris"
structure. Embark contributes the brighter pastel glow and its backgrounds: the editor background is
Embark's exactly (`#1e1c31`), and the surrounding shades use Embark's own space colors. Keywords,
functions, the cursor, borders, selection and search all carry a purple tone.

## Palette

| Name       | Hex       | Used for                                   |
|------------|-----------|--------------------------------------------|
| `crust`    | `#100e23` | tab fill (Embark `space0`)                 |
| `mantle`   | `#17152a` | floats, sidebars, statusline               |
| `base`     | `#1e1c31` | editor background (Embark `space1`)       |
| `hl_low`   | `#242139` | cursorline                                 |
| `surface`  | `#28243e` | popup menu, folds                          |
| `overlay`  | `#2f2a47` | selected menu item (Embark `space2`)       |
| `hl_med`   | `#3e3859` | match paren, LSP references (Embark `space3`) |
| `hl_high`  | `#585273` | scrollbar thumb (Embark `space4`)          |
| `muted`    | `#726d96` | comments                                   |
| `subtle`   | `#9c97c8` | operators, punctuation                     |
| `text`     | `#e3ddf6` | text                                       |
| `iris`     | `#c9b2ff` | functions, methods, primary accent         |
| `violet`   | `#a98cf6` | keywords (`local`, `function`, `import`), tag attributes|
| `lavender` | `#bdb3e8` | properties / fields                        |
| `love`     | `#f27ca5` | control flow (`if`, `for`, `return`), escapes, macros, tags, errors|
| `rose`     | `#f0bdca` | numbers, booleans, constants, doc-comment params|
| `gold`     | `#f6ca8c` | strings, decorators, search, warnings      |
| `foam`     | `#9fdce6` | types (and parameters in `nightbloom-foam`) |
| `pine`     | `#7b93f2` | modules, builtin functions, `self`/`this`  |
| `mint`     | `#9de6cc` | parameters, git added, success             |

## Variants

| Colorscheme       | Parameters                                   |
|-------------------|----------------------------------------------|
| `nightbloom`      | mint italic                                  |
| `nightbloom-foam` | foam italic (same hue as types; italic tells them apart) |

Everything else is identical. Switch with `:colorscheme nightbloom-foam`, or set
`parameter_color = "foam"` in `setup()` and keep using `nightbloom`.

### Experimental: keyword / function-name variants

In `nightbloom`, keywords (`violet`, hue 295°) and function names (`iris`, hue 298°) are the same
hue and differ only in brightness, so `function` and `setup` blur together. These variants pull them
apart on the same background. None of them uses pink or red for keywords, control flow or function
names; `if` / `for` / `return` take the keyword color instead of `love`. Try one with
`:colorscheme nightbloom-blue` (etc.), then keep it.

| Colorscheme         | `local` / `function` / `if` / `return` | Function names      | Parameters   |
|---------------------|----------------------------------------|---------------------|--------------|
| `nightbloom-blue`   | cornflower `#5598f6` (shared with builtins like `vim`, `self`) | lavender `#c9b2ff` | mint italic |
| `nightbloom-indigo` | deep indigo `#8477f3`                  | pale lavender `#d7c7fe` | mint italic |
| `nightbloom-mint`   | violet `#a98cf6` (unchanged)           | mint `#9de6cc`      | foam italic  |
| `nightbloom-ember`  | warm peach `#f4a16d`                   | lavender `#c9b2ff`  | foam italic  |
| `nightbloom-lagoon` | teal `#30c6bf`                         | lavender `#c9b2ff`  | mint italic  |
| `nightbloom-dusty`  | dusty periwinkle `#8193d5`, italic     | soft lavender `#c3b4ea` | mint italic |

`ember`, `lagoon` and `dusty` are the wider-range ones. `ember` also moves strings from gold to mint so
they don't compete with the peach. `dusty` lowers every accent to about 70% of its chroma, the Rose
Pine half of the blend with less of the Embark glow. It then adds two accents of its own: types, type
declarations and builtin types in bright indigo `#8477f3`, and folders (tree, oil, `Directory`) in
blue `#84aee3`. To balance the purple, properties and fields are foam teal and punctuation and
operators a cool slate `#90a0b4`.

The background and the syntax scheme are independent halves defined in
[`lua/nightbloom/variants.lua`](lua/nightbloom/variants.lua). A second background, `dusk` (Rose
Pine's own `#191724`), is defined but unused; to try it with one of the schemes, change one word in
`M.list`:

```lua
["nightbloom-blue"] = { background = "dusk", syntax = "blue" },
```

While comparing, use `theme = "auto"` in lualine so the statusline follows whichever one is active.

### Syntax roles

Optional palette keys let you recolor keywords, function names, strings, types and folders without
touching the accents they borrow from. Unset, they follow the accents below, so the stock theme is
unchanged:

| Key       | Default  | Used for                                   |
|-----------|----------|--------------------------------------------|
| `keyword` | `violet` | `local`, `function`, `import`, preprocessor |
| `control` | `love`   | `if`, `for`, `return`, `try`/`catch`        |
| `func`    | `iris`   | function and method names                   |
| `string`  | `gold`   | string literals                             |
| `type`    | `foam`   | type names, declarations, builtin types, constructors |
| `property` | `lavender` | fields and properties (`opts.name`)       |
| `punctuation` | `subtle` | operators, brackets, delimiters         |
| `folder`  | none     | directory names and icons (nvim-tree, neo-tree, oil, `Directory`); unset keeps each group's own color |

Each takes a hex color or another palette key, e.g. `on_colors = function(c) c.keyword = "pine" end`.

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
  parameter_color = "mint", -- any palette key ("foam", "gold", ...) or a hex color
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

Modes: normal = violet, insert = foam, visual = love, replace = pine, command = gold,
terminal = mint.

## Supported plugins

Treesitter (current and legacy captures), LSP semantic tokens, diagnostics, gitsigns, telescope,
snacks.nvim (picker, indent, dashboard), nvim-cmp, blink.cmp, nvim-tree, neo-tree, oil, which-key,
indent-blankline, mini.indentscope, lazy.nvim, mason, nvim-notify, noice, flash, treesitter-context,
rainbow-delimiters, vim-illuminate, trouble, fidget, nvim-dap, alpha, dashboard.
