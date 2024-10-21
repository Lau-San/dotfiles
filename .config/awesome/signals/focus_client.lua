---@diagnostic disable-next-line: undefined-global
local client = client

local theme = require 'beautiful'

local function focus_client(c)
    -- Change border color
    c.border_color = theme.border_focus
end

client.connect_signal('focus', focus_client)
