---@diagnostic disable-next-line: undefined-global
local awesome, client = awesome, client

local awful = require 'awful'
local gears = require 'gears'

local function new_client(c)
    -- Ensure client is accessible
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end

    c.shape = gears.shape.rounded_rect

    -- If class isn't set, wait for class change to apply rules
    if c.class == nil then
        c.minimized = true
        c:connect_signal("property::class", function ()
            c.minimized = false
            awful.rules.apply(c)
        end)
    end

    c:connect_signal('property::class', function()
        awful.rules.apply(c)
    end)
end

client.connect_signal('manage', new_client)
