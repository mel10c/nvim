-- ===============================================================================
-- ---------------------------- Buffer Line Config -------------------------------

-- initialize
local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        indicator_icon = '',
        buffer_close_icon = "·",
        modified_icon = "",
        close_icon = '',
        show_close_icon = true,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        -- separator_style = "thin",
        separator_style = { '', '' },
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
            guibg = {attribute='bg',highlight='TabLine'}
        },
        background = {
            guibg = {attribute='bg',highlight='TabLine'}
        },

        tab = {
            guibg = {attribute='bg',highlight='TabLine'}
        },

        buffer_selected = {
            guifg = {attribute='fg',highlight='TabLineSel'},
            guibg = {attribute='bg',highlight='TabLineSel'},
            gui = "none"
        },
        buffer_visible = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = {attribute='bg',highlight='TabLine'},
        },

        close_button_visible = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = {attribute='bg',highlight='TabLine'}
        },
        close_button_selected = {
            guifg = {attribute='fg',highlight='TabLineSel'},
            guibg = {attribute='bg',highlight='TabLineSel'},
        },

        info = {
            guifg = {attribute='fg',highlight='TabLineSel'},
        },

        modified_selected = {
            guifg = {attribute='fg',highlight='TabLineSel'},
            guibg = {attribute='bg',highlight='TabLineSel'},
        },
        modified_visible = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = {attribute='bg',highlight='TabLine'}
        },

        modified = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = {attribute='bg',highlight='TabLine'}
        },

        separator = {
            guibg = {attribute='bg',highlight='TabLine'}
        },
        separator_selected = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = {attribute='bg',highlight='TabLine'},
        },
        separator_visible = {
            guibg = {attribute='bg',highlight='TabLine'}
        },
        indicator_selected = {
            guibg = {attribute='bg',highlight='TabLine'}
        },

        pick_selected = {
            guibg = {attribute='bg',highlight='TabLineSel'},
            gui = "bold"
        },
        pick_visible = {
            guibg = {attribute='bg',highlight='TabLine'},
            gui = "bold,italic"
        },
        pick = {
            guibg = {attribute='bg',highlight='TabLine'},
            gui = "bold,italic"
        },

        duplicate_selected = {
            guifg = {attribute='fg',highlight='TabLineSel'},
            guibg = {attribute='bg',highlight='TabLineSel'},
            gui = 'none'
        },
        duplicate_visible = {
            guifg = {attribute='fg',highlight='TabLine'},
            guibg = {attribute='bg',highlight='TabLine'},
        },
    }
}
