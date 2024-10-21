---@diagnostic disable-next-line: undefined-global
local client = client

local gears     = require 'gears'

local function fullscreen(c)
    if c.fullscreen then
        c.shape = gears.shape.rectangle
    else
        c.shape = gears.shape.rounded_rect
    end
end

client.connect_signal('property::fullscreen', fullscreen)
