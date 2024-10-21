from libqtile import layout
from libqtile.config import Match

import themes.tokyonight as theme

border_width = 3
margin = 10

floating_layout = layout.Floating(
    border_width=border_width,
    border_focus=theme.border_focus_floating,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='dialog'),
        Match(wm_class='confirmreset'),
        Match(wm_class='download'),
        Match(wm_class='error'),
        Match(wm_class='file_progress'),
        Match(wm_class='notification'),
        Match(wm_class='toolbar'),
        Match(wm_class='pinentry-gtk-2'),
        Match(wm_class='maketag'),
        Match(wm_class='Yad'),
        Match(wm_class='com-atlauncher-App'),
        Match(title='Confirmation'),
        Match(title='pinentry'),
    ]
)

layouts = [
    layout.Tile(
        shift_windows=True,
        border_width=border_width,
        margin=margin,
        border_focus=theme.border_focus,
        border_normal=theme.border_normal
    ),
    layout.Max(
        border_width=border_width,
        margin=margin,
        border_focus=theme.border_focus,
        border_normal=theme.border_normal
    ),
    floating_layout
]
