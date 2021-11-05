-- --------------------------- Config for other plugins --------------------------
-- ===============================================================================

local M = {}
local g = vim.g

-- ------------------------------- Colorschemes ----------------------------------
M.nightfox = function()
    local present, theme = pcall(require, "nightfox")
    if not present then
        return
    end

    local theme = require('nightfox')
end

-- ----------------------------- Indentline Setup --------------------------------
M.indent = function()
    require("indent_blankline").setup {
        indentLine_enabled = 1,
        char = "|",
        filetype_exclude = {
            "help",
            "terminal",
            "dashboard",
            "alpha",
            "packer",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
    }
end

-- ------------------------------ Commentor Setup --------------------------------
M.comment = function()
    local present, comment = pcall(require, "Comment")
    if present then
        comment.setup()
    end
end

-- ------------------------------ Colorizer Setup --------------------------------
M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup({ "*" }, {
            RGB = true, -- #RGB hex codes
            RRGGBB = true, -- #RRGGBB hex codes
            names = false, -- "Name" codes like Blue
            RRGGBBAA = false, -- #RRGGBBAA hex codes
            rgb_fn = false, -- CSS rgb() and rgba() functions
            hsl_fn = false, -- CSS hsl() and hsla() functions
            css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn

            -- Available modes: foreground, background
            mode = "background", -- Set the display mode.
        })
        vim.cmd "ColorizerReloadAllBuffers"
    end
end

-- ------------------------------- Autopair Setup --------------------------------
M.autopairs = function()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.cmp")

    if not (present1 or present2) then
        -- if not (present1) then
        return
    end

    autopairs.setup()
    -- autopairs_completion.setup {
        -- map_complete = true, -- insert () func completion
        -- map_cr = true,
        -- }
    end

-- --------------------------- LSP Signature Setup -------------------------------
    M.signature = function()
        local present, lspsignature = pcall(require, "lsp_signature")
        if present then
            lspsignature.setup {
                bind = true,
                doc_lines = 5,
                floating_window = false,
                fix_pos = true,
                hint_enable = true,
                hint_prefix = " ",
                hint_scheme = "String",
                hi_parameter = "Search",
                max_height = 22,
                max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
                handler_opts = {
                    border = "none", -- double, single, shadow, none
                },
                zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
                padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
            }
        end
    end

-- -------------------------- LuaSnip Setup (unused) -----------------------------
    M.luasnip = function()
        local present, luasnip = pcall(require, "luasnip")
        if not present then
            return
        end

        luasnip.config.set_config {
            history = true,
            updateevents = "TextChanged,TextChangedI",
        }
        -- require("luasnip/loaders/from_vscode").load { path = { chadrc_config.plugins.options.luasnip.snippet_path } }
        require("luasnip/loaders/from_vscode").load { path = { {} } }
    end

-- ------------------------------- Packer Setup ----------------------------------
    M.packer = function()
        local present, packer = pcall(require, "packer")
        if not present then
            return
        end

        packer.init {
            display = {
                open_fn = function()
                    return require("packer.util").float { border = "single" }
                end,
                prompt_border = "single",
            },
            git = {
                clone_timeout = 600, -- Timeout, in seconds, for git clones
            },
            auto_clean = true,
            compile_on_sync = true,
            --    auto_reload_compiled = true
        }

    end

-- ------------------------------- Lspsaga Setup ---------------------------------
    M.saga = function()
        local present, saga  = pcall(require, "lspsaga")
        if present then
            saga.init_lsp_saga()
        end
    end

    M.trouble = function()
        local present, trouble = pcall(require, "trouble")
        if not present then
            return
        end

        trouble.setup {
            height = 15, -- height of the trouble list when position is top or bottom
            mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
            action_keys = {
                toggle_fold = {"zH", "zh"},
            },
            auto_fold = true,
            use_lsp_diagnostic_signs = true
        }
    end

    M.vimtex = function ()
        g.vimtex_compiler_progname = 'nvr'
        g.vimtex_quickfix_mode = 0
        -- g.vimtex_view_general_viewer = 'zathura'
        -- g.vimtex_view_general_viewer = true
        g.vimtex_view_general_viewer = open
        g.tex_conceal = "abdmg"
        vim.opt.conceallevel=2
    end


    return M
