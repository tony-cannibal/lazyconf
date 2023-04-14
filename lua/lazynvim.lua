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
        priority=1000,
    },
    {
        'lewis6991/gitsigns.nvim',
        event = "BufEnter",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "rebelot/heirline.nvim",
        event = "BufEnter",
        dependencies = {
            { "kyazdani42/nvim-web-devicons" },
        },
        config = function()
            require("configs.userline")
        end
    }
})


