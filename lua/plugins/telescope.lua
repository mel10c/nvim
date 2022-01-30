-- ------------------------------- Telescope config ------------------------------
-- ===============================================================================

local present, telescope = pcall(require, "telescope")
if not present then
    return
end

telescope.setup {
    defaults = {

      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },

        prompt_prefix = "   ",
        -- selection_caret = " ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",

        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.80,
            height = 0.75,
            preview_cutoff = 120,
        },

        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "smart" },
        winblend = 0,
        border = {},

        borderchars = {
            { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
            results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        },

        prompt_title = false,
        results_title = false,
        preview_title = false,
        -- previewer = false,
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },

    pickers = {

        colorscheme = {
            prompt_prefix = "   ",
            layout_config = { width = 0.30, height = 0.30, },
        },

        buffers = {
            prompt_prefix = "   ",
            previewer = false,
            layout_config = { width = 0.40, height = 0.30, },
        },

        find_files = {
            prompt_prefix = "   ",
            previewer = false,
            layout_config = {
                width = 0.50,
                height = 0.50,
            },
        },

        oldfiles = {
            prompt_prefix = " ﭾ  ",
        },

        lsp_references = {
            layout_strategy = "center",
            prompt_prefix = "   ",
            layout_config = {
                preview_cutoff = 40,
                width = 0.50,
                height = 0.40,
            },
        },

        current_buffer_fuzzy_find = {
            prompt_prefix = "   ",
        },

        live_grep = {
            prompt_prefix = "   ",
        },

    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
        },
    },
}

-- local extensions = { "themes", "terms", "fzf", "coc", "ultisnips" }
local extensions = { "fzf", }
-- local packer_repos = [["extensions", "telescope-fzf-native.nvim"]]

pcall(function()
    for _, ext in ipairs(extensions) do
        telescope.load_extension(ext)
    end
end)
