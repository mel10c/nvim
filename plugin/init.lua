-- ===============================================================================
-- ===============================================================================
-- ================================= PLUGINS =====================================

require("plugins.misc").packer()

return require('packer').startup(function(use)

-- --------------------------- Basic System Plugs---------------------------------

    -- lua plugin
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- faster start up time
    -- use { "nathom/filetype.nvim", }
    -- use { "lewis6991/impatient.nvim", }

    -- packer can manage itself
    use {
        'wbthomason/packer.nvim',
        event = "BufRead",
    }

    -- better code color
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
        event = "VimEnter",
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
    -- use {
    --     "AlexvZyl/nordic.nvim",
    --     event = "VimEnter",
    -- }
    use {
          "neanias/everforest-nvim",
        event = "VimEnter",
    }

    -- nerd icons
    use {
        "kyazdani42/nvim-web-devicons",
        after = "onenord.nvim",
        module = "nvim-web-devicons",
        config = function() require('plugins.misc').icon() end,
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
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
        event = "BufRead",
        config = function() require('plugins.misc').indent() end,
    }

    -- dashboard
    use {
        "mel10c/dashboard",
        branch = "Old",
        cmd = {
            "Dashboard",
            "DashboardNewFile",
        },
        config = function() require('plugins.dashboard') end,
    }

    -- git stuff
    use {
        "lewis6991/gitsigns.nvim",
        -- event = "BufRead",
        ft = {"lua", "css", "snippet", "JS", "vim"},
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
                event = "BufRead",
                run = "make",
            },
        },
        module = "telescope",
        cmd = "Telescope",
        config = function() require('plugins.telescope') end,
    }

    -- zettelkasten note taking
    -- use {
    --     'mel10c/telekasten.nvim',
    --     cmd = "Telekasten",
    -- }
    use {
        'renerocksai/telekasten.nvim',
        config = function() require('plugins.telekasten') end,
        cmd = "Telekasten",
    }

    -- -- obsidian!!!
    -- use {
    --     "epwalsh/obsidian.nvim",
    --     ft = {"markdown", "pandoc", "telekasten"},
    --     config = function() require('plugins.obsidian') end,
    -- }

    -- -- markdown header
    -- use {
    --     "crispgm/telescope-heading.nvim",
    --     ft = {"markdown", "pandoc", "telekasten"},
    -- }

    -- preview colors
    use {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = function() require('plugins.misc').colorizer() end,
    }

    -- easy table vim
    use {
        'dhruvasagar/vim-table-mode',
        ft = {"markdown", "pandoc", "telekasten", "Rmd" },
        cmd = "TableModeEnable",
    }

    -- latex preview
    use {
        'lervag/vimtex',
        cmd = "VimtexCompile",
        config = function () require('plugins.misc').vimtex() end,
    }

    -- use {
    --     "rcarriga/nvim-notify",
    --     event = "VimEnter",
    --     config = function () require('plugins.misc').notify() end,
    -- }

    -- cmdline
    use({
        "folke/noice.nvim",
        event = "VimEnter",
        module = "noice",
        config = function () require('plugins.cmdline') end,
        requires = {
            "MunifTanjim/nui.nvim",
            event = "VimEnter",
        }
    })

   --  -- ChatGPT for OpenAI
   --  use({
   --      "jackMort/ChatGPT.nvim",
   --      -- event = "VimEnter",
   --      -- config = function () require('plugins.misc').AI() end,
   --      cmd = "ChatGPT",
   --      config = function()
   --          vim.fn.setenv("OPENAI_API_KEY", "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")
   --          require("chatgpt").setup({
   --              -- optional configuration
   --          })
   --      end,
   --      requires = {
   --          "MunifTanjim/nui.nvim",
   --          "nvim-lua/plenary.nvim",
   --          "nvim-telescope/telescope.nvim"
   --      }
   -- })

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
        -- event = "BufRead",
        after = "nvim-cmp",
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

    -- -- easier alignment
    -- use {
    --     'junegunn/vim-easy-align',
    --     cmd = 'EasyAlign'
    -- }

    -- json file fixer
    -- use {
    --     'ennaro-tedesco/nvim-jqx',
    --     cmd = 'JqxList'
    -- }

    -- Better markdown
    use {
        "vim-pandoc/vim-pandoc-syntax",
        ft = {"markdown", "pandoc"},
    }

    -- ------------------------------ Lsp configs ------------------------------------

    -- lsp config
    use {
        "neovim/nvim-lspconfig",
        requires = {'williamboman/mason.nvim'},
        config = function() require('lsp') end,
        event = "BufRead",
        module = "lspconfig"
    }

    -- RStudio
    use {
        'jalvesaq/Nvim-R',
        ft = {"R", "Rmd", "md"},
        cmd = { "RStart", "RMakePDF", "ROpenLists" },
        config = function() require('plugins.misc').rstudio() end,
    }

    -- -- ---------------------------- Auto completion ----------------------------------

    -- completion engine
    use {
        "hrsh7th/nvim-cmp",
        config = function() require('plugins.cmp') end,
        -- event = "VimEnter",
        event = "InsertCharPre",
        module = "cmp"
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
        -- event = "InsertEnter",
        after = "nvim-cmp",
    }

    -- source for lua api
    use {
        "hrsh7th/cmp-nvim-lua",
        ft = "lua",
        -- event = "InsertEnter",
        after = "nvim-cmp",
    }

    -- source for buffer words
    use {
        "hrsh7th/cmp-buffer",
        -- event = "InsertEnter",
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

    -- latex
    use {
        "kdheepak/cmp-latex-symbols",
        after = "cmp-buffer"
    }

end)
