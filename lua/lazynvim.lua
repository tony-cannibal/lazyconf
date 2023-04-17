local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
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
    {
        'nvim-lualine/lualine.nvim',
        event = "BufEnter",
        dependecies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("configs.lualine-nvim")
        end
    },
    {
        'akinsho/bufferline.nvim',
        event = "BufEnter",
        config = function()
            require("configs.bufferline-nvim")
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("configs.nvim-tree")
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("configs.autopairs")
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim"
        },
        config = function()
            require("configs.nvim-cmp")
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "lukas-reineke/lsp-format.nvim",
        },
        -- event = "BufEnter",
        config = function()
            require("configs.nvim-lsp")
        end
    },
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = function()
            require("configs.toggleterm-nvim")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "lua", "python" },
            sync_install = false,
            auto_install = true,
        },
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
            if not status_ok then
                return
            end

            treesitter.setup {
                -- A list of parser names, or "all"
                ensure_installed = { "lua", "python", "rust" },
                context_commentstring = {
                    enable = true
                },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,
                -- List of parsers to ignore installing (for "all")
                ignore_install = {},
                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
})
