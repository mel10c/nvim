-- ===============================================================================
-- ---------------------------- Buffer Line Config -------------------------------

-- initialize
local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", "", text = "", padding = 1 } },
        indicator_icon = '',
        buffer_close_icon = "·",
        modified_icon = "",
        close_icon = '',
        show_close_icon = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
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
            bg = {attribute='bg',highlight='TabLine'}
        },
        background = {
            bg = {attribute='bg',highlight='TabLine'}
        },

        tab = {
            bg = {attribute='bg',highlight='TabLine'},
        },

        buffer_selected = {
            fg = {attribute='fg',highlight='TabLineSel'},
            bg = {attribute='bg',highlight='TabLineSel'},
            bold = true,
            italic = false
        },
        buffer_visible = {
            fg = {attribute='fg',highlight='TabLine'},
            bg = {attribute='bg',highlight='TabLine'},
        },

        close_button_visible = {
            fg = {attribute='fg',highlight='TabLine'},
            bg = {attribute='bg',highlight='TabLine'}
        },
        close_button_selected = {
            fg = {attribute='fg',highlight='TabLineSel'},
            bg = {attribute='bg',highlight='TabLineSel'},
        },

        info = {
            fg = {attribute='fg',highlight='TabLineSel'},
        },

        modified_selected = {
            fg = {attribute='fg',highlight='TabLineSel'},
            bg = {attribute='bg',highlight='TabLineSel'},
        },
        modified_visible = {
            fg = {attribute='fg',highlight='TabLine'},
            bg = {attribute='bg',highlight='TabLine'}
        },

        modified = {
            fg = {attribute='fg',highlight='TabLine'},
            bg = {attribute='bg',highlight='TabLine'}
        },

        separator = {
            bg = {attribute='bg',highlight='TabLine'}
        },
        separator_selected = {
            fg = {attribute='fg',highlight='TabLine'},
            bg = {attribute='bg',highlight='TabLine'},
        },
        separator_visible = {
            bg = {attribute='bg',highlight='TabLine'}
        },
        indicator_selected = {
            bg = {attribute='bg',highlight='TabLine'}
        },

        pick_selected = {
            bg = {attribute='bg',highlight='TabLineSel'},
            bold = true,
            italic = false
        },
        pick_visible = {
            bg = {attribute='bg',highlight='TabLine'},
            bold = true,
            italic = false
        },
        pick = {
            bg = {attribute='bg',highlight='TabLine'},
            bold = true,
            italic = false
        },

        -- duplicate_selected = {
        --     fg = {attribute='fg',highlight='TabLineSel'},
        --     bg = {attribute='bg',highlight='TabLineSel'},
        -- },
        -- duplicate_visible = {
        --     fg = {attribute='fg',highlight='TabLine'},
        --     bg = {attribute='bg',highlight='TabLine'},
        -- },
    }
}
