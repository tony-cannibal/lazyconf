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
        priority = 1000,
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
        dependecies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("configs.lualine-nvim")
        end
    },
    {
        'akinsho/bufferline.nvim',
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

})
