from libqtile import bar, widget

import themes.tokyonight as theme


widget_defaults = dict(
    font='Ubuntu Bold',
    fontsize=14,
    padding=0
)


def sep():
    return widget.Sep(
        foreground=theme.black_l,
        linewidth=4,
        padding=16,
        size_percent=60
    )


def current_layout_icon():
    return widget.CurrentLayoutIcon(
        padding=6,
        scale=0.7,
        # background=theme.layout_icon
    )


def group_box():
    return widget.GroupBox(
        fontsize=14,
        margin_x=5,
        margin_y=5,
        borderwidth=4,
        highlight_method='line',
        rounded=False,
        highlight_color=[theme.bar_bg, theme.groupbox_active_bg],
        inactive=theme.groupbox_inactive_txt,
        this_current_screen_border=theme.groupbox_active_hl,
        this_screen_border=theme.groupbox_active_unfocused_hl,
        other_screen_border=theme.groupbox_active_other_hl
    )


def task_list():
    return widget.TaskList(
        fontsize=12,
        margin_x=5,
        margin_y=4,
        padding_x=0,
        padding_y=2,
        icon_size=0,
        title_width_method='uniform',
        highlight_method='block',
        theme_mode='preferred',
        txt_floating='',
        txt_maximized='',
        txt_inimized='',
        urgent_method='border',
        border=theme.tasklist_active_bg,
        urgent_border=theme.tasklist_urgent_bg
    )


def clock():
    return widget.Clock(
        padding=0,
        fontsize=14,
        format='%a, %b %d - %I:%M %p',
        foreground=theme.clock_txt
    )


def volume():
    return widget.Volume(
        font='Font Awesome 6 Free',
        emoji_list=['', '', '', ''],
        emoji=True,
        max_chars=4,
        foreground=theme.vol_text
    )


def mem():
    return widget.MemoryGraph(
        border_width=0,
        margin_x=5,
        margin_y=4,
        type='box',
        fill_color=theme.mem_fill,
        graph_color=theme.mem_fill
    )


def cpu():
    return widget.CPUGraph(
        border_width=0,
        margin_x=5,
        margin_y=4,
        type='box',
        fill_color=theme.cpu_fill,
        graph_color=theme.cpu_fill
    )


def breather():
    return widget.Spacer(length=12)


bars = [
    bar.Bar(
        background=theme.bar_bg,
        size=28,
        margin=6,
        opacity= 0.85,
        widgets=[
            breather(),
            current_layout_icon(),
            group_box(),
            task_list(),
            widget.Systray(padding=5),
            sep(),
            cpu(),
            mem(),
            sep(),
            volume(),
            sep(),
            clock(),
            breather(),
        ]
    ),
    bar.Bar(
        background=theme.bar_bg,
        size=28,
        margin=6,
        opacity= 0.85,
        widgets=[
            breather(),
            current_layout_icon(),
            group_box(),
            task_list(),
            volume(),
            sep(),
            clock(),
            breather(),
        ]
    ),
]
