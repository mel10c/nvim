-- ----------------------------- Start page Config -------------------------------
-- ===============================================================================

local present, alpha = pcall(require, "alpha")
if not present then
    return
end

local startify = require'alpha.themes.startify'


startify.section.header.val = {
        [[                                                      ]],
        [[                                                      ]],
        [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
        [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
        [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
        [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
        [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
        [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
        [[                                                      ]],
        [[                                                      ]],
}

startify.section.header.opts = {
    position = "center",
    hl = "Type",
}

startify.section.top_buttons.val = {
    startify.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
}

startify.section.top_buttons.opts = {
    position = "center",
}
-- startify.section.bottom_buttons.val = {
--     startify.button( "q", "  Quit NVIM" , ":qa<CR>"),
-- }
--

alpha.setup(startify.opts)
