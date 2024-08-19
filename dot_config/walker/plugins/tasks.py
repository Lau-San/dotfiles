import sys
import json

text = ' '.join(sys.argv[1:])

actions = {
    'Inbox (New tasks)': 'kitty tti',
    'Active (Tasks in progress)': 'kitty tta',
    'Next (Tasks to focus on)': 'kitty ttn',
    'Ready (Actionable tasks)': 'kitty ttr',
}

notif = {
    'app': 'Tasks',
    'title': 'Task added',
    'body': f'Yout task "{text}" has been added to your inbox.'
}


def create_task():
    return f'''task new "{text}" + new &&
                notify-send -a "{notif['app']}" "{notif['title']}" \\
                "{notif['body']}"'''


options = []
if text:
    options.append({
        'label': f'Add task: {text}',
        'searchable': text.lower(),
        'exec': create_task()
    })
for k, v in actions.items():
    options.append({
        'label': k,
        'searchable': k.lower(),
        'exec': v
    })

print(json.dumps(options))
