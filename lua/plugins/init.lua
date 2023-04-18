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
    { "neanias/everforest-nvim" },
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
    {
        'lewis6991/gitsigns.nvim',
        event = "BufEnter",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("configs.comment-nvim")
        end
    },
}
