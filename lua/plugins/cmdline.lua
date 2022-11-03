-- ----------------------------- cmd Line config ---------------------------------
-- ===============================================================================

local present, cmd = pcall(require, "noice")
if not present then
    return
end

cmd.setup({
    cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup",
        opts = {}, -- extra opts for the cmdline view. See section on views
        format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
            lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
            help = { pattern = "^:%s*h%s+", icon = "ﲉ" },
            input = {}, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
        },
    },
    views = {
        cmdline_popup = {
            position = {
                row = 5,
                col = "50%",
            },
            size = {
                width = 60,
                height = "auto",
            },
        },
        popupmenu = {
            relative = "editor",
            position = {
                row = 8,
                col = "55%",
            },
            size = {
                width = 62,
                height = 10,
            },
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = { Normal = "Active" },
            },
        },
    },
    routes = {
        {
            filter = { event = "msg_show", kind = "search_count", },
            opts = { skip = true },
        },
                  {
                filter = { event = "msg_show", kind = "emsg" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "echo" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "echomsg" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "echoerr" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "lua_error" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "rpc_error" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "return_prompt" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "quickfix" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "search_count" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "wmsg" },
                opts = { skip = true },
            },
            {
                filter = { event = "msg_show", kind = "" },
                opts = { skip = true },
            },
    },
})
