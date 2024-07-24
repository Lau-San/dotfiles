-- =================================================== --
-- ------------ AWESOME WM DRACULA THEME ------------- --
-- =================================================== --
--
-- An Awesome WM theme inpired by the popular Dracula
-- theme (draculatheme.com).
--
-- DEPENDENCIES
-- ------------
--
-- FONTS
-- -----
-- -> Ubuntu
-- -> Iosevka Nerd Font (https://www.nerdfonts.com/font-downloads)


-- =================================================== --
-- IMPORTS
-- =================================================== --

local awful         = require("awful")
local gears         = require("gears")
local gcolor        = require("gears.color")
local wibox         = require("wibox")
local naughty       = require("naughty")

local lain          = require("lain")
local markup        = lain.util.markup
local separators    = lain.util.separators


-- =================================================== --
-- THEME SETUP
-- =================================================== --

local theme     = {}
theme.name      = "dracula"

local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme.name
local icons_dir = theme_dir .. "/icons/"


-- =================================================== --
-- WALLPAPER
-- =================================================== --

theme.wallpaper     = theme_dir .. "/wallpaper.png"


-- =================================================== --
-- FONTS
-- =================================================== --

local font                  = "Ubuntu "
local font_mono             = "Iosevka "
local icon_font             = "Iosevka "

theme.font                  = font .. "12"

theme.notification_font     = font .. "14"

theme.widget_font           = font_mono .. "14"
theme.widget_font_urgent    = font_mono .. "Bold 14"

theme.taglist_font          = font .. "Bold 12"

theme.tasklist_font         = font ..  "Medium 12"


-- =================================================== --
-- PALETTE
-- =================================================== --

local colors        = {}
colors.black_d      = "#181a26"
colors.black        = "#282a36"
colors.black_l      = "#484a56"

colors.gray_d       = "#24273a"
colors.gray         = "#44475a"
colors.gray_l       = "#646776"

colors.white        = "#f8f8f2"

colors.blue_xd      = "#223264"
colors.blue_d       = "#425284"
colors.blue         = "#6272a4"
colors.blue_l       = "#8292c4"
colors.blue_xl      = "#a2b2e4"

colors.cyan_xd      = "#4ba9bd"
colors.cyan_d       = "#6bc9dd"
colors.cyan         = "#8be9fd"
colors.cyan         = "#8be9fd"
colors.cyan_l       = "#abffff"
colors.cyan_xl      = "#bbffff"

colors.green_xd     = "#109a3b"
colors.green_d      = "#30da5b"
colors.green        = "#50fa7b"
colors.green_l      = "#70ff9b"
colors.green_xl     = "#90ffbb"

colors.orange_xd    = "#bf782c"
colors.orange_d     = "#df984c"
colors.orange       = "#ffb86c"
colors.orange_l     = "#ffd88c"
colors.orange_xl    = "#fff8ac"

colors.pink_xd      = "#bf3986"
colors.pink_d       = "#df59a6"
colors.pink         = "#ff79c6"
colors.pink_l       = "#ff99e6"
colors.pink_xl      = "#ffb9ff"

colors.purple_xd    = "#5d3399"
colors.purple_d     = "#9d73d9"
colors.purple       = "#bd93f9"
colors.purple_l     = "#ddb3ff"
colors.purple_xl    = "#fdd3ff"

colors.red_xd       = "#bf1515"
colors.red_d        = "#df3535"
colors.red          = "#ff5555"
colors.red_l        = "#ff7575"
colors.red_xl       = "#ff9595"

colors.yellow_xd    = "#a1aa4c"
colors.yellow_d     = "#d1da6c"
colors.yellow       = "#f1fa8c"
colors.yellow_l     = "#ffffac"
colors.yellow_xl    = "#ffffcc"


-- =================================================== --
-- DEFAULT COLORS
-- =================================================== --

theme.bg_normal = colors.black
theme.fg_normal = colors.white
theme.bg_focus  = colors.blue
theme.fg_focus  = colors.cyan
theme.bg_urgent = colors.black
theme.fg_urgent = colors.red


-- =================================================== --
-- STATUS BAR
-- =================================================== --

theme.bar_height    = 30
theme.bar_opacity   = 0.75

local bar_padding   = 4

theme.bar_bg        = colors.black_d
theme.bar_fg        = colors.white


-- =================================================== --
-- WINDOWS
-- =================================================== --

theme.border_width      = 2
theme.useless_gap       = 6

theme.border_normal     = colors.gray
theme.border_focus      = colors.purple
theme.border_marked     = colors.pink


-- =================================================== --
-- TABS
-- =================================================== --

theme.tabbar_radius     = 20
theme.tabbar_style      = "default"
theme.tabbar_font       = theme.font

theme.tabbar_bg_normal  = colors.gray
theme.tabbar_fg_normal  = colors.black
theme.tabbar_bg_focus   = colors.blue
theme.tabbar_fg_focus   = colors.white


-- =================================================== --
-- NOTIFICATIONS
-- =================================================== --

theme.notification_opacity              = 1

theme.notification_bg                   = colors.black_d
theme.notification_fg                   = colors.blue_xl
theme.notification_border_color         = colors.gray_d

naughty.config.padding                  = 6
naughty.config.spacing                  = 8

naughty.config.defaults.margin          = 10
naughty.config.defaults.border_width    = 2

local notification_corner_radius        = 4

-- PRESETS
---------------------------------------------------------

-- CRITICAL
naughty.config.presets.critical.font            = theme.notification_font
naughty.config.presets.critical.bg              = colors.red_xd
naughty.config.presets.critical.fg              = colors.red_xl
naughty.config.presets.critical.border_color    = colors.red_d
naughty.config.presets.critical.opacity         = 1


-- =================================================== --
-- WIDGETS
-- =================================================== --

local widget_spacing            = 10
local widget_padding            = 8

local widget_margin_top         = 3
local widget_margin_bottom      = 3

local widget_container_spacing  = 4
local widget_container_padding  = 2

local icon_size                 = 14
local icon_margin               = (theme.bar_height - (2 * bar_padding) - icon_size) // 2

local widget_bg                 = colors.black
local widget_fg                 = colors.purple
local widget_icon_bg            = colors.purple_xd
local widget_icon_fg            = colors.purple_l

local widget_icon_size          = "22"

local widget_percent_icon       = "％"

-- TAG LIST
---------------------------------------------------------

theme.taglist_bg_empty          = colors.black
theme.taglist_fg_empty          = colors.gray_l

theme.taglist_bg_occupied       = colors.black
theme.taglist_fg_occupied       = colors.gray_l

theme.taglist_bg_focus          = colors.blue_d
theme.taglist_fg_focus          = colors.blue_xl

theme.taglist_bg_urgent         = colors.red_d
theme.taglist_fg_urgent         = colors.red_xl

theme.tags_org_icon             = icons_dir .. "bookmark.png"
theme.tags_dev_icon             = icons_dir .. "code.png"
theme.tags_www_icon             = icons_dir .. "web.png"
theme.tags_term_icon            = icons_dir .. "terminal.png"
theme.tags_file_icon            = icons_dir .. "folder.png"
theme.tags_sys_icon             = icons_dir .. "laptop.png"
theme.tags_doc_icon             = icons_dir .. "document.png"
theme.tags_virt_icon            = icons_dir .. "virtual.png"
theme.tags_cht_icon             = icons_dir .. "chat.png"
theme.tags_mus_icon             = icons_dir .. "note.png"
theme.tags_vid_icon             = icons_dir .. "play.png"
theme.tags_art_icon             = icons_dir .. "brush.png"

-- TASK LIST
---------------------------------------------------------

theme.tasklist_plain_task_name  = true

theme.tasklist_bg_normal        = colors.black_d
theme.tasklist_fg_normal        = colors.gray_l

theme.tasklist_bg_focus         = colors.black
theme.tasklist_fg_focus         = colors.white

theme.tasklist_bg_urgent        = colors.red_xd
theme.tasklist_fg_urgent        = colors.red_xl

theme.tasklist_bg_minimize      = colors.black_d
theme.tasklist_fg_minimize      = colors.black

-- LAYOUT BOX
---------------------------------------------------------

local widget_layoutbox_bg   = colors.black
local widget_layoutbox_fg   = colors.purple

theme.layout_tile       = gcolor.recolor_image(icons_dir .. "layout_tile.svg", widget_layoutbox_fg)
theme.layout_tileleft   = gcolor.recolor_image(icons_dir .. "layout_tileleft.svg", widget_layoutbox_fg)
theme.layout_tilebottom = gcolor.recolor_image(icons_dir .. "layout_tilebottom.svg", widget_layoutbox_fg)
theme.layout_tiletop    = gcolor.recolor_image(icons_dir .. "layout_tiletop.svg", widget_layoutbox_fg)
theme.layout_fairv      = gcolor.recolor_image(icons_dir .. "layout_fair.svg", widget_layoutbox_fg)
theme.layout_dwindle    = gcolor.recolor_image(icons_dir .. "layout_dwindle.svg", widget_layoutbox_fg)
theme.layout_magnifier  = gcolor.recolor_image(icons_dir .. "layout_magnifier.svg", widget_layoutbox_fg)
theme.layout_max        = gcolor.recolor_image(icons_dir .. "layout_max.svg", widget_layoutbox_fg)
theme.layout_floating   = gcolor.recolor_image(icons_dir .. "layout_floating.svg", widget_layoutbox_fg)

-- SYSTEM TRAY
---------------------------------------------------------

theme.systray_icon_spacing  = 3

theme.bg_systray            = theme.bar_bg

-- TEXT CLOCK
---------------------------------------------------------

local widget_clock_bg           = widget_bg
local widget_clock_fg           = colors.pink

local widget_clock_icon_bg      = colors.pink_xd
local widget_clock_icon_fg      = colors.pink_xl

local widget_clock_icon_size    = widget_icon_size

local widget_clock_icon_date    = ""
local widget_clock_icon_time    = ""

-- BATTERY
---------------------------------------------------------

local widget_bat_bg             = widget_bg
local widget_bat_fg             = widget_fg
local widget_bat_bg_low         = widget_bg
local widget_bat_fg_low         = colors.red

local widget_bat_icon_bg        = widget_icon_bg
local widget_bat_icon_fg        = widget_icon_fg
local widget_bat_icon_bg_low    = widget_icon_bg
local widget_bat_icon_fg_low    = widget_icon_fg

local widget_bat_icon_size      = "15"

local widget_bat_icon_10        = ""
local widget_bat_icon_20        = ""
local widget_bat_icon_30        = ""
local widget_bat_icon_40        = ""
local widget_bat_icon_50        = ""
local widget_bat_icon_60        = ""
local widget_bat_icon_70        = ""
local widget_bat_icon_80        = ""
local widget_bat_icon_90        = ""
local widget_bat_icon_100       = ""
local widget_bat_icon_ac        = ""
local widget_bat_icon_no        = "ﮣ"

-- VOLUME
---------------------------------------------------------

local widget_vol_bg             = widget_bg
local widget_vol_fg             = widget_fg

local widget_vol_icon_bg        = widget_icon_bg
local widget_vol_icon_fg        = widget_icon_fg

local widget_vol_icon_size      = widget_icon_size
local widget_vol_icon           = "墳"

-- NETWORK
---------------------------------------------------------

local widget_net_bg             = widget_bg
local widget_net_fg             = widget_fg

local widget_net_icon_bg        = widget_icon_bg
local widget_net_icon_fg        = widget_icon_fg
local widget_net_icon_fg_up     = widget_net_fg
local widget_net_icon_fg_down   = widget_net_fg

local widget_net_icon_size      = "28"
local widget_net_icon           = ""



-- =================================================== --
-- NOTIFICATIONS SETUP
-- =================================================== --

theme.notification_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, notification_corner_radius)
end


