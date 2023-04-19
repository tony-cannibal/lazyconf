return {
    'akinsho/bufferline.nvim',
    event = "BufEnter",
    config = function()
        -- require("configs.bufferline-nvim")
        require("bufferline").setup {
            options = {
                numbers = "none",                    -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
                middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
                indicator = {
                    icon = '▎',                    -- this should be omitted if indicator style is not 'icon'
                    style = 'icon',                  --| 'underline' | 'none',
                },
                buffer_close_icon = '',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                mode = "buffers",       -- set to "tabs" to only show tabpages instead
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true,  -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = false,    --| "nvim_lsp" | "coc",
                diagnostics_update_in_insert = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer", --| function ,
                        text_align = "center",  -- "left" | "center" | "right"
                        separator = true,
                    }
                },
                highlights = {
                    fill = {
                        bg = {
                            attribute = "bg",
                            highlight = "TabLine"
                        }
                    },
                    background = { italic = false },
                    tab = { italic = false },
                    tab_selected = { italic = false },
                    tab_close = { italic = false },
                    close_button = { italic = false },
                    close_button_visible = { italic = false },
                    close_button_selected = { italic = false },
                    buffer_visible = { italic = false },
                    buffer_selected = { italic = false },
                    numbers = { italic = false },
                    numbers_visible = { italic = false },
                    numbers_selected = { italic = false },
                    diagnostic = { italic = false },
                    diagnostic_visible = { italic = false },
                    diagnostic_selected = { italic = false },
                    hint = { italic = false },
                    hint_visible = { italic = false },
                    hint_selected = { italic = false },
                    hint_diagnostic = { italic = false },
                    hint_diagnostic_visible = { italic = false },
                    hint_diagnostic_selected = { italic = false },
                    info = { italic = false },
                    info_visible = { italic = false },
                    info_selected = { italic = false },
                    info_diagnostic = { italic = false },
                    info_diagnostic_visible = { italic = false },
                    info_diagnostic_selected = { italic = false },
                    warning = { italic = false },
                    warning_visible = { italic = false },
                    warning_selected = { italic = false },
                    warning_diagnostic = { italic = false },
                    warning_diagnostic_visible = { italic = false },
                    warning_diagnostic_selected = { italic = false },
                    error = { italic = false },
                    error_visible = { italic = false },
                    error_selected = { italic = false },
                    error_diagnostic = { italic = false },
                    error_diagnostic_visible = { italic = false },
                    error_diagnostic_selected = { italic = false },
                    modified = { italic = false },
                    modified_visible = { italic = false },
                    modified_selected = { italic = false },
                    duplicate_selected = { italic = false },
                    duplicate_visible = { italic = false },
                    duplicate = { italic = false },
                    separator_selected = { italic = false },
                    separator_visible = { italic = false },
                    separator = { italic = false },
                    indicator_selected = { italic = false },
                    pick_selected = { italic = false },
                    pick_visible = { italic = false },
                    pick = { italic = false },
                    offset_separator = { italic = false },
                }
            }
        }
    end
}
