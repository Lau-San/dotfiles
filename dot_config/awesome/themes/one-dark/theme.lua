-- =================================================== --
-- ----------- AWESOME WM ONE DARK THEME ------------- --
-- =================================================== --
--
-- An Awesome WM theme inpired by the popular One Dark Theme
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
theme.name      = "one-dark"

local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme.name
local icons_dir = theme_dir .. "/icons/"


-- =================================================== --
-- WALLPAPER
-- =================================================== --

theme.wallpaper     = theme_dir .. "/wallpaper.jpg"


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

local palette       = {
    neutral_900     = "#282c34",
    neutral_800     = "#363a43",
    neutral_700     = "#444952",
    neutral_600     = "#525761",
    neutral_500     = "#606671",
    neutral_400     = "#6d7480",
    neutral_300     = "#7b828f",
    neutral_200     = "#89919e",
    neutral_100     = "#979fad",

    cyan_800        = "#225c63",
    cyan_700        = "#2b747e",
    cyan_600        = "#348d98",
    cyan_500        = "#3ea5b3",
    cyan_400        = "#51b6c3",
    cyan_300        = "#86ccd5",
    cyan_200        = "#bbe3e8",
    cyan_100        = "#d6eef1",

    magenta_800     = "#8425a0",
    magenta_700     = "#9c2cbd",
    magenta_600     = "#af3bd2",
    magenta_500     = "#bb58d8",
    magenta_400     = "#c775df",
    magenta_300     = "#dfafec",
    magenta_200     = "#eaccf3",
    magenta_100     = "#f6e9fa",

    red_800         = "#9f1f28",
    red_700         = "#bd252f",
    red_600         = "#d62f3b",
    red_500         = "#dc4d57",
    red_400         = "#e26b73",
    red_300         = "#eea7ab",
    red_200         = "#f4c5c8",
    red_100         = "#f9e2e4",

    green_800       = "#507733",
    green_700       = "#61903e",
    green_600       = "#72a948",
    green_500       = "#84b95c",
    green_400       = "#97c475",
    green_300       = "#bdd9a7",
    green_200       = "#d0e4c0",
    green_100       = "#e2efd9",

    tan_800         = "#805325",
    tan_700         = "#9c652d",
    tan_600         = "#b87735",
    tan_500         = "#ca8946",
    tan_400         = "#d29b62",
    tan_300         = "#e2be99",
    tan_200         = "#ead0b5",
    tan_100         = "#f2e2d1",

    blue_800        = "#0e67b2",
    blue_700        = "#117ad3",
    blue_600        = "#1b8ded",
    blue_500        = "#3c9def",
    blue_400        = "#5daef2",
    blue_300        = "#9fcff7",
    blue_200        = "#c0e0fa",
    blue_100        = "#e1f0fd"
}


-- =================================================== --
-- DEFAULT COLORS
-- =================================================== --

theme.bg_normal = palette.neutral_800
theme.fg_normal = palette.neutral_100
theme.bg_focus  = palette.blue_800
theme.fg_focus  = palette.blue_400
theme.bg_urgent = palette.red_700
theme.fg_urgent = palette.red_300


-- =================================================== --
-- STATUS BAR
-- =================================================== --

theme.bar_height    = 30
theme.bar_opacity   = 0.95

local bar_padding   = 4

local bar_bg        = palette.neutral_900
local bar_fg        = theme.fg_normal


-- =================================================== --
-- WINDOWS
-- =================================================== --

theme.border_width      = 2
theme.useless_gap       = 6

theme.border_normal     = palette.neutral_800
theme.border_focus      = palette.blue_400
theme.border_marked     = palette.magenta_400


-- =================================================== --
-- TABS
-- =================================================== --

theme.tabbar_radius     = 20
theme.tabbar_style      = "default"
theme.tabbar_font       = theme.font

theme.tabbar_bg_normal  = theme.bg_normal
theme.tabbar_fg_normal  = theme.fg_normal
theme.tabbar_bg_focus   = theme.bg_focus
theme.tabbar_fg_focus   = theme.fg_focus


-- =================================================== --
-- NOTIFICATIONS
-- =================================================== --

theme.notification_opacity              = 1

theme.notification_bg                   = palette.neutral_900
theme.notification_fg                   = theme.fg_normal
theme.notification_border_color         = palette.neutral_800

naughty.config.padding                  = 6
naughty.config.spacing                  = 8

naughty.config.defaults.margin          = 10
naughty.config.defaults.border_width    = 2

local notification_corner_radius        = 4

-- PRESETS
---------------------------------------------------------

-- CRITICAL
naughty.config.presets.critical.font            = theme.notification_font
naughty.config.presets.critical.bg              = palette.red_800
naughty.config.presets.critical.fg              = palette.red_300
naughty.config.presets.critical.border_color    = palette.red_700
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

local widget_bg                 = theme.bg_normal
local widget_fg                 = palette.blue_400
local widget_icon_bg            = palette.blue_800
local widget_icon_fg            = palette.blue_300

local widget_icon_size          = "22"

local widget_percent_icon       = "％"

-- TAG LIST
---------------------------------------------------------

theme.taglist_bg_empty          = widget_bg
theme.taglist_fg_empty          = widget_fg