-- =================================================== --
-- WIDGET SETUP
-- =================================================== --

-- CLOCK WIDGET
---------------------------------------------------------

-- DATE WIDGET
--------------

-- ICON
local date_icon = wibox.widget {
    widget  = wibox.container.margin,
    top     = widget_container_padding,
    bottom  = widget_container_padding,

    {
        widget  = wibox.container.background,
        shape   = gears.shape.rounded_bar,
        bg      = widget_clock_icon_bg,

        {
            widget = wibox.container.margin,
            left    = widget_padding,
            right   = widget_padding,

            {
                widget = wibox.widget.textbox,
                markup = markup.fontfg(
                    icon_font .. widget_clock_icon_size,
                    widget_clock_icon_fg,
                    widget_clock_icon_date
                )
            }
        }
    }
}

-- INFO
local date_info = wibox.widget {
    widget  = wibox.widget.textclock,
    refresh = 60,
    format  = markup.fontfg(
        theme.widget_font,
        widget_clock_fg,
        -- "%A, %d %b %Y  %l:%M %p"
        "%A, %d %b %Y"
    )
}

-- WIDGET
local date_widget = wibox.widget {
    layout          = wibox.layout.fixed.horizontal,
    spacing_widget  = wibox.container.background,
    spacing         = widget_container_spacing,

    date_icon,
    date_info
}

