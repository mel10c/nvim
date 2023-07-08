-- ===============================================================================
-- ================================ AUTO CMDs ====================================
-- ===============================================================================

local exec = vim.api.nvim_exec
local autocmd = vim.api.nvim_create_autocmd

-- ------------------------------ Trim White Space -------------------------------
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- ------------------------------ Filetype Setting -------------------------------
--- Set spelling
autocmd("FileType", {
   pattern = { "markdown", "tex", "telekasten", "Rmd", "markdown.pandoc" },
   callback = function()
      vim.opt_local.spell = true
      -- vim.opt_local.foldmethod="indent"
      -- vim.opt_local.foldlevel=0
      -- vim.opt_local.foldtext=""
   end,
})

autocmd("FileType", {
   pattern = { "tex", "tex", },
   callback = function()
       -- vim.cmd[[set ft=latex]]
       vim.opt_local.ft = "latex"
   end,
})

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

vim.cmd
    [[
    autocmd filetype markdown syn region match start=/\\$\\$/ end=/\\$\\$/
    autocmd filetype markdown syn match math '\\$[^$].\{-}\$'
    ]]

-- ---------------------------- Highlight Yank Area ------------------------------
autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
   end,
})

-- -------------------------- Disable comment new line ---------------------------
autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

-- ------------------------------Go to Next indent -------------------------------
vim.cmd
    [[
    function! GoToNextIndent(inc)
        " Get the cursor current position
        let currentPos = getpos('.')
        let currentLine = currentPos[1]
        let matchIndent = 0

        " Look for a line with the same indent level whithout going out of the buffer
        while !matchIndent && currentLine != line('$') + 1 && currentLine != -1
            let currentLine += a:inc
            let matchIndent = indent(currentLine) == indent('.')
        endwhile

        " If a line is found go to this line
        if (matchIndent)
            let currentPos[1] = currentLine
            call setpos('.', currentPos)
        endif
    endfunction
    ]]

-- ------------------------------Go to Next indent -------------------------------
vim.cmd
    [[
    function! OpenPDFCitekey()
    let kcmd = 'kitty --single-instance --instance-group=1 '
    let kcmd = kcmd . 'termpdf.py --nvim-listen-address '
    let kcmd = kcmd . $NVIM_LISTEN_ADDRESS . ' '
    let key=expand('<cword>')
    keepjumps normal! ww
    let page=expand('<cword>')
    if page ==? 'p'
        keepjumps normal! ww
        let page=expand('<cword>')
        endif
        keepjumps normal! bbb
        let kcmd = kcmd . '--open ' . key . ' '
        if page
            let kcmd = kcmd . '-p ' . page
            endif
            exe "!" . kcmd
            endfunction
    ]]
