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
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
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
        padding = { 2, 2, 2, 2 },
    },
    layout = {
        -- height = { min = 4, max = 25 }, -- min and max height of the columns
        -- width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 5,
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "<C-W>"},
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
local conf = " cwd=~/.config/nvim"
local setting = " theme=dropdown prompt_title=false"
local kb = " cwd=~/melaneyroot.github.io"

-- shotcut
key.register({
    f = {
        name = "telescope",
        a = { "<cmd>Telescope colorscheme<cr>",                            'colorscheme'},
        b = { "<cmd>Telescope buffers<cr>",                                'buffers'},
        c = { "<cmd>Telescope find_files"..conf.." <cr>",                  'config'},
        d = { "<cmd>Telescope find_files"..kb.." <cr>",                    'knowledge base'},
        e = { "<cmd>Telescope registers<cr>",                              'registers'},
        f = { "<cmd>Telescope fd<cr>",                                     'find file' },
        i = { "<cmd>Telescope file_browser<cr>",                           'file browse' },
        g = { "<cmd>Telescope git_status<cr>",                             'git status'},
        k = { "<cmd>Telescope keymaps<cr>",                                'keymaps'},
        z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>",              'buffer find'},
        o = { "<cmd>Telescope oldfiles<cr>",                               'recents'},
        p = { "<cmd>Telescope neoclip a"..setting.."<cr>",                 'clipboard'},
        r = { "<cmd>Telescope lsp_references<cr>",                         'reference'},
        t = { "<cmd>Telescope treesitter<cr>",                             'treesitter'},
        w = { "<cmd>Telescope live_grep<cr>",                              'search word'},
    },
}, { prefix = "<leader>" })

-- ------------------------------- LSP commands ----------------------------------
key.register({
    g = {
        name = "lsp",
        -- a = { "<cmd>CodeActionMenu<CR>",                                    'code action'},
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>",                     'code action'},
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>",                      'definition'},
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>",                     'declaration'},
        e = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",    'line diagn'},
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>",                  'implementation'},
        k = { "<cmd>lua vim.lsp.buf.hover()<CR>",                           'hover doc'},
        n = { "<cmd>lua vim.lsp.buf.rename()<CR>",                          'rename'},
        r = { "<cmd>lua vim.lsp.buf.references()<CR>",                      'reference'},
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>",                  'signature help'},
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>",                 'type definition'},
    },
}
-- ,{ prefix = "<leader>" }
)

-- ---------------------------- Floating Terminals -------------------------------
key.register({
    s = {
        name = "toggleTerm",
        d = { ':TermExec cmd="trans <c-r><c-w>" dir="~/"<CR>exit', 'define'},
        g = { '<cmd>TermExec cmd="g"<CR>',                         'lazygit'},
        h = { '<cmd>ToggleTerm direction=horizontal<CR>',          'terminal below'},
        l = { ':TermExec cmd="zh <c-r><c-w>" dir="~/"<CR>exit',    'translate'},
        s = { '<cmd>ToggleTerm<CR>',                               'terminal'},
        t = { ':TermExec cmd="zh" dir="~/"<CR>',                   'translation'},
        w = { '<cmd>ToggleTerm direction=tab<CR>',                 'terminal window'},
    },
}, { prefix = "<leader>" })

-- ------------------------------ Ignoring keys ----------------------------------
key.register({
    ["<space>j"] = "which_key_ignore",
    ["<space>k"] = "which_key_ignore",
    ["<space>l"] = "which_key_ignore",
    ["<space>h"] = "which_key_ignore",
    ["<space>q"] = "which_key_ignore",
    ["<space>w"] = "which_key_ignore",
})