-- TIME WIDGET
--------------

-- ICON
local time_icon = wibox.widget {
    widget  = wibox.container.margin,
    top     = widget_container_padding,
    bottom  = widget_container_padding,

    {
        widget  = wibox.container.background,
        shape   = gears.shape.rounded_bar,
        bg      = widget_clock_icon_bg,

        {
            widget = wibox.container.margin,
            left    = widget_padding,
            right   = widget_padding,

            {
                widget = wibox.widget.textbox,
                markup = markup.fontfg(
                    icon_font .. widget_clock_icon_size,
                    widget_clock_icon_fg,
                    widget_clock_icon_time
                )
            }
        }
    }
}

-- INFO
local time_info = wibox.widget {
    widget  = wibox.widget.textclock,
    refresh = 60,
    format  = markup.fontfg(
        theme.widget_font,
        widget_clock_fg,
        -- "%A, %d %b %Y  %l:%M %p"
        "%I:%M %p"
    )
}

-- WIDGET
local time_widget = wibox.widget {
    layout          = wibox.layout.fixed.horizontal,
    spacing_widget  = wibox.container.background,
    spacing         = widget_container_spacing,

    time_icon,
    time_info
}

-- CLOCK WIDGET
---------------

local clock_widget = wibox.widget {
    widget  = wibox.container.background,
    shape   = gears.shape.rounded_bar,
    bg      = widget_clock_bg,
    {
        widget  = wibox.container.margin,
        left    = widget_container_padding,
        right   = widget_padding,

        {
            layout          = wibox.layout.fixed.horizontal,
            spacing_widget  = wibox.container.background,
            spacing         = widget_spacing,

            date_widget,
            time_widget
        }
    }
}

