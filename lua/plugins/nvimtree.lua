return {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
        -- require("configs.nvim-tree")
        local nvim_tree = require("nvim-tree")
        local nvim_tree_config = require("nvim-tree.config")
        local tree_cb = nvim_tree_config.nvim_tree_callback

        nvim_tree.setup {
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            renderer = {
                root_folder_modifier = ":t",
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
                indent_markers = {
                    enable = true,
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            view = {
                width = 30,
                side = "left",
                mappings = {
                    list = {
                        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                        { key = "h",                  cb = tree_cb "close_node" },
                        { key = "v",                  cb = tree_cb "vsplit" },
                    },
                },
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            }
        }
    end
}
