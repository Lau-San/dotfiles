local awful     = require 'awful'

local util      = require 'util'
local tutil     = require 'util.tag'

awful.screen.connect_for_each_screen(function(s)
    -- STATIC TAGS --
    -- Use this function to create tags that are permanently present, even if
    -- they're empty.
    --
    -- new_static_tag({
    --      name                = '<name of the tag>',
    --      icon                = '<path to an image file relative to the icon directory>',
    --      layout (optional)   = <the initial layout>,
    --      default             = <boolean to indicate if tag should start selected>,
    -- })
    local function new_static_tag(args)
        local name      = args.name
        local icon      = args.icon
        local layout    = args.layout or awful.layout.layouts[1]
        local selected  = args.default

        local new_tag = awful.tag.add(
            name,
            {
                icon        = util.icon_dir .. icon,
                layout      = layout,
                selected    = selected,
                screen      = s
            }
        )

        -- Set the correct icon when the tag is first created
        tutil.handle_icon_on_select(new_tag)

        new_tag:connect_signal(
            'property::selected',
            tutil.handle_icon_on_select
        )

        new_tag:connect_signal(
            'property::urgent',
            tutil.handle_icon_on_urgent
        )
    end

    -- ADD YOUT STATIC TAGS HERE

    new_static_tag({
        name    = 'ORG',
        icon    = 'bookmark.svg',
        layout  = awful.layout.suit.max,
        default = true
    })
end)
