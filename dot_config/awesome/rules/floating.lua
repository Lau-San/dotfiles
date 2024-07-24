local awful     = require('awful')
local placement = awful.placement

-- FLOATING AND CENTERED

return {
    rule_any = {
        type = { 'dialog' },
        name = {
            'Message Filters',
        },
        instance = {
            'DTA',
            'copyq',
            'origin.exe'
        },
        class = {
            'Galculator',
            'Gnome-font-viewer',
            'Font-manager',
            'Gcr-prompter',
            'Steam',
            'pcloud',
            'Godot',
            'Bitwarden',
            'Ulauncher',
            'Gdebi-gtk',
            'MEGAsync',
            'Free Download Manager',
            'smile'
        },
        role = {
            'AlarmWindow',
            'pop-up',
            'Preferences',
            'setup'
        },
    },
    except_any = {
        instance = {
            'teams.live.com',
            'web.whatsapp.com',
            'google.calendar.com',
            'mail.google.com',
            'habitica.com',
            'app.raindrop.io',
            'play.achaea.com'
        }
    },
    properties = {
        floating    = true,
        placement   = placement.centered,
        callback = function(c)
            placement.centered(c)
        end
    }
}
