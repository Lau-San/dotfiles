import sys
import subprocess
import json

# Get user input in prompt
input_text = ' '.join(sys.argv[1:])

# VIT command to open reports
vit_cmd = 'kitty --class="ls-tasks" vit'

# List that will contain the entries for Walker
entries = []

# General reports options
actions = {
    'Ready': f'{vit_cmd} ready',
    'Inbox': f'{vit_cmd} inbox',
    'Next': f'{vit_cmd} next',
    'Active': f'{vit_cmd} active',
    'Completed': f'{vit_cmd} completed'
}


def get_projects() -> dict:
    """Get Taskwarrior projects and return a dictionary where the keys are
    pretty names (title case) and the values are their name in Taskwarrior."""
    # Get all Taskwarrior projects
    tw_projects = subprocess.run(['task', '_projects'],
                                 stdout=subprocess.PIPE,
                                 text=True).stdout.strip().split()
    # Format project names
    projects_pretty = list(map(lambda s: ' '.join(s.split('-')).title(),
                               tw_projects))
    # Map pretty project names to their Taskwarrior name
    projects = dict(zip(projects_pretty, tw_projects))

    return projects


def generate_entries(i, a, p):
    # If the input isn't empty, add an "Add task" option
    if input_text:
        entries.append({
            'label': f'Add task: {input_text}',
            'searchable': input_text.lower(),
            'exec': f'task add "{input_text}" +new'
        })

    # Generate general report entries
    for k, v in actions.items():
        entries.append({
            'label': k,
            'searchable': k.lower(),
            'exec': v
        })

    # Generate project report entries
    for k, v in get_projects().items():
        entries.append({
            'label': f'Project: {k}',
            'searchable': f'project: {k.lower()}',
            'exec': f'{vit_cmd} project:{v}'
        })


print(json.dumps(entries))
