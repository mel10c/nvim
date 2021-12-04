-- ----------------------------- Dashboard Config --------------------------------
-- ===============================================================================

local g = vim.g

vim.cmd [[autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 ]]
vim.cmd [[autocmd FileType dashboard set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2 ]]

-- g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
    '',
    '',
    '',
    '',
    '',
    -- ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    -- ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    -- ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    -- ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    -- ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    -- ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    ' ███╗   ██╗  ██████╗  ██████╗  ██████╗  ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔═══██╗ ██╔══██╗ ██╔══██╗ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ ██║   ██║ ██████╔╝ ██║  ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██║   ██║ ██╔══██╗ ██║  ██║ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ╚██████╔╝ ██║  ██║ ██████╔╝ ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝  ╚═════╝  ╚═╝  ╚═╝ ╚═════╝  ╚═╝ ╚═╝     ╚═╝',
    '',
    '',
    '',
    '',
}

g.dashboard_custom_section = {
    a = { description = { "  Packer Update               ...  " }, command = "PackerSync" },
    b = { description = { "  Packer Status               ...  " }, command = "PackerStatus" },
    c = { description = { "  LSP INFO                    ...  " }, command = "LspInstallInfo" },
    d = { description = { "洛 New File                    ...  " }, command = "DashboardNewFile" },
    e = { description = { "  Change Color Scheme       SPC f a" }, command = "Telescope colorscheme" },
    f = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
    g = { description = { "  Change Config             SPC f c" }, command = "Telescope find_files cwd=~/.config/nvim" },
}
