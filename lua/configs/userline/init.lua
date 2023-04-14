local heirline_ok, heirline = pcall(require, "heirline")
if not heirline_ok then
    return
end

local utils = require("heirline.utils")

require("configs.userline.colors")


local ViMode = require("configs.userline.mode")
local Location = require("configs.userline.location")
local FileName = require("configs.userline.filename")
-- local Diagnostics = require("configs.userline.diagnostics")
local LSPActive = require("configs.userline.lsp-active")
local Git = require("configs.userline.git-status")

local Align = { provider = "%=" }
local Space = { provider = " " }


local StatusLine = {
    { { ViMode }, { Git }},   --{ Diagnostics }, { Git } },
    { Align },
    { { LSPActive }, { FileName },    { Location.Ruler, Location.ScrollBar, Space } }
}

heirline.setup({
    statusline = StatusLine,
})