-- BATTERY
---------------------------------------------------------

-- ICON WIDGET
-- local battery_icon = wibox.widget {
--     widget          = wibox.widget.imagebox,
--     image           = theme.widget_battery_icon_ac,
--     forced_width    = icon_size,
--     forced_height   = icon_size
-- }

local battery_icon_img = wibox.widget.textbox()

local battery_icon = wibox.widget {
    widget  = wibox.container.margin,
    top     = widget_container_padding,
    bottom  = widget_container_padding,

    {
        widget  = wibox.container.background,
        shape   = gears.shape.rounded_bar,
        bg      = widget_bat_icon_bg,

        {
            widget = wibox.container.margin,
            left    = widget_padding,
            right   = widget_padding,

            -- {
            --     widget = wibox.widget.textbox,
            --     markup = markup.fontfg(
            --         icon_font,
            --         widget_bat_icon_fg,
            --         ""
            --     )
            -- }
            battery_icon_img
        }
    }
}

-- INFO WIDGET
local battery_info = lain.widget.bat {

    -- REFRESH RATE
    timeout = 30,

    -- UPDATE FUNCTION
    settings = function()
        bat_notification_charged_preset = {
            title           = "Battery is full",
            text            = "You can unplug the cable",
            timeout         = 15,
            bg              = naughty.config.presets.normal.bg,
            fg              = naughty.config.presets.normal.fg,
            border_width    = naughty.config.presets.normal.border_width,
            border_color    = naughty.config.presets.normal.border_color
        }

        if bat_now.status and bat_now.status ~= "N/A" then
            -- THERE IS A BATTERY

            -- Set battery markup
            widget:set_markup(
                markup.fontfg(
                    theme.widget_font,
                    widget_bat_fg,
                    bat_now.perc .. widget_percent_icon
                )
            )

            if bat_now.ac_status == 1 then
                -- AC STATUS IS ON

                battery_icon_img:set_markup(
                    markup.fontfg(
                        icon_font .. widget_bat_icon_size,
                        widget_bat_icon_fg,
                        widget_bat_icon_ac
                    )
                )
            else
                -- AC STATUS IS OFF

                -- Icon progression
                if tonumber(bat_now.perc) >= 95 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_100
                        )
                    )
                elseif tonumber(bat_now.perc) >= 85 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_90
                        )
                    )
                elseif tonumber(bat_now.perc) >= 75 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_80
                        )
                    )
                elseif tonumber(bat_now.perc) >= 65 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_70
                        )
                    )
                elseif tonumber(bat_now.perc) >= 55 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_60
                        )
                    )
                elseif tonumber(bat_now.perc) >= 45 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_50
                        )
                    )
                elseif tonumber(bat_now.perc) >= 35 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_40
                        )
                    )
                elseif tonumber(bat_now.perc) >= 25 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_30
                        )
                    )
                elseif tonumber(bat_now.perc) >= 15 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_20
                        )
                    )
                elseif tonumber(bat_now.perc) >= 5 then
                    battery_icon_img:set_markup(
                        markup.fontfg(
                            icon_font .. widget_bat_icon_size,
                            widget_bat_icon_fg,
                            widget_bat_icon_10
                        )
                    )
                end

                if tonumber(bat_now.perc) <= 15 then
                    -- BATTERY IS TOO LOW

                    widget:set_markup(
                        markup.fontfg(
                            theme.widget_font,
                            widget_bat_fg_low,
                            bat_now.perc .. widget_percent_icon
                        )
                    )
                end
            end


        else
            -- THERE IS NO BATTERY

            battery_icon_img:set_markup(
                markup.fontfg(
                    icon_font .. widget_bat_icon_size,
                    widget_bat_icon_fg,
                    widget_bat_icon_no
                )
            )
            widget:set_markup(
                markup.fontfg(
                    theme.widget_font,
                    widget_bat_fg,
                    "N/A"
                )
            )
        end
    end
}

