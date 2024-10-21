local gears         = require('gears')
local wibox         = require('wibox')
local naughty       = require('naughty')

local lain          = require('lain')
local markup        = lain.util.markup

local theme         = require('theme')
local widget_config = require('widgets.battery.config')

local battery_icon = wibox.widget.textbox()

local function set_icon(icon, color)
    color = color or widget_config.icon_color

    battery_icon:set_markup(
        markup.fontfg(
            theme.icon_font .. ' ' .. widget_config.icon_size,
            color,
            icon
        )
    )
end

local function set_text(w, text, color)
    color = color or widget_config.fg

    w:set_markup(
        markup.fontfg(
            theme.widget_font,
            color,
            text
        )
    )
end

local battery_text = lain.widget.bat {
    -- refresh rate
    timeout = 30,

    -- update function
    settings = function()
        ---@diagnostic disable-next-line: undefined-global
        local widget, bat_now = widget, bat_now

        -- full battery notification
        ---@diagnostic disable-next-line: lowercase-global
        bat_notification_charged_preset = {
            title           = 'Battery is full',
            text            = 'You can unplug the cable',
            timeout         = 15,
            bg              = naughty.config.presets.normal.bg,
            fg              = naughty.config.presets.normal.fg,
            border_width    = naughty.config.presets.normal.border_width,
            border_color    = naughty.config.presets.normal.border_color
        }

        -- check if there is battery information
        if bat_now.status and bat_now.status ~= 'N/A' then
            -- display battery percent
            local perc_text = bat_now.perc .. theme.widget_percent_icon
            set_text(widget, perc_text)

            -- check ac status
            if bat_now.ac_status == 1 then
                set_icon(widget_config.icon_ac)
            else
                -- set icon depending on battery percent
                local perc = tonumber(bat_now.perc)
                if perc >= 95 then
                    set_icon(widget_config.icon100)
                elseif perc >= 85 then
                    set_icon(widget_config.icon90)
                elseif perc >= 75 then
                    set_icon(widget_config.icon80)
                elseif perc >= 65 then
                    set_icon(widget_config.icon70)
                elseif perc >= 55 then
                    set_icon(widget_config.icon60)
                elseif perc >= 45 then
                    set_icon(widget_config.icon50)
                elseif perc >= 35 then
                    set_icon(widget_config.icon40)
                elseif perc >= 25 then
                    set_icon(widget_config.icon30)
                elseif perc >= 15 then
                    set_icon(widget_config.icon20, widget_config.icon_color_low)
                elseif perc >= 5 then
                    set_icon(widget_config.icon10, widget_config.icon_color_low)
                end

                if tonumber(bat_now.perc) <= 15 then
                    -- indicate low battery by changing text color
                    set_text(widget, perc_text, widget_config.fg_low)
                end
            end
        else
            -- there is no battery
            set_icon(widget_config.icon_no)
            set_text(widget, 'N/A')
        end
    end
}

local battery = wibox.widget {
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

                battery_icon,
                battery_text
            }
        }
    }
}

return battery
