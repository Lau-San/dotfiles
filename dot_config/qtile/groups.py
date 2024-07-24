from libqtile.config import Group, Match

def match_classes(*args):
    matches = []
    for i in args:
        matches.append(Match(wm_class=i))
    return matches

groups = []
groups.extend([
    Group('DEF', layout='max', persist=True, matches=[
        Match(wm_class='thunderbird')
    ]),

    Group('WWW', layout='max', persist=True, matches=match_classes(
        'Brave-browser',
        'firefox'
    )),

    Group('FIL', layout='tile', persist=True, matches=match_classes(
        'Nemo',
        'dolphin',
        'ranger',
        'Pcmanfm'
    )),

    Group('TER', layout='tile', persist=False, init=False, matches=match_classes(
        'Alacritty'
    )),

    Group('DEV', layout='tile', persist=False, init=False, matches=match_classes(
        'Code',
        'Emacs',
        'Godot',
        'nvim'
    )),

    Group('ART', layout='max', persist=False, init=False, matches=match_classes(
        'libresprite',
        'Aseprite'
    )),

    Group('GAM', layout='max', persist=False, init=False, matches=match_classes(
        'retroarch',
        'dolphin-emu',
        'com-atlauncher-App'
    )),

    Group('DOC', layout='tile', persist=False, init=False, matches=match_classes(
        'obsidian',
        'Xreader',
        'Zotero'
    )),
    Group('MUS', layout='max', persist=False, init=False, matches=match_classes(
        'Spotify'
    )),

    Group('SYS', layout='tile', persist=False, init=False, matches=match_classes(
        'Btop',
        'BpyTOP'
    )),
])
