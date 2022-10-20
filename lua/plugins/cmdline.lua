-- ----------------------------- cmd Line config ---------------------------------
-- ===============================================================================

local present, cmd = pcall(require, "noice")
if not present then
    return
end

cmd.setup({
    icons = {
        ["/"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
        ["?"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
        [":"] = { icon = " ", hl_group = "NoiceCmdlineIcon" },
    },
    cmdline = {
        view = "cmdline_popup",
        opts = { buf_options = { filetype = "vim" } },
        icons = {
            [":"] = { icon = " ", hl_group = "NoiceCmdlineIcon" },
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
