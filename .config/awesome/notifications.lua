local naughty   = require('naughty')
local util      = require('util')

local notification_sound    = util.sound_dir .. "notification.mp3"

naughty.config.notify_callback = function(args)
    util.play_sound(notification_sound)
    return args
end
