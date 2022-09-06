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
}

db.hide_tabline = false
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
--
local function make_custom_footer()
	local default_footer = { "", }
	if packer_plugins ~= nil then
		local count = #vim.tbl_keys(packer_plugins)
        local time = os.date("%H:%M")
		default_footer[1] = " |  Loaded: " .. count .. "  |  " .. time .. "  |  "
	end
	return default_footer
end

db.custom_footer = make_custom_footer
