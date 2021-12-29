-- --------------------------- Config for other plugins --------------------------
-- ===============================================================================

local M = {}
local g = vim.g

-- ------------------------------- Colorschemes ----------------------------------
M.nightfox = function()
    local present, nightfox = pcall(require, "nightfox")
    if not present then
        nightfox.setup()
    end
    nightfox.setup{
        hlgroups = {
            CursorLineNr = { fg = "${blue_br}", style = "bold" },
            TabLine = { bg = "${bg}", fg = "${fg}" },
            TabLineFill = { bg = "${bg}" },
            TabLineSel = { fg = "${bg}", bg = "${blue}" },

            TelescopeSelection = { fg = "${cyan}", bg = "${bg}"},
        }
    }

end

M.onenord = function()
    local colorscheme = "onenord"
    local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status then
        vim.notify("colorscheme" .. colorscheme .. " not found!")
        return
    end

end

-- ----------------------------- Indentline Setup --------------------------------
M.indent = function()
    local present, indent = pcall(require, "indent_blankline")
    if not present then
        return
    end

    indent.setup {
        indentLine_enabled = 1,
        char = "│",
        use_treesitter = true,
        filetype_exclude = {
            "help",
            "packer", "terminal",
            "dashboard", "alpha",
            "lspinfo", "LspInstallInfo",
            "TelescopePrompt", "TelescopeResults",
        },
        buftype_exclude = {
            "terminal", "prompt", "nofile", "help"
        },
        show_first_indent_level = false,
        show_trailing_blankline_indent = false,
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
    -- local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.cmp")

    -- if not (present1 or present2) then
    if not (present1) then
        return
    end

    autopairs.setup()
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

-- ----------------------------- Lsp Error Display -------------------------------
M.trouble = function()
    local present, trouble = pcall(require, "trouble")
    if not present then
        return
    end

    trouble.setup {
        height = 15,
        -- "workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
        mode = "workspace_diagnostics",
        action_keys = {
            toggle_fold = {"zH", "zh"},
        },
        auto_fold = true,
        use_diagnostic_signs = true
    }
end

-- ------------------------------- LaTex for Nvim --------------------------------
M.vimtex = function ()
    g.vimtex_compiler_progname = 'nvr'
    g.vimtex_quickfix_mode = 0
    -- g.vimtex_view_general_viewer = 'zathura'
    -- g.vimtex_view_general_viewer = true
    g.vimtex_view_general_viewer = "open"
    g.tex_conceal = "abdmg"
    vim.opt.conceallevel=2
end

-- ---------------------------- nvim UI interface --------------------------------
M.ui = function()
    local present, ui = pcall(require, "dressing")
    if present then
        ui.setup()
    end
end

-- ----------------------------- Nvim Icons Setup --------------------------------
M.icon = function()
    local present, icons = pcall(require, "nvim-web-devicons")
    if not present then
        return
    end

    icons.setup {
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                name = "Zsh"
            }
        };
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
    }
end

-- ----------------------------- Clipboard Helper --------------------------------
M.clip = function ()
    local present, clip = pcall(require, "neoclip")
    if not present then
        return
    end

    clip.setup{
        history = 20,
        enable_persistant_history = false,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        filter = nil,
        preview = false,
        default_register = '"',
        content_spec_column = true,
        on_paste = {
            set_reg = false,
        },
        keys = {
            telescope = {
                i = {
                    select = '<cr>',
                    paste = 'p',
                    paste_behind = 'P',
                    custom = {},
                },
                n = {
                    select = '<cr>',
                    paste = 'p',
                    paste_behind = 'P',
                    custom = {},
                },
            },
        },
    }
end

-- ----------------------------- Terminal Setting --------------------------------
M.terminal = function()
    local present, terminal = pcall(require, "toggleterm")
    if not present then
        return
    end

    terminal.setup {
        -- size can be a number or function which is passed the current terminal
        function(term)
            if term.direction == "horizontal" then
                return 20
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        -- open_mapping = [[<leader>s]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = '3', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = 'float',
        shell = vim.o.shell, -- change the default shell
        close_on_exit = true, -- close the terminal window when the process exits
        float_opts = {
            -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
            border = 'single',
            -- width = <value>,
            -- height = <value>,
            winblend = 3,
            highlights = {
                border = "ToggleTermBorder",
                background = "ToggleTerm",
            }
        }
    }
end

-- -------------------------- Impatient Safe Call --------------------------------
M.imp = function()
    local present, imp = pcall(require, "impatient")
    if not present then
        return
    end
end

return M
