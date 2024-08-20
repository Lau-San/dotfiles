import json


def generate_entries(simple: dict, zellij_layouts: dict) -> list:
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
            'exec': f'kitty zellij --layout {v}'
        })

    return entries


print(json.dumps(generate_entries(
    simple={
        'Github Profile README': '~/Projects/github-profile/README.md'
    },
    zellij_layouts={
        'LauSan Portfolio': 'lausan',
    }
)))
