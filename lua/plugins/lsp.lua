return {
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
}
