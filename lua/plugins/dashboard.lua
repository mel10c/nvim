-- ----------------------------- Dashboard Config --------------------------------
-- ===============================================================================

-- initialize
local present, db = pcall(require, "dashboard")
if not present then
    return
end

db.custom_header = {
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

db.hide_tabline = true
db.hide_statusline = false

db.custom_center = {
  { icon = '    ', desc = ' Packer Update       ', action = 'PackerSync', shortcut = "...  " },
  { icon = '    ', desc = ' Go To Today         ', action = function() vim.cmd[[Telekasten goto_today]] vim.cmd[[call feedkeys("\<CR>")]] end, shortcut = "SPC g" },
  { icon = '    ', desc = ' Packer Status       ', action = 'PackerStatus', shortcut = "...  " },
  { icon = '    ', desc = ' LSP INFO            ', action = 'LspInstallInfo', shortcut = "...  "},
  { icon = '    ', desc = ' New File            ', action = 'DashboardNewFile', shortcut = "...  "},
  { icon = '    ', desc = '             ', action = 'DashboardNewFile', shortcut = " "},
}
--     e = { description = { "  New File                    ...  " }, command = "DashboardNewFile" },
--     h = { description = { "  Change Config             SPC f c" }, command = "Telescope find_files cwd=~/.config/nvim" },
