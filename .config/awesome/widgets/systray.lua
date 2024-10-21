local awful = require 'awful'
local gears = require 'gears'
local wibox = require 'wibox'
local theme = require 'theme'

local util      = require 'util'

local function new_systray(s)
    s.systray = wibox.widget {
        layout  = awful.widget.only_on_screen,
        screen  = 'primary',

        {
            widget  = wibox.container.background,
            shape   = gears.shape.rounded_bar,
            bg      = theme.widget_bg,

            {
                widget  = wibox.container.margin,
                top     = theme.bar_padding,
                bottom  = theme.bar_padding,
                left    = theme.widget_padding,
                right   = theme.widget_padding,

                {
                    widget  = wibox.container.place,
                    valign  = 'center',
                    halign  = 'right',

                    {
                        widget          = wibox.widget.systray,
                        create_callback = function(self)
                            self:set_base_size(theme.systray_icon_size)
                        end
                    }
                }
            }
        }

    }

    return s.systray
end

util.widgets.new_systray = new_systray
return new_systray
