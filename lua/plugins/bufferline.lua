-- ---------------------------- Buffer Line Config -------------------------------
-- ===============================================================================

-- colors
local nord_colors = {
    bg = "#2E3440",
    darkblue = "#81A1C1",
    red = "#BF616A"
}

-- initialize
local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        buffer_close_icon = "·",
        modified_icon = "",
        show_close_icon = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 0,
        tab_size = 18,
        show_tab_indicators = false,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        separator_style = "thin",
        always_show_bufferline = true,
        diagnostics = false, -- "or nvim_lsp"
        custom_filter = function(buf_number)
            -- Func to filter out our managed/persistent split terms
            local present_type, type = pcall(function()
                return vim.api.nvim_buf_get_var(buf_number, "term_type")
            end)

            if present_type then
                if type == "vert" then
                    return false
                elseif type == "hori" then
                    return false
                else
                    return true
                end
            else
                return true
            end
        end,
    },
    highlights = {
        fill = {
            guibg = nord_colors.bg
        },
        background = {
            guibg = nord_colors.bg
        },

        buffer_selected = {
            guifg = nord_colors.bg,
            guibg = nord_colors.darkblue,
            gui = 'none'
        },
        buffer_visible = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = nord_colors.bg
        },

        close_button_visible = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = nord_colors.bg
        },
        close_button_selected = {
            guifg = nord_colors.bg,
            guibg = nord_colors.darkblue,
        },

        modified_selected = {
            guifg = nord_colors.bg,
            guibg = nord_colors.darkblue,
        },
        modified_visible = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = nord_colors.bg
        },
        modified = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = nord_colors.bg
        },

        separator = {
            guibg = nord_colors.bg
        },
        separator_selected = {
            guibg = nord_colors.bg
        },
        separator_visible = {
            guibg = nord_colors.bg
        },
        indicator_selected = {
            guibg = nord_colors.bg
        },

        pick_selected = {
            guifg = nord_colors.red,
            guibg = nord_colors.darkblue,
            gui = "bold"
        },
        pick_visible = {
            guifg = nord_colors.red,
            guibg = nord_colors.bg,
            gui = "bold,italic"
        },
        pick = {
            guifg = nord_colors.red,
            guibg = nord_colors.bg,
            gui = "bold,italic"
        }
    },
}
