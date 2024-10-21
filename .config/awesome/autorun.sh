#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

# This is to fix my secondary monitor's screen resolution since my Xorg
# config files don't seem to apply properly when using AwesomeWM and NVidia
# for some reason. There may be another way, but this works for me.
run "$HOME/.screensize.sh"

# Remap CapsLock key to Ctrl to make Ctrl+ keybindings more comfortable.
# If you expected the usual CapsLock behaviour, just comment this line,
# log out of AwesomeWM and log in again.
xmodmap "$HOME/.Xmodmap"

# Authentication agent
run /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1

# Compositor
picom &

run nm-applet
run flameshot
run megasync

# run "thunderbird"
# run "$HOME/Applications/Obsidian-1.3.4_840d2a4751277566044dbaa931301565.AppImage"
run discord
# run "$HOME/Applications/pCloud.AppImage"

# brave-browser --app="https://mail.google.com" &
