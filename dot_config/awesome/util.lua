---@diagnostic disable-next-line: undefined-global
local client = client

local awful     = require 'awful'

local util = {}
util.widgets = {}

util.awesome_path   = os.getenv('HOME') .. '/.config/awesome'

util.assets_dir     = util.awesome_path .. '/assets/'

util.icon_dir       = util.assets_dir .. '/icons/'
util.sound_dir      = util.assets_dir .. '/sounds/'

-- function util.tint(icon, color)
--     return gcolor.recolor_image(icon, color)
-- end

function util.exec(cmd)
    awful.spawn.with_shell(cmd)
end

function util.run_once(cmd, rules)
    local findme = cmd
    local firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace-1)
    end
    awful.spawn.with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")", rules)
end

-- TODO REORGANIZE THESE THINGS

function util.restore_minimized()
    local c = awful.client.restore()
    if c then
        client.focus = c
        c:raise()
    end
end

function util.volume_up()
    os.execute(string.format('amixer -q set %s 1%%+', util.volume.channel))
    util.volume.update()
end

function util.volume_down()
    os.execute(string.format('amixer -q set %s 1%%-', util.volume.channel))
    util.volume.update()
end

-- function util.volume_mute()
--     os.execute(string.format('amixer -q set %s toggle', util.volume.togglechannel))
--     util.volume.update()
-- end

function util.view_tag_only(tag_idx)
    local screen = awful.screen.focused()
    local tag = screen.tags[tag_idx]
    if tag then
        tag:view_only()
    end
end

function util.toggle_tag(tag_idx)
    local screen = awful.screen.focused()
    local tag = screen.tags[tag_idx]
    if tag then
        awful.tag.viewtoggle(tag)
    end
end

function util.move_focused_client_to_tag(tag_idx)
    if client.focus then
        local tag = client.focus.screen.tags[tag_idx]
        if tag then
            client.focus:move_to_tag(tag)
        end
    end
end

function util.toggle_fullscreen(c)
    c.fullscreen = not c.fullscreen
    c:raise()
end


function util.toggle_maximize(c)
    c.maximized = not c.maximized
    c:raise()
end

function util.play_sound(sound)
    os.execute('ffplay -nodisp -autoexit -volume 50 ' .. sound .. ' &')
end

return util
