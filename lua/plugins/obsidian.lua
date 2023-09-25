-- ------------------------------- obsidian nvim ---------------------------------
-- ===============================================================================

local present, obsidian = pcall(require, "obsidian")
if not present then
    return
end

obsidian.setup({
    dir = "~/melaneyroot.github.io",
    -- log_level = vim.log.levels.DEBUG,

    completion = {
        nvim_cmp = true,
        min_chars = 3,
        -- prepend_note_id = true
        -- max_suggestions = 3,
    },

    daily_notes = {
        folder = "Journal",
        -- date_format = "%Y-%m-%d"
    },

    mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = require("obsidian.mapping").gf_passthrough(),
    },

    open_app_foreground = false,
    disable_frontmatter = true,

})

vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
