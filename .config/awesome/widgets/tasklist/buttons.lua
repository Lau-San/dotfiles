---@diagnostic disable-next-line: undefined-global
local client = client

local awful         = require('awful')
local tb            = require('gears.table')

local util          = require('util')
local mod           = require('bindings.mod')
local click         = require('bindings.clicks')

local tasklist_buttons = {}

local function bind(bindings)
    for _, b in pairs(bindings) do
        local m     = b[1] or {}
        local c     = b[2]
        local func  = b[3]

        tasklist_buttons = tb.join(
            tasklist_buttons,
            awful.button({ table.unpack(m) }, c, func)
        )
    end
end

bind({
    {
        { }, click.left,
        function(c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal('request::activate', 'tasklist', {raise = true})
            end
        end
    }
})

util.tasklist_buttons = tasklist_buttons
return tasklist_buttons
