-- ===============================================================================
-- ================================ CORE MAPPINGS ================================
-- ===============================================================================

-- ----------------------------------- Basics ------------------------------------

-- shortcuts
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local g = vim.g

g.mapleader = " "
g.UltiSnipsJumpBackwardTrigger="<c-b>"
g.UltiSnipsJumpForwardTrigger="<c-f>"

-- ------------------------------ Navigation -------------------------------------
map('n', '<C-j>', ':m .+1<cr>==')
map('i', '<C-j>', '<esc>:m .+1<cr>==')
map('n', '<C-k>', ':m .-2<cr>==')
map('i', '<C-k>', '<esc>:m .-2<cr>==')
map('v', 'J', ":m '>+1<cr>gv=gv")
map('v', 'K', ":m '<-2<cr>gv=gv")
map('i', '<C-u>', '<C-w>')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', 'G', 'Gzz')
map('n', '{', '{zz')
map('n', '}', '}zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-o>', '<C-o>zz')
map('n', '<leader>o', '<C-^>zz')
map('n', 'gj', 'j')
map('n', 'gk', 'k')
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "H", 'v:count || mode(1)[0:1] == "no" ? "^" : "g^"', { expr = true })
map("", "L", 'v:count || mode(1)[0:1] == "no" ? "$" : "g$"', { expr = true })

-- --------------------------- Window Navigation ---------------------------------
map("n", "Sl", "<cmd>set splitright<CR><cmd>vsplit<CR>")
map("n", "Sj", "<cmd>set splitbelow<CR><cmd>split<CR>")
map("n", "<leader>h", "<C-W>h")
map("n", "<leader>j", "<c-W>j")
map("n", "<leader>k", "<c-W>k")
map("n", "<leader>l", "<C-W>l")
map("n", "<up>", "<cmd>res +5<cr>")
map("n", "<down>", "<cmd>res -5<cr>")
map("n", "<left>", "<cmd>vertical resize-5<cr>")
map("n", "<right>", "<cmd>vertical resize+5<cr>")

-- -------------------------------- Edititng -------------------------------------
map('v', 'y', "y`]")
-- map('n', 'Y', 'y$') -- nvm 0.6 update made this default
map('v', 'Y', '"+y')
map('v', 'p', '"_dP')
map('n', ',p', '"_diwP')
map('n', '<leader>p', '"0p')
map('n', '<leader>d', '"_d')
map('v', '<leader>d', '"_d')
map('i', ',f', '<Esc>/<++><CR>:nohlsearch<CR>c4l')
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', '$', '$<C-g>u')
map('i', '{', '{<C-g>u')
map('i', '}', '}<C-g>u')
map('n', 'Q', '<cmd>q!<cr>')
map('n', '<leader>q', '<cmd>q<cr>')
map('n', '<leader>w', '<cmd>w<cr>')
map('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
map("n",  "x", '"_x')

map('n', 'i', 'zzi')
map('n', 'I', 'zzI')
map('n', 'a', 'zza')
map('n', 'A', 'zzA')
map('n', 'o', 'zzo')
map('n', 'O', 'zzO')

map('i', ',n', '<esc>"npa')

-- ------------------------ Insert Mode Emacs-style mapping ----------------------
map('i', '<C-a>', '<Home>')
map('i', '<C-e>', '<End>')
map('i', '<C-p>', '<Up>')
map('i', '<C-n>', '<Down>')
map('i', '<C-b>', '<Left>')
map('i', '<C-f>', '<Right>')
map('i', '<C-d>', '<Esc>ls')

-- ----------------------------- Plugin Custom mappings --------------------------
-- ===============================================================================
map('n', '<leader>t', '<cmd>NvimTreeToggle <CR>')
map('n', '<leader>x', '<cmd>VimtexCompile<cr>')
vim.cmd[[nmap <leader>; <plug>(matchup-%)]]
vim.cmd[[xmap <leader>r <plug>RSendSelection]]
-- vim.cmd[[nmap <leader>g <cmd>call Spawn_note_window()<cr>]]
vim.cmd[[nmap <leader>j <cmd>call GoToNextIndent(1)<cr>zz]]
vim.cmd[[nmap <leader>k <cmd>call GoToNextIndent(-1)<cr>zz]]
vim.cmd[[nmap <leader><cr> <cmd>Telekasten toggle_todo<cr>]]

-- buffers
map('n', ',1', '<cmd>BufferLineGoToBuffer 1 <cr>zz')
map('n', ',2', '<cmd>BufferLineGoToBuffer 2 <cr>zz')
map('n', ',3', '<cmd>BufferLineGoToBuffer 3 <cr>zz')
map('n', ',4', '<cmd>BufferLineGoToBuffer 4 <cr>zz')
map('n', ',x', '<cmd>BufferLinePickClose <cr>')

-- ------------------------------ Lsp mappings -----------------------------------
map('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- ---------------------------- Surround Shortcuts ------------------------------
vim.cmd[[xmap <leader>i <Plug>VSurround*E]]
vim.cmd[[xmap <leader>b <Plug>VSurround*gv<Plug>VSurround*E]]
vim.cmd[[xmap <leader>u <Plug>VSurround<u>E]]
vim.cmd[[xmap <leader>l <Plug>VSurround]gv<Plug>VSurround]E]]
vim.cmd[[xmap <leader>h <Plug>VSurround=gv<Plug>VSurround=E]]
vim.cmd[[xmap <leader>m <Plug>VSurround$E]]

vim.cmd[[nmap <leader>i viw<Plug>VSurround*E]]
vim.cmd[[nmap <leader>b viw<Plug>VSurround*gv<Plug>VSurround*E]]
vim.cmd[[nmap <leader>9 viw<Plug>VSurround)E]]

-- --------------------------- Markdown Syntax Shortcuts -------------------------
-- vim.cmd[[nmap <leader>cq <cmd>%s/ \*Highlight \[page \d\]:\*/-/g<cr>]]
-- vim.cmd[[nmap <leader>cn <cmd>%s/ \*and Note \[page \d\]:\*/>/g<cr>]]
map('n', '<leader>cd', '<cmd>set ft=markdown.pandoc<cr>')
map('n', '<leader>cs', '<cmd>%s/<cr>')
map('n', '<leader>cl', '<cmd>LspStop<cr>')
vim.cmd[[inoremap <tab> <c-t>]]
vim.cmd[[nmap <leader>cp yi(o<img src="link" width="300"><esc>Fkviwpgkdd]]
vim.cmd[[nmap <leader>ci ^vUi- <esc>l]]
vim.cmd[[nmap <leader>cr va]yGo<esc>pa: ]]
vim.cmd[[nmap <leader>ct :!/Applications/Typora.app/Contents/MacOS/Typora "%"<cr>]]
vim.cmd[[nmap <leader>ch /^#/ %<cr><c-l>]]
vim.cmd[[vmap <c-s> y:!say -v Kate '<c-r>"'<cr>]]
vim.cmd[[nmap <leader>ca <cmd>set foldmethod=indent<cr>]]
map('n', '<leader>cu', '<cmd>UploadClipboard<cr>')
