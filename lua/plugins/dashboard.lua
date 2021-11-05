-- ----------------------------- Dashboard Config --------------------------------
-- ===============================================================================

local g = vim.g

vim.cmd [[autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 ]]

-- g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
    '',
    '',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '',
    '',
}

g.dashboard_custom_section = {
    a = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
    b = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
    c = { description = { "  Change Config             SPC f c" }, command = "Telescope find_files cwd=~/dotfiles/contents/.config/" },
    d = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" },
    e = { description = { "洛 New File                    ...  " }, command = "DashboardNewFile" },
    f = { description = { "  Bookmarks                   ...  " }, command = "Telescope marks" },
    g = { description = { "  Change Color Scheme         ...  " }, command = "Telescope colorscheme" },
}

-- TODO: view number of plugins
-- g.dashboard_custom_footer = {
--        "   ",
--     }
--     g.total_plugins = trim(system("fd -d 2 . $HOME'/.local/share/nvim/site/pack/packer' | head -n -2 | wc -l"))
--     g.dashboard_custom_footer = {'                               loaded '.. g.total_plugins ..' plugins     '}
