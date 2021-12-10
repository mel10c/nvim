-- ------------------------------ Statusline Config ------------------------------
-- -------------------------------------------------------------------------------

local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-explorer", "vista"}

local nord_colors = {
    --bg = "NONE",
    bg = "#2E3440",
    fg = "#81A1C1",
    line_bg = "NONE",
    lbg = "NONE",
    -- lbg = "#3B4252",
    fg_green = "#8FBCBB",
    yellow = "#EBCB8B",
    darkblue = "#81A1C1",
    lightgray = "#6C7A96",
    green = "#8FBCBB",
    cyan = "#A3BE8C",
    orange = "#D08770",
    purple = "#B48EAD",
    magenta = "#BF616A",
    gray = "#616E88",
    dark_gray = "#3B4252",
    blue = "#5E81AC",
    red = "#BF616A"
}

local buffer_not_empty = function()
    if fn.empty(fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

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

section.left[1] = {
    ViMode = {
        provider = function()
            cmd('hi GalaxyViMode guibg='..mode_color[fn.mode()])
            -- return '   MEL10 '--..mode_text[vim.fn.mode()]
            return '  גּ  '--..mode_text[vim.fn.mode()]
            -- return ' '--..mode_text[vim.fn.mode()]
        end,
        condition = checkwidth,
        highlight = {nord_colors.bg, nord_colors.bg, "bold"}
    }
}

section.left[2] = {
    Dir = {
        provider = function()
            local dir_name = fn.fnamemodify(fn.getcwd(), ":t")
            return "  ".. " " .. dir_name .. " "
        end,
        condition = checkwidth_small,
        separator = " ",
        separator_highlight = {nord_colors.blue, nord_colors.lightgray},
        highlight = {nord_colors.bg, nord_colors.darkblue,},
    }
}

section.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {nord_colors.bg, nord_colors.lightgray}
    }
}
section.left[4] = {
    FileName = {
        provider = "FileName",
        condition = buffer_not_empty,
        separator = " ",
        separator_highlight = {nord_colors.blue, nord_colors.line_bg},
        highlight = {nord_colors.bg, nord_colors.lightgray,},
    }
}

section.right[1] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "   ",
        highlight = {nord_colors.red, nord_colors.line_bg},
        separator_highlight = {nord_colors.bg, nord_colors.line_bg}
    }
}
section.right[2] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "   ",
        highlight = {nord_colors.yellow, nord_colors.line_bg},
        separator_highlight = {nord_colors.bg, nord_colors.line_bg}
    }
}

section.right[3] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "   ",
        highlight = {nord_colors.purple, nord_colors.line_bg},
        separator_highlight = {nord_colors.bg, nord_colors.line_bg}
    }
}

section.right[4] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = " ",
        highlight = {nord_colors.blue, nord_colors.line_bg},
        -- separator = " ",
        -- separator_highlight = {nord_colors.bg, nord_colors.lightgray}
    }
}

section.right[5] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        separator = " ",
        separator_highlight = {nord_colors.bg, nord_colors.purple},
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        -- highlight = {nord_colors.purple, nord_colors.dark_gray}
        highlight = {nord_colors.bg, nord_colors.purple}
    }
}
section.right[6] = {
    GitBranch = {
        provider = "GitBranch",
        condition = checkwidth,
        -- highlight = {nord_colors.purple, nord_colors.dark_gray, "bold"}
        highlight = {nord_colors.bg, nord_colors.purple}
    }
}

section.right[7] = {
    Sep = {
        provider = function()
            return " "
        end,
        condition = checkwidth_small,
        highlight = {nord_colors.purple, nord_colors.purple},
    }
}

section.right[8] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth_small,
        separator = "",
        separator_highlight = {nord_colors.gray, nord_colors.purple},
        icon = " ",
        -- highlight = {nord_colors.cyan, nord_colors.dark_gray}
        highlight = {nord_colors.bg, nord_colors.purple}
    }
}
section.right[9] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth_small,
        separator = "",
        separator_highlight = {nord_colors.gray, nord_colors.purple},
        icon = "柳",
        -- highlight = {nord_colors.yellow, nord_colors.dark_gray}
        highlight = {nord_colors.bg, nord_colors.purple}
    }
}
section.right[10] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth_small,
        separator = "",
        separator_highlight = {nord_colors.bg, nord_colors.gray},
        icon = " ",
        -- highlight = {nord_colors.orange, nord_colors.dark_gray}
        highlight = {nord_colors.bg, nord_colors.purple}
    }
}

section.right[11] = {
    LineInfo = {
        provider = 'LinePercent',
        separator = " ",
        separator_highlight = {nord_colors.gray, nord_colors.gray},
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
