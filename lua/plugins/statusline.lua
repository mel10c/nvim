-- ------------------------------ Statusline Config ------------------------------
-- -------------------------------------------------------------------------------

local cmd = vim.cmd
local fn = vim.fn
local b = vim.b
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-explorer", "vista"}

local one_dark_colors = {
    bg = "#2e3440",
    fg = "#81a1c1",
    line_bg = "#2e3440",
    fg_green = "#6d96a5",
    yellow = "#e5c07b",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98c379",
    orange = "#FF8800",
    purple = "#5d4d7a",
    magenta = "#d16d9e",
    grey = "#c0c0c0",
    blue = "#61afef",
    red = "#D16969"
}

local nord_colors = {
    --bg = "NONE",
    bg = "#2E3440",
    fg = "#81A1C1",
    line_bg = "NONE",
    lbg = "NONE",
    -- lbg = "#3B4252",
    fg_green = "#8FBCBB",
    yellow = "#EBCB8B",
    cyan = "#A3BE8C",
    darkblue = "#81A1C1",
    green = "#8FBCBB",
    orange = "#D08770",
    purple = "#B48EAD",
    magenta = "#BF616A",
    gray = "#616E88",
    blue = "#5E81AC",
    red = "#BF616A"
}

local buffer_not_empty = function()
    if fn.empty(fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

local function lsp_status(status)
    local shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+") do
        local err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end

local function get_coc_lsp()
    local status = fn['coc#status']()
    if not status or status == '' then
        return ''
    end
    return lsp_status(status)
end

local function get_diagnostic_info()
    if fn.exists('*coc#rpc#start_server') == 1 then
        return get_coc_lsp()
    end
    return ''
end

CocStatus = get_diagnostic_info

local checkwidth = function()
    local squeeze_width = fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

local checkwidth_small = function()
    local squeeze_width = fn.winwidth(0) / 2
    if squeeze_width > 60 then
        return true
    end
    return false
end

local mode_color = {
    n = nord_colors.blue,
    i = nord_colors.cyan,
    v = nord_colors.yellow,
    [""] = nord_colors.orange,
    V = nord_colors.blue,
    c = nord_colors.red,
    no = nord_colors.magenta,
    s = nord_colors.orange,
    S = nord_colors.orange,
    [""] = nord_colors.orange,
    ic = nord_colors.yellow,
    R = nord_colors.purple,
    Rv = nord_colors.purple,
    cv = nord_colors.red,
    ce = nord_colors.red,
    r = nord_colors.green,
    rm = nord_colors.green,
    ["r?"] = nord_colors.green,
    ["!"] = nord_colors.red,
    t = nord_colors.red
}
--local mode_color = {
  --n = one_dark_colors.blue,
  --i = one_dark_colors.green,
  --v = one_dark_colors.yellow,
  --[""] = one_dark_colors.orange,
  --V = one_dark_colors.blue,
  --c = one_dark_colors.red,
  --no = one_dark_colors.magenta,
  --s = one_dark_colors.orange,
  --S = one_dark_colors.orange,
  --[""] = one_dark_colors.orange,
  --ic = one_dark_colors.yellow,
  --R = one_dark_colors.purple,
  --Rv = one_dark_colors.purple,
  --cv = one_dark_colors.red,
  --ce = one_dark_colors.red,
  --r = one_dark_colors.green,
  --rm = one_dark_colors.green,
  --["r?"] = one_dark_colors.green,
  --["!"] = one_dark_colors.red,
  --t = one_dark_colors.red
--}

--[[ section.left[0] = {
  Sep = {
    provider = function()
      return " "
    end,
    condition = checkwidth_small,
    highlight = {nord_colors.bg, nord_colors.line_bg,},
  }
} ]]

section.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode

            --cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
            --return "   גּ  "
            cmd('hi GalaxyViMode guibg='..mode_color[fn.mode()])
            -- return '   MEL10 '--..mode_text[vim.fn.mode()]
            -- return '  גּ '--..mode_text[vim.fn.mode()]
            return ' '--..mode_text[vim.fn.mode()]
        end,
        condition = checkwidth,
        separator = " ",
        --highlight = {one_dark_colors.bg, one_dark_colors.line_bg, "bold"}
        highlight = {nord_colors.line_bg, nord_colors.bg, "bold"}
    }
}

section.left[2] = {
    Dir = {
        provider = function()
            local dir_name = fn.fnamemodify(fn.getcwd(), ":t")
            return "".. " " .. dir_name .. " "
        end,
        condition = checkwidth_small,
        highlight = {nord_colors.fg, nord_colors.line_bg,},
    }
}

