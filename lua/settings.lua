-- ===============================================================================
-- ============================== EDITOR SETTINGS ================================
-- ===============================================================================

-- shortcuts
local opt = vim.opt
local exec = vim.api.nvim_exec

-- ------------------------------ Interface Settings -----------------------------
opt.syntax = 'on'
opt.mouse = 'a'
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 5
opt.showmode = false
opt.showcmd = true
opt.wildmenu = true
opt.foldenable = false
opt.signcolumn = 'number'

-- --------------------------------- Editor Settings -----------------------------
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.indentexpr = ''
opt.backspace = {'indent', 'eol', 'start'}
opt.wrap = true
opt.ignorecase = true
opt.smartcase= true
opt.hlsearch = true
opt.incsearch = true
opt.conceallevel = 2
vim.cmd [[autocmd FileType markdown,tex set spell]]
vim.cmd [[set whichwrap+=<,>,[,],h,l]]

-- -- ---------------------------------- Files Settings -----------------------------
opt.hidden = true
opt.list = true
opt.shortmess = opt.shortmess + { I = true }
opt.timeoutlen = 200
opt.compatible = false
opt.completeopt = {'menuone', 'noselect'}
opt.visualbell = true
opt.autochdir = true
opt.exrc = true
opt.secure = true
opt.updatetime = 100
opt.swapfile = false

-- ----------------------------------- Auto Commands -----------------------------
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

vim.cmd
[[
if index(argv(), ".") >= 0
  autocmd VimEnter * NvimTreeOpen
  bd1
elseif len(argv()) == 0
  autocmd VimEnter * Dashboard
endif
]]


-- ---------------------------- Colorscheme Save Call ----------------------------
local colorscheme = "onenord"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status then
    vim.notify("colorscheme" .. colorscheme .. " not found!")
    return
end
