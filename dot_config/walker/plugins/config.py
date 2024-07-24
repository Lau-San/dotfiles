import json

home = '/home/laura'
confdir = f'{home}/.config'

configs = {
    'AwesomeWM': f'{confdir}/awesome',
    'Hyprland': f'{confdir}/hypr',
    'QTile': f'{confdir}/qtile',

    'Eww': f'{confdir}/eww',

    'Picom': f'{confdir}/picom.conf',
    'Dunst': f'{confdir}/dunst',

    'Xresources': f'{home}/.Xresources',

    'Rofi': f'{confdir}/rofi',
    'walker': f'{confdir}/walker',
    'anyrun': f'{confdir}/anyrun',
    'sysmenu': f'{confdir}/sys64/menu',

    'Alacritty': f'{confdir}/alacritty/alacritty.toml',
    'Kitty': f'{confdir}/kitty/kitty.conf',

    'Bash RC': f'{home}/.bashrc',
    'Bash Aliases': f'{home}/.bash_aliases',
    'Bash Profile': f'{home}/.bash_profile',
    'Fish': f'{confdir}/fish/config.fish',
    'Fish Variables': f'{confdir}/fish/fish_variables',

    'Starship': f'{confdir}/starship.toml',
    'Fastfetch': f'{confdir}/fastfetch/config.jsonc',

    'LazyVim': f'{confdir}/nvim/lua',

    'Btop': f'{confdir}/btop/btop.conf',
    'MPV': f'{confdir}/mpv/mpv.conf',
}

options = []
for k, v in configs.items():
    options.append({
        'label': k,
        'searchable': k.lower(),
        'exec': f'chezmoi edit --apply {v}'
    })

print(json.dumps(options))
