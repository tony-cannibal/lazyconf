return {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
        'jose-elias-alvarez/null-ls.nvim',
        "nvim-lua/plenary.nvim"
    },
    lazy = true,
    config = function()
        require("mason-null-ls").setup({
            ensure_installed = {
                -- Opt to list sources here, when available in mason.
                "stylua",
            },
            automatic_installation = false,
            handlers = {},
        })

        require("null-ls").setup({
            sources = {
                -- Anything not supported by mason.
            },
        })
    end
}
