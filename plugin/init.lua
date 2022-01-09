-- ===============================================================================
-- ================================= PLUGINS =====================================
-- ===============================================================================

require("plugins.misc").packer()

return require('packer').startup(function(use)

-- --------------------------- Basic System Plugs---------------------------------

    -- lua plugin
    use { 'nvim-lua/plenary.nvim', }

    -- packer can manage itself
    use {
        'wbthomason/packer.nvim',
        event = "VimEnter",
    }

    -- faster start up time
    use {
        'nathom/filetype.nvim',
        config = function()
            vim.g.did_load_filetypes = 1
        end,
    }
    use {
        'lewis6991/impatient.nvim',
        config = function() require('plugins.misc').imp() end,
        after = 'filetype.nvim',
    }

    -- better code color
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
        event = "BufRead",
        cmd = {
            "TSInstall",
            "TSInstallSync",
            "TSBufEnable",
            "TSBufToggle",
            "TSEnableAll",
            "TSInstallFromGrammer",
            "TSToggleAll",
            "TSUpdate",
            "TSUpdateSync"
        },
        config = function() require('plugins.treesitter') end,
    }

-- ------------------------------- Appearance ------------------------------------

    -- key map reminder
    use {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function() require('plugins.which-key') end,
    }

    -- customized color scheme
    use {
        "mel10c/onenord.nvim",
        event = "VimEnter",
        config = function() require('plugins.misc').onenord() end,
    }

    -- alternative color scheme
    use {
        "EdenEast/nightfox.nvim",
        event = "VimEnter",
        config = function() require('plugins.misc').nightfox() end,
    }

    -- nerd icons
    use {
        "kyazdani42/nvim-web-devicons",
        after = "onenord.nvim",
        config = function() require('plugins.misc').icon() end,
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons',},
        after = "nvim-web-devicons",
        config = function() require('plugins.statusline') end,
    }

    -- tabline
    use {
        "akinsho/bufferline.nvim",
        after = "nvim-web-devicons",
        config = function() require('plugins.bufferline') end,
    }

    -- indent line
    use {
        'lukas-reineke/indent-blankline.nvim',
        event = "VimEnter",
        config = function() require('plugins.misc').indent() end,
    }

    -- dashboard
    use {
        "glepnir/dashboard-nvim",
        cmd = {
            "Dashboard",
            "DashboardChangeColorscheme",
            "DashboardFindFile",
            "DashboardFindHistory",
            "DashboardFindWord",
            "DashboardNewFile",
            "DashboardJumpMarks",
            "SessionLoad",
            "SessionSave"
        },
        config = function() require('plugins.dashboard') end,
    }

    -- git stuff
    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function() require('plugins.gitsigns') end,
    }

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
        config = function() require('plugins.NvimTree') end,
    }

    -- file finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {
                -- telescope order
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
        },
        cmd = "Telescope",
        config = function() require('plugins.telescope') end,
    }

    -- clipboard
    use {
        "AckslD/nvim-neoclip.lua",
        requires = "nvim-telescope/telescope.nvim",
        after = "telescope.nvim",
        config = function() require('plugins.misc').clip() end,
    }

    -- code outline
    use {
        'simrat39/symbols-outline.nvim',
        cmd = "SymbolsOutline",
    }

    -- preview colors
    use {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function() require('plugins.misc').colorizer() end,
    }

    -- easy table vim
    use {
        'dhruvasagar/vim-table-mode',
        ft = {"markdown", "pandoc", "telekasten"},
        cmd = "TableModeEnable",
    }

    -- latex preview
    use {
        'lervag/vimtex',
        cmd = "VimtexCompile",
        config = function () require('plugins.misc').vimtex() end,
    }

    -- zettelkasten note taking
    use {
        'mel10c/telekasten.nvim',
        cmd = "Telekasten",
        config = function () require('plugins.note') end,
    }

    -- ---------------------------- Editing Tools ------------------------------------

    -- auto pair
    use {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function() require('plugins.misc').autopairs() end,
    }

    -- change surrand types
    use {
        "tpope/vim-surround",
        event = "BufRead",
    }

    -- easy comment
    use {
        'numToStr/Comment.nvim',
        event = "BufRead",
        config = function() require('plugins.misc').comment() end,
    }

    -- terminal
    use {
        "akinsho/toggleterm.nvim",
        cmd = {"ToggleTerm", "TermExec"},
        config = function() require('plugins.misc').terminal() end,
    }

    -- match under cursor
    use {
        "andymass/vim-matchup",
        event = "VimEnter",
    }

    -- easier alignment
    use {
        'junegunn/vim-easy-align',
        cmd = 'EasyAlign'
    }

    -- ------------------------------ Lsp configs ------------------------------------

    -- lsp config
    use {
        "neovim/nvim-lspconfig",
        requires = {'williamboman/nvim-lsp-installer'},
        config = function() require('lsp') end,
        event = "BufRead",
    }

    -- better rename
    use {
        'stevearc/dressing.nvim',
        event = "BufRead",
        config = function() require('plugins.misc').ui() end,
    }

    -- ---------------------------- Auto completion ----------------------------------

    -- completion engine
    use {
        "hrsh7th/nvim-cmp",
        config = function() require('plugins.cmp') end,
        event = "InsertEnter",
    }

    -- -- snips
    -- use {
    --     "L3MON4D3/LuaSnip",
    --     after = "nvim-cmp",
    --     config = function() require('plugins.misc').luasnip() end,
    --     disable = false,
    -- }
    -- -- luasnip completetion
    -- use {
    --     "saadparwaiz1/cmp_luasnip",
    --     after = "LuaSnip",
    --     disable = false,
    -- }

    -- snippets
    use {
        'SirVer/ultisnips',
        event = "InsertEnter",
        config = function ()
            vim.g.UltiSnipsRemoveSelectModeMappings = 0
        end,
    }
    -- completion for snippets
    use {
        'quangnguyen30192/cmp-nvim-ultisnips',
        after = 'ultisnips',
    }

    -- soruce for build-in lsp clients
    use {
        "hrsh7th/cmp-nvim-lsp",
        event = "InsertEnter",
    }

    -- source for lua api
    use {
        "hrsh7th/cmp-nvim-lua",
        ft = "lua",
        after = "nvim-cmp",
    }

    -- source for buffer words
    use {
        "hrsh7th/cmp-buffer",
        event = "InsertEnter",
        after = "nvim-cmp",
    }

    -- source for path
    use {
        "hrsh7th/cmp-path",
        after = "cmp-buffer",
    }

    -- complete calculation
    use {
        "hrsh7th/cmp-calc",
        after = "cmp-buffer",
    }

    -- word suggestion
    use {
        "octaltree/cmp-look",
        after = "cmp-buffer"
    }

end)
