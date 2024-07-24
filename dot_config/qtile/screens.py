from libqtile.config import Screen
from bars import bars

screens = [
    Screen(top=bars[0]),
    Screen(top=bars[1]),
]
