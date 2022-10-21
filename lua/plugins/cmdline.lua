-- ----------------------------- cmd Line config ---------------------------------
-- ===============================================================================

local present, cmd = pcall(require, "noice")
if not present then
    return
end

cmd.setup({
    format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        cmdline = { pattern = "^:", icon = "" },
        search_down = { kind = "search", pattern = "^/", icon = " ", ft = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", ft = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", ft = "sh" },
        lua = { pattern = "^:%s*lua%s+", icon = "", ft = "lua" },
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
            -- border = {
            --     style = "none",
            --     padding = { 1, 2 },
            -- },
            -- win_options = {
            --     winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            -- },
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
