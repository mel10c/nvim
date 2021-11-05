-- ---------------------------- Keymap helper config -----------------------------
-- ===============================================================================

local present, key = pcall(require, "which-key")
if not present then
    return
end

key.setup {
    marks = false,
    registers = false,
    spelling = {
        enabled = false,
        suggestions = 20,
    },
    presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = false, -- misc bindings to work with windows
        z = false, -- bindings for folds, spelling and others prefixed with z
        g = false, -- bindings for prefixed with g
    },
    key_labels = {},
    icons = {
        breadcrumb = "+",
        separator = "➜",
        group = "» ",
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        -- height = { min = 4, max = 25 }, -- min and max height of the columns
        -- width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 5, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "<C-W>"}, -- hide mapping boilerplate
    show_help = false,
    triggers = "auto",
    -- triggers = {"<leader>"},
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },
}


-- ---------------------------- Telescope window ---------------------------------
-- shortcuts
local conf = " cwd=~/dotfiles/contents/.config/"
local setting = " previewer=false prompt_title=false results_title=false"
local config = "<cmd>Telescope find_files" .. conf .. setting .." <cr>"

-- telescope
key.register({
    f = {
        name = "telescope",
        a = { "<cmd>Telescope colorscheme<cr>",               'colorscheme'},
        b = { "<cmd>Telescope buffers<cr>",                   'buffers'},
        c = { config,                                         'dotfile'},
        --  d = { "<cmd>Telescope coc diagnostics theme=ivy", 'diagnostics'},
        e = { "<cmd>Telescope registers<cr>",                 'registers'},
        f = { "<cmd>Telescope find_files<cr>",                "Find File" },
        i = { "<cmd>Telescope file_browser<cr>",              "Find File" },
        g = { "<cmd>Telescope git_status<cr>",                'git status'},
        k = { "<cmd>Telescope keymaps<cr>",                   'keymaps'},
        z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", 'buffer find'},
        o = { "<cmd>Telescope oldfiles<cr>",                  'recents'},
        -- r = {':Telescope coc references theme=ivy',        'coc references'],
        r = { "<cmd>Telescope lsp_references<cr>",            'reference'},
        t = { "<cmd>Telescope treesitter theme=ivy<cr>",      'treesitter'},
        w = { "<cmd>Telescope live_grep<cr>",                 'search word'},
        s = { "<cmd>Telescope ultisnips<cr>",                 'ultisnips'},
        -- u = { "<cmd>Telescope file_browser cwd=~/OneDrive - University of Toronto/2021-2022/<cr>" , 'dotfile'},
    },
}, { prefix = "<leader>" })

-- lsp mappings
key.register({
    g = {
        name = "lsp",
        a = { "<cmd>CodeActionMenu<CR>",                             'code action'},
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>",               'definition'},
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>",              'declaration'},
        e = { "<cmd>Lspsaga show_line_diagnostics<cr>",              'line diagn'},
        h = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<cr>", 'lsp finder'},
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>",           'implementation'},
        k = { "<cmd>lua vim.lsp.buf.hover()<CR>",                    'hover doc'},
        n = { "<cmd>Lspsaga rename<cr>",                             'rename'},
        r = { "<cmd>lua vim.lsp.buf.references()<CR>",               'reference'},
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>",           'signature help'},
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>",          'type definition'},
    },
}
-- ,{ prefix = "<leader>" }
)

key.register({ s = {
    name = "session",
    s = { "<cmd><C-u>SessionSave<CR>"               , "save session"},
    l = { "<cmd><C-u>SessionLoad<CR>"               , "load session"},
},
}, { prefix = "<leader>" })

-- ignore keys
key.register({
    ["<space>j"] = "which_key_ignore",
    ["<space>k"] = "which_key_ignore",
    ["<space>l"] = "which_key_ignore",
    ["<space>h"] = "which_key_ignore",
    ["<space>q"] = "which_key_ignore",
    ["<space>w"] = "which_key_ignore",
})

