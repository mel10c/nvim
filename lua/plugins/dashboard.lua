-- ----------------------------- Dashboard Config --------------------------------
-- ===============================================================================

local g = vim.g

vim.cmd [[autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=3 ]]
vim.cmd [[autocmd FileType dashboard set laststatus=0 | autocmd WinLeave <buffer> set laststatus=3 ]]

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
    '',
    '',
    -- ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    -- ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    -- ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    -- ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    -- ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    -- ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
     '        ▄▄▄▄▄▄▄  ▄▄▄▄▄        ',
     '        █    ██      █        ',
     '        █      ██    █        ',
     '  ███  █  ██    ██  █  ███  ',
     '        █    ██      █        ',
     '        █      ██    █        ',
     '        ▀▀▀▀▀  ▀▀▀▀▀▀▀        ',
    '',
    '',
    '',
    '',
}

g.dashboard_custom_section = {
    a = { description = { "  Packer Update               ...  " }, command = "PackerSync" },
    b = { description = { "  Go To Today                SPC g  " }, command = function() vim.cmd[[Telekasten goto_today]] vim.cmd[[call feedkeys("\<CR>")]] end },
    c = { description = { "  Packer Status               ...  " }, command = "PackerStatus" },
    d = { description = { "  LSP INFO                    ...  " }, command = "LspInstallInfo" },
    e = { description = { " New File                    ...  " }, command = "DashboardNewFile" },
    h = { description = { "  Change Config             SPC f c" }, command = "Telescope find_files cwd=~/.config/nvim" },
}
