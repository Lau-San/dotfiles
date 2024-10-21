local gears         = require('gears')
local wibox         = require('wibox')

local lain          = require('lain')
local markup        = lain.util.markup

local theme         = require('theme')
local util          = require('util')
local widget_config = require('widgets.volume.config')

local volume_icon = wibox.widget {
    widget  = wibox.widget.textbox,
    markup  = markup.fontfg(
    theme.icon_font .. ' ' .. widget_config.icon_size,
    widget_config.icon_color,
    widget_config.icon
    )
}

local volume_text = lain.widget.alsa {
    timeout = 0,
    togglechannel = 'Headphone,0',
    settings = function()
        ---@diagnostic disable-next-line: undefined-global
        local widget, volume_now = widget, volume_now

        widget:set_markup(
            markup.fontfg(
                theme.widget_font,
                widget_config.fg,
                volume_now.level .. theme.widget_percent_icon
            )
        )
    end
}
util.volume = volume_text

local volume = wibox.widget {
    widget  = wibox.container.background,
    shape   = gears.shape.rounded_bar,
    bg      = widget_config.bg,

    {
        widget  = wibox.container.margin,
        left    = theme.widget_padding,
        right   = theme.widget_padding,

        {
            widget  = wibox.container.place,
            valign  = 'center',

            {
                layout          = wibox.layout.fixed.horizontal,
                spacing_widget  = wibox.container.background,
                spacing         = theme.widget_inner_spacing,

                volume_icon,
                volume_text
            }
        }
    }
}

return volume
