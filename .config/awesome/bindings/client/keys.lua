local awful         = require 'awful'
local tb            = require 'gears.table'

local util          = require 'util'
local cutil         = require 'util.client'
local mods          = require 'bindings.mod'

local client_keys = {}

local function bind(group, bindings)
    for _, b in pairs(bindings) do
        local mod   = b[1] or {}
        local key   = b[2]
        local func  = b[3]
        local desc  = b[4]

        client_keys = tb.join(
            client_keys,
            awful.key(
                {table.unpack(mod)}, key,
                func,
                { description = desc, group = group }
            )
        )
    end
end

bind('client',
    {
        {
            { mods.sup, mods.ctrl }, 'c',
            function(c) c:kill() end,
            'close client'
        },
        {
            { mods.sup, mods.ctrl }, 'f',
            awful.client.floating.toggle,
            'toggle floating'
        },
        {
            { mods.sup, mods.shft }, 'f',
            cutil.toggle_fullscreen,
            'toggle fullscreen'
        },
        {
            { mods.sup, mods.ctrl }, 'Return',
            function(c) c:swap(awful.client.getmaster()) end,
            'move client to master'
        },
        {
            { mods.sup, mods.ctrl }, 'o',
            cutil.move_client_to_other_screen,
            'move client to other screen'
        },
        {
            { mods.sup, mods.ctrl }, 'n',
            function(c) c.minimized = true end,
            'minimize client'
        },
        {
            { mods.sup, mods.ctrl }, 'm',
            cutil.toggle_maximize,
            '(un)maximize client'
        }
    }
)

util.client_keys = client_keys
return client_keys
