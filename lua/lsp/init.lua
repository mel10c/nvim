-- ------------------------------ LSP Config -------------------------------------
-- ===============================================================================
local present, lspconfig = pcall(require, "lspconfig")
if not present then
    return
end

-- ------------------------------ LSP Setup --------------------------------------
local setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = false, underline = false,
        signs = { active = signs, },
        update_in_insert = true, severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            header = "",
            prefix = "󰋽 ",
        },
    }

    vim.diagnostic.config(config)
end

setup()

-- ------------------------------ LSP Servers ------------------------------------
local status, mason = pcall(require, "mason")
if not status then
    return
end
mason.setup({ })

-- local capabilities = {
--     capabilities = require('lsp.handlers').capabilities,
-- }
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end
local lsp_flags = {
  debounce_text_changes = 150,
}

lspconfig['lua_ls'].setup{
    on_attach = on_attach,
    -- capabilities =-capabilities,
    flags = lsp_flags,
    settings = require('lsp.servers.lua_ls')
}
-- lspconfig['css_lua'].setup{
--     on_attach = on_attach,
--     -- capabilities =-capabilities,
--     flags = lsp_flags,
--     settings = require('lsp.servers.css')
-- }
-- lspconfig['ltex'].setup{
--     on_attach = on_attach,
--     -- capabilities =-capabilities,
--     flags = lsp_flags,
--     settings = require('lsp.servers.ltex')
-- }
lspconfig['r_language_server'].setup{
    on_attach = on_attach,
    -- capabilities = capabilities,
    flags = lsp_flags,
    settings = require('lsp.servers.r_language_server')
}

-- ---------------------------- LSP Settings -------------------------------------
-- require('lsp.handlers').setup()
