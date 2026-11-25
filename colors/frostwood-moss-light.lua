-- frostwood-moss-light.lua — a winter forest night colorscheme for Neovim
-- Inspired by Rosé Pine and Embark: soft, low-glare, a little dreamy,
-- but colder: blue-green night sky, snow text, pine and frost accents,
-- with one warm "cabin window" ember for contrast.
--
-- Install: save as ~/.config/nvim/colors/frostwood-moss-light.lua
-- Use:     :colorscheme frostwood-moss-light   (or vim.cmd.colorscheme("frostwood-moss-light"))
--
-- Options (set before loading):
--   vim.g.frostwood_transparent = true   -- no background fill
--   vim.g.frostwood_italics = false      -- disable italics

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "frostwood-moss-light"

local p = {
  -- the night
  abyss   = "#090d10", -- darkest: floats' shadow, statusline ends
  night   = "#0e1418", -- main background: sky between the trees
  bark    = "#141c21", -- raised surfaces: floats, sidebars
  shade   = "#1b252b", -- cursorline, popup menus
  thicket = "#243139", -- selections, borders
  mist    = "#32434c", -- stronger borders, indent guides
  -- the snow
  fog     = "#667c86", -- comments, line numbers
  slate   = "#8a9da6", -- punctuation, subtle text
  snow    = "#d5e0e4", -- main text
  drift   = "#eef4f6", -- brightest: emphasis, cursor
  -- the forest
  pine    = "#b4c59c", -- strings
  spruce  = "#62a0c0", -- operators (now a steel blue-teal)
  aurora  = "#cfe0b8", -- success, insert mode, small accents
  indigo  = "#9aa6f5", -- functions
  frost   = "#a8e0f2", -- types, properties
  ice     = "#79bde8", -- keywords
  dusk    = "#c79fe0", -- constants, numbers (mauve)
  moon    = "#bfb89e", -- warnings, search, parameters
  ember   = "#b48e7c", -- builtins, special
  berry   = "#ea7d95", -- errors, deletions
}

local transparent = vim.g.frostwood_transparent == true
local italic = vim.g.frostwood_italics ~= false
local bg = transparent and "NONE" or p.night
local float_bg = transparent and "NONE" or p.bark

local function hl(group, spec)
  if spec.italic and not italic then
    spec.italic = false
  end
  vim.api.nvim_set_hl(0, group, spec)
end

