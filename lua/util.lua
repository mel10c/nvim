-- ===============================================================================
-- ============================== HELPER FUNCTIONS ===============================
-- ===============================================================================

local M = {}

M.packer_lazy_load = function(plugin, timer)
    if plugin then
        timer = timer or 0
        vim.defer_fn(function()
            require("packer").loader(plugin)
        end, timer)
    end
end

-- ------------------------ Disable unnecessary plugins --------------------------
M.disable = function ()
    local disabled_built_ins = {
        "fzf",
        "gtags",
        "matchparen",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "matchit"
    }

    for _, plugin in pairs(disabled_built_ins) do
        vim.g["loaded_" .. plugin] = 1
    end
end

return M
