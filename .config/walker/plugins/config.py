import json

configs = {
    'AwesomeWM': '~/.config/awesome',
    'Hyprland': '~/.config/hypr',
    'QTile': '~/.config/qtile',

    'Eww': '~/.config/eww',
    'Waybar': '~/.config/waybar',

    'Picom': '~/.config/picom.conf',
    'Dunst': '~/.config/dunst',
    'Fnott': '~/.config/fnott',

    'Xresources': '~/.Xresources',

    'Rofi': '~/.config/rofi',
    'Walker': '~/.config/walker',
    'Anyrun': '~/.config/anyrun',
    'Sysmenu': '~/.config/sys64/menu',

    'Alacritty': '~/.config/alacritty/alacritty.toml',
    'Kitty': '~/.config/kitty/kitty.conf',

    'Bash RC': '~/.bashrc',
    'Bash Aliases': '~/.bash_aliases',
    'Bash Profile': '~/.bash_profile',
    'Fish': '~/.config/fish/config.fish',

    'Starship': '~/.config/starship.toml',
    'Fastfetch': '~/.config/fastfetch/config.jsonc',
    'Tmux': '~/.config/tmux/tmux.conf',
    'Zellij': '~/.config/zellij',

    'Neovim': '~/.config/nvim/lua',

    'Btop': '~/.config/btop/btop.conf',
    'MPV': '~/.config/mpv/mpv.conf',
    'Yazi': '~/.config/yazi',
    'Taskwarrior': '~/.taskrc',
    'VIT': '~/.vit/config.ini',
}


notif = {
    "title": "ls-config",
    "success": {
        'summary': 'New configuration applied',
        'body': 'Your new configuration has been successfully applied ' +
                'and synced with chezmoi.'
    },
    "error": {
        'summary': "Couldn't apply new configuration",
        'body': 'Something when wrong when trying to apply and/or sync ' +
                'your new configuration with chezmoi.'
    },
}


def create_exec(path: str):
    return f'''chezmoi edit --apply {path} &&
                notify-send --app-name="{notif['title']}" \\
                    "{notif['success']['summary']}" \\
                    "{notif['success']['body']}" ||
                notify-send --app-name="{notif['title']}" --urgency=critical
                    "{notif['error']['summary']}" \\
                    "{notif['error']['body']}" \\'''


options = []
for k, v in configs.items():
    options.append({
        'label': k,
        'searchable': k.lower(),
        'exec': create_exec(v)
    })

print(json.dumps(options))
