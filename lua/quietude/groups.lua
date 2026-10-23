local M = {}

local function linked(groups, names, target)
  for _, name in ipairs(names) do
    groups[name] = { link = target }
  end
end

function M.get(palette, options)
  local p = palette
  local normal_bg = options.transparent and "NONE" or p.bg
  local surface_bg = p.bg_surface
  local end_of_buffer_fg = options.transparent and p.invisible or p.bg

  local groups = {
    -- Editor UI
    Normal = { fg = p.fg, bg = normal_bg },
    NormalFloat = { fg = p.fg, bg = surface_bg },
    FloatBorder = { fg = p.punctuation, bg = surface_bg },
    FloatTitle = { fg = p.yellow, bg = surface_bg, bold = true },
    FloatFooter = { fg = p.comment, bg = surface_bg },
    FloatShadow = { bg = p.bg_deep, blend = 80 },
    FloatShadowThrough = { bg = p.bg_deep, blend = 100 },
    Cursor = { fg = p.bg, bg = p.cursor },
    CursorLine = { bg = p.bg_line },
    CursorColumn = { bg = p.bg_line },
    ColorColumn = { bg = p.bg_line },
    LineNr = { fg = p.line_number },
    CursorLineNr = { fg = p.yellow, bold = true },
    SignColumn = { fg = p.comment, bg = normal_bg },
    FoldColumn = { fg = p.comment, bg = normal_bg },
    CursorLineSign = { fg = p.comment, bg = p.bg_line },
    CursorLineFold = { fg = p.comment, bg = p.bg_line },
    Folded = { fg = p.comment, bg = p.bg_line },
    EndOfBuffer = { fg = end_of_buffer_fg, bg = normal_bg },
    NonText = { fg = p.punctuation },
    Whitespace = { fg = p.invisible },
    SpecialKey = { fg = p.invisible },
    Conceal = { fg = p.comment },
    Directory = { fg = p.blue },
    Title = { fg = p.yellow, bold = true },
    WinSeparator = { fg = p.bg_inactive },
    Visual = { bg = p.bg_selection },
    VisualNOS = { bg = p.bg_selection },
    Search = { bg = p.bg_search },
    IncSearch = { bg = p.bg_search_active },
    CurSearch = { fg = p.bg, bg = p.blue, bold = true },
    Substitute = { fg = p.bg, bg = p.yellow },
    MatchParen = { bg = p.bg_reference_write, bold = true },
    QuickFixLine = { bg = p.bg_active },
    qfLineNr = { fg = p.blue },
    WildMenu = { fg = p.fg, bg = p.bg_active },

    Pmenu = { fg = p.fg, bg = p.bg_hover },
    PmenuSel = { fg = p.fg, bg = p.bg_active },
    PmenuKind = { fg = p.fg_dim, bg = p.bg_hover },
    PmenuKindSel = { fg = p.fg_dim, bg = p.bg_active },
    PmenuExtra = { fg = p.comment, bg = p.bg_hover },
    PmenuExtraSel = { fg = p.comment, bg = p.bg_active },
    PmenuMatch = { fg = p.yellow, bg = p.bg_hover, bold = true },
    PmenuMatchSel = { fg = p.yellow, bg = p.bg_active, bold = true },
    PmenuSbar = { bg = p.bg_surface },
    PmenuThumb = { bg = p.fg_disabled },
    PmenuBorder = { fg = p.punctuation, bg = p.bg_hover },
    PmenuShadow = { bg = p.bg_deep, blend = 80 },
    PmenuShadowThrough = { bg = p.bg_deep, blend = 100 },
    ComplMatchIns = { fg = p.yellow, bold = true },
    PreInsert = { fg = p.comment },
    ComplHint = { fg = p.comment, italic = true },
    ComplHintMore = { fg = p.fg_disabled },
    SnippetTabstop = { bg = p.bg_reference },
    SnippetTabstopActive = { bg = p.bg_reference_write },

    StatusLine = { fg = p.fg, bg = p.bg_deep },
    StatusLineNC = { fg = p.comment, bg = p.bg_deep },
    StatusLineTerm = { fg = p.fg, bg = p.bg_deep },
    StatusLineTermNC = { fg = p.comment, bg = p.bg_deep },
    TabLine = { fg = p.comment, bg = p.bg_deep },
    TabLineSel = { fg = p.yellow, bg = p.bg_line, bold = true },
    TabLineFill = { bg = p.bg_deep },
    MsgArea = { fg = p.fg },
    MsgSeparator = { fg = p.bg_inactive, bg = p.bg_deep },
    ModeMsg = { fg = p.green, bold = true },
    MoreMsg = { fg = p.green },
    OkMsg = { fg = p.green },
    Question = { fg = p.blue },
    WarningMsg = { fg = p.yellow },
    ErrorMsg = { fg = p.red },
    StderrMsg = { fg = p.red },
    StdoutMsg = { fg = p.fg },

    SpellBad = { undercurl = true, sp = p.red },
    SpellCap = { undercurl = true, sp = p.blue },
    SpellRare = { undercurl = true, sp = p.magenta },
    SpellLocal = { undercurl = true, sp = p.cyan },

    Added = { fg = p.green },
    Changed = { fg = p.yellow },
    Removed = { fg = p.red },
    DiffAdd = { fg = p.green, bg = p.bg_diff_add },
    DiffDelete = { fg = p.red, bg = p.bg_diff_delete },
    DiffChange = { fg = p.yellow, bg = p.bg_diff_change },
    DiffText = { fg = p.yellow, bg = p.bg_selection_strong, bold = true },
    DiffTextAdd = { fg = p.green, bg = p.bg_selection_strong, bold = true },

    -- Diagnostics and LSP UI
    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.blue },
    DiagnosticHint = { fg = p.green },
    DiagnosticOk = { fg = p.green },
    DiagnosticVirtualTextError = { fg = p.diagnostic_error },
    DiagnosticVirtualTextWarn = { fg = p.diagnostic_warn },
    DiagnosticVirtualTextInfo = { fg = p.diagnostic_info },
    DiagnosticVirtualTextHint = { fg = p.diagnostic_hint },
    DiagnosticVirtualTextOk = { fg = p.diagnostic_hint },
    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.green },
    DiagnosticUnderlineOk = { undercurl = true, sp = p.green },
    DiagnosticUnnecessary = { fg = p.comment },
    DiagnosticDeprecated = { fg = p.red, strikethrough = true },
    LspReferenceText = { bg = p.bg_reference },
    LspReferenceRead = { bg = p.bg_reference },
    LspReferenceWrite = { bg = p.bg_reference_write },
    LspReferenceTarget = { bg = p.bg_reference_write, bold = true },
    LspInlayHint = { fg = p.comment, bg = p.bg_line, italic = true },
    LspCodeLens = { fg = p.comment },
    LspCodeLensSeparator = { fg = p.punctuation },
    LspSignatureActiveParameter = { fg = p.yellow, bold = true },

    -- Traditional Vim syntax
    Comment = { fg = p.comment },
    Constant = { fg = p.fg },
    String = { fg = p.string },
    Character = { fg = p.fg },
    Number = { fg = p.fg },
    Boolean = { fg = p.fg },
    Float = { fg = p.fg },
    Identifier = { fg = p.fg },
    Function = { fg = p.green },
    Statement = { fg = p.keyword },
    Conditional = { fg = p.keyword },
    Repeat = { fg = p.keyword },
    Label = { fg = p.blue },
    Operator = { fg = p.keyword },
    Keyword = { fg = p.keyword },
    Exception = { fg = p.keyword },
    PreProc = { fg = p.yellow },
    Include = { fg = p.yellow },
    Define = { fg = p.yellow },
    Macro = { fg = p.green },
    PreCondit = { fg = p.yellow },
    Type = { fg = p.yellow },
    StorageClass = { fg = p.keyword },
    Structure = { fg = p.yellow },
    Typedef = { fg = p.yellow },
    Special = { fg = p.yellow },
    SpecialChar = { fg = p.punctuation },
    Tag = { fg = p.yellow },
    Delimiter = { fg = p.punctuation },
    SpecialComment = { fg = p.comment, italic = true },
    Debug = { fg = p.red },
    Underlined = { fg = p.blue, underline = true },
    Ignore = { fg = p.comment },
    Error = { fg = p.red, italic = true, underline = true },
    Todo = { fg = p.bg, bg = p.yellow, bold = true },

    -- Tree-sitter captures that need styles beyond a simple link
    ["@variable.builtin"] = { fg = p.fg, italic = true },
    ["@variable.parameter.builtin"] = { fg = p.fg, italic = true },
    ["@string.special.url"] = { fg = p.keyword, underline = true },
    ["@markup.heading"] = { fg = p.yellow, bold = true },
    ["@markup.heading.1"] = { fg = p.yellow, bold = true },
    ["@markup.heading.2"] = { fg = p.yellow, bold = true },
    ["@markup.heading.3"] = { fg = p.yellow, bold = true },
    ["@markup.heading.4"] = { fg = p.yellow, bold = true },
    ["@markup.heading.5"] = { fg = p.yellow, bold = true },
    ["@markup.heading.6"] = { fg = p.yellow, bold = true },
    ["@markup.strong"] = { fg = p.yellow, bold = true },
    ["@markup.italic"] = { fg = p.yellow, italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.raw"] = { fg = p.string, italic = true },
    ["@markup.quote"] = { fg = p.comment, italic = true },
    ["@markup.link"] = { fg = p.green },
    ["@markup.link.label"] = { fg = p.green },
    ["@markup.link.url"] = { fg = p.keyword, underline = true },
    ["@property.css"] = { fg = p.fg_dim },
    ["@property.scss"] = { fg = p.fg_dim },
    ["@property.less"] = { fg = p.fg_dim },
    ["@comment.error"] = { fg = p.red, bold = true },
    ["@comment.warning"] = { fg = p.yellow, bold = true },
    ["@comment.todo"] = { fg = p.bg, bg = p.yellow, bold = true },
    ["@comment.note"] = { fg = p.blue, bold = true },

    -- Telescope
    TelescopeNormal = { fg = p.fg, bg = p.bg_surface },
    TelescopeBorder = { fg = p.bg_inactive, bg = p.bg_surface },
    TelescopePromptNormal = { fg = p.fg, bg = p.bg_hover },
    TelescopePromptBorder = { fg = p.bg_hover, bg = p.bg_hover },
    TelescopePromptTitle = { fg = p.green, bg = p.bg_hover, bold = true },
    TelescopePreviewTitle = { fg = p.blue, bg = p.bg_surface, bold = true },
    TelescopeResultsTitle = { fg = p.yellow, bg = p.bg_surface, bold = true },
    TelescopeSelection = { fg = p.fg, bg = p.bg_active },
    TelescopeSelectionCaret = { fg = p.yellow, bg = p.bg_active },
    TelescopeMultiSelection = { fg = p.magenta, bg = p.bg_active },
    TelescopeMatching = { fg = p.yellow, bold = true },
    TelescopePromptPrefix = { fg = p.green },
    TelescopePromptCounter = { fg = p.comment },
    TelescopePreviewMatch = { bg = p.bg_search_active },

    -- blink.cmp
    BlinkCmpMenu = { fg = p.fg, bg = p.bg_hover },
    BlinkCmpMenuBorder = { fg = p.punctuation, bg = p.bg_hover },
    BlinkCmpMenuSelection = { fg = p.fg, bg = p.bg_active },
    BlinkCmpLabel = { fg = p.fg },
    BlinkCmpLabelMatch = { fg = p.yellow, bold = true },
    BlinkCmpLabelDeprecated = { fg = p.comment, strikethrough = true },
    BlinkCmpLabelDescription = { fg = p.comment },
    BlinkCmpLabelDetail = { fg = p.comment },
    BlinkCmpSource = { fg = p.comment },
    BlinkCmpKind = { fg = p.fg_dim },
    BlinkCmpScrollBarGutter = { bg = p.bg_surface },
    BlinkCmpScrollBarThumb = { bg = p.fg_disabled },
    BlinkCmpDoc = { fg = p.fg, bg = p.bg_surface },
    BlinkCmpDocBorder = { fg = p.punctuation, bg = p.bg_surface },
    BlinkCmpDocSeparator = { fg = p.bg_inactive, bg = p.bg_surface },
    BlinkCmpDocCursorLine = { bg = p.bg_line },
    BlinkCmpSignatureHelp = { fg = p.fg, bg = p.bg_surface },
    BlinkCmpSignatureHelpBorder = { fg = p.punctuation, bg = p.bg_surface },
    BlinkCmpSignatureHelpActiveParameter = { fg = p.yellow, bold = true },
    BlinkCmpGhostText = { fg = p.comment, italic = true },

    -- Gitsigns, Copilot, and Twilight
    GitSignsAdd = { fg = p.green },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },
    GitSignsTopdelete = { fg = p.red },
    GitSignsChangedelete = { fg = p.yellow },
    GitSignsUntracked = { fg = p.green },
    GitSignsCurrentLineBlame = { fg = p.comment, italic = true },
    CopilotSuggestion = { fg = p.comment, italic = true },
    CopilotAnnotation = { fg = p.comment, italic = true },
    Twilight = { fg = p.comment, italic = true },

    -- Keep netrw restrained: names read like text and classifiers like punctuation.
    netrwDir = { fg = p.fg },
    netrwClassify = { fg = p.punctuation },
  }

  linked(groups, { "NormalNC", "NormalSB" }, "Normal")
  linked(groups, { "CursorIM", "lCursor", "TermCursor" }, "Cursor")
  linked(groups, { "LineNrAbove", "LineNrBelow" }, "LineNr")
  linked(groups, { "WinBar" }, "StatusLine")
  linked(groups, { "WinBarNC" }, "StatusLineNC")
  linked(groups, { "VertSplit" }, "WinSeparator")

  linked(groups, { "DiagnosticSignError", "DiagnosticFloatingError" }, "DiagnosticError")
  linked(groups, { "DiagnosticSignWarn", "DiagnosticFloatingWarn" }, "DiagnosticWarn")
  linked(groups, { "DiagnosticSignInfo", "DiagnosticFloatingInfo" }, "DiagnosticInfo")
  linked(groups, { "DiagnosticSignHint", "DiagnosticFloatingHint" }, "DiagnosticHint")
  linked(groups, { "DiagnosticSignOk", "DiagnosticFloatingOk" }, "DiagnosticOk")
  linked(groups, { "DiagnosticVirtualLinesError" }, "DiagnosticError")
  linked(groups, { "DiagnosticVirtualLinesWarn" }, "DiagnosticWarn")
  linked(groups, { "DiagnosticVirtualLinesInfo" }, "DiagnosticInfo")
  linked(groups, { "DiagnosticVirtualLinesHint" }, "DiagnosticHint")
  linked(groups, { "DiagnosticVirtualLinesOk" }, "DiagnosticOk")

  linked(groups, { "diffAdded" }, "DiffAdd")
  linked(groups, { "diffRemoved" }, "DiffDelete")
  linked(groups, { "diffChanged" }, "DiffChange")
  linked(groups, { "diffOldFile", "diffNewFile", "diffFile" }, "Directory")
  linked(groups, { "diffLine" }, "Comment")
  linked(groups, { "diffIndexLine" }, "Number")

  linked(groups, {
    "@comment",
    "@comment.documentation",
  }, "Comment")
  linked(groups, {
    "@constant",
    "@constant.builtin",
    "@constant.macro",
  }, "Constant")
  linked(groups, { "@string", "@string.documentation" }, "String")
  linked(groups, { "@string.special", "@string.special.symbol", "@string.special.path" }, "String")
  linked(groups, { "@string.regexp", "@string.escape", "@character.special" }, "SpecialChar")
  linked(groups, { "@character" }, "Character")
  linked(groups, { "@boolean" }, "Boolean")
  linked(groups, { "@number" }, "Number")
  linked(groups, { "@number.float", "@float" }, "Float")
  linked(groups, {
    "@variable",
    "@variable.member",
    "@variable.parameter",
    "@property",
    "@attribute",
    "@attribute.builtin",
  }, "Identifier")
  linked(groups, {
    "@module",
    "@module.builtin",
    "@namespace",
    "@type",
    "@type.builtin",
    "@type.definition",
    "@constructor",
  }, "Type")
  linked(groups, {
    "@function",
    "@function.builtin",
    "@function.call",
    "@function.method",
    "@function.method.call",
    "@method",
    "@method.call",
  }, "Function")
  linked(groups, { "@function.macro", "@macro" }, "Macro")
  linked(groups, {
    "@keyword",
    "@keyword.coroutine",
    "@keyword.function",
    "@keyword.operator",
    "@keyword.import",
    "@keyword.type",
    "@keyword.modifier",
    "@keyword.repeat",
    "@keyword.return",
    "@keyword.debug",
    "@keyword.exception",
    "@keyword.conditional",
    "@keyword.conditional.ternary",
    "@conditional",
    "@repeat",
  }, "Keyword")
  linked(groups, { "@keyword.directive" }, "PreProc")
  linked(groups, { "@keyword.directive.define" }, "Define")
  linked(groups, { "@operator" }, "Operator")
  linked(groups, { "@label" }, "Label")
  linked(groups, { "@punctuation.delimiter", "@punctuation.bracket", "@punctuation.special" }, "Delimiter")
  linked(groups, { "@markup.list", "@markup.list.checked", "@markup.list.unchecked" }, "Delimiter")
  linked(groups, { "@markup.math" }, "String")
  linked(groups, { "@diff.plus" }, "diffAdded")
  linked(groups, { "@diff.minus" }, "diffRemoved")
  linked(groups, { "@diff.delta" }, "diffChanged")
  linked(groups, { "@tag", "@tag.builtin" }, "Tag")
  linked(groups, { "@tag.attribute" }, "Identifier")
  linked(groups, { "@tag.delimiter" }, "Delimiter")

  local semantic_types = {
    namespace = "Type",
    type = "Type",
    class = "Type",
    enum = "Type",
    interface = "Type",
    struct = "Type",
    typeParameter = "Type",
    parameter = "Identifier",
    variable = "Identifier",
    property = "Identifier",
    enumMember = "Constant",
    event = "Identifier",
    ["function"] = "Function",
    method = "Function",
    macro = "Macro",
    keyword = "Keyword",
    modifier = "Keyword",
    comment = "Comment",
    string = "String",
    number = "Number",
    regexp = "SpecialChar",
    operator = "Operator",
    decorator = "Function",
    label = "Label",
  }
  for token, target in pairs(semantic_types) do
    groups["@lsp.type." .. token] = { link = target }
  end
  groups["@lsp.mod.deprecated"] = { link = "DiagnosticDeprecated" }

  local completion_kinds = {
    Text = "Identifier",
    Method = "Function",
    Function = "Function",
    Constructor = "Type",
    Field = "Identifier",
    Variable = "Identifier",
    Class = "Type",
    Interface = "Type",
    Module = "Type",
    Property = "Identifier",
    Unit = "Number",
    Value = "Constant",
    Enum = "Type",
    Keyword = "Keyword",
    Snippet = "Special",
    Color = "Special",
    File = "Directory",
    Reference = "Label",
    Folder = "Directory",
    EnumMember = "Constant",
    Constant = "Constant",
    Struct = "Type",
    Event = "Special",
    Operator = "Operator",
    TypeParameter = "Type",
  }
  for kind, target in pairs(completion_kinds) do
    groups["BlinkCmpKind" .. kind] = { link = target }
  end

  linked(groups, { "TelescopePreviewNormal", "TelescopeResultsNormal" }, "TelescopeNormal")
  linked(groups, { "TelescopePreviewBorder", "TelescopeResultsBorder" }, "TelescopeBorder")
  linked(groups, { "TelescopeResultsLineNr" }, "LineNr")
  linked(groups, { "TelescopeResultsComment" }, "Comment")
  linked(groups, { "TelescopeResultsConstant" }, "Constant")
  linked(groups, { "TelescopeResultsFunction", "TelescopeResultsMethod" }, "Function")
  linked(groups, { "TelescopeResultsIdentifier", "TelescopeResultsField", "TelescopeResultsVariable" }, "Identifier")
  linked(groups, { "TelescopeResultsNumber" }, "Number")
  linked(groups, { "TelescopeResultsOperator" }, "Operator")
  linked(groups, { "TelescopeResultsDiffAdd", "TelescopeResultsDiffUntracked" }, "diffAdded")
  linked(groups, { "TelescopeResultsDiffChange" }, "diffChanged")
  linked(groups, { "TelescopeResultsDiffDelete" }, "diffRemoved")

  return groups
end

return M
