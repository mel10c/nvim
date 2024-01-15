-- ----------------------------- highlight config --------------------------------
-- ===============================================================================

local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup {
    ensure_installed = {
        "lua",
        "java",
        "python",
        "r",
        -- "latex",
        "css",
        "markdown", "markdown_inline",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        -- additional_vim_regex_highlighting = { "markdown" },
    },
}
