import sys
import json

text = ' '.join(sys.argv[1:])

options = []

if text:
    options.append({
        'label': f'Create note: {text}',
        'searchable': text.lower(),
        'exec': f'kitty on "{text}"'
    })

actions = {
    'Open personal vault': 'kitty oo',
    'Review notes': 'kitty oor'
}

for k, v in actions.items():
    options.append({
        'label': k,
        'searchable': text.lower(),
        'exec': v
    })

print(json.dumps(options))
