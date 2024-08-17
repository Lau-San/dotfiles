import sys
import json

text = ' '.join(sys.argv[1:])

actions = {
    f'Create note: {text}': f'kitty on "{text}"',
    'Open personal vault': 'kitty oo',
    'Review notes': 'kitty oor'
}

options = []
for k, v in actions.items():
    options.append({
        'label': k,
        'searchable': text.lower(),
        'exec': v
    })

print(json.dumps(options))