local groups = {
  ---------------------------------------------------------------- editor UI
  Normal        = { fg = p.snow, bg = bg },
  NormalNC      = { fg = p.snow, bg = bg },
  NormalFloat   = { fg = p.snow, bg = float_bg },
  FloatBorder   = { fg = p.mist, bg = float_bg },
  FloatTitle    = { fg = p.frost, bg = float_bg, bold = true },
  ColorColumn   = { bg = p.bark },
  Conceal       = { fg = p.fog },
  Cursor        = { fg = p.night, bg = p.drift },
  lCursor       = { link = "Cursor" },
  CursorIM      = { link = "Cursor" },
  CursorLine    = { bg = p.shade },
  CursorColumn  = { bg = p.shade },
  CursorLineNr  = { fg = p.moon, bold = true },
  LineNr        = { fg = p.mist },
  LineNrAbove   = { fg = p.mist },
  LineNrBelow   = { fg = p.mist },
  SignColumn    = { fg = p.fog, bg = bg },
  FoldColumn    = { fg = p.fog, bg = bg },
  Folded        = { fg = p.slate, bg = p.bark, italic = true },
  VertSplit     = { fg = p.thicket },
  WinSeparator  = { fg = p.thicket },
  EndOfBuffer   = { fg = p.night },
  NonText       = { fg = p.mist },
  Whitespace    = { fg = p.thicket },
  SpecialKey    = { fg = p.mist },
  Directory     = { fg = p.ice },
  Title         = { fg = p.frost, bold = true },
  MatchParen    = { fg = p.moon, bg = p.thicket, bold = true },
  Visual        = { bg = p.thicket },
  VisualNOS     = { bg = p.thicket },
  Search        = { fg = p.night, bg = p.moon },
  IncSearch     = { fg = p.night, bg = p.ember },
  CurSearch     = { fg = p.night, bg = p.ember },
  Substitute    = { fg = p.night, bg = p.berry },
  QuickFixLine  = { bg = p.shade, bold = true },
  ModeMsg       = { fg = p.slate },
  MsgArea       = { fg = p.snow },
  MoreMsg       = { fg = p.aurora },
  Question      = { fg = p.aurora },
  ErrorMsg      = { fg = p.berry },
  WarningMsg    = { fg = p.moon },
  Pmenu         = { fg = p.snow, bg = p.bark },
  PmenuSel      = { fg = p.drift, bg = p.thicket, bold = true },
  PmenuSbar     = { bg = p.shade },
  PmenuThumb    = { bg = p.mist },
  PmenuKind     = { fg = p.frost, bg = p.bark },
  PmenuExtra    = { fg = p.fog, bg = p.bark },
  WildMenu      = { link = "PmenuSel" },
  StatusLine    = { fg = p.snow, bg = p.bark },
  StatusLineNC  = { fg = p.fog, bg = p.abyss },
  TabLine       = { fg = p.fog, bg = p.abyss },
  TabLineFill   = { bg = p.abyss },
  TabLineSel    = { fg = p.drift, bg = bg, bold = true },
  WinBar        = { fg = p.slate, bg = bg },
  WinBarNC      = { fg = p.fog, bg = bg },
  SpellBad      = { sp = p.berry, undercurl = true },
  SpellCap      = { sp = p.moon, undercurl = true },
  SpellLocal    = { sp = p.frost, undercurl = true },
  SpellRare     = { sp = p.dusk, undercurl = true },

  DiffAdd       = { bg = "#16261f" },
  DiffChange    = { bg = "#17232c" },
  DiffDelete    = { fg = p.berry, bg = "#2a1a20" },
  DiffText      = { bg = "#24394a", bold = true },
  Added         = { fg = p.pine },
  Changed       = { fg = p.ice },
  Removed       = { fg = p.berry },
  diffAdded     = { fg = p.pine },
  diffRemoved   = { fg = p.berry },
  diffChanged   = { fg = p.ice },
  diffFile      = { fg = p.frost, bold = true },
  diffLine      = { fg = p.dusk },

  ---------------------------------------------------------------- syntax
  Comment       = { fg = p.fog, italic = true },
  Constant      = { fg = p.dusk },
  String        = { fg = p.pine },
  Character     = { fg = p.pine },
  Number        = { fg = p.dusk },
  Float         = { fg = p.dusk },
  Boolean       = { fg = p.dusk, italic = true },
  Identifier    = { fg = p.snow },
  Function      = { fg = p.indigo },
  Statement     = { fg = p.ice },
  Conditional   = { fg = p.ice },
  Repeat        = { fg = p.ice },
  Label         = { fg = p.ice },
  Operator      = { fg = p.spruce },
  Keyword       = { fg = p.ice, italic = true },
  Exception     = { fg = p.berry },
  PreProc       = { fg = p.ember },
  Include       = { fg = p.ice },
  Define        = { fg = p.ember },
  Macro         = { fg = p.ember },
  PreCondit     = { fg = p.ember },
  Type          = { fg = p.frost },
  StorageClass  = { fg = p.ice },
  Structure     = { fg = p.frost },
  Typedef       = { fg = p.frost },
  Special       = { fg = p.ember },
  SpecialChar   = { fg = p.ember },
  Tag           = { fg = p.ice },
  Delimiter     = { fg = p.slate },
  SpecialComment = { fg = p.slate, italic = true },
  Debug         = { fg = p.berry },
  Underlined    = { fg = p.frost, underline = true },
  Ignore        = { fg = p.mist },
  Error         = { fg = p.berry },
  Todo          = { fg = p.night, bg = p.moon, bold = true },

  ---------------------------------------------------------------- treesitter
  ["@variable"]                 = { fg = p.snow },
  ["@variable.builtin"]         = { fg = p.ember, italic = true },
  ["@variable.parameter"]       = { fg = p.moon },
  ["@variable.member"]          = { fg = p.frost },
  ["@property"]                 = { fg = p.frost },
  ["@constant"]                 = { fg = p.dusk },
  ["@constant.builtin"]         = { fg = p.dusk, italic = true },
  ["@constant.macro"]           = { fg = p.ember },
  ["@module"]                   = { fg = p.slate },
  ["@label"]                    = { fg = p.ice },
  ["@string"]                   = { fg = p.pine },
  ["@string.escape"]            = { fg = p.ember },
  ["@string.regexp"]            = { fg = p.ember },
  ["@string.special"]           = { fg = p.ember },
  ["@string.special.url"]       = { fg = p.frost, underline = true },
  ["@character"]                = { fg = p.pine },
  ["@number"]                   = { fg = p.dusk },
  ["@boolean"]                  = { fg = p.dusk, italic = true },
  ["@type"]                     = { fg = p.frost },
  ["@type.builtin"]             = { fg = p.frost, italic = true },
  ["@attribute"]                = { fg = p.ember },
  ["@function"]                 = { fg = p.indigo },
  ["@function.builtin"]         = { fg = p.ember },
  ["@function.call"]            = { fg = p.indigo },
  ["@function.macro"]           = { fg = p.ember },
  ["@function.method"]          = { fg = p.indigo },
  ["@function.method.call"]     = { fg = p.indigo },
  ["@constructor"]              = { fg = p.frost },
  ["@operator"]                 = { fg = p.spruce },
  ["@keyword"]                  = { fg = p.ice, italic = true },
  ["@keyword.function"]         = { fg = p.ice, italic = true },
  ["@keyword.operator"]         = { fg = p.ice },
  ["@keyword.return"]           = { fg = p.ice, italic = true },
  ["@keyword.import"]           = { fg = p.ice },
  ["@keyword.exception"]        = { fg = p.berry },
  ["@keyword.conditional"]      = { fg = p.ice },
  ["@keyword.repeat"]           = { fg = p.ice },
  ["@punctuation.delimiter"]    = { fg = p.slate },
  ["@punctuation.bracket"]      = { fg = p.slate },
  ["@punctuation.special"]      = { fg = p.spruce },
  ["@comment"]                  = { link = "Comment" },
  ["@comment.todo"]             = { fg = p.night, bg = p.moon, bold = true },
  ["@comment.note"]             = { fg = p.night, bg = p.frost, bold = true },
  ["@comment.warning"]          = { fg = p.night, bg = p.ember, bold = true },
  ["@comment.error"]            = { fg = p.night, bg = p.berry, bold = true },
  ["@tag"]                      = { fg = p.ice },
  ["@tag.attribute"]            = { fg = p.frost, italic = true },
  ["@tag.delimiter"]            = { fg = p.slate },
  ["@markup.heading"]           = { fg = p.frost, bold = true },
  ["@markup.heading.1"]         = { fg = p.frost, bold = true },
  ["@markup.heading.2"]         = { fg = p.aurora, bold = true },
  ["@markup.heading.3"]         = { fg = p.ice, bold = true },
  ["@markup.heading.4"]         = { fg = p.dusk, bold = true },
  ["@markup.heading.5"]         = { fg = p.moon, bold = true },
  ["@markup.heading.6"]         = { fg = p.ember, bold = true },
  ["@markup.strong"]            = { fg = p.drift, bold = true },
  ["@markup.italic"]            = { italic = true },
  ["@markup.strikethrough"]     = { strikethrough = true },
  ["@markup.underline"]         = { underline = true },
  ["@markup.quote"]             = { fg = p.slate, italic = true },
  ["@markup.link"]              = { fg = p.ice },
  ["@markup.link.label"]        = { fg = p.ice },
  ["@markup.link.url"]          = { fg = p.frost, underline = true },
  ["@markup.raw"]               = { fg = p.pine },
  ["@markup.list"]              = { fg = p.spruce },
  ["@markup.list.checked"]      = { fg = p.aurora },
  ["@markup.list.unchecked"]    = { fg = p.fog },
  ["@diff.plus"]                = { fg = p.pine },
  ["@diff.minus"]               = { fg = p.berry },
  ["@diff.delta"]               = { fg = p.ice },

  ---------------------------------------------------------------- LSP
  ["@lsp.type.namespace"]       = { link = "@module" },
  ["@lsp.type.parameter"]       = { link = "@variable.parameter" },
  ["@lsp.type.property"]        = { link = "@property" },
  ["@lsp.type.variable"]        = {}, -- defer to treesitter
  ["@lsp.type.enumMember"]      = { link = "@constant" },
  ["@lsp.type.macro"]           = { link = "@function.macro" },
  ["@lsp.type.decorator"]       = { link = "@attribute" },
  ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
  ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.variable.readonly"]       = { link = "@constant" },

  -- Lean: bound variables and hypotheses (n, h, x…) in moss green.
  -- Scoped with ".lean", so other languages keep snow-white variables.
  ["@lsp.type.variable.lean"]   = { fg = p.pine },
  LspReferenceText              = { bg = p.thicket },
  LspReferenceRead              = { bg = p.thicket },
  LspReferenceWrite             = { bg = p.thicket, underline = true },
  LspInlayHint                  = { fg = p.fog, bg = p.bark, italic = true },
  LspCodeLens                   = { fg = p.fog, italic = true },
  LspSignatureActiveParameter   = { fg = p.moon, bold = true, underline = true },

  DiagnosticError               = { fg = p.berry },
  DiagnosticWarn                = { fg = p.moon },
  DiagnosticInfo                = { fg = p.frost },
  DiagnosticHint                = { fg = p.dusk },
  DiagnosticOk                  = { fg = p.aurora },
  DiagnosticVirtualTextError    = { fg = p.berry, bg = "#221a20" },
  DiagnosticVirtualTextWarn     = { fg = p.moon, bg = "#222320" },
  DiagnosticVirtualTextInfo     = { fg = p.frost, bg = "#17232a" },
  DiagnosticVirtualTextHint     = { fg = p.dusk, bg = "#1b1e2b" },
  DiagnosticUnderlineError      = { sp = p.berry, undercurl = true },
  DiagnosticUnderlineWarn       = { sp = p.moon, undercurl = true },
  DiagnosticUnderlineInfo       = { sp = p.frost, undercurl = true },
  DiagnosticUnderlineHint       = { sp = p.dusk, undercurl = true },
  DiagnosticUnnecessary         = { fg = p.fog },
  DiagnosticDeprecated          = { fg = p.fog, strikethrough = true },

  ---------------------------------------------------------------- plugins
  -- gitsigns
  GitSignsAdd                   = { fg = p.pine },
  GitSignsChange                = { fg = p.ice },
  GitSignsDelete                = { fg = p.berry },
  GitSignsCurrentLineBlame      = { fg = p.fog, italic = true },

  -- telescope
  TelescopeNormal               = { fg = p.snow, bg = float_bg },
  TelescopeBorder               = { fg = p.mist, bg = float_bg },
  TelescopeTitle                = { fg = p.frost, bold = true },
  TelescopePromptPrefix         = { fg = p.ember },
  TelescopeSelection            = { fg = p.drift, bg = p.thicket },
  TelescopeSelectionCaret       = { fg = p.ember, bg = p.thicket },
  TelescopeMatching             = { fg = p.moon, bold = true },

  -- fzf-lua / snacks picker share float groups; a few explicit ones:
  FzfLuaBorder                  = { link = "FloatBorder" },
  FzfLuaTitle                   = { link = "FloatTitle" },
  SnacksPickerMatch             = { fg = p.moon, bold = true },
  SnacksPickerDir               = { fg = p.fog },
  SnacksIndent                  = { fg = p.shade },
  SnacksIndentScope             = { fg = p.mist },

  -- nvim-cmp
  CmpItemAbbr                   = { fg = p.snow },
  CmpItemAbbrDeprecated         = { fg = p.fog, strikethrough = true },
  CmpItemAbbrMatch              = { fg = p.moon, bold = true },
  CmpItemAbbrMatchFuzzy         = { fg = p.moon, bold = true },
  CmpItemMenu                   = { fg = p.fog, italic = true },
  CmpItemKind                   = { fg = p.frost },
  CmpItemKindFunction           = { fg = p.indigo },
  CmpItemKindMethod             = { fg = p.indigo },
  CmpItemKindKeyword            = { fg = p.ice },
  CmpItemKindVariable           = { fg = p.snow },
  CmpItemKindConstant           = { fg = p.dusk },
  CmpItemKindSnippet            = { fg = p.ember },
  CmpItemKindText               = { fg = p.pine },

  -- blink.cmp
  BlinkCmpMenu                  = { link = "Pmenu" },
  BlinkCmpMenuBorder            = { link = "FloatBorder" },
  BlinkCmpMenuSelection         = { link = "PmenuSel" },
  BlinkCmpLabelMatch            = { fg = p.moon, bold = true },
  BlinkCmpLabelDeprecated       = { fg = p.fog, strikethrough = true },
  BlinkCmpKind                  = { fg = p.frost },
  BlinkCmpGhostText             = { fg = p.fog, italic = true },

  -- neo-tree / nvim-tree
  NeoTreeNormal                 = { fg = p.snow, bg = float_bg },
  NeoTreeNormalNC               = { fg = p.snow, bg = float_bg },
  NeoTreeDirectoryName          = { fg = p.ice },
  NeoTreeDirectoryIcon          = { fg = p.spruce },
  NeoTreeRootName               = { fg = p.frost, bold = true },
  NeoTreeGitAdded               = { fg = p.pine },
  NeoTreeGitModified            = { fg = p.ice },
  NeoTreeGitDeleted             = { fg = p.berry },
  NeoTreeGitUntracked           = { fg = p.moon },
  NeoTreeIndentMarker           = { fg = p.thicket },
  NvimTreeNormal                = { fg = p.snow, bg = float_bg },
  NvimTreeFolderName            = { fg = p.ice },
  NvimTreeOpenedFolderName      = { fg = p.ice, bold = true },
  NvimTreeFolderIcon            = { fg = p.spruce },
  NvimTreeRootFolder            = { fg = p.frost, bold = true },
  NvimTreeIndentMarker          = { fg = p.thicket },
  NvimTreeGitDirty              = { fg = p.ice },
  NvimTreeGitNew                = { fg = p.pine },
  NvimTreeGitDeleted            = { fg = p.berry },

  -- indent-blankline / mini.indentscope
  IblIndent                     = { fg = p.shade },
  IblScope                      = { fg = p.mist },
  MiniIndentscopeSymbol         = { fg = p.mist },

  -- which-key
  WhichKey                      = { fg = p.indigo },
  WhichKeyGroup                 = { fg = p.ice },
  WhichKeyDesc                  = { fg = p.snow },
  WhichKeySeparator             = { fg = p.fog },

  -- lazy.nvim / mason
  LazyH1                        = { fg = p.night, bg = p.frost, bold = true },
  LazyButton                    = { fg = p.snow, bg = p.shade },
  LazyButtonActive              = { fg = p.night, bg = p.aurora, bold = true },
  LazySpecial                   = { fg = p.ember },
  MasonHeader                   = { fg = p.night, bg = p.frost, bold = true },
  MasonHighlight                = { fg = p.aurora },
  MasonHighlightBlock           = { fg = p.night, bg = p.aurora },
  MasonHighlightBlockBold       = { fg = p.night, bg = p.aurora, bold = true },

  -- flash / leap / hop
  FlashLabel                    = { fg = p.night, bg = p.ember, bold = true },
  FlashMatch                    = { fg = p.frost, bg = p.thicket },
  FlashCurrent                  = { fg = p.night, bg = p.moon },
  LeapLabel                     = { fg = p.night, bg = p.ember, bold = true },
  HopNextKey                    = { fg = p.ember, bold = true },
  HopNextKey1                   = { fg = p.frost, bold = true },
  HopNextKey2                   = { fg = p.spruce },

  -- notify / noice
  NotifyERRORBorder             = { fg = p.berry },
  NotifyWARNBorder              = { fg = p.moon },
  NotifyINFOBorder              = { fg = p.frost },
  NotifyDEBUGBorder             = { fg = p.fog },
  NotifyTRACEBorder             = { fg = p.dusk },
  NotifyERRORTitle              = { fg = p.berry },
  NotifyWARNTitle               = { fg = p.moon },
  NotifyINFOTitle               = { fg = p.frost },
  NotifyDEBUGTitle              = { fg = p.fog },
  NotifyTRACETitle              = { fg = p.dusk },
  NoiceCmdlinePopupBorder       = { fg = p.mist },
  NoiceCmdlineIcon              = { fg = p.ember },

  -- mini.statusline (lualine's "auto" theme picks up StatusLine etc.)
  MiniStatuslineModeNormal      = { fg = p.night, bg = p.frost, bold = true },
  MiniStatuslineModeInsert      = { fg = p.night, bg = p.aurora, bold = true },
  MiniStatuslineModeVisual      = { fg = p.night, bg = p.dusk, bold = true },
  MiniStatuslineModeReplace     = { fg = p.night, bg = p.berry, bold = true },
  MiniStatuslineModeCommand     = { fg = p.night, bg = p.ember, bold = true },
  MiniStatuslineModeOther       = { fg = p.night, bg = p.spruce, bold = true },
  MiniStatuslineDevinfo         = { fg = p.snow, bg = p.thicket },
  MiniStatuslineFilename        = { fg = p.slate, bg = p.bark },
  MiniStatuslineFileinfo        = { fg = p.snow, bg = p.thicket },
  MiniStatuslineInactive        = { fg = p.fog, bg = p.abyss },

  -- treesitter-context
  TreesitterContext             = { bg = p.bark },
  TreesitterContextLineNumber   = { fg = p.fog, bg = p.bark },
  TreesitterContextBottom       = { sp = p.thicket, underline = true },

  -- render-markdown / headlines
  RenderMarkdownCode            = { bg = p.bark },
  RenderMarkdownH1Bg            = { bg = "#17232a" },
  RenderMarkdownH2Bg            = { bg = "#16261f" },
}

for group, spec in pairs(groups) do
  hl(group, spec)
end

-- :terminal colors
local term = {
  p.shade, p.berry, p.pine, p.moon, p.ice, p.dusk, p.spruce, p.snow,
  p.fog, p.berry, p.aurora, p.ember, p.frost, p.dusk, p.aurora, p.drift,
}
for i, color in ipairs(term) do
  vim.g["terminal_color_" .. (i - 1)] = color
end
