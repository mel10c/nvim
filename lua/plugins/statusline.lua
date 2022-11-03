-- ------------------------------ Statusline Config ------------------------------

-- initialize
-- -------------------------------------------------------------------------------
local present, lualine = pcall(require, "lualine")
if not present then
    return

end
-- ----------------------------------- Set Up ------------------------------------

local colors = {
    bg        = '#2E3440',
    -- bg        = 'NONE',
    fg        = '#C8D0E0',
    yellow    = '#EBCB8B',
    cyan      = '#8FBCBB',
    darkblue  = '#5E81AC',
    green     = '#A3BE8C',
    orange    = '#D08770',
    violet    = '#B48EAD',
    magenta   = '#BF616A',
    blue      = '#81A1C1',
    red       = '#BF616A',
    lightgray = "#6C7A96",
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
        disabled_filetypes = {"packager", "Floaterm", "dashboard", "NvimTree", "TelescopePrompt"},
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {
            -- {
            --     require("noice").api.status.command.get,
            --     cond = require("noice").api.status.command.has,
            --     color = { fg = "#6C7A96" }
            -- },
            -- {
            --     require("noice").api.status.search.get,
            --     cond = require("noice").api.status.search.has,
            --     color = { fg = "#6C7A96" }
            -- },

            {
                require("noice").api.status.message.get,
                cond = require("noice").api.status.message.has,
                color = { fg = "#81A1C1" }
            },
            {
                require("noice").api.status.mode.get,
                cond = require("noice").api.status.mode.has,
                color = { fg = "#6C7A96" }
            },
        },
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_z = {},
        lualine_y = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

-- ------------------------------------ Left -------------------------------------

-- ins_left({
--     function()
--         return '▊'
--     end,
--     color = { fg = colors.lightgray },
--     padding = { left = 0, right = 0 },
-- })

ins_left({
    -- mode component
    function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.yellow,
            V = colors.yellow,
            ["\x16"] = colors.orange,
            c = colors.red,
            no = colors.magenta,
            s = colors.orange,
            S = colors.orange,
            -- ["^S"] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        local mode_icons = {
            ['n'] = '    ',
            ['i'] = '    ',
            ['s'] = '    ',
            ['v'] = '    ',
            ['V'] = '    ',
            ['\x16'] = '    ',
            ['r'] = '    ',
            ['c'] = '    ',
            ['t'] = '    ',
        }
        vim.api.nvim_command('hi! LualineMode guibg=' .. mode_color[vim.fn.mode()] .. ' guifg=' .. colors.bg)
        -- return '   '
        return mode_icons [vim.fn.mode()]
    end,
    color = 'LualineMode',
    padding = { left = 0, right = 1 },
})


ins_left({
    function()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        return "  ".. " " .. dir_name .. " "
    end,
    color = { fg = colors.lightgray, gui = 'bold' },
    cond = conditions.hide_in_width,
    padding = { left = 0, right = 0 },
})
--
-- ins_left({
--     'filetype',
--     cond = conditions.buffer_not_empty,
--     color = { fg = colors.darkblue, gui = 'bold' },
--     colored = false,
--     icon_only = true,
--     padding = { left = 1, right = 0 },
-- })
--
-- ins_left({
--     'filename',
--     cond = conditions.buffer_not_empty,
--     color = { fg = colors.darkblue, gui = 'bold' },
--     padding = { left = 1, right = 0 },
-- })

ins_left({
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
})

-- ---------------------------------- Middle -------------------------------------

-- ins_left({
--     function()
--         return '%='
--     end,
-- })
--
-- ins_left({
--     -- Lsp server name .
--     function()
--         local msg = 'No Active Lsp'
--         local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--         local clients = vim.lsp.get_active_clients()
--         if next(clients) == nil then
--             return msg
--         end
--         for _, client in ipairs(clients) do
--             local filetypes = client.config.filetypes
--             if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--                 return client.name
--             end
--         end
--         return msg
--     end,
--     color = { fg = colors.fg, },
--     cond = conditions.hide_in_width,
-- })

-- ----------------------------------- Right -------------------------------------
--
-- ins_right({
--     'branch',
--     icon = '',
--     color = { fg = colors.violet, gui = 'bold' },
-- })

-- ins_right({
--     'diff',
--     -- Is it me or the symbol for modified us really weird
--     symbols = { added = ' ', modified = '柳', removed = ' ' },
--     diff_color = {
--         added = { fg = colors.green },
--         modified = { fg = colors.orange },
--         removed = { fg = colors.red },
--     },
--     cond = conditions.hide_in_width,
--     padding = { left = 0, right = 1 },
-- })

ins_right({
    function()
        return 'ω:' ..vim.fn.wordcount().words
    end,
    color = { fg = colors.lightgray, gui = "bold" },
    cond = conditions.hide_in_width,
    padding = { left = 1, right = 2 },
})

ins_right({
    function()
        return ' '
    end,
    color = { bg = colors.lightgray },
    padding = { left = 0, right = 0 },
})

ins_right({
    'progress',
    icon = "",
    color = { fg = colors.bg, bg = colors.lightgray, gui = 'bold' },
    padding = { left = 0, right = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