local battery_widget = wibox.widget {
    widget  = wibox.container.background,
    shape   = gears.shape.rounded_bar,
    bg      = widget_bat_bg,
    {
        widget  = wibox.container.margin,
        left    = widget_container_padding,
        right   = widget_padding,

        {
            layout          = wibox.layout.fixed.horizontal,
            spacing_widget  = wibox.container.background,
            spacing         = widget_container_spacing,

            battery_icon,
            battery_info
        }
    }
}

-- VOLUME
---------------------------------------------------------

-- ICON WIDGET
local volume_icon = wibox.widget {
    widget  = wibox.container.margin,
    top     = widget_container_padding,
    bottom  = widget_container_padding,

    {
        widget  = wibox.container.background,
        shape   = gears.shape.rounded_bar,
        bg      = widget_vol_icon_bg,

        {
            widget  = wibox.container.margin,
            left    = widget_padding,
            right   = widget_padding,

            {
                widget = wibox.widget.textbox,
                markup = markup.fontfg(
                    icon_font .. widget_vol_icon_size,
                    widget_vol_icon_fg,
                    widget_vol_icon
                )
            }
        }
    }
}

-- INFO WIDGET
theme.volume = lain.widget.alsa {
    timeout = 1,
    settings = function ()
        widget:set_markup(
            markup.fontfg(
                theme.widget_font,
                widget_vol_fg,
                volume_now.level .. widget_percent_icon
            )
        )
        -- if volume_now.status == "on" then
        --     widget:set_markup(
        --         markup.fontfg(
        --             theme.widget_font,
        --             widget_vol_fg,
        --             volume_now.level .. widget_percent_icon
        --         )
        --     )

        -- else
        --     volume_icon:set_image(theme.widget_volume_icon_mute)
        --     widget:set_markup()
        -- end
    end,
}

-- VOLUME WIDGET
local volume_widget = wibox.widget {
    widget  = wibox.container.background,
    shape   = gears.shape.rounded_bar,
    bg      = widget_vol_bg,
    {
        widget  = wibox.container.margin,
        left    = widget_container_padding,
        right   = widget_padding,

        {
            layout          = wibox.layout.fixed.horizontal,
            spacing_widget  = wibox.container.background,
            spacing         = widget_container_spacing,

            volume_icon,
            theme.volume
        }
    }
}

-- NETWORK
---------------------------------------------------------

