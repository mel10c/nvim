-- ===============================================================================
-- ================================= PLUGINS =====================================
-- ===============================================================================
require("plugins.misc").packer()
require('util').disable()

-- -------------------------------- Auto Load ------------------------------------
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
-- --------------------------- Basic System Plugs---------------------------------
    -- lua plugin
    use {
        'nvim-lua/plenary.nvim',
    }

    -- packer can manage itself
    use {
        'wbthomason/packer.nvim',
    }

    -- faster start up time
    use({
        'lewis6991/impatient.nvim',
        config = function() require('impatient') end,
    })

    -- better code color
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
        branch = "0.5-compat",
        config = function() require('plugins.treesitter') end,
        event = "BufRead",
    }

-- ------------------------------- Appearance ------------------------------------
    -- key map reminder
    use {
        "folke/which-key.nvim",
        config = function() require('plugins.which-key') end,
        event = "BufWinEnter",
        disable = false,
    }

    -- Good COLOR SCHEME!
    use {
        "EdenEast/nightfox.nvim",
        disable = false,
        config = function() require('plugins.nightfox') end,
    }

    -- nerd icons
    use {
        "kyazdani42/nvim-web-devicons",
        config = function() require('plugins.icons') end,
    }

    -- status line
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons',},
        config = function() require('plugins.statusline') end,
        after = "nvim-web-devicons"
    }

    -- tabline
    use {
        "akinsho/bufferline.nvim",
        config = function() require('plugins.bufferline') end,
        after = "nvim-web-devicons",
    }

    -- dashboard
    use {
        "glepnir/dashboard-nvim",
        config = function() require('plugins.dashboard') end,
        disable = false,
        event = "BufEnter",
    }

    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            -- require'alpha'.setup(require'alpha.themes.startify'.opts)
            require('plugins.alpha')
        end,
        disable = true
    }

    -- git stuff
    use {
        "lewis6991/gitsigns.nvim",
        config = function() require('plugins.gitsigns') end,
        disable = false,
        setup = function()
            require("util").packer_lazy_load "gitsigns.nvim"
        end,
    }

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require('plugins.NvimTree') end,
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
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
            {
                -- view ultisnips
                "fhill2/telescope-ultisnips.nvim",
            }
        },
        config = function() require('plugins.telescope') end,
        cmd = "Telescope",
    }

    -- indent line
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins.misc').indent() end,
        event = "BufWinEnter",
    }

    -- code outline
    use {
        'simrat39/symbols-outline.nvim',
        cmd = "SymbolsOutline",
    }

    -- preview colors
    use {
        "norcalli/nvim-colorizer.lua",
        config = function() require('plugins.misc').colorizer() end,
        cmd = "ColorizerToggle",
    }

    -- markdown requirement + highlight
    use {
        'vim-pandoc/vim-pandoc',
        ft = {"markdown", "pandoc"},
        disable = true
    }
    use {
        'vim-pandoc/vim-pandoc-syntax',
        requires = { 'vim-pandoc/vim-pandoc' },
        ft = {"markdown", "pandoc"},
        disable = true
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
        disable = false,
        ft = 'tex',
        config = function () require('plugins.misc').vimtex() end,
    }

    -- ---------------------------- Editing Tools ------------------------------------
    -- auto pair
    use {
        "windwp/nvim-autopairs",
        config = function() require('plugins.misc').autopairs() end,
        after = "nvim-cmp"
    }

    -- change surrand types
    use {
        "tpope/vim-surround",
        event = "BufRead",
    }

    -- zen mode
    use {
        "Pocco81/TrueZen.nvim",
        cmd = {'TZMinimalist', 'TZFocus', 'TZAtaraxis' }
    }

    -- markdown bullets
    use {
        'dkarter/bullets.vim',
        ft = {"markdown", "pandoc"},
    }

    -- easy comment
    use {
        'numToStr/Comment.nvim',
        config = function() require('plugins.misc').comment() end,
        event = "BufRead",
    }

    -- terminal
    use {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        disable = true
    }

    -- match under cursor
    use {
        "andymass/vim-matchup",
        setup = function()
            require("util").packer_lazy_load "vim-matchup"
        end,
        -- event = "BufRead",
        event = "BufEnter",
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
        requires = {'kabouzeid/nvim-lspinstall'},
        config = function() require('plugins.lspconfig') end,
        setup = function()
            require("util").packer_lazy_load "nvim-lspconfig"
            -- reload the current file so lsp actually starts for it
            vim.defer_fn(function()
                vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
            end, 0)
        end,
    }

    -- lsp hints
    use {
        "ray-x/lsp_signature.nvim",
        config = function() require('plugins.misc').signature() end,
        after = "nvim-lspconfig",
    }

    -- completion engine
    use {
        "hrsh7th/nvim-cmp",
        config = function() require('plugins.cmp') end,
    }

    -- snips
    -- use {
    --     "L3MON4D3/LuaSnip",
    --     wants = "friendly-snippets",
    --     after = "nvim-cmp",
    --     config = function() require('plugins.misc').luasnip() end,
    -- }

    -- luasnip completetion
    -- use {
    --     "saadparwaiz1/cmp_luasnip",
    --     after = "LuaSnip",
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

    -- dot completion
    use {
        'kristijanhusak/vim-dadbod-completion',
        after = "cmp-buffer",
        disable = true,
    }

    -- pretty rename and other lsp functions
    use {
        'glepnir/lspsaga.nvim',
        config = function() require('plugins.lspsaga') end,
        cmd = "Lspsaga",
        after = "nvim-cmp",
        disable = false,
    }

    -- good code action menu
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    }

    -- good bug display
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require('plugins.misc').trouble() end,
        cmd = "TroubleToggle"
    }

end)
