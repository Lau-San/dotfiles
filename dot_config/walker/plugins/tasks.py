import sys
import json

# Text being enterd by user on prompt
input_text = ' '.join(sys.argv[1:])

# Window Class for kitty windows
w_class = 'ls-tasks'

# List that will contain the entries for Walker
entries = []

# If the input isn't empty, add an "Add task" option
if input_text:
    entries.append({
        'label': f'Add task: {input_text}',
        'searchable': input_text.lower(),
        'exec': f'task add "{input_text}" +new'
    })

# Add all options to view tasks
actions = {
    'Ready': f'kitty --class="{w_class}" vit ready',
    'Inbox': f'kitty --class="{w_class}" vit inbox',
    'Next': f'kitty --class="{w_class}" vit next',
    'Active': f'kitty --class="{w_class}" vit active',
    'Completed': f'kitty --class="{w_class}" vit completed',
    'Open project ': 'task _projects | walker - -dmenu - n - -theme = tokyonight-centered'
}
for k, v in actions.items():
    entries.append({
        'label': k,
        'searchable': k.lower(),
        'exec': v
    })

# print(projects)
print(json.dumps(entries))
