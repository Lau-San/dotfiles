local awful = require 'awful'
local gears = require 'gears'
local wibox = require 'wibox'

local theme = require 'theme'
local util  = require 'util'

require 'widgets.tasklist.buttons'

local function new_tasklist(s)
    s.tasklist = awful.widget.tasklist {
        screen      = s,
        buttons     = util.tasklist_buttons,
        filter      = awful.widget.tasklist.filter.currenttags,
        style       = { shape = gears.shape.rounded_bar },

        layout = {
            layout      = wibox.layout.flex.horizontal,
            spacing     = theme.widget_spacing
        },

        widget_template = {
            -- Background
            widget  = wibox.container.background,
            id      = 'background_role',
            shape   = gears.shape.rounded_bar,

            {
                -- Padding
                widget  = wibox.container.margin,
                left    = theme.widget_padding,
                right   = theme.widget_padding,
                top     = 5,
                bottom  = 5,

                {
                    -- Text placement
                    widget  = wibox.container.place,
                    halign  = 'center',

                    {
                        layout          = wibox.layout.fixed.horizontal,
                        spacing_widget  = wibox.container.background,
                        spacing         = theme.widget_spacing,

                        {
                            widget  = awful.widget.clienticon,
                            id      = 'clienticon'
                        },
                        {
                            widget  = wibox.widget.textbox,
                            id      = 'text_role'
                        }
                    }
                }
            },

            nil,
            create_callback = function(self, c, index, objects)
                self:get_children_by_id('clienticon')[1].client = c
            end
        }
    }

    return s.tasklist
end

util.widgets.new_tasklist = new_tasklist
return new_tasklist
