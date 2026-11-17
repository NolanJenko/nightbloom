local blend = require("nightbloom.util").blend

local M = {}

local function style(spec, extra)
  return vim.tbl_extend("force", spec, extra or {})
end

---@param c NightbloomPalette
---@param o NightbloomConfig
---@return table<string, table>
function M.get(c, o)
  local s = o.styles
  local none = "NONE"
  local bg = o.transparent and none or c.base
  local float_bg = o.transparent and none or c.mantle
  local nc_bg = o.transparent and none or (o.dim_inactive and c.mantle or c.base)
  local bar_bg = o.transparent and none or c.mantle
  local param = c[o.parameter_color] or o.parameter_color or c.mint

  -- Derived tints
  local d = {
    border    = blend(c.violet, c.base, 0.45),
    linenr    = blend(c.muted, c.base, 0.75),
    selection = blend(c.iris, c.base, 0.22),
    indent    = blend(c.hl_med, c.base, 0.60),
    diff_add  = blend(c.mint, c.base, 0.14),
    diff_del  = blend(c.love, c.base, 0.14),
    diff_chg  = blend(c.violet, c.base, 0.14),
    diff_text = blend(c.violet, c.base, 0.32),
    err_bg    = blend(c.love, c.base, 0.10),
    warn_bg   = blend(c.gold, c.base, 0.10),
    info_bg   = blend(c.foam, c.base, 0.10),
    hint_bg   = blend(c.iris, c.base, 0.10),
    ok_bg     = blend(c.mint, c.base, 0.10),
  }

  local g = {
    ---------------------------------------------------------------- Editor UI
    Normal       = { fg = c.text, bg = bg },
    NormalNC     = { fg = c.text, bg = nc_bg },
    NormalFloat  = { fg = c.text, bg = float_bg },
    FloatBorder  = { fg = d.border, bg = float_bg },
    FloatTitle   = { fg = c.iris, bg = float_bg, bold = true },
    FloatFooter  = { fg = c.subtle, bg = float_bg },
    ColorColumn  = { bg = c.hl_low },
    Conceal      = { fg = c.muted },
    Cursor       = { fg = c.base, bg = c.iris },
    lCursor      = { link = "Cursor" },
    CursorIM     = { link = "Cursor" },
    TermCursor   = { fg = c.base, bg = c.iris },
    CursorLine   = { bg = c.hl_low },
    CursorColumn = { bg = c.hl_low },
    CursorLineNr = { fg = c.iris, bold = true },
    LineNr       = { fg = d.linenr },
    LineNrAbove  = { link = "LineNr" },
    LineNrBelow  = { link = "LineNr" },
    SignColumn   = { fg = c.subtle, bg = bg },
    FoldColumn   = { fg = c.muted, bg = bg },
    Folded       = { fg = c.subtle, bg = c.surface, italic = true },
    WinSeparator = { fg = c.hl_med, bg = none },
    VertSplit    = { link = "WinSeparator" },
    StatusLine   = { fg = c.subtle, bg = bar_bg },
    StatusLineNC = { fg = c.muted, bg = bar_bg },
    WinBar       = { fg = c.subtle, bg = bg },
    WinBarNC     = { fg = c.muted, bg = bg },
    TabLine      = { fg = c.muted, bg = bar_bg },
    TabLineFill  = { bg = o.transparent and none or c.crust },
    TabLineSel   = { fg = c.iris, bg = c.base, bold = true },
    Pmenu        = { fg = c.subtle, bg = c.surface },
    PmenuSel     = { fg = c.text, bg = c.overlay, bold = true },
    PmenuSbar    = { bg = c.surface },
    PmenuThumb   = { bg = c.hl_high },
    PmenuKind    = { fg = c.violet, bg = c.surface },
    PmenuKindSel = { fg = c.iris, bg = c.overlay },
    PmenuExtra   = { fg = c.muted, bg = c.surface },
    PmenuExtraSel = { fg = c.subtle, bg = c.overlay },
    PmenuMatch   = { fg = c.iris, bg = c.surface, bold = true },
    PmenuMatchSel = { fg = c.iris, bg = c.overlay, bold = true },
    WildMenu     = { link = "PmenuSel" },
    Visual       = { bg = d.selection },
    VisualNOS    = { link = "Visual" },
    Search       = { fg = c.gold, bg = c.hl_med, bold = true },
    IncSearch    = { fg = c.base, bg = c.gold, bold = true },
    CurSearch    = { link = "IncSearch" },
    Substitute   = { fg = c.base, bg = c.love },
    MatchParen   = { fg = c.iris, bg = c.hl_med, bold = true },
    NonText      = { fg = c.hl_med },
    Whitespace   = { fg = c.hl_med },
    SpecialKey   = { fg = c.hl_high },
    EndOfBuffer  = { fg = c.hl_med },
    Directory    = { fg = c.folder or c.iris },
    Title        = { fg = c.iris, bold = true },
    ErrorMsg     = { fg = c.love, bold = true },
    WarningMsg   = { fg = c.gold },
    MoreMsg      = { fg = c.violet },
    ModeMsg      = { fg = c.subtle },
    Question     = { fg = c.gold },
    QuickFixLine = { bg = c.hl_low, bold = true },
    SpellBad     = { sp = c.love, undercurl = true },
    SpellCap     = { sp = c.foam, undercurl = true },
    SpellLocal   = { sp = c.gold, undercurl = true },
    SpellRare    = { sp = c.iris, undercurl = true },

    DiffAdd    = { bg = d.diff_add },
    DiffChange = { bg = d.diff_chg },
    DiffDelete = { fg = c.love, bg = d.diff_del },
    DiffText   = { bg = d.diff_text },
    Added      = { fg = c.mint },
    Changed    = { fg = c.iris },
    Removed    = { fg = c.love },
    diffAdded     = { fg = c.mint },
    diffRemoved   = { fg = c.love },
    diffChanged   = { fg = c.iris },
    diffFile      = { fg = c.violet, bold = true },
    diffOldFile   = { fg = c.love },
    diffNewFile   = { fg = c.mint },
    diffLine      = { fg = c.muted },
    diffIndexLine = { fg = c.muted },

    healthError   = { fg = c.love },
    healthSuccess = { fg = c.mint },
    healthWarning = { fg = c.gold },

    ----------------------------------------------------------- Legacy syntax
    Comment        = style({ fg = c.muted }, s.comments),
    Constant       = { fg = c.rose },
    String         = style({ fg = c.string }, s.strings),
    Character      = { fg = c.string },
    Number         = { fg = c.rose },
    Float          = { fg = c.rose },
    Boolean        = { fg = c.rose },
    Identifier     = { fg = c.text },
    Function       = style({ fg = c.func }, s.functions),
    Statement      = style({ fg = c.keyword }, s.keywords),
    Conditional    = style({ fg = c.control }, s.keywords),
    Repeat         = style({ fg = c.control }, s.keywords),
    Label          = { fg = c.foam },
    Operator       = { fg = c.punctuation },
    Keyword        = style({ fg = c.keyword }, s.keywords),
    Exception      = style({ fg = c.control }, s.keywords),
    PreProc        = { fg = c.keyword },
    Include        = { fg = c.keyword },
    Define         = { fg = c.keyword },
    Macro          = { fg = c.love },
    PreCondit      = { fg = c.keyword },
    Type           = style({ fg = c.type }, s.types),
    StorageClass   = { fg = c.foam },
    Structure      = { fg = c.type },
    Typedef        = { fg = c.type },
    Special        = { fg = c.love },
    SpecialChar    = { fg = c.love },
    Tag            = { fg = c.love },
    Delimiter      = { fg = c.punctuation },
    SpecialComment = { fg = c.violet },
    Debug          = { fg = c.rose },
    Underlined     = { underline = true },
    Bold           = { bold = true },
    Italic         = { italic = true },
    Ignore         = { fg = c.muted },
    Error          = { fg = c.love },
    Todo           = { fg = c.base, bg = c.iris, bold = true },

    --------------------------------------------------------------- Treesitter
    ["@variable"]                   = { fg = c.text },
    ["@variable.builtin"]           = { fg = c.pine, italic = true },
    ["@variable.parameter"]         = style({ fg = param }, s.parameters),
    ["@variable.parameter.builtin"] = { fg = param, italic = true },
    ["@variable.member"]            = { fg = c.property },

    -- Parameter names inside doc comments (---@param, @param {T} name, \param)
    ["@variable.parameter.luadoc"]  = style({ fg = c.rose }, s.comments),
    ["@variable.parameter.jsdoc"]   = style({ fg = c.rose }, s.comments),
    ["@variable.parameter.doxygen"] = style({ fg = c.rose }, s.comments),
    ["@variable.parameter.phpdoc"]  = style({ fg = c.rose }, s.comments),

    ["@constant"]         = { fg = c.rose },
    ["@constant.builtin"] = { fg = c.rose },
    ["@constant.macro"]   = { fg = c.love },

    ["@module"]         = { fg = c.pine },
    ["@module.builtin"] = { fg = c.pine, italic = true },
    ["@label"]          = { fg = c.foam },

    ["@string"]                = { link = "String" },
    ["@string.documentation"]  = { link = "String" },
    ["@string.escape"]         = { fg = c.love },
    ["@string.regexp"]         = { fg = c.love },
    ["@string.special"]        = { fg = c.love },
    ["@string.special.symbol"] = { fg = c.rose },
    ["@string.special.path"]   = { fg = c.foam },
    ["@string.special.url"]    = { fg = c.pine, underline = true },
    ["@character"]             = { link = "Character" },
    ["@character.special"]     = { fg = c.love },
    ["@boolean"]               = { link = "Boolean" },
    ["@number"]                = { link = "Number" },
    ["@number.float"]          = { link = "Float" },

    ["@type"]            = { link = "Type" },
    ["@type.builtin"]    = { fg = c.type },
    ["@type.definition"] = { fg = c.type },
    ["@attribute"]       = { fg = c.gold, italic = true },
    ["@attribute.builtin"] = { fg = c.gold, italic = true },
    ["@property"]        = { fg = c.property },

    ["@function"]             = { link = "Function" },
    ["@function.builtin"]     = { fg = c.pine },
    ["@function.call"]        = { link = "Function" },
    ["@function.macro"]       = { fg = c.love },
    ["@function.method"]      = { link = "Function" },
    ["@function.method.call"] = { link = "Function" },
    ["@constructor"]          = { fg = c.type },
    ["@constructor.lua"]      = { fg = c.punctuation }, -- table braces, not constructors
    ["@operator"]             = { fg = c.punctuation },

    ["@keyword"]                     = { link = "Keyword" },
    ["@keyword.coroutine"]           = { link = "Keyword" },
    ["@keyword.function"]            = { link = "Keyword" },
    ["@keyword.operator"]            = { link = "Keyword" },
    ["@keyword.import"]              = { link = "Keyword" },
    ["@keyword.type"]                = { link = "Keyword" },
    ["@keyword.modifier"]            = { link = "Keyword" },
    ["@keyword.repeat"]              = { link = "Repeat" },
    ["@keyword.return"]              = { link = "Conditional" },
    ["@keyword.exception"]           = { link = "Exception" },
    ["@keyword.conditional"]         = { link = "Conditional" },
    ["@keyword.conditional.ternary"] = { fg = c.punctuation },
    ["@keyword.directive"]           = { fg = c.keyword },
    ["@keyword.directive.define"]    = { fg = c.keyword },
    ["@keyword.debug"]               = { fg = c.rose },

    ["@punctuation.delimiter"] = { fg = c.punctuation },
    ["@punctuation.bracket"]   = { fg = c.punctuation },
    ["@punctuation.special"]   = { fg = c.love },

    ["@comment"]               = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@comment.error"]         = { fg = c.base, bg = c.love, bold = true },
    ["@comment.warning"]       = { fg = c.base, bg = c.gold, bold = true },
    ["@comment.todo"]          = { fg = c.base, bg = c.iris, bold = true },
    ["@comment.note"]          = { fg = c.base, bg = c.foam, bold = true },

    ["@markup.strong"]         = { bold = true },
    ["@markup.italic"]         = { italic = true },
    ["@markup.strikethrough"]  = { strikethrough = true },
    ["@markup.underline"]      = { underline = true },
    ["@markup.heading"]        = { fg = c.iris, bold = true },
    ["@markup.heading.1"]      = { fg = c.iris, bold = true },
    ["@markup.heading.2"]      = { fg = c.love, bold = true },
    ["@markup.heading.3"]      = { fg = c.rose, bold = true },
    ["@markup.heading.4"]      = { fg = c.gold, bold = true },
    ["@markup.heading.5"]      = { fg = c.foam, bold = true },
    ["@markup.heading.6"]      = { fg = c.pine, bold = true },
    ["@markup.quote"]          = { fg = c.subtle, italic = true },
    ["@markup.math"]           = { fg = c.foam },
    ["@markup.link"]           = { fg = c.violet },
    ["@markup.link.label"]     = { fg = c.iris },
    ["@markup.link.url"]       = { fg = c.pine, underline = true },
    ["@markup.raw"]            = { fg = c.foam },
    ["@markup.raw.block"]      = { fg = c.foam },
    ["@markup.list"]           = { fg = c.violet },
    ["@markup.list.checked"]   = { fg = c.mint },
    ["@markup.list.unchecked"] = { fg = c.muted },

    ["@tag"]           = { fg = c.love },
    ["@tag.builtin"]   = { fg = c.love },
    ["@tag.attribute"] = { fg = c.violet, italic = true },
    ["@tag.delimiter"] = { fg = c.punctuation },

    ["@diff.plus"]  = { fg = c.mint },
    ["@diff.minus"] = { fg = c.love },
    ["@diff.delta"] = { fg = c.iris },

    -- Older nvim-treesitter capture names (Neovim <= 0.9 era parsers)
    ["@parameter"]     = { link = "@variable.parameter" },
    ["@field"]         = { link = "@variable.member" },
    ["@namespace"]     = { link = "@module" },
    ["@method"]        = { link = "@function.method" },
    ["@method.call"]   = { link = "@function.method.call" },
    ["@include"]       = { link = "@keyword.import" },
    ["@conditional"]   = { link = "@keyword.conditional" },
    ["@repeat"]        = { link = "@keyword.repeat" },
    ["@exception"]     = { link = "@keyword.exception" },
    ["@storageclass"]  = { link = "@keyword.modifier" },
    ["@symbol"]        = { link = "@string.special.symbol" },
    ["@float"]         = { link = "@number.float" },
    ["@string.regex"]  = { link = "@string.regexp" },
    ["@text.title"]    = { link = "@markup.heading" },
    ["@text.literal"]  = { link = "@markup.raw" },
    ["@text.uri"]      = { link = "@markup.link.url" },
    ["@text.emphasis"] = { link = "@markup.italic" },
    ["@text.strong"]   = { link = "@markup.strong" },
    ["@text.reference"] = { link = "@markup.link" },
    ["@text.todo"]     = { link = "@comment.todo" },
    ["@text.note"]     = { link = "@comment.note" },
    ["@text.warning"]  = { link = "@comment.warning" },
    ["@text.danger"]   = { link = "@comment.error" },

    ---------------------------------------------------- LSP semantic tokens
    ["@lsp.type.class"]         = { link = "@type" },
    ["@lsp.type.decorator"]     = { link = "@attribute" },
    ["@lsp.type.enum"]          = { link = "@type" },
    ["@lsp.type.enumMember"]    = { link = "@constant" },
    ["@lsp.type.function"]      = { link = "@function" },
    ["@lsp.type.interface"]     = { link = "@type" },
    ["@lsp.type.keyword"]       = { link = "@keyword" },
    ["@lsp.type.macro"]         = { link = "@function.macro" },
    ["@lsp.type.method"]        = { link = "@function.method" },
    ["@lsp.type.namespace"]     = { link = "@module" },
    ["@lsp.type.parameter"]     = { link = "@variable.parameter" },
    ["@lsp.type.property"]      = { link = "@property" },
    ["@lsp.type.struct"]        = { link = "@type" },
    ["@lsp.type.type"]          = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"]      = {}, -- let treesitter decide
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.parameter.documentation"] = { link = "@variable.parameter.luadoc" },
    ["@lsp.mod.deprecated"]     = { strikethrough = true },

    ------------------------------------------------------------- Diagnostics
    DiagnosticError = { fg = c.love },
    DiagnosticWarn  = { fg = c.gold },
    DiagnosticInfo  = { fg = c.foam },
    DiagnosticHint  = { fg = c.iris },
    DiagnosticOk    = { fg = c.mint },
    DiagnosticVirtualTextError = { fg = c.love, bg = d.err_bg },
    DiagnosticVirtualTextWarn  = { fg = c.gold, bg = d.warn_bg },
    DiagnosticVirtualTextInfo  = { fg = c.foam, bg = d.info_bg },
    DiagnosticVirtualTextHint  = { fg = c.iris, bg = d.hint_bg },
    DiagnosticVirtualTextOk    = { fg = c.mint, bg = d.ok_bg },
    DiagnosticUnderlineError = { sp = c.love, undercurl = true },
    DiagnosticUnderlineWarn  = { sp = c.gold, undercurl = true },
    DiagnosticUnderlineInfo  = { sp = c.foam, undercurl = true },
    DiagnosticUnderlineHint  = { sp = c.iris, undercurl = true },
    DiagnosticUnderlineOk    = { sp = c.mint, undercurl = true },
    DiagnosticUnnecessary = { fg = c.muted },
    DiagnosticDeprecated  = { sp = c.muted, strikethrough = true },

    LspReferenceText  = { bg = c.hl_med },
    LspReferenceRead  = { bg = c.hl_med },
    LspReferenceWrite = { bg = c.hl_med, underline = true, sp = c.iris },
    LspReferenceTarget = { bg = c.hl_med },
    LspSignatureActiveParameter = { bg = c.overlay, bold = true },
    LspInlayHint = { fg = c.muted, bg = c.hl_low, italic = true },
    LspCodeLens = { fg = c.muted },
    LspCodeLensSeparator = { fg = c.hl_high },
    LspInfoBorder = { link = "FloatBorder" },

    ----------------------------------------------------------------- Plugins
    -- gitsigns
    GitSignsAdd    = { fg = c.mint },
    GitSignsChange = { fg = c.iris },
    GitSignsDelete = { fg = c.love },
    GitSignsAddNr    = { fg = c.mint },
    GitSignsChangeNr = { fg = c.iris },
    GitSignsDeleteNr = { fg = c.love },
    GitSignsAddInline    = { bg = blend(c.mint, c.base, 0.28) },
    GitSignsChangeInline = { bg = d.diff_text },
    GitSignsDeleteInline = { bg = blend(c.love, c.base, 0.28) },
    GitSignsCurrentLineBlame = { fg = c.muted, italic = true },

    -- telescope
    TelescopeNormal         = { fg = c.subtle, bg = float_bg },
    TelescopeBorder         = { fg = d.border, bg = float_bg },
    TelescopeTitle          = { fg = c.base, bg = c.violet, bold = true },
    TelescopePromptNormal   = { fg = c.text, bg = float_bg },
    TelescopePromptBorder   = { fg = d.border, bg = float_bg },
    TelescopePromptTitle    = { fg = c.base, bg = c.iris, bold = true },
    TelescopePromptPrefix   = { fg = c.iris },
    TelescopeResultsTitle   = { fg = c.base, bg = c.violet, bold = true },
    TelescopePreviewTitle   = { fg = c.base, bg = c.foam, bold = true },
    TelescopeSelection      = { fg = c.text, bg = c.overlay },
    TelescopeSelectionCaret = { fg = c.iris, bg = c.overlay },
    TelescopeMatching       = { fg = c.iris, bold = true },
    TelescopeMultiSelection = { fg = c.love },

    -- snacks.nvim
    SnacksPickerMatch      = { fg = c.iris, bold = true },
    SnacksPickerBorder     = { fg = d.border, bg = float_bg },
    SnacksPickerTitle      = { fg = c.base, bg = c.violet, bold = true },
    SnacksPickerDir        = { fg = c.muted },
    SnacksIndent           = { fg = d.indent, nocombine = true },
    SnacksIndentScope      = { fg = d.border, nocombine = true },
    SnacksDashboardHeader  = { fg = c.violet },
    SnacksDashboardIcon    = { fg = c.iris },
    SnacksDashboardKey     = { fg = c.love },
    SnacksDashboardDesc    = { fg = c.subtle },
    SnacksDashboardFooter  = { fg = c.muted, italic = true },
    SnacksDashboardSpecial = { fg = c.iris },

    -- nvim-cmp
    CmpItemAbbr           = { fg = c.subtle },
    CmpItemAbbrDeprecated = { fg = c.muted, strikethrough = true },
    CmpItemAbbrMatch      = { fg = c.iris, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.iris, bold = true },
    CmpItemMenu           = { fg = c.muted },
    CmpItemKind           = { fg = c.violet },

    -- blink.cmp
    BlinkCmpMenu           = { link = "Pmenu" },
    BlinkCmpMenuBorder     = { fg = d.border, bg = c.surface },
    BlinkCmpMenuSelection  = { link = "PmenuSel" },
    BlinkCmpLabel          = { fg = c.subtle },
    BlinkCmpLabelMatch     = { fg = c.iris, bold = true },
    BlinkCmpLabelDeprecated = { fg = c.muted, strikethrough = true },
    BlinkCmpLabelDetail    = { fg = c.muted },
    BlinkCmpLabelDescription = { fg = c.muted },
    BlinkCmpKind           = { fg = c.violet },
    BlinkCmpSource         = { fg = c.muted },
    BlinkCmpGhostText      = { fg = c.muted, italic = true },
    BlinkCmpDoc            = { link = "NormalFloat" },
    BlinkCmpDocBorder      = { link = "FloatBorder" },
    BlinkCmpSignatureHelp  = { link = "NormalFloat" },
    BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
    BlinkCmpSignatureHelpActiveParameter = { link = "LspSignatureActiveParameter" },

    -- nvim-tree
    NvimTreeNormal           = { fg = c.subtle, bg = float_bg },
    NvimTreeNormalNC         = { fg = c.subtle, bg = float_bg },
    NvimTreeWinSeparator     = { fg = c.hl_med, bg = none },
    NvimTreeRootFolder       = { fg = c.folder or c.iris, bold = true },
    NvimTreeFolderName       = { fg = c.folder or c.lavender },
    NvimTreeFolderIcon       = { fg = c.folder or c.violet },
    NvimTreeOpenedFolderName = { fg = c.folder or c.iris },
    NvimTreeEmptyFolderName  = { fg = c.muted },
    NvimTreeIndentMarker     = { fg = c.hl_med },
    NvimTreeSpecialFile      = { fg = c.gold },
    NvimTreeOpenedFile       = { fg = c.text, bold = true },
    NvimTreeCursorLine       = { bg = c.hl_low },
    NvimTreeGitDirty         = { fg = c.iris },
    NvimTreeGitNew           = { fg = c.mint },
    NvimTreeGitDeleted       = { fg = c.love },
    NvimTreeGitStaged        = { fg = c.foam },

    -- neo-tree
    NeoTreeNormal        = { fg = c.subtle, bg = float_bg },
    NeoTreeNormalNC      = { fg = c.subtle, bg = float_bg },
    NeoTreeWinSeparator  = { fg = c.hl_med, bg = none },
    NeoTreeRootName      = { fg = c.iris, bold = true },
    NeoTreeDirectoryName = { fg = c.folder or c.lavender },
    NeoTreeDirectoryIcon = { fg = c.folder or c.violet },
    NeoTreeFileName      = { fg = c.subtle },
    NeoTreeFileNameOpened = { fg = c.text, bold = true },
    NeoTreeIndentMarker  = { fg = c.hl_med },
    NeoTreeGitAdded      = { fg = c.mint },
    NeoTreeGitModified   = { fg = c.iris },
    NeoTreeGitDeleted    = { fg = c.love },
    NeoTreeGitUntracked  = { fg = c.gold },
    NeoTreeGitConflict   = { fg = c.love, bold = true },
    NeoTreeGitIgnored    = { fg = c.muted },
    NeoTreeTitleBar      = { fg = c.base, bg = c.violet, bold = true },
    NeoTreeFloatBorder   = { link = "FloatBorder" },

    -- oil.nvim
    OilDir = { fg = c.folder or c.iris },
    OilDirIcon = { fg = c.folder or c.violet },

    -- which-key
    WhichKey          = { fg = c.iris },
    WhichKeyGroup     = { fg = c.violet },
    WhichKeyDesc      = { fg = c.subtle },
    WhichKeySeparator = { fg = c.muted },
    WhichKeyValue     = { fg = c.muted },
    WhichKeyIcon      = { fg = c.violet },
    WhichKeyNormal    = { bg = float_bg },
    WhichKeyFloat     = { bg = float_bg },
    WhichKeyBorder    = { link = "FloatBorder" },

    -- indent guides
    IblIndent     = { fg = d.indent, nocombine = true },
    IblWhitespace = { fg = d.indent, nocombine = true },
    IblScope      = { fg = d.border, nocombine = true },
    IndentBlanklineChar        = { link = "IblIndent" },
    IndentBlanklineContextChar = { link = "IblScope" },
    MiniIndentscopeSymbol      = { fg = d.border, nocombine = true },

    -- lazy.nvim
    LazyNormal        = { fg = c.text, bg = float_bg },
    LazyH1            = { fg = c.base, bg = c.violet, bold = true },
    LazyH2            = { fg = c.iris, bold = true },
    LazyButton        = { fg = c.subtle, bg = c.surface },
    LazyButtonActive  = { fg = c.base, bg = c.violet, bold = true },
    LazySpecial       = { fg = c.love },
    LazyProgressDone  = { fg = c.iris },
    LazyProgressTodo  = { fg = c.hl_med },

    -- mason
    MasonNormal              = { fg = c.text, bg = float_bg },
    MasonHeader              = { fg = c.base, bg = c.violet, bold = true },
    MasonHighlight           = { fg = c.iris },
    MasonHighlightBlock      = { fg = c.base, bg = c.iris },
    MasonHighlightBlockBold  = { fg = c.base, bg = c.iris, bold = true },
    MasonMuted               = { fg = c.muted },
    MasonMutedBlock          = { fg = c.subtle, bg = c.surface },

    -- nvim-notify
    NotifyBackground  = { bg = c.mantle },
    NotifyERRORBorder = { fg = blend(c.love, c.base, 0.5) },
    NotifyWARNBorder  = { fg = blend(c.gold, c.base, 0.5) },
    NotifyINFOBorder  = { fg = blend(c.foam, c.base, 0.5) },
    NotifyDEBUGBorder = { fg = c.hl_high },
    NotifyTRACEBorder = { fg = d.border },
    NotifyERRORIcon   = { fg = c.love },
    NotifyWARNIcon    = { fg = c.gold },
    NotifyINFOIcon    = { fg = c.foam },
    NotifyDEBUGIcon   = { fg = c.muted },
    NotifyTRACEIcon   = { fg = c.iris },
    NotifyERRORTitle  = { fg = c.love },
    NotifyWARNTitle   = { fg = c.gold },
    NotifyINFOTitle   = { fg = c.foam },
    NotifyDEBUGTitle  = { fg = c.muted },
    NotifyTRACETitle  = { fg = c.iris },

    -- noice
    NoiceCmdlinePopupBorder       = { fg = d.border },
    NoiceCmdlinePopupTitle        = { fg = c.iris },
    NoiceCmdlineIcon              = { fg = c.iris },
    NoiceCmdlinePopupBorderSearch = { fg = c.gold },
    NoiceCmdlineIconSearch        = { fg = c.gold },
    NoiceConfirmBorder            = { fg = d.border },
    NoiceMini                     = { bg = c.mantle },

    -- flash.nvim
    FlashLabel    = { fg = c.base, bg = c.love, bold = true },
    FlashMatch    = { fg = c.iris, bg = d.selection },
    FlashCurrent  = { fg = c.base, bg = c.gold },
    FlashBackdrop = { fg = c.muted },

    -- treesitter-context
    TreesitterContext           = { bg = c.surface },
    TreesitterContextLineNumber = { fg = c.iris, bg = c.surface },
    TreesitterContextBottom     = { underline = true, sp = c.hl_med },

    -- rainbow-delimiters
    RainbowDelimiterRed    = { fg = c.love },
    RainbowDelimiterYellow = { fg = c.gold },
    RainbowDelimiterBlue   = { fg = c.pine },
    RainbowDelimiterOrange = { fg = c.rose },
    RainbowDelimiterGreen  = { fg = c.mint },
    RainbowDelimiterViolet = { fg = c.violet },
    RainbowDelimiterCyan   = { fg = c.foam },

    -- vim-illuminate
    IlluminatedWordText  = { bg = c.hl_med },
    IlluminatedWordRead  = { bg = c.hl_med },
    IlluminatedWordWrite = { bg = c.hl_med },

    -- trouble / fidget / dap / dashboards
    TroubleNormal  = { fg = c.subtle, bg = float_bg },
    TroubleText    = { fg = c.subtle },
    TroubleCount   = { fg = c.love, bg = c.surface },
    FidgetTitle    = { fg = c.iris },
    FidgetTask     = { fg = c.muted },
    DapBreakpoint  = { fg = c.love },
    DapStopped     = { fg = c.gold },
    DapStoppedLine = { bg = d.warn_bg },
    DashboardHeader = { fg = c.violet },
    AlphaHeader    = { fg = c.violet },
    AlphaButtons   = { fg = c.iris },
    AlphaShortcut  = { fg = c.love },
    AlphaFooter    = { fg = c.muted, italic = true },
  }

  -- Completion item kinds (nvim-cmp + blink.cmp)
  local kinds = {
    Text = c.subtle, Method = c.func, Function = c.func, Constructor = c.type,
    Field = c.property, Variable = c.text, Class = c.type, Interface = c.type,
    Module = c.pine, Property = c.property, Unit = c.rose, Value = c.rose,
    Enum = c.type, Keyword = c.keyword, Snippet = c.love, Color = c.rose,
    File = c.subtle, Reference = c.rose, Folder = c.folder or c.iris, EnumMember = c.rose,
    Constant = c.rose, Struct = c.type, Event = c.gold, Operator = c.subtle,
    TypeParameter = c.type, Copilot = c.mint, Codeium = c.mint,
    TabNine = c.mint, Supermaven = c.mint,
  }
  for kind, color in pairs(kinds) do
    g["CmpItemKind" .. kind] = { fg = color }
    g["BlinkCmpKind" .. kind] = { fg = color }
  end

  return g
end

---@param c NightbloomPalette
function M.terminal(c)
  local function bright(color)
    return blend("#ffffff", color, 0.18)
  end
  local colors = {
    c.overlay, c.love, c.mint, c.gold, c.pine, c.violet, c.foam, c.subtle,
    c.muted, bright(c.love), bright(c.mint), bright(c.gold),
    bright(c.pine), c.iris, bright(c.foam), c.text,
  }
  for i, color in ipairs(colors) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
