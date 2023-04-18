return {
    'nvim-lualine/lualine.nvim',
    event = "BufEnter",
    dependecies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require("configs.lualine-nvim")
    end
}
