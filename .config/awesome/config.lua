return {
    -- Default color themes:
    --  > one-dark
    --  > tokyo-night
    color_theme         = 'tokyo-night',

    -- Set the path to a custom wallpaper.
    wallpaper           = '~/Pictures/wallpapers/wp-02.jpg',

    font_size           = '14',
    fonts = {
        main            = 'Ubuntu',
        mono            = 'Mononoki Nerd Font',
        icon            = 'Iosevka',
    },

    bar = {
        height          = 36,
        opacity         = 0.95,
        padding         = 6
    },

    clients = {
        border_width    = 2,
        useless_gap     = 6
    },

    notifications = {
        font_size       = 16,
        opacity         = 0.9,
        padding         = 14,
        spacing         = 8,
        margin          = 20,
        border_width    = 2,
        rounded_corners = true,
        corner_radius   = 2
    },

    widgets = {
        -- NOTE ABOUT WIDGETS
        -- Most of the default widgets are made off of multiple types of
        -- AwesomeWM widgets. When we refer to widgets here, we actually
        -- talk about the full combination of those widgets that can
        -- easily be placed in the statusbar.
        --
        -- eg: The "volume widget" is actually built from an imagebox widget,
        -- to show the icon, the actual widget that shows the volume info,
        -- and some helper widgets to control margin, positioning, etc. All
        -- of these AwesomeWM widgets make up the volume widget.

        -- Space between widget left and right borders and the actual
        -- widget content
        padding         = 16,

        -- Spacing between widgets.
        -- Note that some widgets are technically two or more widgets
        -- together (the clock widget has a date widget and a time widget).
        -- The spacing between these "sub-widgets" is proportional to
        -- this spacing.
        spacing         = 6,
        -- item_padding    = 2,
        -- item_spacing    = 4,
        icon_size       = '20',
        percent_icon    = '％'
    },

    system_tray = {
        spacing         = 3
    },

    client_increment    = 0.05
}
