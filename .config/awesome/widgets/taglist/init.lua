local awful         = require 'awful'
local gears         = require 'gears'
local gcolor        = require 'gears.color'
local tint          = gcolor.recolor_image
local wibox         = require 'wibox'

local theme         = require('theme')
local widget_config = require 'widgets.taglist.config'
local util          = require("util")

require 'widgets.taglist.buttons'

local n = require 'naughty'

local function new_taglist(s)
    s.taglist = awful.widget.taglist {
        screen      = s,
        filter      = awful.widget.taglist.filter.all,
        buttons     = util.taglist_buttons,
        style       = { shape = gears.shape.rounded_bar },

        layout = {
            layout          = wibox.layout.fixed.horizontal,
            spacing_widget  = wibox.container.background,
            spacing         = theme.widget_inner_spacing
        },

        widget_template = {
            -- Tag padding
            widget      = wibox.container.margin,
            -- left        = widget_config.tag_hpadding,
            -- right       = widget_config.tag_hpadding,
            top         = widget_config.tag_vpadding,
            bottom      = widget_config.tag_vpadding,

            {
                -- Tag icon
                widget  = wibox.widget.imagebox,
                id      = 'icon_role',
                opacity = 0.7
            }
        }
    }

    return wibox.widget {
        widget  = wibox.container.background,
        shape   = gears.shape.rounded_bar,
        bg      = theme.widget_bg,

        {
            layout  = wibox.container.margin,
            top     = theme.widget_padding * 0.25,
            bottom  = theme.widget_padding * 0.25,
            left    = theme.widget_padding,
            right   = theme.widget_padding,

            {
                layout  = wibox.layout.fixed.horizontal,

                s.taglist
            }
        }
    }
end

util.widgets.new_taglist = new_taglist
return new_taglist
