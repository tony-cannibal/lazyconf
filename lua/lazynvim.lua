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


require("lazy").setup("plugins", {
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { vim.g.colorscheme, "habamax" },
    },
    ui = {
        border = "single"
    },
})


function ColorPencil(color, trans)
    vim.g.gruvbox_material_background = 'hard'

    if color == "gruvbox" then
        vim.cmd [[highlight IndentBlanklineIndent1 guifg=#555555 gui=nocombine]]
    end


    vim.cmd.colorscheme(color)
    if trans == true then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

ColorPencil(vim.g.colorscheme, vim.g.transparency)
