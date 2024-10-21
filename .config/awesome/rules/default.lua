local awful     = require('awful')
local placement = awful.placement
local theme     = require('beautiful')

local util      = require('util')

return {
    rule = { },
    properties = {
        border_width        = theme.border_width,
        border_color        = theme.border_color,
        focus               = awful.client.focus.filter,
        raise               = true,
        keys                = util.client_keys,
        buttons             = util.client_buttons,
        screen              = awful.screen.preferred,
        placement           = placement.no_overlap+placement.no_offscreen,
        size_hints_honor    = false
    }
}
