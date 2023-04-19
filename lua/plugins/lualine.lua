return {
    'nvim-lualine/lualine.nvim',
    event = "BufEnter",
    dependecies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        -- require("configs.lualine-nvim")
        local progress = function()
            local current_line = vim.fn.line(".")
            local total_lines = vim.fn.line("$")
            local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return "%(%l/%L%):%2c %P " .. chars[index]
        end

        local tree_info = function()
            local icon = ""
            local status = require "nvim-treesitter.parsers".has_parser()
            if status == true then
                return icon .. " TS"
            else
                return ""
            end
        end

        -- local lsp_name = function()
        --     local msg = ''
        --     -- local icon = ' LSP:'
        --     local icon = ' '
        --     -- local icon = ' LSP'
        --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        --     local clients = vim.lsp.get_active_clients()
        --     if next(clients) == nil then
        --         return msg
        --     end
        --     for _, client in ipairs(clients) do
        --         local filetypes = client.config.filetypes
        --         if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        --             return icon .. client.name
        --             -- return icon
        --         end
        --     end
        -- end

        local lsp_name2 = function()
            local names = {}
            for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
                table.insert(names, server.name)
            end
            local size = 0
            for _ in pairs(names) do
                size = size + 1
            end
            if size > 0 then
                -- return " [" .. table.concat(names, " ") .. "]"
                return " " .. table.concat(names, " ")
            else
                return ""
            end
        end

        local diff = {
            "diff",
            colored = vim.g.coloredsigns,
        }

        local diagnostics = {
            "diagnostics",
            colored = vim.g.coloredsigns,
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '|', right = '|' },
                -- component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                disabled_filetypes = { "alpha", "NvimTree" },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', diff, diagnostics },
                lualine_c = { 'filename' },
                lualine_x = { tree_info, 'encoding' }, -- 'fileformat' },
                lualine_y = { 'filetype', lsp_name2 }, -- { 'progress' },
                lualine_z = { progress }               -- { 'location', progress }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
