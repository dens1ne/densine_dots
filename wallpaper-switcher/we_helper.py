import json
import os
import sys

DIR = "/home/densine/.local/share/Steam/steamapps/workshop/content/431960"
wallpapers_ids = os.listdir(path=DIR)
wallpapers_titles = list()

for wallpaper in wallpapers_ids:
    with open(os.path.join(DIR, wallpaper, "project.json")) as wall_file:
        wallpaper_data = json.load(wall_file)
        # title = f'"{wallpaper_data["title"]}"'
        title = wallpaper_data["title"]
        wallpapers_titles.append(title)

if sys.argv[1] == "--list":
    print(";".join(wallpapers_titles))
elif sys.argv[1] == "--id_by_name":
    index = wallpapers_titles.index(sys.argv[2])
    print(wallpapers_ids[index])
