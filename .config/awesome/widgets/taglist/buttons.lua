---@diagnostic disable-next-line: undefined-global
local client = client

local awful         = require('awful')
local tb            = require('gears.table')

local util          = require('util')
local mod           = require('bindings.mod')
local click         = require('bindings.clicks')

local taglist_buttons = {}

local function bind(bindings)
    for _, b in pairs(bindings) do
        local m     = b[1] or {}
        local c     = b[2]
        local func  = b[3]

        taglist_buttons = tb.join(
            taglist_buttons,
            awful.button({ table.unpack(m) }, c, func)
        )
    end
end

bind({
    {
        { }, click.left,
        function(t) t:view_only() end
    },
    {
        { mod.sup }, click.left,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    },
    {
        { }, click.right,
        awful.tag.viewtoggle
    }
})

util.taglist_buttons = taglist_buttons
return taglist_buttons
