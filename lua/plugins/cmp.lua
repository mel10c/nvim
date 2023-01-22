-- ---------------------------- Completion Config --------------------------------
-- ===============================================================================

-- initialize
local present, cmp = pcall(require, "cmp")
if not present then
    return
end

-- local function png_or_markdown_files(path)
--     return string.match(path, '.*%.png') or string.match(path, '.*%.md')
-- end
--

vim.opt.completeopt = "menuone,noselect"

-- ----------------------------- Formating Config --------------------------------
cmp.setup {
    snippet = {
        expand = function(args)
            -- require("luasnip").lsp_expand(args.body)
            vim.fn["UltiSnips#Anon"](args.body)
        end, },
    sources = {
        { name = 'calc' },
        { name = "ultisnips" },
        { name = "nvim_lsp", max_item_count = 10 },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer", keyword_length = 3, max_item_count = 3, },
        { name = 'look', keyword_length=4, max_item_count = 3,
            options={ convert_case=true, loud=true } },
        { name = "latex_symbols", option = {strategy = 0}, max_item_count = 3 },
    },
    formatting = {
        fields = { "abbr", "kind", "menu", },
        format = function(entry, vim_item)
            -- load lspkind icons
            vim_item.kind = string.format(
            -- "%s %s",
            require("plugins.lspkind_icons").icons[vim_item.kind],
            vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "LSP",
                nvim_lua = "API",
                buffer = "BUF",
                path = "PAT",
                ultisnips = "SNI",
                luasnip = "LLL",
                calc = "CAL",
                look = "SPL",
                latex_symbols = "TEX",
            }) [entry.source.name]
            return vim_item
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<up>"] = cmp.mapping.scroll_docs(-4),
        ["<down>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
            elseif vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            else
                fallback()
            end
        end,
    },
    window = {
    documentation = {
        -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        border = { " ", " ", " ", " ", " ", " ", " ", " " },
    }, },
    -- window = {
    --     completion = { border = "solid" },
    --     documentation = { border = "solid" }
    -- },
    experimental = {
        native_menu = false,
        ghost_text = true,
    }
}

-- ------------------------------ cmdline Config ---------------------------------
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
