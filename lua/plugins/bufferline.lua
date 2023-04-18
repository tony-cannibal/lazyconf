return {
    'akinsho/bufferline.nvim',
    event = "BufEnter",
    config = function()
        require("configs.bufferline-nvim")
    end
}
