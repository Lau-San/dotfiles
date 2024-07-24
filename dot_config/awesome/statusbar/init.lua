local awful             = require 'awful'
local wibox             = require 'wibox'

local theme             = require 'theme'
local widgets           = require 'statusbar.widgets'

local function new_statusbar(s)
    -- load widgets
    widgets.setup(s)

    -- create statusbar
    s.statusbar = awful.wibar({
        screen      = s,
        position    = 'top',
        opacity     = theme.bar_opacity,
        height      = theme.bar_height,
        bg          = theme.bar_bg,
        fg          = theme.bar_fg
    })

    -- add widgets to statusbar
    s.statusbar:setup {
        layout = wibox.layout.align.horizontal,

        -- left widgets
        {
            layout  = wibox.container.margin,
            top     = theme.bar_padding,
            -- bottom  = theme.bar_padding,
            left    = theme.bar_padding,

            {
                layout          = wibox.layout.fixed.horizontal,
                spacing_widget  = wibox.container.background,
                spacing         = theme.widget_spacing,

                table.unpack(widgets.screen[s].left)
            }
        },
        -- middle widgets
        {
            layout  = wibox.container.margin,
            left    = theme.widget_spacing,
            right   = theme.widget_spacing,
            -- bottom  = theme.bar_padding,
            top     = theme.bar_padding,

            table.unpack(widgets.screen[s].middle)
        },
        -- right widgets
        {
            layout  = wibox.container.margin,
            right   = theme.bar_padding,
            top     = theme.bar_padding,
            -- bottom  = theme.bar_padding,

            {
                layout          = wibox.layout.fixed.horizontal,
                spacing_widget  = wibox.container.background,
                spacing         = theme.widget_spacing,

                table.unpack(widgets.screen[s].right)
            }
        }
    }

    return s.statusbar
end

awful.screen.connect_for_each_screen(new_statusbar)
return new_statusbar
