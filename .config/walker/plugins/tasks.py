import sys
import subprocess
import json

# Get user input in prompt
user_input = ' '.join(sys.argv[1:])

# VIT command to open reports
vit_cmd = 'kitty --class="ls-tasks" vit'


def new_task_notif(task: str) -> str:
    """
    Generate a shell command that sends a notification, informing
    the user that the new task was added successfully.
    """
    app = 'ls-tasks'
    title = 'Task added'
    body = f'Your new task \\"{task}\\" has been added successfully'
    return f'''notify-send --app-name={app} "{title}" "{body}"'''


def get_projects() -> dict:
    """
    Get Taskwarrior projects and return a dictionary where the keys are
    pretty names (title case) and the values are their name in Taskwarrior.
    """

    # Get all Taskwarrior projects
    tw_projects = subprocess.run(['task', '+PENDING', '_projects'],
                                 stdout=subprocess.PIPE,
                                 text=True).stdout.strip().split()
    # Format project names
    projects_pretty = list(map(lambda s: ' '.join(s.split('-')).title(),
                               tw_projects))
    # Map pretty project names to their Taskwarrior name
    projects = dict(zip(projects_pretty, tw_projects))

    return projects


def generate_entries(new_task: str, reports: dict, actions: dict) -> dict:
    # List that will contain the entries for Walker
    entries = []

    if new_task:
        entries.append({
            'label': f'  Add task: {new_task}',
            'searchable': new_task.lower(),
            'exec': f'task add "{new_task}" && {new_task_notif(new_task)}'
        })

    # Generate general report and simple actions entries
    for k, v in reports.items():
        entries.append({
            'label': f'  {k}',
            'searchable': f'report {k.lower()}',
            'exec': f'{vit_cmd} {v}'
        })

    # Generate action entries
    for k, v in actions.items():
        entries.append({
            'label': f'  {k}',
            'searchable': k.lower(),
            'exec': v
        })

    # Generate project report entries
    for k, v in get_projects().items():
        entries.append({
            'label': f'󱥾  {k}',
            'searchable': f'project {k.lower()}',
            'exec': f'{vit_cmd} project:{v}'
        })

    return entries


print(json.dumps(generate_entries(
    user_input,
    reports={
        'Ready': 'ready',
        'Inbox': 'inbox',
        'Next': 'next',
        'Active': 'active',
        'Completed': 'completed',
        'Waiting': 'waiting',
        'Blocked': 'blocked'
    },
    actions={
        'Daily Plan': 'tp'
    }
)))
