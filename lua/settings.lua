-- ===============================================================================
-- ============================== EDITOR SETTINGS ================================
-- ===============================================================================

-- shortcuts
local opt = vim.opt
local cmd = vim.cmd
-- local g = vim.g

cmd "colorscheme nordfox"
-- ------------------------------ Interface Settings -----------------------------
opt.syntax = 'on'
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
-- opt.cursorcolumn = true
opt.cursorline = true
opt.scrolloff = 5
opt.showmode = false
opt.showcmd = true
opt.wildmenu = true
opt.foldenable = false
opt.signcolumn = 'number'

-- --------------------------------- Editor Settings -----------------------------
local tabwidth = 4
opt.tabstop = tabwidth
opt.shiftwidth = tabwidth
opt.softtabstop = tabwidth
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.ttyfast = true
--opt.tw=0
opt.indentexpr = ''
opt.backspace = {'indent', 'eol', 'start'}
opt.wrap = true
opt.ignorecase = true
opt.smartcase= true
opt.hlsearch = false
opt.incsearch = true
opt.conceallevel = 2
opt.spell = true
opt.spelllang = 'en_us'

-- ---------------------------------- Files Settings -----------------------------
opt.autochdir = true
opt.exrc = true
opt.secure = true
opt.hidden = true
opt.list = true
opt.shortmess = opt.shortmess + { I = true }
opt.visualbell = true
opt.updatetime = 100
opt.timeoutlen=200
opt.compatible = false
opt.completeopt = {'menuone', 'noselect'}
