import sys
import json

user_input = ' '.join(sys.argv[1:])

print(json.dumps([
    {
        'label': f'  Add task: {user_input}',
        'searchable': user_input,
        'exec': f'inbox {user_input}'
    }
]))