-- ICON WIDGET
-- local net_icon = wibox.widget {
--     widget          = wibox.widget.imagebox,
--     image           = theme.widget_net_icon,
--     forced_width    = icon_size,
--     forced_height   = icon_size
-- }
-- local net_icon = wibox.widget.textbox()
local net_icon = wibox.widget {
    widget  = wibox.container.margin,
    top     = widget_container_padding,
    bottom  = widget_container_padding,

    {
        widget  = wibox.container.background,
        shape   = gears.shape.rounded_bar,
        bg      = widget_net_icon_bg,

        {
            widget  = wibox.container.margin,
            left    = widget_padding,
            right   = widget_padding,

            {
                widget = wibox.widget.textbox,
                markup = markup.fontfg(
                    icon_font .. widget_net_icon_size,
                    widget_net_icon_fg,
                    widget_net_icon
                )
            }
        }
    }
}
local net_sep = wibox.widget {
    widget = wibox.widget.textbox,
    markup = markup.fontfg(
        icon_font .. widget_icon_size,
        widget_net_icon_fg_up,
        "" .. markup.fontfg(
            icon_font .. widget_icon_size,
            widget_net_icon_fg_down,
            ""
        )
    )
}

-- INFO WIDGETS
local net_down      = wibox.widget.textbox()
local net_up        = wibox.widget.textbox()

-- WIDGET UPDATE
local net_update = lain.widget.net {
    wifi_state = "on",
    settings = function()
        -- net_icon:set_image(theme.widget_net_icon)
        -- net_icon:set_markup(
        --     markup.fontfg(
        --         "Iosevka 28",
        --         colors.cyan,
        --         ""
        --     )
        -- )
        net_down:set_markup(
            markup.fontfg(
                theme.widget_font,
                widget_net_fg,
                net_now.received
            )
        )
        net_up:set_markup(
            markup.fontfg(
                theme.widget_font,
                widget_net_fg,
                net_now.sent
            )
        )
        -- net_sep:set_markup(
        --     markup.fontfg(
        --         icon_font,
        --         colors.green,
        --         -- "↓↑"
        --         "" .. markup.fontfg(
        --             icon_font,
        --             colors.red,
        --             ""
        --         )
        --         --string.format("%x", "f01b")
        --     )
        -- )
    end
}

-- NETWORK WIDGET
-- local net_widget = wibox.widget {
--     widget  = wibox.container.background,
--     shape   = gears.shape.rounded_bar,
--     bg      = widget_bg,
--     {
--         widget  = wibox.container.margin,
--         left    = widget_padding,
--         right   = widget_padding,

--         {
--             layout          = wibox.layout.fixed.horizontal,
--             spacing_widget  = wibox.container.background,
--             spacing         = widget_container_spacing,

--             {
--                 layout  = wibox.container.margin,
--                 right     = icon_margin,

--                 net_icon,
--             },
--             net_up,
--             net_sep,
--             net_down
--         }
--     }
-- }
local net_widget = wibox.widget {
    widget  = wibox.container.background,
    shape   = gears.shape.rounded_bar,
    bg      = widget_net_bg,
    {
        widget  = wibox.container.margin,
        left    = widget_container_padding,
        right   = widget_padding,

        {
            layout          = wibox.layout.fixed.horizontal,
            spacing_widget  = wibox.container.background,
            spacing         = widget_container_spacing,

            net_icon,
            {
                layout          = wibox.layout.fixed.horizontal,
                spacing_widget  = wibox.container.background,
                spacing         = widget_container_spacing + 2,

                net_up,
                net_sep,
                net_down
            }
        }
    }
}


-- =================================================== --

