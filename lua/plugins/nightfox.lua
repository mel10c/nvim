-- -------------------------------- Theme config ---------------------------------
-- ===============================================================================

local present, theme = pcall(require, "nightfox")
if not present then
    return
end

local theme = require('nightfox')

theme.setup({
    -- fox = "nightfox",
    transparent = false,
    terminal_colors = true, -- Configure the colors used when opening :terminal
    -- styles = {
    --     --comments = "italic",
    --     functions = "italic",
    --     keywords = "bold",
    --     --strings = "NONE",
    --     variables = "italic",
    -- },
})
