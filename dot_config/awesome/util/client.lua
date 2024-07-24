---@diagnostic disable-next-line: undefined-global
local client = client

local awful = require 'awful'

local tags  = require 'tags'
local tutil = require 'util.tag'

local cutil = {}

function cutil.move_focused_client_to_tag(tag_idx)
    if client.focus then
        local tag = client.focus.screen.tags[tag_idx]
        if tag then
            client.focus:move_to_tag(tag)
        end
    end
end

function cutil.move_client_to_other_screen(c)
    local tag = c.first_tag.name
    c:move_to_screen()
    cutil.move_to_dynamic_tag(c, tag, c.screen, true)
    c.first_tag:view_only()
end

function cutil.restore_minimized()
    local c = awful.client.restore()
    if c then
        client.focus = c
        c:raise()
    end
end

function cutil.toggle_fullscreen(c)
    c.fullscreen = not c.fullscreen
    c:raise()
end

function cutil.toggle_maximize(c)
    c.maximized = not c.maximized
    c:raise()
end

function cutil.move_to_dynamic_tag(c, t, s, follow)
    s = s or awful.screen.preferred(c)
    t = tutil.create_dynamic_tag(t, s)

    c:move_to_tag(t)
    if follow then t:view_only() end
end

return cutil
