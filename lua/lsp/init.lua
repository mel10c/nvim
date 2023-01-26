-- ------------------------------ LSP Config -------------------------------------
-- ===============================================================================
local present, lspconfig = pcall(require, "lspconfig")
if not present then
    return
end

-- ------------------------------ LSP Servers ------------------------------------
local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('lsp.handlers').on_attach,
        capabilities = require('lsp.handlers').capabilities,
    }

    if server.name == "sumneko_lua" then
        local sumneko_opts = require('lsp.servers.sumneko_lua')
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "css_lua" then
        local css_opts = require('lsp.servers.css')
        opts = vim.tbl_deep_extend("force", css_opts, opts)
    end

    if server.name == "ltex" then
        local ltex_opts = require('lsp.servers.ltex')
        opts = vim.tbl_deep_extend("force", ltex_opts, opts)
    end

    if server.name == "r_language_server" then
        local r_opts = require('lsp.servers.r_language_server')
        opts = vim.tbl_deep_extend("force", r_opts, opts)
    end

    server:setup(opts)
end)

-- ---------------------------- LSP Settings -------------------------------------
require('lsp.handlers').setup()
