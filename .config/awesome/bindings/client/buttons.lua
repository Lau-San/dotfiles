---@diagnostic disable-next-line: undefined-global
local client = client

local awful         = require('awful')
local tb            = require('gears.table')

local util          = require('util')
local mod           = require('bindings.mod')
local click         = require('bindings.clicks')

local client_buttons = {}

local function bind(bindings)
    for _, b in pairs(bindings) do
        local m     = b[1] or {}
        local c     = b[2]
        local func  = b[3]

        client_buttons = tb.join(
            client_buttons,
            awful.button({ table.unpack(m) }, c, func)
        )
    end
end

bind({
    {
        { }, click.left,
        function(c)
            c:emit_signal('request::activate', 'mouse_click', {raise = true})
        end
    },
    {
        { mod.sup }, click.left,
        function(c)
            c:emit_signal('request::activate', 'mouse_click', {raise = true})
            awful.mouse.client.move(c)
        end
    },
    {
        { mod.sup }, click.right,
        function(c)
            c:emit_signal('request::activate', 'mouse_click', {raise = true})
            awful.mouse.client.resize(c)
        end
    }
})

util.client_buttons = client_buttons
return client_buttons