function theme.at_screen_connect(s)

    -- Set wallpaper
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
       wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s)

     -- Set default layout
     -- awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Layout button widget
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(gears.table.join(
       awful.button({ }, 1, function () awful.layout.inc(1) end),
       awful.button({ }, 3, function () awful.layout.inc(-1) end)
    )))

    local layoutbox_widget = wibox.widget {
        widget   = wibox.container.background,
        shape    = gears.shape.rounded_bar,
        bg       = widget_layoutbox_bg,

        {
            layout   = wibox.container.margin,
            left     = widget_padding,
            right    = widget_padding,
            top      = 5,
            bottom   = 5,

            s.mylayoutbox
        }
    }

    -- Taglist widget
    s.mytaglist = awful.widget.taglist {
        screen          = s,
        filter          = awful.widget.taglist.filter.all,
        buttons         = awful.util.taglist_buttons,
        style           = { shape = gears.shape.rounded_bar },
        layout          = {
            layout          = wibox.layout.fixed.horizontal,
            spacing_widget  = wibox.container.background,
            spacing         = widget_container_spacing
        },
        widget_template = {
            widget  = wibox.container.background,
            id      = "background_role",

            {
                widget  = wibox.container.margin,
                left    = widget_padding,
                right   = widget_padding,

                {
                    widget  = wibox.widget.imagebox,
                    id      = "icon_role",
                    opacity = 0.7
                }
            }
        }
    }

    -- Takslist widget (shows only minimized clients)
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        style   = { shape = gears.shape.rounded_bar },
        layout  = {
            layout          = wibox.layout.flex.horizontal,
            spacing_widget  = wibox.container.background,
            spacing         = widget_container_spacing
        },
        widget_template = {
            widget  = wibox.container.background,
            id      = "background_role",
            shape   = gears.shape.rounded_bar,
            {
                widget  = wibox.container.margin,
                top     = 3,
                bottom  = 3,
                left    = widget_padding,
                right   = widget_padding,
                {
                    layout          = wibox.layout.fixed.horizontal,
                    spacing_widget  = wibox.container.background,
                    spacing         = widget_spacing,

                    {
                        widget = awful.widget.clienticon,
                        id = "clienticon"
                    },
                    {
                        widget = wibox.widget.textbox,
                        id = "text_role"
                    }
                }
            },
            nil,
            create_callback = function(self, c, index, objects)
                self:get_children_by_id("clienticon")[1].client = c
            end
        }
    }

    -- System Tray widget
    s.mysystray = wibox.widget {
        widget  = wibox.container.margin,
        right   = 18,
        {
            widget = wibox.container.place,
            valign = "center",
            halign = "center",
            {
                widget = wibox.widget.systray,
                create_callback = function(self)
                    self:set_base_size(14)
                end
            }
        }
    }

    -- Create status bar
    s.mywibox = awful.wibar({
       position = "top",
       screen   = s,
       opacity  = theme.bar_opacity,
       height   = theme.bar_height,
       bg       = theme.bar_bg,
       fg       = theme.bar_fg
    })

    -- Add widgets to the status bar
    s.mywibox:setup {
       layout = wibox.layout.align.horizontal,

       -- LEFT WIDGETS
       ---------------
       {
           layout   = wibox.container.margin,
           top      = bar_padding,
           bottom   = bar_padding,
           left     = bar_padding,

           {
               layout           = wibox.layout.fixed.horizontal,
               spacing_widget   = wibox.container.background,
               spacing          = widget_spacing,

               layoutbox_widget,
               {   -- Taglist
                   widget   = wibox.container.background,
                   shape    = gears.shape.rounded_bar,
                   bg       = widget_bg,
                   {
                       layout   = wibox.container.margin,
                       margins  = widget_container_padding,

                       {
                           layout = wibox.layout.fixed.horizontal,

                           s.mytaglist
                       }
                   }
               }
           }
       },

       -- MIDDLE WIDGETS
       -----------------
       { -- Tasklist
           layout   = wibox.container.margin,
           top      = bar_padding,
           bottom   = bar_padding,
           left     = widget_spacing,
           right    = widget_spacing,

           {
               layout = wibox.layout.flex.horizontal,

               s.mytasklist
           }
       },


       -- RIGHT WIDGETS
       ----------------
       {
           layout = wibox.container.margin,
           top = bar_padding,
           bottom = bar_padding,
           right = bar_padding,
           {
               layout            = wibox.layout.fixed.horizontal,
               spacing_widget    = wibox.container.background,
               spacing           = widget_spacing,

               {
                   layout           = wibox.layout.fixed.horizontal,
                   spacing_widget   = wibox.container.background,
                   spacing          = widget_container_spacing,

                   net_widget,
                   volume_widget,
                   battery_widget,
               },
               clock_widget,
               {
                   layout = awful.widget.only_on_screen,
                   screen = "primary",
                   s.mysystray,
               }
           }
       }
    }
end

return theme
