-- -------------------------------- Lspsaga config -------------------------------
-- ===============================================================================

local present, saga = pcall(require, "lspsaga")
if not present then
    return
end

saga.init_lsp_saga {
    -- default value
    use_saga_diagnostic_sign = false,
    -- error_sign = '',
    -- warn_sign = '',
    -- hint_sign = '',
    -- infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
        enable = false,
        sign = true,
        sign_priority = 20,
        virtual_text = false,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 50, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    definition_preview_icon = '  ',
    -- "single" "double" "round" "plus"
    border_style = "plus",
    rename_prompt_prefix = '凜',
}
