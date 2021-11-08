-- -------------------------------- Theme config ---------------------------------
-- ===============================================================================

local present, theme = pcall(require, "nightfox")
if not present then
    return
end

local theme = require('nightfox')
-- local c = require('nighfox.colors').load()
-- local config = require("nightfox.config").options
-- local util = require("nightfox.util")

theme.setup({
    transparent = false,
    terminal_colors = true, -- Configure the colors used when opening :terminal
    -- hlgroups = {
    --     Conceal = { fg = c.blue_dm },
    --     Substitute = { bg = c.red, fg = c.black },
    --     CursorLineNr = { fg = c.blue_br, style = "bold" },
    --     NormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    --     Pmenu = { bg = c.bg_popup, fg = c.fg },
    --     PmenuSel = { fg = c.blue_br, bg = util.darken(c.fg_gutter, 0.8) },
    --     PmenuSbar = { bg = util.lighten(c.bg_popup, 0.95) },
    --     IncSearch = config.inverse.search and { style = "inverse" } or { bg = c.blue_br, fg = c.black },
    --     SpecialKey = { fg = c.black },
    --     SpellBad = { fg = c.orange_dm, style = "undercurl" },
    --     SpellCap = { fg = c.warning, style = "undercurl" },
    --     SpellLocal = { fg = c.info, style = "undercurl" },
    --     SpellRare = { fg = c.hint, style = "undercurl" },
    --     TabLine = { bg = c.bg_statusline, fg = c.fg_gutter },
    --     TabLineFill = { bg = c.black },
    --     Number = { fg = c.orange_br },
    --     Float = { fg = c.orange_br },
    --     Boolean = { fg = c.orange_br },
    --
    --     Identifier = { fg = c.blue_br, style = config.styles.variables },
    --     Function = { fg = c.blue, style = config.styles.functions },
    --     Statement = { fg = c.magenta_br },
    --     Conditional = { fg = c.magenta_br },
    --     Repeat = { fg = c.magenta_br },
    --     Label = { fg = c.magenta_br },
    --
    --     mkdCodeStart = { fg = c.blue, style = "bold" },
    --     mkdCodeEnd = { fg = c.blue, style = "bold" },
    --     markdownCode = { fg = c.blue },
    --     markdownCodeBlock = { fg = c.blue },
    --
    --     DiagnosticUnderlineWarning = { style = "undercurl", sp = c.warning },
    --     DiagnosticUnderlineInformation = { style = "undercurl", sp = c.info },
    --
    --     DiagnosticError = { fg = c.error },
    --     DiagnosticWarn = { fg = c.warning },
    --     DiagnosticInfo = { fg = c.info },
    --     DiagnosticHint = { fg = c.hint },
    --
    --     TSConstBuiltin = { fg = c.orange_br },
    --     rustTSField = { fg = util.darken(c.white, 0.75) },
    --     TSFuncBuiltin = { fg = c.blue },
    --     TSNamespace = { fg = c.blue },
    --     TSParameter = { fg = c.orange_br },
    --     TSPunctSpecial = { fg = c.white },
    --     TSTypeBuiltin = { fg = c.blue },
    --     TSTextReference = { fg = c.blue },
    --
    --     TelescopeSelectionCaret = { fg = c.blue_br },
    --     TelescopeSelection = { fg = c.blue_br, bg = c.bg },
    --     TelescopeMatching = { fg = c.orange },
    --
    --     WhichKey = { fg = c.blue_br },
    -- },
})