section.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        --highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, one_dark_colors.line_bg}
        highlight = {nord_colors.blue, nord_colors.line_bg}
    }
}
section.left[4] = {
    FileName = {
        provider = "FileName",
        --[[ provider = function()
            return fn.expand("%:F")
        end, ]]
        condition = buffer_not_empty,
        separator = " ",
        separator_highlight = {nord_colors.blue, nord_colors.line_bg},
        --highlight = {nord_colors.blue, nord_colors.line_bg, "bold"}
        highlight = {nord_colors.blue, nord_colors.line_bgbg,},
    }
}

section.left[5] = {
    VistaPlugin = {
        provider = function()
            if (b.vista_nearest_method_or_function == nil) then
                return ''
            elseif (b.vista_nearest_method_or_function == '') then
                return ''
            else
                return '  -> '..b.vista_nearest_method_or_function
            end
        end,
        separator = ' ',
        condition = buffer_not_empty,
        highlight = {nord_colors.gray, nord_colors.bg},
    }
}

-- section.left[5] = {
--     FileSize = {
--         provider = "FileSize",
--         separator = " ",
--         condition = buffer_not_empty,
--         separator_highlight = {nord_colors.blue, nord_colors.line_bg},
--         highlight = {nord_colors.fg, nord_colors.line_bg}
--     }
-- }

section.right[0] = {
    CocStatus = {
        separator = " ",
        provider = CocStatus,
        condition = checkwidth_small,
        highlight = {nord_colors.purple, nord_colors.line_bg},
        icon = '  '
    }
}

section.right[1] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "   ",
        -- separator = " ",
        highlight = {nord_colors.red, nord_colors.line_bg},
        separator_highlight = {nord_colors.bg, nord_colors.line_bg}
    }
}
section.right[2] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        -- separator = " ",
        icon = "   ",
        highlight = {nord_colors.yellow, nord_colors.line_bg},
        separator_highlight = {nord_colors.bg, nord_colors.line_bg}
    }
}

section.right[3] = {
    DiagnosticInfo = {
        -- separator = " ",
        provider = "DiagnosticInfo",
        icon = "   ",
        highlight = {nord_colors.cyan, nord_colors.line_bg},
        separator_highlight = {nord_colors.bg, nord_colors.line_bg}
    }
}

section.right[4] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        separator = " ",
        icon = " ",
        highlight = {nord_colors.blue, nord_colors.line_bg},
        separator_highlight = {nord_colors.bg, nord_colors.line_bg}
    }
}

section.right[5] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        separator = " | ",
        separator_highlight = {nord_colors.gray, nord_colors.line_bg},
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {nord_colors.purple, nord_colors.line_bg}
    }
}
section.right[6] = {
    GitBranch = {
        provider = "GitBranch",
        -- condition = require("galaxyline.provider_vcs").check_git_workspace,
        condition = checkwidth,
        highlight = {nord_colors.purple, nord_colors.line_bg, "bold"}
    }
}

section.right[7] = {
    Sep = {
        provider = function()
            return " "
        end,
        condition = checkwidth_small,
    }
}

section.right[8] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth_small,
        separator = "",
        icon = " ",
        highlight = {nord_colors.cyan, nord_colors.line_bg}
    }
}
section.right[9] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth_small,
        separator = "",
        icon = "柳",
        highlight = {nord_colors.yellow, nord_colors.line_bg}
    }
}
section.right[10] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth_small,
        separator = "",
        icon = " ",
        highlight = {nord_colors.orange, nord_colors.line_bg}
    }
}

section.right[11] = {
    LineInfo = {
        provider = 'LinePercent',
        separator = " ",
        separator_highlight = {nord_colors.gray, nord_colors.line_bg},
        condition = checkwidth,
        highlight = {nord_colors.bg, nord_colors.gray}
    }
}

section.right[12] = {
    WordCount = {
        provider = function()
            return ' ω:' ..fn.wordcount().words ..' '
        end,
        condition = checkwidth_small,
        highlight = {nord_colors.bg, nord_colors.gray}
    }
}

section.right[13] = {
    ScrollBar = {
        provider = 'ScrollBar',
        condition = checkwidth_small,
        highlight = {nord_colors.gray, nord_colors.line_bg}
    }
}

section.short_line_left[1] = {
    BufferType = {
        provider = "FileIcon",
        separator = " ",
        separator_highlight = {"NONE", nord_colors.lbg},
        highlight = {nord_colors.blue, nord_colors.lbg, "bold"}
    }
}

section.short_line_left[2] = {
    SFileName = {
        provider = function()
            local fileinfo = require("galaxyline.provider_fileinfo")
            local fname = fileinfo.get_current_file_name()
            for _, v in ipairs(gl.short_line_list) do
                if v == vim.bo.filetype then
                    return ""
                end
            end
            return fname
        end,
        condition = buffer_not_empty,
        highlight = {nord_colors.white, nord_colors.lbg, "bold"}
    }
}

section.short_line_right[1] = {
    BufferIcon = {
        provider = "BufferIcon",
        highlight = {nord_colors.fg, nord_colors.lbg}
    }
}
