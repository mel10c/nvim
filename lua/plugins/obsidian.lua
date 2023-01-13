-- ------------------------------- obsidian nvim ---------------------------------
-- ===============================================================================

local present, obsidian = pcall(require, "obsidian")
if not present then
    return
end

obsidian.setup({
    dir = "~/melaneyroot.github.io",
    completion = {
        nvim_cmp = true,
    },
    daily_notes = {
        folder = "Journal",
    }
})

vim.keymap.set(
  "n",
  "gf",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true}
)
