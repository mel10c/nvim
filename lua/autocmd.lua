-- ===============================================================================
-- ================================ AUTO CMDs ====================================
-- ===============================================================================

local exec = vim.api.nvim_exec

-- ------------------------------ Trim White Space -------------------------------
local NoWhitespace = exec(
    [[
    function! NoWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfunction
    call NoWhitespace()
    ]],
    true
)
exec([[au BufWritePre * call NoWhitespace()]], false)

-- ----------------------------- DASHBOARD or TREE -------------------------------
vim.cmd
[[
if index(argv(), ".") >= 0
  autocmd VimEnter * NvimTreeOpen
  bd1
elseif len(argv()) == 0
  autocmd VimEnter * Dashboard
endif
]]

-- ---------------------------- Highlight Yank Area ------------------------------
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Search', timeout=100 }
augroup END
]]
