---@diagnostic disable-next-line: undefined-global
local awesome, root = awesome, root

local awful         = require 'awful'
local hotkeys_popup = require 'awful.hotkeys_popup'
local tb            = require 'gears.table'

local config        = require 'config'
local util          = require 'util'
local exec          = util.exec
local cutil         = require 'util.client'
local tutil         = require 'util.tag'
local apps          = require 'apps'
local mods           = require 'bindings.mod'

local global_keys = {}

local function bind(group, bindings)
    for _, b in pairs(bindings) do
        local mod   = b[1] or {}
        local key   = b[2]
        local func  = b[3]
        local desc  = b[4]

        global_keys = tb.join(
            global_keys,
            awful.key(
                {table.unpack(mod)}, key,
                func,
                { description = desc, group = group }
            )
        )
    end
end

bind('awesome',
    {
        {
            { mods.sup }, 's',
            hotkeys_popup.show_help,
            'show awesome hotkeys cheatsheet'
        },
        {
            { mods.sup, mods.shft }, 'r',
            awesome.restart,
            'reload awesome'
        },
        {
            { mods.sup, mods.shft }, 'q',
            awesome.quit,
            'log out'
        }
    }
)

bind('prompts',
    {
        {
            { mods.sup }, 'r',
            function() exec('rofi -no-show-icons -show run') end,
            'run command'
        },
        {
            { mods.sup }, 'p',
            function() exec('rofi -show drun') end,
            'application launcher'
        },
        {
            { mods.sup }, 'w',
            function() exec('rofi -show window') end,
            'open windows'
        },
        {
            { mods.sup }, 'c',
            function() exec('ls-conf') end,
            'open configuration'
        },
        {
            { mods.sup }, 'o',
            function() exec('rofi-obsidian-capture') end,
            'capture to obsidian daily note'
        }
    }
)

bind('applications',
    {
        {
            { mods.sup }, 'Return',
            function() exec(apps.terminal .. ' -e tmux attach') end,
            'terminal (tmux)'
        },
        {
            { mods.sup, mods.alt }, 'Return',
            function() exec(apps.terminal) end,
            'terminal'
        },
        {
            { mods.sup }, '.',
            function() exec(apps.system_monitor) end,
            'system monitor'
        },
        {
            { mods.sup }, 'b',
            function() exec(apps.browser) end,
            'web browser'
        },
        {
            { mods.sup }, 'f',
            function() exec(apps.file_manager) end,
            'file manager'
        },
        {
            { mods.sup }, 'e',
            function() exec(apps.editor) end,
            'editor'
        }
    }
)

bind('tools',
    {
        {
            { mods.sup, mods.shft }, 'e',
            function() exec('flatpak run it.mijorus.smile') end,
            'emoji'
        }
    }
)

bind('tags',
    {
        {
            { mods.sup }, 'i',
            awful.tag.viewnext,
            'go to next tag'
        },
        {
            { mods.sup }, 'u',
            awful.tag.viewprev,
            'go to previous tag'
        },
    }
)

bind('screens',
    {
        {
            { mods.sup }, 'l',
            function() awful.screen.focus_relative(1) end,
            'focus next screen'
        },
        {
            { mods.sup }, 'h',
            function() awful.screen.focus_relative(-1) end,
            'focus previous screen'
        },
    }
)

bind('client',
    {
        {
            { mods.sup }, 'j',
            function() awful.client.focus.byidx(1) end,
            'focus next client'
        },
        {
            { mods.sup }, 'k',
            function() awful.client.focus.byidx(-1) end,
            'focus previous client'
        },
        {
            { mods.sup, mods.ctrl }, 'j',
            function() awful.client.swap.byidx(1) end,
            'swap client with next client'
        },
        {
            { mods.sup, mods.ctrl }, 'k',
            function() awful.client.swap.byidx(-1) end,
            'swap client with previous client'
        },
        {
            { mods.sup, mods.ctrl }, 'r',
            cutil.restore_minimized,
            'restore last minimized client'
        }
    }
)

bind('layout',
    {
        {
            { mods.sup, mods.shft }, 'j',
            function() awful.layout.inc(1) end,
            'select next layout'
        },
        {
            { mods.sup, mods.shft }, 'k',
            function() awful.layout.inc(-1) end,
            'select previous layout'
        },
        {
            { mods.sup }, '+',
            function() awful.tag.incmwfact(config.client_increment) end,
            'increase master area size'
        },
        {
            { mods.sup }, '-',
            function() awful.tag.incmwfact(-config.client_increment) end,
            'decrease master areal size'
        },
        {
            { mods.sup, mods.shft }, '+',
            function() awful.tag.incnmaster(1, nil, true) end,
            'increase number of master clients'
        },
        {
            { mods.sup, mods.shft }, '-',
            function() awful.tag.incnmaster(-1, nil, true) end,
            'decrease number of master clients'
        }
    }
)

bind('system',
    {
        {
            { }, 'XF86AudioRaiseVolume',
            util.volume_up,
            'increase volume'
        },
        {
            { }, 'XF86AudioLowerVolume',
            util.volume_down,
            'decrease volume'
        },
        -- {
        --     { }, 'XF86AudioMute',
        --     util.volume_mute,
        --     'mute'
        -- }
    }
)

-- TAG BINDINGS
-- Bindings that need a tag number go here.
for i = 1, 9 do

    -- If you don't want to display all number keys in the hotkey popup,
    -- you can set the description here so it only displays the first and last.
    local descr_goto, descr_toggle, descr_move
    if i == 1 or i == 9 then
        descr_goto      = 'go to tag #'
        descr_toggle    = 'toggle tag #'
        descr_move      = 'move focused client to tag #'
    end

    bind('tags',
        {
            {
                { mods.sup }, '#' .. i + 9,
                function() tutil.view_tag_only(i) end,
                descr_goto
            },
            {
                { mods.sup, mods.shft }, '#' .. i + 9,
                function() tutil.toggle_tag(i) end,
                descr_toggle
            }
        }
    )

    bind('client',
        {
            {
                { mods.sup, mods.ctrl }, '#' .. i + 9,
                function() cutil.move_focused_client_to_tag(i) end,
                descr_move
            }
        }
    )
end

root.keys(global_keys)
return global_keys
