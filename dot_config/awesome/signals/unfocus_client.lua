---@diagnostic disable-next-line: undefined-global
local client = client

local theme = require 'beautiful'

local function unfocus_client(c)
    -- Change border color
    c.border_color = theme.border_normal
end

client.connect_signal('unfocus', unfocus_client)
