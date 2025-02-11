import json


def zj_new(session_name: str, layout: bool = False) -> str:
    '''Generate a command that creates a new session with the given name'''
    cmd = f'kitty zellij -s "{session_name}"'
    if layout:
        cmd += f' -n {session_name}'
    return cmd


def zj_new_godot(project: str) -> str:
    '''
    Generate a command that moves to a godot project folder and creates a new
    session with the godot layout
    '''
    cmd = f'kitty -d ~/Projects/development/games/godot/{project}'
    cmd += f' zellij -s {project} -n godot'
    return cmd


def generate_entries(simple: dict, zellij_layouts: dict, godot: dict) -> list:
    entries = []

    # Generate entries for simple projects that only require one
    # Neovim instance
    for k, v in simple.items():
        entries.append({
            'label': f'  {k}',
            'searchable': k.lower(),
            'exec': f'kitty nvim {v}'
        })

    # Generate entries for projects that should open
    # In a Zellij layout
    for k, v in zellij_layouts.items():
        entries.append({
            'label': f'  {k}',
            'searchable': k.lower(),
            'exec': f'zellij d {v}; {zj_new(v, True)}'
        })

    # Generate entries for Godot projects. This move into a
    # Godot project folder and runs Zellij with the godot layout
    for k, v in godot.items():
        entries.append({
            'label': f'  {k}',
            'searchable': k.lower(),
            'exec': f'zellij d godot; {zj_new_godot(v)}'
        })

    return entries


print(json.dumps(generate_entries(
    simple={
        'Github Profile README': '~/Projects/github-profile/README.md'
    },
    zellij_layouts={
        'Portfolio': 'lausan',
        'TermiTask': 'termitask',
        'Bitburner': 'bitburner',
        'Learn C++': 'learncpp'
    },
    godot={
        'Sokoban Clone': 'sokoban-clone'
    }
)))
