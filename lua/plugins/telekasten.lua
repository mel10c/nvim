-- ===============================================================================
-- ------------------------------Telekasten Config -------------------------------

-- initialize
local present, telekasten = pcall(require, "telekasten")
if not present then
    return
end

local home = vim.fn.expand("~/melaneyroot.github.io")
telekasten.setup({
    home         = home,
    take_over_my_home = true,
    auto_set_filetype = true,
    dailies      = home .. '/' .. 'Journal',
    weeklies     = home .. '/' .. 'Journal',
    templates    = home .. '/' .. '',
    -- image_subdir = "img",
    extension    = ".md",
    new_note_filename = "title",
    -- uuid_type = "%Y%m%d%H%M",
    -- uuid_sep = "-",
    filename_space_subst = nil,

    follow_creates_nonexisting = false,
    dailies_create_nonexisting = false,
    weeklies_create_nonexisting = false,
    journal_auto_open = true,
    -- template_new_note = home .. '/' .. 'templates/new_note.md',
    -- template_new_daily = home .. '/' .. 'templates/daily.md',
    -- template_new_weekly= home .. '/' .. 'templates/weekly.md',
    image_link_style = "wiki",
    sort = "modified",

    -- integrate with calendar-vim
    plug_into_calendar = false,
    -- calendar_opts = {
    --     -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
    --     weeknm = 4,
    --     -- use monday as first day of week: 1 .. true, 0 .. false
    --     calendar_monday = 1,
    --     -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
    --     calendar_mark = 'left-fit',
    -- },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",
    command_palette_theme = "dropdown",
    show_tags_theme = "dropdown",

    subdirs_in_links = false,
    new_note_location = "smart",
    rename_update_links = true,

    vaults = {
        vault2 = {
            -- alternate configuration for vault2 here. Missing values are defaulted to
            -- default values from telekasten.
            -- e.g.
            -- home = "/home/user/vaults/personal",
        },
    },
    -- how to preview media files
    -- "telescope-media-files" if you have telescope-media-files.nvim installed
    -- "catimg-previewer" if you have catimg installed
    -- media_previewer = "telescope-media-files",
    -- A customizable fallback handler for urls.
    follow_url_fallback = nil,
})


-- ------------------------------source file config -------------------------------
-- Under [local function find_files_sorted(opts)] function
-- This allows only file name display on search

-- path_display = function(_, e)
--     local tail = utils.path_tail(e)
--     return tail
--     -- return e:gsub(escape(opts.cwd .. "/"), "")
-- end,

