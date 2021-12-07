-- ------------------------------ LSP Config -------------------------------------
-- ===============================================================================
local lspconfig = require('lspconfig')

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
    if msg:match "exit code" then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end


-- ------------------------------ LSP Servers ------------------------------------
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    for _, lsp in ipairs(server) do
        lspconfig[lsp].setup {
            -- on_attach = my_custom_on_attach,
            capabilities = capabilities,
        }
    end

    server:setup(opts)
end)

-- ---------------------------- LSP UI Settings ----------------------------------
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        prefix = '❯', -- Could be '●', '▎', 'x', '■',
    }
})

