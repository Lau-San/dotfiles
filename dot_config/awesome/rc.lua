pcall(require, "luarocks.loader")

---@diagnostic disable-next-line: undefined-global
local awesome = awesome

-- IMPORTS --

local gears     = require 'gears'
local awful     = require 'awful'
local theme     = require 'beautiful'
local naughty   = require 'naughty'
require 'awful.autofocus'

local util      = require 'util'

-- ERROR HANDLING --

if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Runtime Errors
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

-- THEME --

theme.init(util.awesome_path .. '/theme/init.lua')

-- CONFIG --

require 'notifications'
require 'apps'
require 'layouts'
require 'tags'
require 'bindings'
require 'rules'
require 'statusbar'
require 'signals'

awful.screen.connect_for_each_screen(function(s)
    gears.wallpaper.maximized(theme.wallpaper, s)
end)

-- require 'autorun'
util.exec('~/.config/awesome/autorun.sh')

-- gears.timer.start_new(10, function()
--     collectgarbage("step", 20000)
--     return true
-- end)

gears.timer {
    timeout     = 30,
    autostart   = true,
    callback    = function() collectgarbage() end
}
