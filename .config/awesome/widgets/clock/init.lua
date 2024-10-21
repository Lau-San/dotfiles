local gears         = require('gears')
local wibox         = require('wibox')

local lain          = require('lain')
local markup        = lain.util.markup

local theme         = require('theme')
local widget_config = require('widgets.clock.config')
local util          = require('util')

local date_icon = wibox.widget {
    widget  = wibox.widget.textbox,
    markup  = markup.fontfg(
        theme.icon_font .. ' ' .. widget_config.icon_size,
        widget_config.icon_color,
        widget_config.date_icon
    )
}

local date_text = wibox.widget {
    widget  = wibox.widget.textclock,
    refresh = 60,
    format  = markup.fontfg(
        theme.widget_font,
        widget_config.fg,
        "%A, %d %b %Y"
    )
}

local date = wibox.widget {
    widget  = wibox.container.place,
    valign  = 'center',

    {
        layout          = wibox.layout.fixed.horizontal,
        spacing_widget  = wibox.container.background,
        spacing         = theme.widget_inner_spacing,

        date_icon,
        date_text
    }
}

local time_icon = wibox.widget {
    widget  = wibox.widget.textbox,
    markup  = markup.fontfg(
        theme.icon_font .. ' ' .. widget_config.icon_size,
        widget_config.icon_color,
        widget_config.time_icon
    )
}

local time_text = wibox.widget {
    widget  = wibox.widget.textclock,
    refresh = 60,
    format  = markup.fontfg(
        theme.widget_font,
        widget_config.fg,
        "%I:%M %p"
    )
}

local time = wibox.widget {
    widget  = wibox.container.place,
    valign  = 'center',

    {
        layout          = wibox.layout.fixed.horizontal,
        spacing_widget  = wibox.container.background,
        spacing         = theme.widget_inner_spacing,

        time_icon,
        time_text
    }
}

local clock = wibox.widget {
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
                spacing         = theme.widget_spacing * 2,

                date,
                time
            }
        }
    }
}

util.widgets.clock = clock
return clock
