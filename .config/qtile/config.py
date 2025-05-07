import os
import subprocess
from libqtile import hook

from keys import keys, mouse
from my_layouts import layouts
from groups import groups
from bars import widget_defaults
from screens import screens


def set_wallpaper():
    path = '~/.config/qtile/wallpaper.png'
    os.system('feh --bg-fill ' + path)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def window_to_prev_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)



floating_layout = layouts[2]
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = True
cursor_warp = True
auto_fulscreen = True
focus_on_window_activation = 'smart'
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = 'LG3D'


@hook.subscribe.startup
def startup():
    set_wallpaper()


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autorun.sh'])
