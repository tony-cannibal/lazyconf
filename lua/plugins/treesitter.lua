return {
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
        require("configs.nvim-treesitter")
    end
}
