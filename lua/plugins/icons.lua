-- ----------------------------- Icon sings config -------------------------------
-- ===============================================================================

local present, icons = pcall(require, "nvim-web-devicons")
if not present then
    return
end


icons.setup {
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh"
        }
    };
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
}
