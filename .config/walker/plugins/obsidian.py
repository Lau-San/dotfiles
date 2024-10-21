import sys
import json

user_input = ' '.join(sys.argv[1:])

options = []

if user_input:
    options.append({
        'label': f'  Create note: {user_input}',
        'searchable': user_input.lower(),
        'exec': f'kitty on "{user_input}"'
    })

actions = {
    '󱉼  Open vault': 'kitty oo',
    '  Review notes': 'kitty oor',
    # '  Open Yesterday\'s note': "kitty nvim +':ObsidianYesterday'",
    # '  Open Today\'s note': "kitty nvim +':ObsidianToday'",
    # '  Open Tomorrow\'s note': "kitty nvim +':ObsidianTomorrow'",
}

for k, v in actions.items():
    options.append({
        'label': k,
        'searchable': k.lower(),
        'exec': v,
    })

print(json.dumps(options))
