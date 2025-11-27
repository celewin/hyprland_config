import os
import subprocess
import random

PATH = f"{os.path.expanduser('~')}/Wallpapers/"

wallpapers = []
for root, dirs, files in os.walk(PATH):
    subprocess.run(
        [
            "swww", "img", 
            "--transition-type", "right", 
            "--transition-duration", "1",
            "--transition-step", "20",
            "--transition-fps", "144",
            f"{PATH}/{random.choice(files)}"
        ]
    )