-- ===============================================================================
-- ================================= PLUGINS =====================================
-- ===============================================================================
require("plugins.misc").packer()

return require('packer').startup(function(use)

-- --------------------------- Basic System Plugs---------------------------------

    -- packer can manage itself
    use { 'wbthomason/packer.nvim', }

    -- lua plugin
    use { 'nvim-lua/plenary.nvim', }

    -- faster start up time
    use {
        'lewis6991/impatient.nvim',
        config = function() require('plugins.misc').imp() end,
    }
    use { 'nathom/filetype.nvim' }

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
        event = "BufEnter",
        config = function() require('plugins.which-key') end,
    }

    -- customized color scheme
    use {
        "mel10c/onenord.nvim",
        config = function() require('plugins.misc').onenord() end,
    }

    -- alternative color scheme
    use {
        "EdenEast/nightfox.nvim",
        config = function() require('plugins.misc').nightfox() end,
    }

    -- nerd icons
    use {
        "kyazdani42/nvim-web-devicons",
        event = "BufEnter",
        config = function() require('plugins.misc').icon() end,
    }

    -- status line
    use {
        'glepnir/galaxyline.nvim',
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
        event = "BufEnter",
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
        ft = {"markdown", "pandoc"},
        cmd = "TableModeEnable",
    }

    -- latex preview
    use {
        'lervag/vimtex',
        ft = 'tex',
        config = function () require('plugins.misc').vimtex() end,
    }

    -- Todo UI
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        cmd = {"TodoTelescope", "TodoQuickFix"},
        config = function() require('plugins.todo') end,
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
        event = "BufEnter",
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
        event = "BufRead",
    }

    -- easier alignment
    use {
        'junegunn/vim-easy-align',
        cmd = 'EasyAlign'
    }

    -- better rename
    use {
        'stevearc/dressing.nvim',
        event = "BufRead",
        config = function() require('plugins.misc').ui() end,
    }

    -- ------------------------------ Lsp configs ------------------------------------
    -- lsp config
    use {
        "neovim/nvim-lspconfig",
        requires = {'williamboman/nvim-lsp-installer'},
        config = function() require('lsp') end,
        event = "BufEnter"
    }

    -- good code action menu
    -- use {
    --     'weilbith/nvim-code-action-menu',
    --     cmd = 'CodeActionMenu',
    --     disable = true
    -- }

    -- good bug display
    -- use {
    --     "folke/trouble.nvim",
    --     requires = "kyazdani42/nvim-web-devicons",
    --     config = function() require('plugins.misc').trouble() end,
    --     cmd = "TroubleToggle",
    --     disable = false,
    -- }


    -- ---------------------------- Auto completion ----------------------------------
    -- completion engine
    use {
        "hrsh7th/nvim-cmp",
        config = function() require('plugins.cmp') end,
    }

    -- snips
    -- use {
    --     "L3MON4D3/LuaSnip",
    --     after = "nvim-cmp",
    --     config = function() require('plugins.misc').luasnip() end,
    --     disable = true,
    -- }
    -- luasnip completetion
    -- use {
    --     "saadparwaiz1/cmp_luasnip",
    --     after = "LuaSnip",
    --     disable = true,
    -- }

    -- snippets
    use {
        'SirVer/ultisnips',
        config = function ()
            vim.g.UltiSnipsRemoveSelectModeMappings = 0
        end,
        ft = {'tex', 'java', 'pandoc', 'markdown', 'snippets', 'lua'},
    }
    -- completion for snippets
    use {
        'quangnguyen30192/cmp-nvim-ultisnips',
        after = 'ultisnips',
    }

    -- soruce for build-in lsp clients
    use {
        "hrsh7th/cmp-nvim-lsp",
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
