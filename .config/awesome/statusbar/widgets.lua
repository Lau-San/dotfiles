-- These are functions that create widgets that depend on the screen.
-- Don't comment these. If you want to disable one of these widgets,
-- look for where these functions are being executed.
-- If you have widgets like these, make sure the functions that create
-- them are imported before yout load them and add them to the status bar.
local new_layoutbox = require 'widgets.layoutbox'
local new_taglist   = require 'widgets.taglist'
local new_tasklist  = require 'widgets.tasklist'
local new_systray   = require 'widgets.systray'

-- These are the widgets that don't depend on the screen. This means you
-- don't need a separate one for each screen, but only one that doesn't
-- change no matter what screen it's on.
local clock         = require 'widgets.clock'
-- local battery       = require 'widgets.battery'
local volume        = require 'widgets.volume'

local widgets = {}
widgets.screen = {}

function widgets.setup(s)
    -- If your widget depends of the screen, create them here.
    local layoutbox = new_layoutbox(s)
    local taglist   = new_taglist(s)
    local tasklist  = new_tasklist(s)
    local systray   = new_systray(s)

    -- After importing and loading your widgets, you can place them
    -- and arrange them here.
    widgets.screen[s] = {

        left = {
            layoutbox,
            taglist
        },

        middle = {
            tasklist
        },

        right = {
            systray,
            volume,
            -- battery,
            clock,
        }
    }
end

return widgets
