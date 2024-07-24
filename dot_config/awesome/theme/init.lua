local awful     = require 'awful'
local gears     = require 'gears'
local gcolor    = require 'gears.color'
local tint      = gcolor.recolor_image
local naughty   = require 'naughty'

local util      = require 'util'
local icon_dir  = util.icon_dir

local config    = require 'config'
local fonts     = config.fonts

local lb_conf   = require 'widgets.layoutbox.config'

local t = {}

-- load selected color theme
t.colors                        = require('theme.colors.' .. config.color_theme)

-- Wallpaper --
t.wallpaper = config.wallpaper or util.awesome_path .. '/wallpaper.jpg'

-- Default Fonts --
t.font                          = fonts.main .. ' ' .. config.font_size
t.font_mono                     = fonts.mono .. ' ' .. config.font_size
t.icon_font                     = fonts.icon

-- Default colors --
-- t.bg_normal                     = t.colors.c0_800
t.bg_normal                     = t.colors.c0_900
t.fg_normal                     = t.colors.c0_100
t.bg_focus                      = t.colors.c0_800
t.fg_focus                      = t.colors.c6_700
t.bg_urgent                     = t.colors.c0_800
t.fg_urgent                     = t.colors.c3_700

-- Status bar --
t.bar_height                    = config.bar.height
t.bar_opacity                   = config.bar.opacity
t.bar_padding                   = config.bar.padding
t.bar_bg                        = t.colors.c0_900 .. '00'
t.bar_fg                        = t.fg_normal

-- Notifications --
t.notification_font                     = fonts.main .. ' ' .. config.notifications.font_size
t.notification_opacity                  = config.notifications.opacity
t.notification_bg                       = t.colors.c0_900
t.notification_fg                       = t.fg_normal
t.notification_border_color             = t.colors.c1_800
naughty.config.defaults.border_width    = config.notifications.border_width
naughty.config.spacing                  = config.notifications.spacing
naughty.config.padding                  = config.notifications.margin
naughty.config.defaults.margin          = config.notifications.padding
-- set rounded corners for notifications
if config.notifications.rounded_corners then
    t.notification_shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, config.notifications.corner_radius)
    end
end
-- set notification presets
naughty.config.presets.critical.font            = t.notification_font
naughty.config.presets.critical.bg              = t.notification_bg
naughty.config.presets.critical.fg              = t.colors.c3_400
naughty.config.presets.critical.border_color    = t.colors.c3_700
-- naughty.config.presets.critical.opacity         = 1

-- Widgets --
t.widget_font                   = t.font_mono
t.widget_font_urgent            = fonts.mono .. ' Bold ' .. config.font_size
t.widget_padding                = config.widgets.padding
t.widget_spacing                = config.widgets.spacing
t.widget_inner_spacing          = 8
t.widget_item_padding           = 0
t.widget_item_spacing           = 0
t.widget_bg                     = t.bg_normal
t.widget_fg                     = t.fg_normal
t.widget_icon_bg                = t.widget_bg
t.widget_icon_fg                = t.colors.c6_500
t.widget_icon_color             = t.colors.c6_500
t.widget_icon_size              = config.widgets.icon_size
t.widget_percent_icon           = config.widgets.percent_icon

-- Taglist --
t.taglist_font                  = fonts.main .. ' Bold ' .. config.font_size
t.taglist_bg_empty              = t.widget_bg
t.taglist_fg_empty              = t.widget_fg
t.taglist_bg_occupied           = t.taglist_bg_empty
t.taglist_fg_occupied           = t.taglist_fg_empty
t.taglist_bg_focus              = t.taglist_bg_occupied
t.taglist_fg_focus              = t.fg_focus
t.taglist_bg_urgent             = t.bg_urgent
t.taglist_fg_urgent             = t.fg_urgent

-- Tasklist --
t.tasklist_font                 = fonts.main .. ' Medium ' .. config.font_size
t.tasklist_plain_task_name      = true
t.tasklist_bg_normal            = t.widget_bg .. '88'
t.tasklist_fg_normal            = t.fg_normal
-- t.tasklist_bg_focus             = t.colors.c0_800
t.tasklist_bg_focus             = t.widget_bg
t.tasklist_fg_focus             = t.fg_normal
t.tasklist_bg_urgent            = t.bg_urgent
t.tasklist_fg_urgent            = t.fg_urgent
t.tasklist_bg_minimize          = t.bar_bg
t.tasklist_fg_minimize          = t.fg_normal

-- Layout Box --
t.layoutbox_bg      = t.widget_bg
t.layoutbox_fg      = t.colors.c4_400
t.layout_tile       = tint(icon_dir .. lb_conf.icon_tile, t.layoutbox_fg)
t.layout_tileleft   = tint(icon_dir .. lb_conf.icon_tileleft, t.layoutbox_fg)
t.layout_tilebottom = tint(icon_dir .. lb_conf.icon_tilebottom, t.layoutbox_fg)
t.layout_tiletop    = tint(icon_dir .. lb_conf.icon_tiletop, t.layoutbox_fg)
t.layout_fairv      = tint(icon_dir .. lb_conf.icon_fairv, t.layoutbox_fg)
t.layout_dwindle    = tint(icon_dir .. lb_conf.icon_dwindle, t.layoutbox_fg)
t.layout_magnifier  = tint(icon_dir .. lb_conf.icon_magnifier, t.layoutbox_fg)
t.layout_max        = tint(icon_dir .. lb_conf.icon_max, t.layoutbox_fg)
t.layout_floating   = tint(icon_dir .. lb_conf.icon_floating, t.layoutbox_fg)

-- System Tray --
t.systray_icon_spacing          = config.system_tray.spacing
t.bg_systray                    = t.bar_bg

-- Hotkeys Popup --
t.hotkeys_font                  = 'Iosevka Bold 16'
t.hotkeys_bg                    = t.bar_bg
t.hotkeys_fg                    = t.colors.c1_200
t.hotkeys_border_width          = 2
t.hotkeys_border_color          = t.colors.c6_800
t.hotkeys_modifiers_fg          = t.colors.c6_600
t.hotkeys_label_bg              = t.hotkeys_bg
t.hotkeys_label_fg              = t.colors.c0_900
t.hotkeys_description_font      = t.font .. ' 12'
t.hotkeys_group_margin          = 8
-- t.hotkeys_shape                 = function(cr, w, h)
--     gears.shape.rounded_rect(cr, w, h, 4)
-- end

-- Clients (Windows) --
-- t.border_width                  = config.clients.border_width
t.border_width                  = 0
t.useless_gap                   = config.clients.useless_gap
t.border_normal                 = t.colors.c0_900
t.border_focus                  = t.colors.c6_700
t.border_marked                 = t.colors.c2_400

-- Tabs --
t.tabbar_radius                 = 20
t.tabbar_style                  = 'default'
t.tabbar_font                   = fonts.main
t.tabbar_bg_normal              = t.bg_normal
t.tabbar_fg_normal              = t.fg_normal
t.tabbar_bg_focus               = t.bg_focus
t.tabbar_fg_focus               = t.fg_focus

return t
