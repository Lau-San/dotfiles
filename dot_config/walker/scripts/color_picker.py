import json

base_cmd = 'hyprpicker --autocopy --format='

print(json.dumps([
    {
        'label': 'Color Picker (HEX)',
        'searchable': 'hex',
        'exec': base_cmd + 'hex'
    },
    {
        'label': 'Color Picker (RGB)',
        'searchable': 'rgb',
        'exec': base_cmd + 'rgb'
    },
    {
        'label': 'Color Picker (HSL)',
        'searchable': 'hsl',
        'exec': base_cmd + 'hsl'
    },
]))
