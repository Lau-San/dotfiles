from libqtile.config import Key, Drag
from libqtile.lazy import lazy

from apps import terminal, browser, file_manager
from utils import toggle_compositor

mod = 'mod4'

keys = [
    Key([mod], 'Return', lazy.spawn(terminal), desc='Terminal'),
    Key([mod], 'b', lazy.spawn(browser), desc='Web Browser'),
    Key([mod], 'p', lazy.spawn('rofi -show drun'), desc='Run Launcher'),
    Key([mod], 'r', lazy.spawn('rofi -no-show-icons -show run'), desc='Run Launcher'),
    Key([mod, 'control'], 'r', lazy.reload_config(), desc='Reload config'),
    Key([mod, 'control'], 'q', lazy.shutdown(), desc='Exit Qtile'),
    Key([mod], 'g', toggle_compositor(), desc='Toggle compositor'),

    # Window Navigation
    Key([mod], 'j', lazy.layout.next(), desc='Focus next window'),
    Key([mod], 'k', lazy.layout.previous(), desc='Focus previous window'),

    # Window control
    Key([mod, 'control'], 'j', lazy.window.move_down(),
        desc='Move down below in stack'),
    Key([mod, 'control'], 'k', lazy.window.move_up(),
        desc='Move up below in stack'),
    Key([mod, 'control'], 'c', lazy.window.kill(), desc='Close window'),
    Key([mod, 'control'], 'm', lazy.layout.maximize(),
        desc='Toggle maximize window'),
    Key([mod, 'control'], 'f', lazy.window.toggle_floating(),
        desc='Toggle floating'),

    # Layout Control
    Key([mod, 'shift'], 'j', lazy.next_layout(), desc='Next layout'),
    Key([mod, 'shift'], 'k', lazy.prev_layout(), desc='Previous layout'),
    Key([mod, 'shift'], 'l', lazy.layout.increase_ratio(),
        desc='Grow master window'),
    Key([mod, 'shift'], 'h', lazy.layout.decrease_ratio(),
        desc='Grow master window'),

    # Group Navigation
    Key([mod], 'i', lazy.screen.next_group(), desc='Next group'),
    Key([mod], 'u', lazy.screen.prev_group(), desc='Previous group'),

    # Monitors
    Key([mod], 'l', lazy.next_screen(), desc='Focus next screen'),
    Key([mod], 'h', lazy.prev_screen(), desc='Focus previous screen'),
]

mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]
