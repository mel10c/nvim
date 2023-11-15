-- --------------------------- Config for other plugins --------------------------
-- ===============================================================================

local M = {}
local g = vim.g

-- ------------------------------- Colorschemes ----------------------------------
M.onenord = function()
    local colorscheme = "onenord"

    local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

    if not status then
        vim.notify("colorscheme" .. colorscheme .. " not found!")
        return
    end

    vim.cmd[[colorscheme onenord]]
end

-- ----------------------------- Indentline Setup --------------------------------
M.indent = function()
    local present, indent = pcall(require, "ibl")
    if not present then
        return
    end

    indent.setup {
        -- debounce = 100,
        indent = { char = "│" },
        whitespace = { highlight = { "Whitespace", "NonText" } },
        scope = {
            exclude = { },
            enabled = false,
            show_start = false,
            show_end = false,
            injected_languages = false,
            -- highlight = { "Function", "Label" },
            priority = 500,
    },

    --     -- use_treesitter = true,
    --     filetype_exclude = {
    --         "help",
    --         "packer", "terminal",
    --         "dashboard", "alpha",
    --         "lspinfo", "LspInstallInfo",
    --         "TelescopePrompt", "TelescopeResults",
    --     },
    --     buftype_exclude = {
    --         "terminal", "prompt", "nofile", "help"
    --     },
        -- show_first_indent_level = true,
        -- show_trailing_blankline_indent = false,
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
-- M.luasnip = function()
--     local present, luasnip = pcall(require, "luasnip")
--     if not present then
--         return
--     end
--
--     luasnip.config.set_config {
--         history = true,
--         updateevents = "TextChanged,TextChangedI",
--     }
--     -- require("luasnip/loaders/from_vscode").load { path = { chadrc_config.plugins.options.luasnip.snippet_path } }
--     require("luasnip/loaders/from_vscode").load { path = { {} } }
-- end

-- ------------------------------- Packer Setup ----------------------------------
M.packer = function()
    vim.cmd [[packadd packer.nvim]]

    local present, packer = pcall(require, "packer")
    if not present then
        local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

        print "Cloning packer.."
        -- remove the dir before cloning
        vim.fn.delete(packer_path, "rf")
        vim.fn.system {
            "git",
            "clone",
            "https://github.com/wbthomason/packer.nvim",
            "--depth",
            "20",
            packer_path,
        }

        vim.cmd "packadd packer.nvim"
        present, packer = pcall(require, "packer")

        if present then
            print "Packer cloned successfully."
        else
            error("Couldn't clone packer !\nPacker path: " .. packer_path)
        end
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

-- ------------------------------- LaTex for Nvim --------------------------------
M.vimtex = function ()
    g.vimtex_compiler_progname = 'nvr'
    g.vimtex_quickfix_mode = 0
    -- g.vimtex_view_general_viewer = 'zathura'
    -- g.vimtex_view_general_viewer = true
    g.vimtex_view_general_viewer = "open"
    g.tex_conceal = "abdmg"
    g.tex_flavor= "latex"
    vim.opt.conceallevel=2
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
            },
            md = {
                icon = " ",
                color = "#81A1C1",
                name = "md"
            }
        };
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
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
        highlights = {
            Normal = {
                guibg = "#2E3440",
            },
            NormalFloat = {
                guifg = "#C8D0E0",
                guibg = "#353B49",
            },
            FloatBorder = {
                guifg = '#353B49',
                guibg = '#353B49',
            },
        },
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
            border = 'none',
            -- width = <value>,
            -- height = <value>,
            -- winblend = 3,
        },
    }
end

-- -------------------------- Impatient Safe Call --------------------------------
M.imp = function()
    local present, imp = pcall(require, "impatient")
    if not present then
        return
    end
end

-- ---------------------------- RStudio in Nvim ----------------------------------
M.rstudio = function()
    g.R_auto_start = 0 -- does not auto start
end

-- ----------------------------- OpenAI ChatGPTOpenAI  ----------------------------------
-- M.AI = function()
--     local present, AI = pcall(require, "chatgpt")
--     if not present then
--         return
--     end
--     vim.fn.setenv("OPENAI_API_KEY", "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")
--
--     AI.setup({})
-- end

return M
