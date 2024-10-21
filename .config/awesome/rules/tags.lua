local awful     = require 'awful'
local tb        = require 'gears.table'

local cutil     = require 'util.client'

local rules = {}

local function static_tag_rule(t, r, e, opt)
    e = e or {}
    opt = opt or { follow = true, screen = awful.screen.preferred }

    rules = tb.join(
        rules,
        {
            {
                rule_any    = r,
                except_any  = e,
                properties  = {
                    screen          = opt.screen,
                    tag             = t,
                    switch_to_tags  = opt.follow,
                    callback        = nil
                }
            }
        }
    )
end

local function dynamic_tag_rule(t, r, e, opt)
    e = e or {}
    opt = opt or { follow = true, screen = nil}

    rules = tb.join(
        rules,
        {
            {
                rule_any    = r,
                except_any  = e,
                properties  = {
                    switch_to_tags  = opt.follow,
                    callback        = function(c)
                        cutil.move_to_dynamic_tag(c, t, opt.screen, opt.follow)
                    end
                }
            }
        }
    )
end

-- PUT YOUR TAG RULES HERE
-- If the tag is static, use:
-- 
-- static_tag_rule('<tag name>', {
--      class = { ... },
--      instance = { ... },
--      ...
-- }, { follow = <boolean>, screen = <screen> })
--
-- If the tag is dynamic, use:
--
-- dynamic_tag_rule('<tag name>', {
--      class = { ... },
--      instance = { ... },
--      ...
-- }, { follow = <boolean>, screen = <screen> })

-- WWW --

dynamic_tag_rule('WWW',
    {
        class = {
            'firefox',
            'qutebrowser',
            'Brave-browser'
        }
    },
    -- Except
    {
        instance = {
            'habitica.com',
            'google.calendar.com',
            'mail.google.com',
            'app.raindrop.io',
            'play.achaea.com'
        }
    })

-- ORG --

static_tag_rule('ORG', {
    instance = {
        'habitica.com'
    }
})
static_tag_rule('ORG', {
    class = {
        'thunderbird'
    },
    instance = {
        'mail.google.com'
    },
    name = {
        'google.calendar.com'
    }
}, {}, { screen = 2 })

-- DEV --

dynamic_tag_rule('DEV', {
    class = {
        'Code',
        'Emacs',
        'Godot',
        'nvim'
    }
})

-- GAME --

dynamic_tag_rule('GAME', {
    class = {
        'steam',
        'heroic',
        'retroarch',
        'dolphin-emu',
        'Ankama Launcher',
        'Mudlet'
    },
    instance = {
        'play.achaea.com'
    }
})

-- CHT --

dynamic_tag_rule('CHT', {
    class = {
        'discord',
    },
    name = {
        'teams.live.com',
        'web.whatsapp.com'
    }
}, {}, { follow = false })

-- TERM --

dynamic_tag_rule('TERM', {
    class = {
        'Alacritty'
    }
})

-- FILE --

dynamic_tag_rule('FILE', {
    class = {
        'Nemo',
        'Pcmanfm',
        'ranger'
    }
})

-- SYS --

dynamic_tag_rule('SYS', {
    instance = {
        'BpyTOP',
        'Btop',
        'LSConf'
    }
})

-- VRT --

dynamic_tag_rule('VRT', {
    class = {
        'Virt-manager'
    }
})

-- DOC --

dynamic_tag_rule('DOC', {
    class = {
        'Xreader',
        'Zotero',
        'obsidian'
    },
    name = {
        'Confluence'
    },
    instance = {
        'app.raindrop.io'
    }
})

-- IMG --

dynamic_tag_rule('IMG', {
    class = {
        'Xviewer',
        'qView',
        'feh'
    }
})

-- MUS --

dynamic_tag_rule('MUS', {
    class = {
        'Spotify'
    }
})

-- ART --

dynamic_tag_rule('ART', {
    class = {
        'libresprite',
        'Aseprite'
    },
    instance = {
        'org.inkscape.Inkscape'
    }
})

return rules
