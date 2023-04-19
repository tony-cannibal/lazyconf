return {
    {
        'folke/tokyonight.nvim',
        opts = {
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = false },
                keywords = { italic = false },
            }
        }
    },
    {
        "neanias/everforest-nvim",
        config = function()
            require("everforest").setup({
                -- Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
                -- Default is "medium".
                background = "hard",
                -- How much of the background should be transparent. Options are 0, 1 or 2.
                -- Default is 0.
                --
                -- 2 will have more UI components be transparent (e.g. status line
                -- background).
                transparent_background_level = 0,
                -- Whether italics should be used for keywords, builtin types and more.
                italics = false,
                -- Disable italic fonts for comments. Comments are in italics by default, set
                -- this to `true` to make them _not_ italic!
                disable_italic_comments = true,
            })
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        -- priority = 1000,
        opts = {
            italic = {
                strings = false,
                comments = false,
                operators = false,
                folds = false,
            },
            contrast = "hard", -- can be "hard", "soft" or empty string
            transparent_mode = false,
        }
    },
    -- { 'shaunsingh/solarized.nvim' },
    { 'maxmx03/solarized.nvim' },
}