theme.taglist_bg_occupied       = theme.taglist_bg_empty
theme.taglist_fg_occupied       = theme.taglist_fg_empty

theme.taglist_bg_focus          = theme.bg_focus
theme.taglist_fg_focus          = theme.fg_focus

theme.taglist_bg_urgent         = theme.bg_urgent
theme.taglist_fg_urgent         = theme.fg_urgent

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

theme.tasklist_bg_normal        = bar_bg

theme.tasklist_bg_normal        = bar_bg
theme.tasklist_fg_normal        = theme.fg_normal

theme.tasklist_bg_focus         = palette.neutral_800
theme.tasklist_fg_focus         = theme.fg_focus

theme.tasklist_bg_urgent        = theme.bg_urgent
theme.tasklist_fg_urgent        = theme.fg_urgent

theme.tasklist_bg_minimize      = bar_bg
theme.tasklist_fg_minimize      = palette.neutral_600

-- LAYOUT BOX
---------------------------------------------------------

local widget_layoutbox_bg   = widget_bg
local widget_layoutbox_fg   = palette.green_400

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

theme.bg_systray            = bar_bg

-- TEXT CLOCK
---------------------------------------------------------

local widget_clock_bg           = widget_bg
local widget_clock_fg           = palette.cyan_400

local widget_clock_icon_bg      = palette.cyan_700
local widget_clock_icon_fg      = palette.cyan_300

local widget_clock_icon_size    = widget_icon_size

local widget_clock_icon_date    = ""
local widget_clock_icon_time    = ""

-- BATTERY
---------------------------------------------------------

local widget_bat_bg             = widget_bg
local widget_bat_fg             = widget_fg
local widget_bat_bg_low         = widget_bg
local widget_bat_fg_low         = palette.red_400

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
--     widget  = wibox.container.margin,
--     top     = widget_container_padding,
--     bottom  = widget_container_padding,
--
--     {
--         widget  = wibox.container.background,
--         shape   = gears.shape.rounded_bar,
--         bg      = widget_net_icon_bg,
--
--         {
--             widget  = wibox.container.margin,
--             left    = widget_padding,
--             right   = widget_padding,
--
--             {
--                 widget = wibox.widget.textbox,
--                 markup = markup.fontfg(
--                     icon_font .. widget_net_icon_size,
--                     widget_net_icon_fg,
--                     widget_net_icon
--                 )
--             }
--         }
--     }
-- }
-- local net_sep = wibox.widget {
--     widget = wibox.widget.textbox,
--     markup = markup.fontfg(
--         icon_font .. widget_icon_size,
--         widget_net_icon_fg_up,
--         "" .. markup.fontfg(
--             icon_font .. widget_icon_size,
--             widget_net_icon_fg_down,
--             ""
--         )
--     )
-- }

-- INFO WIDGETS
-- local net_down      = wibox.widget.textbox()
-- local net_up        = wibox.widget.textbox()

-- WIDGET UPDATE
-- local net_update = lain.widget.net {
--     wifi_state = "on",
--     settings = function()
--         net_down:set_markup(
--             markup.fontfg(
--                 theme.widget_font,
--                 widget_net_fg,
--                 net_now.received
--             )
--         )
--         net_up:set_markup(
--             markup.fontfg(
--                 theme.widget_font,
--                 widget_net_fg,
--                 net_now.sent
--             )
--         )
--     end
-- }

-- NETWORK WIDGET
-- local net_widget = wibox.widget {
--     widget  = wibox.container.background,
--     shape   = gears.shape.rounded_bar,
--     bg      = widget_net_bg,
--     {
--         widget  = wibox.container.margin,
--         left    = widget_container_padding,
--         right   = widget_padding,
--
--         {
--             layout          = wibox.layout.fixed.horizontal,
--             spacing_widget  = wibox.container.background,
--             spacing         = widget_container_spacing,
--
--             net_icon,
--             {
--                 layout          = wibox.layout.fixed.horizontal,
--                 spacing_widget  = wibox.container.background,
--                 spacing         = widget_container_spacing + 2,
--
--                 net_up,
--                 net_sep,
--                 net_down
--             }
--         }
--     }
-- }


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
                top     = 2,
                bottom  = 2,

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
        buttons = awful.util.tasklist_buttons,
        filter  = awful.widget.tasklist.filter.currenttags,
        -- style   = { shape = gears.shape.rounded_bar },
        layout  = {
            layout          = wibox.layout.flex.horizontal,
            -- spacing_widget  = wibox.container.background,
            -- spacing         = widget_container_spacing
        },
        widget_template = {
            widget  = wibox.container.background,
            id      = "background_role",
            shape   = gears.shape.rounded_bar,
            {
                widget  = wibox.container.margin,
                top     = 6,
                bottom  = 6,
                left    = widget_padding,
                right   = widget_padding,

                {
                    widget  = wibox.container.place,
                    halign  = "center",
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
       bg       = bar_bg,
       fg       = bar_fg
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
           -- top      = bar_padding,
           bottom   = bar_padding,
           left     = widget_spacing,
           right    = widget_spacing,

           s.mytasklist
           -- {
               -- widget = wibox.container.background,
               -- bg       = widget_bg
--
           -- }

           -- {
               -- layout = wibox.layout.flex.horizontal,
           -- }
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
