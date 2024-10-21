local awful     = require('awful')

local util      = require('util')

local dynamic_tags = {}

-- DYNAMIC TAGS --
-- Use this function to add tags that wont be created until a client needs them
-- and will be deleted once they're not needed anymore.
-- 
-- new_dynamic_tag({
--      name                = '<name of the tag>',
--      icon                = '<path to an image file relative to the icon directory>'
--      layout (optional)   = <the initial layout>
-- })
local function new_dynamic_tag(args)
    local name = args.name
    local icon = args.icon
    local layout = args.layout or awful.layout.layouts[1]

    dynamic_tags[name] = {
        name = name,
        icon = util.icon_dir .. icon,
        layout = layout
    }

    return dynamic_tags[name]
end

-- ADD YOUR DYNAMIC TAGS HERE

new_dynamic_tag({
    name    = 'DEV',
    icon    = 'code.svg'
})
new_dynamic_tag({
    name    = 'WWW',
    icon    = 'web.svg'
})
new_dynamic_tag({
    name    = 'GAME',
    icon    = 'controller.svg',
    layout  = awful.layout.suit.max
})
new_dynamic_tag({
    name    = 'TERM',
    icon    = 'terminal.svg'
})
new_dynamic_tag({
    name    = 'FILE',
    icon    = 'folder.svg'
})
new_dynamic_tag({
    name    = 'SYS',
    icon    = 'system.svg'
})
new_dynamic_tag({
    name    = 'DOC',
    icon    = 'document.svg'
})
new_dynamic_tag({
    name    = 'IMG',
    icon    = 'image.svg'
})
new_dynamic_tag({
    name    = 'VRT',
    icon    = 'virtual.svg',
    layout  = awful.layout.suit.max
})
new_dynamic_tag({
    name    = 'CHT',
    icon    = 'chat.svg'
})
new_dynamic_tag({
    name    = 'MUS',
    icon    = 'note.svg'
})
new_dynamic_tag({
    name    = 'VID',
    icon    = 'play.svg'
})
new_dynamic_tag({
    name    = 'ART',
    icon    = 'brush.svg'
})

return dynamic_tags
