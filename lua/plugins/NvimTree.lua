-- ---------------------------- File-tree config ---------------------------------
-- ===============================================================================

local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 3
g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
--
g.nvim_tree_show_icons = {
    folders = 1,
    -- folder_arrows= 1
    files = 1,
    --git = git_status,
}

g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        deleted = "-",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "?",
    },
    folder = {
        -- arrow_open = "",
        -- arrow_closed = "",
        default = "",
        empty = "", -- 
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
    },
    lsp = {
        hint =  "",
        info =  "",
        warning =  "",
        error = "",

    }
}

nvimtree.setup {
    -- lsp_diagnostics = false,
    disable_netrw = true,
    hijack_netrw = true,
    ignore_ft_on_setup = { "dashboard" },
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    git = {
        enable = false,
        ignore = true,
        timeout = 500,
    },
    view = {
        allow_resize = true,
        side = "left",
        width = 30,
    },
}

