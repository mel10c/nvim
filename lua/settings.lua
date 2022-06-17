-- ===============================================================================
-- ============================== EDITOR SETTINGS ================================
-- ===============================================================================

-- shortcuts
local opt = vim.opt


-- ------------------------------ Interface Settings -----------------------------
opt.syntax = 'on'
opt.mouse = 'a'
opt.number = false
opt.numberwidth = 2
opt.relativenumber = false
opt.cursorline = true
opt.scrolloff = 5
opt.showmode = false
opt.showcmd = true
opt.wildmenu = true
opt.foldenable = false
opt.signcolumn = 'yes'
opt.laststatus = 3

-- --------------------------------- Editor Settings -----------------------------
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
opt.indentexpr = ''
opt.backspace = {'indent', 'eol', 'start'}
opt.wrap = true
opt.ignorecase = true
opt.smartcase= true
opt.hlsearch = true
opt.incsearch = true
opt.conceallevel = 2
vim.cmd [[set whichwrap+=<,>,[,],h,l]]

-- -- ---------------------------------- Files Settings -----------------------------
opt.confirm = true
opt.title = true
opt.fillchars = { eob = " " }
opt.shortmess:append "sTWIca"
opt.hidden = true
opt.list = true
-- opt.shortmess = opt.shortmess + { c = true, F = true, W = true, I = true }
opt.timeoutlen = 200
opt.compatible = false
opt.completeopt = {'menuone', 'noselect'}
opt.visualbell = true
opt.autochdir = true
opt.exrc = true
opt.secure = true
opt.updatetime = 100
opt.swapfile = false
