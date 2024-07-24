from subprocess import check_output
import sys
import json

expr = sys.argv[1]
result = check_output(f'expr "{expr}" | bc', shell=True, text=True).strip()

print(json.dumps([
    {
        'label': f'Result: {result}',
        'searchable': expr,
    }
]))
