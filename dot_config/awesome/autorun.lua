local util  = require 'util'

-- This is to fix my secondary monitor's screen resolution since my Xorg 
-- config files don't seem to apply properly when using AwesomeWM and NVidia
-- for some reason. There may be another way, but this works for me.
util.exec('~/.screensize.sh')

-- Remap CapsLock key to Ctrl to make Ctrl+ keybindings more comfortable.
-- If you expected the usual CapsLock behaviour, just comment this line,
-- log out of AwesomeWM and log in again.
util.exec('xmodmap ~/.Xmodmap')

-- Authentication agent
util.run_once("/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1")

-- Compositor
util.run_once('picom --experimental-backends')

util.run_once('nm-applet')
util.run_once('volumeicon')
-- util.run_once('indicator-cpufreq')
-- util.run_once('flameshot')
-- util.run_once('megasync')

-- util.run_once('thunderbird', { screen = 1 })
-- util.run_once("~/Applications/Bitwarden.AppImage")
-- util.run_once("~/web-apps/Teams-linux-x64/Teams")

util.exec("~/Applications/obsidian-1.0.3_e7b7904b582b979e3aee68aabf6a1f59.AppImage")
util.exec("pgrep -u $USER -x 'pcloud' > /dev/null || (~/Applications/pCloud.AppImage)")
