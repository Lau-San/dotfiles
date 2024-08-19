import sys
import json

text = ' '.join(sys.argv[1:])

notif = {
    'app': 'Tasks',
    'title': 'Task added',
    'body': f'Yout task "{text}" has been added to your inbox.'
}


cmd = f'''task add "{
    text}" +new && notify-send -a "{notif['app']}" "{notif['title']}" "{notif['body']}"'''


options = []

if text:
    options.append({
        'label': f'Add task: {text}',
        'searchable': text.lower(),
        'exec': cmd
    })

actions = {
    'Ready (Actionable tasks)': 'kitty taskwarrior-tui -r ready',
    'Inbox (New tasks)': 'kitty taskwarrior-tui -r inbox',
    'Active (Tasks in progress)': 'kitty taskwarrior-tui -r active',
    'Next (Tasks to focus on)': 'kitty taskwarrior-tui -r next',
}

for k, v in actions.items():
    options.append({
        'label': k,
        'searchable': k.lower(),
        'exec': v
    })

print(json.dumps(options))
