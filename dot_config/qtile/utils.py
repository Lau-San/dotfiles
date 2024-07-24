import subprocess

from libqtile.lazy import lazy

@lazy.function
def toggle_compositor(qtile):
    picom = subprocess.run(['pgrep', '-x', 'picom']).returncode
    if picom == 0:
        subprocess.run(['killall', 'picom'])
    else:
        qtile.spawn('picom')
