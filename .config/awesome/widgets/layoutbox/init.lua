local awful     = require('awful')
local gears     = require('gears')
local wibox     = require('wibox')

local theme     = require('theme')
local util      = require('util')

-- local config    = require('widgets.layoutbox.config')

local function new_layoutbox(s)
    s.layoutbox = awful.widget.layoutbox(s)
    s.layoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function() awful.layout.inc(1) end),
        awful.button({ }, 3, function() awful.layout.inc(-1) end)
    ))

    return wibox.widget {
        widget  = wibox.container.background,
        shape   = gears.shape.rounded_bar,
        bg      = theme.layoutbox_bg,

        {
            layout  = wibox.container.margin,
            left    = theme.widget_padding,
            right   = theme.widget_padding,
            top     = 8,
            bottom  = 8,

            s.layoutbox
        }
    }
end

util.widgets.new_layoutbox = new_layoutbox
return new_layoutbox
